import os

constants = {
    "DEFAULT_ZONE": 'us-west-2',
    "AWS_USER": 'ubuntu',
    "AWS_PRIVATE_KEY": os.path.expanduser('~/Subho.pem'),
    "JOB_TABLE": os.path.expanduser("~/aws_jobs.tbl")
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
