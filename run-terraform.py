#!/usr/bin/env python3

import getpass
import os, re
import subprocess

print(f'\n-----------------------------------------------------------------------------\n')
print(f'   Beginning Proceedures to Apply Terraform Resources to the environment')
print(f'\n-----------------------------------------------------------------------------\n')

random_folders = []
git_path = './'
result = subprocess.Popen(['python3', '-m', 'git_status_checker'], stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
while(True):
    # returns None while subprocess is running
    retcode = result.poll()
    line = result.stdout.readline()
    line = line.decode('utf-8')
    if re.search(r'M (.*/).*.tf\n', line):
        folder = re.search(r'M (.*/).*.tf', line).group(1)
        if not folder in random_folders:
            random_folders.append(folder)
    if retcode is not None:
        break

if not random_folders:
    print(f'\n-----------------------------------------------------------------------------\n')
    print(f'   There were no uncommitted changes in the environment.')
    print(f'   Proceedures Complete!!! Closing Environment and Exiting Script.')
    print(f'\n-----------------------------------------------------------------------------\n')
    exit()

user = input('Enter APIC username: ')
while True:
    try:
        password = getpass.getpass(prompt='Enter APIC password: ')
        break
    except Exception as e:
        print('Something went wrong. Error received: {}'.format(e))

os.environ['TF_VAR_aciUser'] = '%s' % (user)
os.environ['TF_VAR_aciPass'] = '%s' % (password)

strict_folders = []
folder_order = ['Tenant_mgmt', 'Access', 'VLANs', 'Fabric', 'Admin', 'Tenant_common', 'Tenant_infra', 'L3Out']
for folder in folder_order:
    for fx in random_folders:
        if folder in fx:
            strict_folders.append(folder)
            random_folders.remove(folder)
for folder in random_folders:
    strict_folders.append(folder)
    random_folders.remove(folder)

print(strict_folders)

response_p = ''
response_a = ''
for folder in strict_folders:
    path = './%s' % (folder)
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