import os

constants = {
    "DEFAULT_ZONE": 'us-west-2',
    "AWS_USER": 'ubuntu',
    "AWS_PRIVATE_KEY": os.path.expanduser('~/Subho.pem'),
    "JOB_TABLE": os.path.expanduser("~/aws_jobs.tbl"),
    "HTTP_PORT": "8000",
    "cat" : "http://img3.wikia.nocookie.net/__cb20140501181347/creepypasta/images/f/f6/Grumpy_Cat.jpg"
}

def confirm(prompt="Are you sure?"):
    """prompts for yes or no """

    prompt = "{} (y|n): ".format(prompt)

    while True:
        ans = raw_input(prompt)
        if not ans:
            print prompt
            continue
        if ans in 'yY':
            return True
        if ans in 'nN':
            return False
        else:
            print prompt
            continue

def print_iterable(iterable):
    for e in iterable:
        print e

def get_deepnet_path():
    from commands import getstatusoutput
    if getstatusoutput('hostname')[1] == 'langmead.pc.cs.cmu.edu':
        path = '/storage/data1/dbm/deepnet/deepnet'
    else:
        path = '/home/ubuntu/deepnet/deepnet'
    return path


