import aws_helper
import deepnet_aws_helper as deepnet_helper
import inspect
from fabric.api import *
import awsutil
import itertools

# Instantiate helper objects
awshelper = aws_helper.AWSHelper()
deepnet_helper = deepnet_helper.DeepnetHelper(awshelper)

BANNED_INSTANCES=["PancreasCOE", "tesla1"]


# Set up roles and environments
env.shell = "/bin/bash -l -i -c" 
env.user = awsutil.constants["AWS_USER"]
env.roledefs = {
    "deepnet":
    [ip for (name, ip) in awshelper.name_to_ip.items() if name not in BANNED_INSTANCES],
    "tesla":
    [ip for (name, ip) in awshelper.name_to_ip.items() if name == 'tesla1'],
    "aws": [],
    "table": []
}
env.disable_known_hosts = True
env.key_filename = awsutil.constants["AWS_PRIVATE_KEY"]

# Add methods from helper classes to fabric namespace
aws_methods = [tup for tup in
               inspect.getmembers(awshelper, predicate=inspect.ismethod)
               if not tup[0].startswith("_")]
deepnet_methods = [tup for tup in
               inspect.getmembers(deepnet_helper, predicate=inspect.ismethod)
               if not tup[0].startswith("_")]

for tup in aws_methods:
    locals()[tup[0]] = roles("aws")(tup[1])

for tup in (tup for tup in deepnet_methods if tup[0].startswith("deepnet")):
    locals()[tup[0]] = roles("deepnet")(tup[1])

for tup in (tup for tup in deepnet_methods if tup[0].startswith("tesla")):
    locals()[tup[0]] = roles("tesla")(tup[1])

for tup in (tup for tup in deepnet_methods if tup[0].startswith("table")):
    locals()[tup[0]] = roles("table")(tup[1])
