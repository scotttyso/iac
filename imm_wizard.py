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
        intersight_org = input('What is your Intersight Organization Name [default]? ')
        if intersight_org == "":
            intersight_org = 'default'
        valid = ucs_validating.org_rule('Intersight Organization', intersight_org, 1, 62)

    valid = False
    while valid == False:
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
            fabric_model = 'UCS-FI-6454'
            valid = True
        elif model == '2':
            fabric_model = 'UCS-FI-64108'
            valid = True
        else:
            print(f'\n-----------------------------------------------------------------------------\n')
            print(f'  Error!! Invalid Selection.  Please Select a valid Index from the List.')
            print(f'\n-----------------------------------------------------------------------------\n')

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
            else:
                print(f'\n-----------------------------------------------------------------------------\n')
                print(f'  Error!! Invalid Selection.  Please Select a valid Index from the List.')
                print(f'\n-----------------------------------------------------------------------------\n')

    valid = False
    while valid == False:
        ipv4_primary_dns = input('What is your Primary IPv4 DNS Server [208.67.220.220]? ')
        if ipv4_primary_dns == "":
            ipv4_primary_dns = '208.67.220.220'
        valid = ucs_validating.ip_address('Primary DNS Server', ipv4_primary_dns)

    valid = False
    while valid == False:
        secondary_true = input('Do you want to Configure a Secondary IPv4 DNS Server [Y/N]?')
        if secondary_true == 'Y':
            ipv4_secondary_dns = input('What is your Secondary DNS Server [208.67.222.222]? ')
            if ipv4_secondary_dns == "":
                ipv4_secondary_dns = '208.67.222.222'
            valid = ucs_validating.ip_address('Secondary DNS Server', ipv4_secondary_dns)
        elif secondary_true == 'N':
            ipv4_secondary_dns = ''
            valid = True
        else:
            print(f'\n-----------------------------------------------------------------------------\n')
            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
            print(f'\n-----------------------------------------------------------------------------\n')

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
        secondary_true = input('Do you want to Configure a Secondary NTP Server [Y/N]?')
        if secondary_true == 'Y':
            secondary_ntp = input('What is your Secondary DNS Server [1.north-america.pool.ntp.org]? ')
            if secondary_ntp == "":
                secondary_ntp = '1.north-america.pool.ntp.org'
            valid = ucs_validating.ip_address('Secondary DNS Server', secondary_ntp)
            if re.search(r'[a-zA-Z]+', secondary_ntp):
                valid = ucs_validating.dns_name('Secondary NTP Server', secondary_ntp)
            else:
                valid = ucs_validating.ip_address('Secondary NTP Server', secondary_ntp)
        elif secondary_true == 'N':
            secondary_ntp = ''
            valid = True
        else:
            print(f'\n-----------------------------------------------------------------------------\n')
            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
            print(f'\n-----------------------------------------------------------------------------\n')

        secondary_ntp = input('Please Enter your Secondary NTP Server: ')
        valid = ucs_validating.ip_address('Secondary NTP Server', secondary_ntp)
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
        timezone_index = input('Please Enter the Index for the Time Region Above to assign to the Domain: ')
        for i, v in enumerate(region_tzs):
            i += 1
            if int(timezone_index) == i:
                timezone = v
        print(f'Timezone is {timezone}')
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'Intersight Organization: {intersight_org}')
        print(f'UCS Domain Profile: {ucs_domain_profile}')
        print(f'UCS Domain Version: {ucs_domain_version}')
        print(f'IPv4 Primary DNS Server: {ipv4_primary_dns}')
        print(f'IPv4 Secondary DNS Server: {ipv4_secondary_dns}')
        print(f'Primary NTP Server: {primary_ntp}')
        print(f'Secondary NTP Server: {secondary_ntp}')
        print(f'Timezone is: {timezone}')
        break

    print(f'\n-----------------------------------------------------------------------------\n')
    print(f'  Proceedures Complete!!! Closing Environment and Exiting Script.')
    print(f'\n-----------------------------------------------------------------------------\n')
    exit()

if __name__ == '__main__':
    main()
