import aws_helper
#import deepnet_aws_helper
import inspect
from fabric.api import *
import awsutil
import itertools

# Instantiate helper objects
awshelper = aws_helper.AWSHelper()
#deepnet_helper = deepnet_helper.DeepnetHelper(helper)

# Set up roles and environments
env.user = awsutil.constants["AWS_USER"]
env.roledefs = {
    "denovo":
    [ip for (name, ip) in awshelper.name_to_ip.items() if 'denovo' in name],
    "single":
    [ip for (name, ip) in awshelper.name_to_ip.items() if name == 'denovo-1'],
    "aws": [],
    "table": []
}
env.disable_known_hosts = True
env.key_filename = awsutil.constants["AWS_PRIVATE_KEY"]

# Add methods from helper classes to fabric namespace
aws_methods = [tup for tup in
               inspect.getmembers(awshelper, predicate=inspect.ismethod)
               if not tup[0].startswith("_")]
#deepnet_methods = [tup for tup in
#               inspect.getmembers(deepnet_helper, predicate=inspect.ismethod)
#               if not tup[0].startswith("_")]
#
for tup in aws_methods:
    locals()[tup[0]] = roles("aws")(tup[1])

#for tup in (tup for tup in denovo_methods if tup[0].startswith("denovo")):
#    locals()[tup[0]] = roles("denovo")(tup[1])
#
#for tup in (tup for tup in denovo_methods if tup[0].startswith("single")):
#    locals()[tup[0]] = roles("single")(tup[1])
#
#for tup in (tup for tup in denovo_methods if tup[0].startswith("table")):
#    locals()[tup[0]] = roles("table")(tup[1])
