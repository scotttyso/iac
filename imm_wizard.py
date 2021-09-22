#!/usr/bin/env python3
from pathlib import Path
from git import Repo
import getpass
import lib_aci
import os, re, sys
import subprocess
import time
import ucs_validating

home = Path.home()

def main():
    # Ask user for required Information:
    print(f'\n-----------------------------------------------------------------------------\n')
    print(f'  Starting the Easy IMM Wizard!')
    print(f'\n-----------------------------------------------------------------------------\n')

    valid = False
    while valid == False:
        organization = input('What is your Intersight Organization Name [default]? ')
        if organization == '':
            organization = 'default'
        valid = ucs_validating.org_rule('Intersight Organization', organization, 1, 62)

    policy_loop = False
    while policy_loop == False:
        policy_type = 'BIOS Policy'
        policy_file = 'bios_templates.txt'
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'Do You Want to Configure a {policy_type} Template? ')
        configure_x = input('Enter "Y" or "N" [Y/N]? ')
        if configure_x == 'Y':
            template_loop = False
            while template_loop == False:
                valid = False
                while valid == False:
                    if os.path.isfile(policy_file):
                        template_file = open(policy_file, 'r')
                        template_file.seek(0)
                        policy_templates = []
                        for line in template_file:
                            line = line.strip()
                            policy_templates.append(line)
                        print(f'\n-----------------------------------------------------------------------------\n')
                        print(f'  {policy_type} Policy Templates:')
                        for i, v in enumerate(policy_templates):
                            i += 1
                            if i < 10:
                                print(f'     {i}. {v}')
                            else:
                                print(f'    {i}. {v}')
                        print(f'\n-----------------------------------------------------------------------------\n')
                    policy_temp = input(f'Enter the Index Number for the {policy_type} Template to Create: ')
                    for i, v in enumerate(policy_templates):
                        i += 1
                        if int(policy_temp) == i:
                            policy_template = v
                            valid = True
                    if valid == False:
                        print(f'\n-----------------------------------------------------------------------------\n')
                        print(f'  Error!! Invalid Selection.  Please Select a valid Index from the List.')
                        print(f'\n-----------------------------------------------------------------------------\n')
                    template_file.close()

                valid = False
                while valid == False:
                    name = input(f'Enter the Name for the {policy_type} [{organization}_{policy_template}]: ')
                    if name == '':
                        name = '%s_%s' % (organization, policy_template)
                    valid = ucs_validating.name_rule(f'{policy_type} Name', name, 1, 62)

                valid = False
                while valid == False:
                    descr = input(f'Enter the Description for the {policy_type} [{organization}_{policy_template} {policy_type}.]: ')
                    if descr == '':
                        descr = '%s_%s %s.' % (organization, policy_template, policy_type)
                    valid = ucs_validating.description(f'{policy_type} Description', descr, 1, 128)

                template_answer = input(f'Would You like to Configure another {policy_type} Template [Y/N]? ')
                if template_answer == 'N':
                    template_loop = True
                    policy_loop = True

        else:
            policy_loop = True

    policy_loop = False
    while policy_loop == False:
        policy_type = 'Ethernet Adapter Policy'
        policy_file = 'ethernet_adapter_templates.txt'
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'Do You Want to Configure a {policy_type} Template? ')
        configure_x = input('Enter "Y" or "N" [Y/N]? ')
        if configure_x == 'Y':
            template_loop = False
            while template_loop == False:
                valid = False
                while valid == False:
                    if os.path.isfile(policy_file):
                        template_file = open(policy_file, 'r')
                        template_file.seek(0)
                        policy_templates = []
                        for line in template_file:
                            line = line.strip()
                            policy_templates.append(line)
                        print(f'\n-----------------------------------------------------------------------------\n')
                        print(f'  {policy_type} Policy Templates:')
                        for i, v in enumerate(policy_templates):
                            i += 1
                            if i < 10:
                                print(f'     {i}. {v}')
                            else:
                                print(f'    {i}. {v}')
                        print(f'\n-----------------------------------------------------------------------------\n')
                    policy_temp = input(f'Enter the Index Number for the {policy_type} Template to Create: ')
                    for i, v in enumerate(policy_templates):
                        i += 1
                        if int(policy_temp) == i:
                            policy_template = v
                            valid = True
                    if valid == False:
                        print(f'\n-----------------------------------------------------------------------------\n')
                        print(f'  Error!! Invalid Selection.  Please Select a valid Index from the List.')
                        print(f'\n-----------------------------------------------------------------------------\n')
                    template_file.close()

                valid = False
                while valid == False:
                    name = input(f'Enter the Name for the {policy_type} [{organization}_{policy_template}]: ')
                    if name == '':
                        name = '%s_%s' % (organization, policy_template)
                    valid = ucs_validating.name_rule(f'{policy_type} Name', name, 1, 62)

                valid = False
                while valid == False:
                    descr = input(f'Enter the Description for the {policy_type} [{organization}_{policy_template} {policy_type}.]: ')
                    if descr == '':
                        descr = '%s_%s %s.' % (organization, policy_template, policy_type)
                    valid = ucs_validating.description(f'{policy_type} Description', descr, 1, 128)

                template_answer = input(f'Would You like to Configure another {policy_type} Template [Y/N]? ')
                if template_answer == 'N':
                    template_loop = True
                    policy_loop = True

        else:
            policy_loop = True



    valid = False
    while valid == False:
        print(f'\n-----------------------------------------------------------------------------\n')
        ucs_domain_profile = input('What is the Name for the UCS Domain Profile [my-ucs]? ')
        if ucs_domain_profile == "":
            ucs_domain_profile = 'my-ucs'
        valid = ucs_validating.name_rule('UCS Domain Profile', ucs_domain_profile, 1, 62)

    valid = False
    while valid == False:
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'  1. UCS-FI-6454')
        print(f'  2. UCS-FI-64108')
        print(f'\n-----------------------------------------------------------------------------\n')
        model = input('Select the Index Value of the model of the Fabric Interconnects: ')
        if model == '1':
            device_model = 'UCS-FI-6454'
            valid = True
        elif model == '2':
            device_model = 'UCS-FI-64108'
            valid = True
        else:
            print(f'\n-----------------------------------------------------------------------------\n')
            print(f'  Error!! Invalid Selection.  Please Select a valid Index from the List.')
            print(f'\n-----------------------------------------------------------------------------\n')

    valid = False
    while valid == False:
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'  Note: If you do not have the Serial Number at this time you can manually')
        print(f'        add it to the ucs_domain_profiles/ucs_domain_profile.auto.tfvars')
        print(f'        file later.')
        print(f'\n-----------------------------------------------------------------------------\n')
        serial_number_fabric_a = input('What is the Serial Number of Fabric A [press enter to skip]? ')
        serial_number_fabric_b = input('What is the Serial Number of Fabric B [press enter to skip]? ')
        valid = True

    valid = False
    while valid == False:
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   UCS Version of Software to Deploy...')
        if os.path.isfile('ucs_version.txt'):
            version_file = open('ucs_version.txt', 'r')
            versions = []
            for line in version_file:
                line = line.strip()
                versions.append(line)
            for i, v in enumerate(versions):
                i += 1
                if i < 10:
                    print(f'     {i}. {v}')
                else:
                    print(f'    {i}. {v}')
        print(f'\n-----------------------------------------------------------------------------\n')
        ucs_version = input('Enter the Index Number for the Version of Software to Run: ')
        for i, v in enumerate(versions):
            i += 1
            if int(ucs_version) == i:
                ucs_domain_version = v
                valid = True
        if valid == False:
            print(f'\n-----------------------------------------------------------------------------\n')
            print(f'  Error!! Invalid Selection.  Please Select a valid Index from the List.')
            print(f'\n-----------------------------------------------------------------------------\n')
        version_file.close()

    valid = False
    while valid == False:
        print(f'\n-----------------------------------------------------------------------------\n')
        ipv4_primary_dns = input('What is your Primary IPv4 DNS Server [208.67.220.220]? ')
        if ipv4_primary_dns == '':
            ipv4_primary_dns = '208.67.220.220'
        valid = ucs_validating.ip_address('Primary IPv4 DNS Server', ipv4_primary_dns)

    valid = False
    while valid == False:
        alternate_true = input('Do you want to Configure an Alternate IPv4 DNS Server [Y/N]? ')
        if alternate_true == 'Y':
            ipv4_alternate_dns = input('What is your Alternate IPv4 DNS Server [208.67.222.222]? ')
            if ipv4_alternate_dns == '':
                ipv4_alternate_dns = '208.67.222.222'
            valid = ucs_validating.ip_address('Alternate IPv4 DNS Server', ipv4_alternate_dns)
        elif alternate_true == 'N':
            ipv4_alternate_dns = ''
            valid = True
        else:
            print(f'\n-----------------------------------------------------------------------------\n')
            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
            print(f'\n-----------------------------------------------------------------------------\n')

    valid = False
    while valid == False:
        ipv6_dns = input('Do you want to Configure IPv6 DNS [Y/N]? ')
        if ipv6_dns == 'Y':
            ipv6_primary_dns = input('What is your Primary IPv6 DNS Server [2620:119:35::35]? ')
            if ipv6_primary_dns == '':
                ipv6_primary_dns = '2620:119:35::35'
            valid = ucs_validating.ip_address('Primary IPv6 DNS Server', ipv6_primary_dns)
        if ipv6_dns == 'N':
            ipv6_primary_dns = ''
            valid = True

    valid = False
    while valid == False:
        if ipv6_dns == 'Y':
            alternate_true = input('Do you want to Configure an Alternate IPv6 DNS Server [Y/N]? ')
            if alternate_true == 'Y':
                ipv6_alternate_dns = input('What is your Alternate IPv6 DNS Server [2620:119:53::53]? ')
                if ipv6_alternate_dns == '':
                    ipv6_alternate_dns = '2620:119:53::53'
                valid = ucs_validating.ip_address('Alternate IPv6 DNS Server', ipv6_alternate_dns)
            elif alternate_true == 'N':
                ipv6_alternate_dns = ''
                valid = True
            else:
                print(f'\n-----------------------------------------------------------------------------\n')
                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                print(f'\n-----------------------------------------------------------------------------\n')
        else:
            ipv6_alternate_dns = ''
            valid = True

    valid = False
    while valid == False:
        primary_ntp = input('Please Enter your Primary NTP Server [0.north-america.pool.ntp.org]: ')
        if primary_ntp == "":
            primary_ntp = '0.north-america.pool.ntp.org'
        if re.search(r'[a-zA-Z]+', primary_ntp):
            valid = ucs_validating.dns_name('Primary NTP Server', primary_ntp)
        else:
            valid = ucs_validating.ip_address('Primary NTP Server', primary_ntp)

    valid = False
    while valid == False:
        alternate_true = input('Do you want to Configure an Alternate NTP Server [Y/N]? ')
        if alternate_true == 'Y':
            alternate_ntp = input('What is your Alternate NTP Server [1.north-america.pool.ntp.org]? ')
            if alternate_ntp == "":
                alternate_ntp = '1.north-america.pool.ntp.org'
            if re.search(r'[a-zA-Z]+', alternate_ntp):
                valid = ucs_validating.dns_name('Alternate NTP Server', alternate_ntp)
            else:
                valid = ucs_validating.ip_address('Alternate NTP Server', alternate_ntp)
        elif alternate_true == 'N':
            alternate_ntp = ''
            valid = True
        else:
            print(f'\n-----------------------------------------------------------------------------\n')
            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
            print(f'\n-----------------------------------------------------------------------------\n')

    valid = False
    while valid == False:
        print(f'\n-----------------------------------------------------------------------------')
        print(f'   Timezone Regions...')
        if os.path.isfile('timezones.txt'):
            tz_file = open('timezones.txt', 'r')
            tz_regions = []
            for line in tz_file:
                tz_region = line.split('/')[0]
                if not tz_region in tz_regions:
                    tz_regions.append(tz_region)
            for index, value in enumerate(tz_regions):
                index += 1
                if index < 10:
                    print(f'     {index}. {value}')
                else:
                    print(f'    {index}. {value}')
        print(f'-----------------------------------------------------------------------------\n')
        time_region = input('Please Enter the Index for the Time Region for the Domain: ')
        for index, value in enumerate(tz_regions):
            index += 1
            if int(time_region) == index:
                valid = True
        if valid == False:
            print(f'\n-----------------------------------------------------------------------------\n')
            print(f'  Error!! Invalid Selection.  Please Select a valid Index from the List.')
            print(f'\n-----------------------------------------------------------------------------\n')

    valid = False
    while valid == False:
        print(f'\n-----------------------------------------------------------------------------')
        print(f'   Region Timezones...')
        for index, value in enumerate(tz_regions):
            index += 1
            if int(time_region) == index:
                tz_region = value
                region_tzs = []
                tz_file.seek(0)
                for line in tz_file:
                    if tz_region in line:
                        line = line.strip()
                        region_tzs.append(line)
                for i, v in enumerate(region_tzs):
                    i += 1
                    if i < 10:
                        print(f'     {i}. {v}')
                    else:
                        print(f'    {i}. {v}')
        print(f'-----------------------------------------------------------------------------\n')
        timezone_index = input('Please Enter the Index for the Region Timezone to assign to the Domain: ')
        for i, v in enumerate(region_tzs):
            i += 1
            if int(timezone_index) == i:
                timezone = v
                valid = True
        if valid == False:
            print(f'\n-----------------------------------------------------------------------------\n')
            print(f'  Error!! Invalid Selection.  Please Select a valid Index from the List.')
            print(f'\n-----------------------------------------------------------------------------\n')
        tz_file.close()

    print(f'\n-----------------------------------------------------------------------------\n')
    print(f'Intersight Organization: {organization}')
    print(f'IPv4 Primary DNS Server: {ipv4_primary_dns}')
    if not ipv4_alternate_dns == '':
        print(f'IPv4 Alternate DNS Server: {ipv4_alternate_dns}')
    if not ipv6_primary_dns == '':
        print(f'IPv6 Primary DNS Server: {ipv6_primary_dns}')
    if not ipv6_alternate_dns == '':
        print(f'IPv6 Alternate DNS Server: {ipv6_alternate_dns}')
    print(f'Primary NTP Server: {primary_ntp}')
    if not alternate_ntp == '':
        print(f'Alternate NTP Server: {alternate_ntp}')
    print(f'Timezone is: {timezone}')
    print(f'UCS Domain Profile: {ucs_domain_profile}')
    print(f'UCS Domain Version: {ucs_domain_version}')
    print(f'UCS Domain Model: {device_model}')
    print(f'Serial Number Fabric A: {serial_number_fabric_a}')
    print(f'Serial Number Fabric B: {serial_number_fabric_b}')

    print(f'\n-----------------------------------------------------------------------------\n')
    print(f'  Proceedures Complete!!! Closing Environment and Exiting Script.')
    print(f'\n-----------------------------------------------------------------------------\n')
    exit()

if __name__ == '__main__':
    main()
