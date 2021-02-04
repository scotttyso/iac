#!/usr/bin/env python3

import getpass
import os, re
import subprocess

#user = input('Enter APIC username: ')
#while True:
#    try:
#        password = getpass.getpass(prompt='Enter APIC password: ')
#        break
#    except Exception as e:
#        print('Something went wrong. Error received: {}'.format(e))

os.environ['TF_VAR_aciUser'] = '%s' % ('admin')
os.environ['TF_VAR_aciPass'] = '%s' % ('cisco123')

#path = './ACI/DC2/L3Out'

# folders = ['dc1-spine101', 'dc1-leaf201', 'dc1-leaf202']

folders = ['Tenant_mgmt', 'Access', 'Access/VLANs', 'Fabric', 'Admin', 'dc1-spine101', 'dc1-leaf201', 'dc1-leaf202',
           'Tenant_common', 'Tenant_infra', 'Tenant_dmz', 'Tenant_prod']

for folder in folders:
    path = './ACI/DC1/%s' % (folder)
    if 'VLANs' in path:
        p = subprocess.Popen(['terraform', 'init', '-plugin-dir=../../../../terraform-plugins/providers/'], cwd=path)
    else:
        p = subprocess.Popen(['terraform', 'init', '-plugin-dir=../../../terraform-plugins/providers/'], cwd=path)
    p.wait()
    p = subprocess.Popen(['terraform', 'plan', '-out=main.plan'], cwd=path)
    p.wait()
    while True:
        print('Plan Complete.  Please Review the Plan and confirm if you want to move forward.')
        response = input('A to Apply the Plan. S to Skip.  Q to Quit.\n  Please Enter [A, S or Q]: ')
        if re.search('^(A|S)$', response):
            break
        elif response == 'Q':
            exit()
        else:
            print(f'\n-----------------------------------------------------------------------------\n')
            print(f'   A Valid Response is either "A", "S" or "Q"...')
            print(f'\n-----------------------------------------------------------------------------\n')

    if response == 'A':
        p = subprocess.Popen(['terraform', 'apply', '-parallelism=1', 'main.plan'], cwd=path)
        p.wait()

    while True:
        print('Apply Complete.  Please Review and confirm if you want to move forward.')
        response = input('M to Move to the Next Section. Q to Quit.\n  Please Enter [M or Q]: ')
        if response == 'M':
            break
        elif response == 'Q':
            exit()
        else:
            print(f'\n-----------------------------------------------------------------------------\n')
            print(f'   A Valid Response is either "M" or "Q"...')
            print(f'\n-----------------------------------------------------------------------------\n')



