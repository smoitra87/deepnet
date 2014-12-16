import os,sys
import boto.ec2
import re

DEFAULT_AMI ="ami-d13869e1" 
DEFAULT_INSTANCE_TYPE = "g2.2xlarge"
DEFAULT_KEY_NAME = "Subho"
DEFAULT_SECURITY_GROUP ="launch-wizard-4" 

def get_status(conn):
   reservations  = conn.get_all_instances()
   for res in reservations:
       for inst in res.instances:
           if 'Name' in inst.tags:
               print "%s (%s) [%s]" % (inst.tags['Name'], inst.id, inst.state)
           else:
               print "%s [%s]" % (inst.id, inst.state)

def get_next_job_id(conn, job_prefix):
   reservations  = conn.get_all_instances()
   names=  []
   for res in reservations:
       for inst in res.instances:
           if 'Name' in inst.tags and job_prefix in inst.tags["Name"]: 
               names.append(inst.tags["Name"])

   ids = map(int,[re.findall('\d+',f)[0] for f in names if re.findall('\d+',f)])
   return max(ids)+1 if ids else 1

def launch_instances(conn, job_prefix, launch_count=1):
    next_exp_id = get_next_job_id(conn, job_prefix = job_prefix)

    reservation = conn.run_instances(image_id=DEFAULT_AMI, instance_type=DEFAULT_INSTANCE_TYPE, \
            key_name= DEFAULT_KEY_NAME ,security_groups= [DEFAULT_SECURITY_GROUP], \
            min_count= launch_count, max_count=launch_count)

    for idx, instance in enumerate(reservation.instances):
        inst_name = job_prefix + str(next_exp_id + idx)
        conn.create_tags([instance.id], {"Name": inst_name})
        print("Launching {} {}".format(inst_name, instance.id))

def get_all_instances_by_job_prefix(conn, job_prefix):
   reservations  = conn.get_all_instances()
   instances = {}
   for res in reservations:
       for inst in res.instances:
           if 'Name' in inst.tags and job_prefix in inst.tags["Name"]:
               instances[inst.tags["Name"]] = inst.id
   return instances

def stop_instances(conn, job_prefix, start_idx=1, end_idx=None):
    end_idx = get_next_job_id(conn, job_prefix) if end_idx is None else end_idx

    instances = get_all_instances_by_job_prefix(conn, job_prefix)
    instances = dict([(inst, instances[inst]) for inst in instances if \
            int(re.findall("\d+",inst)[0]) in range(start_idx, end_idx)])
    conn.stop_instances(instance_ids = instances.values())
    for instance in instances : 
        print("Stopping {}".format(instance))

def terminate_instances(conn, job_prefix, start_idx=1, end_idx=None):
    end_idx = get_next_job_id(conn, job_prefix) if end_idx is None else end_idx + 1

    instances = get_all_instances_by_job_prefix(conn, job_prefix)
    instances = dict([(inst, instances[inst]) for inst in instances if \
            int(re.findall("\d+",inst)[0]) in range(start_idx, end_idx)])
    conn.terminate_instances(instance_ids = instances.values())
    for instance in instances : 
        print("Terminating {}".format(instance))


if __name__ == '__main__' : 
    from argparse import ArgumentParser
    parser = ArgumentParser(description="handles boto instance creation and termination")
    parser.add_argument("--launch",type=int,default = -1, help="Launch new gpu instances")
    parser.add_argument("--status", action='store_true', help="Show statuses of running instances")
    parser.add_argument("--job_prefix", type=str, default='experiment', help="Show statuses of running instances")
    parser.add_argument("--stop", action='store_true', help="stop jobs")
    parser.add_argument("--terminate", action='store_true', help="stop jobs")
    parser.add_argument("--start_idx", type=int, default=1, help="idx of the first job")
    parser.add_argument("--end_idx", type=int, default=None, help="idx of the last job")
    args= parser.parse_args()

    # Make the boto connenction
    try:
        conn = boto.ec2.connect_to_region("us-west-2")

        if args.status:
            get_status(conn)

        if args.launch != -1:
            launch_instances(conn, job_prefix=args.job_prefix, launch_count=args.launch)

        if args.stop:
            stop_instances(conn, job_prefix=args.job_prefix, start_idx=args.start_idx,\
                    end_idx=args.end_idx)

        if args.terminate:
            terminate_instances(conn, job_prefix=args.job_prefix, start_idx=args.start_idx,\
                    end_idx=args.end_idx)

    finally:
        conn.close()


