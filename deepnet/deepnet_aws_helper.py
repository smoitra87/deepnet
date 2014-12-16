import aws_helper
from fabric.api import *
from contextlib import nested
import json
import os
import awsutil
import sqlite3 as lite
import datetime
from operator import itemgetter
import itertools
from collections import defaultdict
import markup
import webbrowser
from urlparse import urljoin

class DeepnetHelper(object):

    """ Helper for running commands on deepnet instances

    Wraps up ssh requests and submits them
    """

    def __init__(self, helper):
        self.aws_helper = helper
        self.jobs = {}
        with JobTable() as tbl:
            for stat in ("submitted", "running"):
                self.jobs[stat] = tbl.get_jobs_by_status(stat)

    def deepnet_update_from_github(self):
        """ Update deepnet on all hosts"""
        with cd("deepnet"):
            run("git pull origin master")

    @with_settings(shell_escape=False)
    def _any_cmd(self, cmd):
        """ Run any command on instances """
        run(cmd).splitlines()

    def tesla_any_cmd(self, cmd):
        """ Run any command on tesla instances """
        self._any_cmd(cmd)

    def _update_from_github(self):
        """ Update deepnet on all hosts"""
        with cd("deepnet"):
            run("git pull origin master")

    def _clean_git_repo(self):
        """Clean the git repo """
        with cd("deepnet"):
            run("git checkout -- *")

    def tesla_run_ff(self):
        """ Run ff on tesla """
        self._run_ff()


    def tesla_run_pause(self, duration=10):
        """ Pause and insert into table """
        cmd = 'sleep {}'.format(duration)
        processid = self._exec_bg_cmd(cmd)
        self._table_insert_jobs(processid, cmd)

    def _run_ff(self):
        """ Runs ff"""
        with cd("deepnet/deepnet/examples/ff"):
           processid = self._exec_bg_cmd("./runall.sh") 
           link = self._build_dnslink("deepnet/examples/checkpoints")
           self._table_insert_jobs(processid, "ff", link)

    def _build_dnslink(self, path):
        dns = self.aws_helper.name_to_publicdns[self.aws_helper.ip_to_name[env.host]]
        return '<a href="' + dns + ":8000/"+ path + '">Output</a>'

    def tesla_setup(self):
        """ Setup Tesla""" 
        self._setup()

    def _setup(self):
        """ Setup Telsa """
        self._clean_git_repo()
        self._update_from_github()
        self._setup_examples_path()
        self._clean_dev_shm()
        self._warm_start_cudamat()
        self._start_webserver()

    @with_settings(warn_only=True)
    def _start_webserver(self):
        with cd("deepnet"):
            self._exec_bg_cmd("python -m SimpleHTTPServer 8000")

    @with_settings(warn_only=True)
    def _clean_dev_shm(self):
        sudo("rm /dev/shm/*")

    def _warm_start_cudamat(self):
        with cd("deepnet/cudamat/examples"):
            run("python rbm_cudamat.py")

    def _setup_examples_path(self):
        """ cd into examples directory and setup path"""
        with cd("deepnet/deepnet/examples"):
            run("python setup_examples.py `pwd`/mnist `pwd`/checkpoints")

    @with_settings(shell_escape=False)
    def _exec_bg_cmd(self,
                           cmd, err="my.err", out="my.out", inp="/dev/null"):
        """ Run background job with no hup"""
        cmd = "(nohup " + cmd + " 2>%s 1>%s <%s & ); " % (err, out, inp) +\
            " ps ax --sort=etime " +\
            "| grep -F \'" + cmd + "\' " +\
            "| grep -v -F 'grep' | head -n 1 | tr -s \' \'"
        for line in run(cmd).splitlines():
            return line.split()[0]

    def tesla_exec_bg_cmd(self,
                           cmd, err="my.err", out="my.out", inp="/dev/null"):
        """ Runs single background job """
        self._exec_bg_cmd(cmd, err, out, inp)

    @with_settings(shell_escape=False)
    def deepnet_run_from_cli(self, deepnet_cli):
        """ Run java program using command line params """
        with cd("deepnet"):
            return self.deepnet_exec_bg_cmd(deepnet_cli)

    def _table_insert_jobs(self, processid, deepnet_cli, \
            link='<a href="{}">Dont click here</a>'.format(awsutil.constants['cat'])):
        """ Insert job into job table """
        hostname = self.aws_helper.ip_to_name[env.host]
        with JobTable() as tbl:
            now = datetime.datetime.now()
            max_job_id = tbl.get_max_jobid()
            new_job_id = 1 if max_job_id is None else max_job_id+1
            record = (
                new_job_id,
                processid,
                now,
                hostname,
                "submitted",
                deepnet_cli,
                link)
            tbl.insert_record(record)

    def all_update_jobs(self):
        """ Update jobs running on tesla"""
        self._table_update_jobs()


    def _table_update_jobs(self):
        """ Update the jobs table """
        hostname = self.aws_helper.ip_to_name[env.host]
        updates = defaultdict(list)

        for job in itertools.chain(self.jobs["submitted"], self.jobs["running"]):
            db_hostname, db_pid = job[3], job[1]
            if db_hostname != hostname:
                continue
            if not self._check_pid_exists(db_pid):
                updates["finished"].append(job[0])
            else:
                updates["running"].append(job[0])

        updates = dict(updates)
        with JobTable() as tbl:
            for stat in updates:
                tbl.update_stat(updates[stat], stat)

    def table_display_all(self):
        """ Display all table results """
        with JobTable() as tbl:
            html = JobTable.encode_html_rows(tbl.get_all_jobs())

        outf = os.path.join("/tmp", os.urandom(16).encode('hex')+".html")
        with open(outf, 'w') as fout:
            fout.write(html)

        webbrowser.open(outf, new=2)


    def table_kill_all_jobs(self):
        """ Kill all running jobs """
        with JobTable() as tbl:
            running = tbl.get_jobs_by_status("running")

        for job in running:
            self.table_kill_job(job[0])

    def table_kill_job(self, jobid):
        """ Delete a particular job id """

        jobid = int(jobid)
        print "Killing job : {:d}".format(jobid)
        with JobTable() as tbl:
            job_record = tbl.get_job_by_jobid(jobid)
        pid, hostname = job_record[1], job_record[3]
        ip = self.aws_helper.name_to_ip[hostname]

        with settings(host_string=ip):
            gid = run("ps x -o  '%p %r' | column -t | tr -s ' ' |" + \
                " grep -E '^{}' | cut -d ' ' -f2".format(pid))
            self._any_cmd("kill -TERM -{}".format(gid))

    def _check_pid_exists(self, pid):
        """ Check that a pid exists """
        return int(run("[ -e /proc/%d ] && echo 1 || echo 0" % pid))

class JobTable:

    """ MySQL table containing all the jobs and the job ids """
    columns = ["job_id", "pid", "ts", "mach", "stat", "cmd", "link"]

    def __enter__(self):
        self.con = lite.connect(awsutil.constants["JOB_TABLE"])
        self.cur = self.con.cursor()
        self._create_table()
        return self

    def __exit__(self, type, value, traceback):
        self.con.close()

    def insert_record(self, record):
        """ Insert a record into the table """
        cmd = "insert into jobs(job_id, pid, ts, mach, stat, cmd, link) values" +\
            "(?, ?, ?, ?, ?, ?, ?)"
        self.cur.execute(cmd, record)
        self.con.commit()

    def get_jobs_by_status(self, status, all=False):
        """ Get jobs according to status - submitted/running/finished """
        cmd = 'select * from jobs where stat="%s"' % status
        self.cur.execute(cmd)
        return self.cur.fetchall()

    def get_job_by_jobid(self, jobid):
        """ Get jobs according to status - submitted/running/finished """
        cmd = 'select * from jobs where job_id=%d' % jobid
        self.cur.execute(cmd)
        return self.cur.fetchall()[0]

    def get_all_jobs(self):
        """ Return all jobs """
        cmd = "select * from jobs order by ts desc"
        self.cur.execute(cmd)
        return self.cur.fetchall()

    def get_max_jobid(self):
        """ Return the max job id stored in the table """
        cmd = "select max(job_id) from jobs"
        self.cur.execute(cmd)
        max_id = self.cur.fetchone()
        return max_id[0]

    @staticmethod
    def encode_html_rows(rows):
        """ Encode rows into html """
        page = markup.page()
        page.h2("Job Table")
        page.init("Job Table")
        JobTable.make_table(page, rows, header= JobTable.columns)
        return page.__str__()

    @staticmethod
    def make_table(page, rows, header=None):
        """ Make an HTML table for a markup page """
        page.table(border=1)
        page.tr()
        page.th(header)
        page.tr.close()
        for row in rows:
            page.tr()
            page.td(row)
            page.tr.close()
        page.table.close()

    def display_all(self):
        """ Display all the records """
        cmd = "select * from jobs order by ts desc"
        self.cur.execute(cmd)
        for line in self.cur.fetchall():
            print(line)

    def _create_table(self):
        """ Create a job table """
        cmd = "create table if not exists jobs(job_id int, pid int, " +\
            "ts timestamp, mach text, stat text, cmd text, link text)"
        self.cur.execute(cmd)

    def _delete_table(self):
        """Delete the job table"""
        cmd = "drop table jobs"
        self.cur.execute()

    def update_stat(self, jobids, stat):
        """ updates values """
        cmd = 'update jobs set stat="%s" ' % stat + 'where job_id in (' +\
            ','.join(map(str, jobids)) + ')'
        print cmd
        self.cur.execute(cmd)
        self.con.commit()


if __name__ == '__main__':
    helper = aws_helper.AWSHelper()
    deepnet_helper = DeepnetHelper(helper)

    with JobTable() as tbl:
        now = datetime.datetime.now()
        max_job_id = tbl.get_max_jobid()
        new_job_id = 1 if max_job_id is None else max_job_id+1
        record = (new_job_id, 5300, now, "deepnet-1", "submitted", "ls -la")
        tbl.insert_record(record)
        record = (new_job_id+1, 5301, now, "deepnet-1", "submitted", "ls -la")
        tbl.insert_record(record)
        for rec in tbl.get_jobs_by_status("submitted"):
            print rec
