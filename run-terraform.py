#!/usr/bin/env python3

import getpass
import glob, os, re
import subprocess
import datetime as dt
from git import Repo

print(f'\n-----------------------------------------------------------------------------\n')
print(f'   Beginning Proceedures to Apply Terraform Code to the environment')
print(f'\n-----------------------------------------------------------------------------\n')

# user = input('Enter APIC username: ')
# while True:
#     try:
#         password = getpass.getpass(prompt='Enter APIC password: ')
#         break
#     except Exception as e:
#         print('Something went wrong. Error received: {}'.format(e))

os.environ['TF_VAR_aciUser'] = '%s' % ('admin')
os.environ['TF_VAR_aciPass'] = '%s' % ('cisco123')

folders = []
git_path = './'
repo = Repo('./')
lastCommit = repo.head.commit.committed_date
uncommittedFiles = []
files = [f for f in glob.glob(git_path + "**/*.tf", recursive=True)]
for file in files:
    dir_path = os.path.dirname(file)
    if os.path.getmtime(file) > lastCommit:
        if not dir_path in folders:
            folders.append(dir_path)

if not folders:
    print(f'\n-----------------------------------------------------------------------------\n')
    print(f'   There were no uncommitted changes in the environment.')
    print(f'   Proceedures Complete!!! Closing Environment and Exiting Script.')
    print(f'\n-----------------------------------------------------------------------------\n')
    exit()


response_p = ''
response_a = ''
for folder in folders:
    path = folder
    if 'VLANs' in path:
        p = subprocess.Popen(['terraform', 'init', '-plugin-dir=../../../../terraform-plugins/providers/'], cwd=path)
    else:
        p = subprocess.Popen(['terraform', 'init', '-plugin-dir=../../../terraform-plugins/providers/'], cwd=path)
    p.wait()
    p = subprocess.Popen(['terraform', 'plan', '-out=main.plan'], cwd=path)
    p.wait()
    while True:
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Terraform Plan Complete.  Please Review the Plan and confirm if you want')
        print(f'   to move forward.  "A" to Apply the Plan. "S" to Skip.  "Q" to Quit.')
        print(f'\n-----------------------------------------------------------------------------\n')
        response_p = input('Please Enter ["A", "S" or "Q"]: ')
        if re.search('^(A|S)$', response_p):
            break
        elif response_p == 'Q':
            exit()
        else:
            print(f'\n-----------------------------------------------------------------------------\n')
            print(f'   A Valid Response is either "A", "S" or "Q"...')
            print(f'\n-----------------------------------------------------------------------------\n')

    if response_p == 'A':
        p = subprocess.Popen(['terraform', 'apply', '-parallelism=1', 'main.plan'], cwd=path)
        p.wait()

    while True:
        if response_p == 'A':
            response_p = ''
            print(f'\n-----------------------------------------------------------------------------\n')
            print(f'   Terraform Apply Complete.  Please Review for any errors and confirm if you')
            print(f'   want to move forward.  "M" to Move to the Next Section. "Q" to Quit..')
            print(f'\n-----------------------------------------------------------------------------\n')
            response_a = input('\n  Please Enter ["M" or "Q"]: ')
        elif response_p == 'S':
            break
        if response_a == 'M':
            break
        elif response_a == 'Q':
            exit()
        else:
            print(f'\n-----------------------------------------------------------------------------\n')
            print(f'   A Valid Response is either "M" or "Q"...')
            print(f'\n-----------------------------------------------------------------------------\n')

print(f'\n-----------------------------------------------------------------------------\n')
print(f'   Proceedures Complete!!! Closing Environment and Exiting Script.')
print(f'\n-----------------------------------------------------------------------------\n')
exit()

