import argparse
import logging
import re
import copy
import os, sys
import boto.ec2
from awsutil import confirm

DEFAULT_AMI ="ami-bdeeb68d" 
DEFAULT_INSTANCE_TYPE = "g2.2xlarge"
DEFAULT_KEY_NAME = "Subho"
DEFAULT_SECURITY_GROUP ="launch-wizard-4" 

class AWSHelper(object):

    """ Helper class for gce instances """

    def __init__(self):
        self.gce_service = None
        self.auth_http = None
        self.conn = boto.ec2.connect_to_region("us-west-2")
        self.name_to_ip = {}
        self.ip_to_name = {}
        self.name_to_publicdns = {}
        self.publicdns_to_name = {}
        self._update_name_to_ip()
        self._update_name_to_publicdns()
    
    def aws_rename_instances(self, from_prefix, to_prefix):
       instances  = self.conn.get_only_instances()
       for inst in instances:
           if inst.tags['Name'].startswith(from_prefix):
               name = inst.tags["Name"]
               new_name = to_prefix + name[len(from_prefix):]
               self.conn.create_tags([inst.id], {"Name": new_name})
               print "Renaming %s -> %s" % (name, new_name)
               import time ; time.sleep(1)

    def aws_get_status(self):
       """ Get all statuses """ 
       reservations  = self.conn.get_all_instances()
       for res in reservations:
           for inst in res.instances:
               if 'Name' in inst.tags:
                   print "%s (%s) [%s]" % (inst.tags['Name'], inst.id, inst.state)
               else:
                   print "%s [%s]" % (inst.id, inst.state)

    def aws_launch_instances(self, job_prefix, launch_count=1):
        """ Launch instances (job_prefix, launch_count)"""
        next_exp_id = self._get_next_instance_id(job_prefix = job_prefix)

        reservation = self.conn.run_instances(image_id=DEFAULT_AMI, instance_type=DEFAULT_INSTANCE_TYPE, \
                key_name= DEFAULT_KEY_NAME ,security_groups= [DEFAULT_SECURITY_GROUP], \
                min_count= launch_count, max_count=launch_count)

        for idx, instance in enumerate(reservation.instances):
            import time ; time.sleep(2)  # give aws a breather
            inst_name = job_prefix + str(next_exp_id + idx)
            self.conn.create_tags([instance.id], {"Name": inst_name})
            print("Launching {} {}".format(inst_name, instance.id))

    def _get_next_instance_id(self, job_prefix):
       names=  []
       for inst in self.conn.get_only_instances():
           if not inst.ip_address: continue 
           if 'Name' in inst.tags and job_prefix in inst.tags["Name"]: 
               names.append(inst.tags["Name"])

       ids = map(int,[re.findall('\d+',f)[0] for f in names if re.findall('\d+',f)])
       nextid =  max(ids)+1 if ids else 1
       print "Next id {}".format(nextid)
       confirm()
       return nextid

    def aws_stop_instances(self, job_prefix, start_idx=1, end_idx=None):
        """ Stop instances (job_prefix, start_idx, end_idx)"""
        end_idx = self._get_next_instance_id(job_prefix) if end_idx is None else end_idx

        instances = self._get_all_instances_by_prefix(job_prefix)
        instances = dict([(inst, instances[inst]) for inst in instances if \
                int(re.findall("\d+",inst)[0]) in range(int(start_idx), int(end_idx))])
        print(instances)
        self.conn.stop_instances(instance_ids = instances.values())
        for instance in instances : 
            print("Stopping {}".format(instance))

    def aws_stop_instance(self, name):
        """ Stop instances (job_prefix, start_idx, end_idx)"""
        instance_id = self._get_instance_id(name) 
        print "Stopping ",name, instance_id
        self.conn.stop_instances(instance_ids = [instance_id])

    def aws_terminate_instances(self, job_prefix, start_idx=1, end_idx=None):
        """ Terminate instances (job_prefix, start_idx, end_idx)"""
        end_idx = self._get_next_instance_id(job_prefix) if end_idx is None else int(end_idx) + 1

        start_idx, end_idx = int(start_idx), int(end_idx)
        instances = self._get_all_instances_by_prefix( job_prefix)
        instances = dict([(inst, instances[inst]) for inst in instances if \
                int(re.findall("\d+",inst)[0]) in range(start_idx, end_idx)])
        self.conn.terminate_instances(instance_ids = instances.values())
        for instance in instances : 
            print("Terminating {}".format(instance))

    def _get_all_instances_by_prefix(self, job_prefix):
       reservations  = self.conn.get_all_instances()
       instances = {}
       for res in reservations:
           for inst in res.instances:
               if 'Name' in inst.tags and job_prefix in inst.tags["Name"]:
                   instances[inst.tags["Name"]] = inst.id
       return instances

    def _get_instance_id(self, name):
       reservations  = self.conn.get_all_instances()
       for res in reservations:
           for inst in res.instances:
               if 'Name' in inst.tags and name == inst.tags["Name"]:
                   return inst.id

    @staticmethod
    def _get_instance_number(instance_name):
        """ Get the number from an instance"""
        try:
            number = int(next(re.compile('\d+').finditer(
                instance_name)).group())
        except StopIteration:
            raise ValueError("Unknown instance type" + instance_name)
        return number

    def _update_name_to_ip(self):
        self.name_to_ip = dict([(inst.tags["Name"], inst.ip_address) \
                for inst in self.conn.get_only_instances() if inst.ip_address])
        self.ip_to_name = dict([(v,k) for (k,v) in self.name_to_ip.items()])

    def _update_name_to_publicdns(self):
        self.name_to_publicdns = dict([(inst.tags["Name"], inst.public_dns_name) \
                for inst in self.conn.get_only_instances() if inst.public_dns_name])
        self.publicdns_to_name = dict([(v,k) for (k,v) in self.name_to_publicdns.items()])

    def aws_list_name_ips(self):
        """ List all the name to ip maps """
        for  key, val in self.name_to_ip.iteritems():
            print("{0}: {1}".format(key, val))

if __name__ == '__main__':
    awshelper = AWSHelper()
    awshelper.aws_get_status()
    awshelper._update_name_to_ip()
    awshelper.aws_list_name_ips()
