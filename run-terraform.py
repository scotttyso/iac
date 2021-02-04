#!/usr/bin/env python3

import getpass
import os, re
import subprocess
import datetime as dt

now = dt.datetime.now()
ago = now-dt.timedelta(minutes=20)

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

#path = './ACI/DC2/L3Out'

#data_center = 'DC1'
#folders = ['Tenant_mgmt', 'Access', 'Access/VLANs', 'Fabric', 'Admin', 'dc1-spine101', 'dc1-leaf201', 'dc1-leaf202',
#           'Tenant_common', 'Tenant_infra', 'Tenant_dmz', 'Tenant_prod']
data_center = 'DC2'
folders = ['Tenant_mgmt', 'Access', 'Access/VLANs', 'Fabric', 'Admin', 'dc2-spine101', 'dc2-leaf201', 'dc2-leaf202',
           'Tenant_common', 'Tenant_infra', 'Tenant_dmz', 'Tenant_prod']

skip_folders = []

for folder in folders:
    no_changes_count = 0
    path = './ACI/%s/%s' % (data_center, folder)
    files = os.listdir(path)
    for filename in files:
        if filename.endswith('.tf'):
            path_check = os.path.join(path, filename)
            st = os.stat(path_check)    
            mtime = dt.datetime.fromtimestamp(st.st_mtime)
            if not mtime > ago:
                no_changes_count += 1
    if no_changes_count > 0:
        skip_folders.append(folder)

for folder in skip_folders:
    folders.remove(folder)

for folder in folders:
    path = './ACI/%s/%s' % (data_center, folder)
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

