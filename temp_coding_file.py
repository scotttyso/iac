#!/usr/bin/env python3

import codecs
import copy
import getpass
import ipaddress
import jinja2
import os, re, sys
import pkg_resources
import validating_ucs
from pathlib import Path

ucs_template_path = pkg_resources.resource_filename('lib_ucs', 'ucs_templates/')

class easy_imm_wizard(object):
    def __init__(self, name_prefix, org, type):
        self.templateLoader = jinja2.FileSystemLoader(
            searchpath=(ucs_template_path + '%s/') % (type))
        self.templateEnv = jinja2.Environment(loader=self.templateLoader)
        self.name_prefix = name_prefix
        self.org = org
        self.type = type

    #========================================
    # SNMP Policy Module
    #========================================
    def snmp_policies(self):
        name_prefix = self.name_prefix
        name_suffix = 'snmp'
        org = self.org
        policy_names = []
        policy_type = 'SNMP Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'snmp_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  A {policy_type} will configure chassis, domains, and servers with SNMP parameters.')
            print(f'  This Policy is not required to standup a server but is a good practice for day 2 support.')
            print(f'  This wizard will save the configuraton for this section to the following file:')
            print(f'  - Intersight/{org}/{self.type}/{templateVars["template_type"]}.auto.tfvars')
            print(f'\n-------------------------------------------------------------------------------------------\n')
            configure = input(f'Do You Want to Configure an {policy_type}?  Enter "Y" or "N" [Y]: ')
            if configure == 'Y' or configure == '':
                loop_count = 1
                policy_loop = False
                while policy_loop == False:

                    if not name_prefix == '':
                        name = '%s_%s' % (name_prefix, name_suffix)
                    else:
                        name = '%s_%s' % (org, name_suffix)

                    templateVars["name"] = policy_name(name, policy_type)
                    templateVars["descr"] = policy_descr(templateVars["name"], policy_type)
                    templateVars["enabled"] = True

                    valid = False
                    while valid == False:
                        templateVars["port"] = input(f'Note: The following Ports cannot be chosen: [22, 23, 80, 123, 389, 443, 623, 636, 2068, 3268, 3269]\n'\
                            'Enter the Port to Assign to this SNMP Policy.  Valid Range is 1-65535.  [161]: ')
                        if templateVars["port"] == '':
                            templateVars["port"] = 161
                        if re.search(r'[0-9]{1,4}', str(templateVars["port"])):
                            valid = validating_ucs.snmp_port('SNMP Port', templateVars["port"], 1, 65535)
                        else:
                            print(f'\n-------------------------------------------------------------------------------------------\n')
                            print(f'  Invalid Entry!  Please Enter a valid Port in the range of 1-65535.')
                            print(f'  Excluding [22, 23, 80, 123, 389, 443, 623, 636, 2068, 3268, 3269].')
                            print(f'\n-------------------------------------------------------------------------------------------\n')

                    valid = False
                    while valid == False:
                        templateVars["system_contact"] = input(f'Note: Enter a string up to 64 characters, such as an email address or a name and telephone number.\n'\
                            'What is the Contact person responsible for the SNMP implementation?  [UCS Admins]: ')
                        if templateVars["system_contact"] == '':
                            templateVars["system_contact"] = 'UCS Admins'
                        valid = validating_ucs.string_length('System Contact', templateVars["system_contact"], 1, 64)

                    valid = False
                    while valid == False:
                        templateVars["system_location"] = input(f'What is the Location of the host on which the SNMP agent (server) runs?  [Data Center]: ')
                        if templateVars["system_location"] == '':
                            templateVars["system_location"] = 'Data Center'
                        valid = validating_ucs.string_length('System Location', templateVars["system_location"], 1, 64)

                    templateVars["access_community_string"] = ''
                    valid = False
                    while valid == False:
                        question = input(f'Would you like to configure an SNMP Access Community String?  Enter "Y" or "N" [N]: ')
                        if question == 'Y':
                            input_valid = False
                            while input_valid == False:
                                input_string = input(f'What is your SNMP Access Community String? ')
                                if not input_string == '':
                                    input_valid = validating_ucs.snmp_string('SNMP Access Community String', input_string)
                                else:
                                    print(f'\n-------------------------------------------------------------------------------------------\n')
                                    print(f'  Error!! Invalid Value.  Please Re-enter the SNMP Access Community String.')
                                    print(f'\n-------------------------------------------------------------------------------------------\n')
                            templateVars["access_community_string"] = loop_count
                            os.environ['TF_VAR_access_community_string_{loop_count}'] = input_string
                            valid = True
                        elif question == '' or question == 'N':
                            valid = True
                        else:
                            print(f'\n------------------------------------------------------\n')
                            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                            print(f'\n------------------------------------------------------\n')

                    templateVars["policy_file"] = 'snmp_community_access.txt'
                    templateVars["var_description"] = '    Controls access to the information in the inventory tables. Applicable only for SNMPv1 and SNMPv2c.\n'\
                        '    - Disabled - (Defualt) - Blocks access to the information in the inventory tables.\n'\
                        '    - Full - Full access to read the information in the inventory tables.\n'\
                        '    - Limited - Partial access to read the information in the inventory tables.\n'
                    templateVars["var_type"] = 'SNMP Community Access'
                    templateVars["snmp_community_access"] = variable_loop(**templateVars)

                    templateVars["trap_community_string"] = ''
                    valid = False
                    while valid == False:
                        question = input(f'Would you like to configure an SNMP Trap Community String?  Enter "Y" or "N" [N]: ')
                        if question == 'Y':
                            input_valid = False
                            while input_valid == False:
                                input_string = input(f'What is your SNMP Trap Community String? ')
                                if not input_string == '':
                                    input_valid = validating_ucs.snmp_string('SNMP Trap Community String', input_string)
                                else:
                                    print(f'\n-------------------------------------------------------------------------------------------\n')
                                    print(f'  Error!! Invalid Value.  Please Re-enter the SNMP Trap Community String.')
                                    print(f'\n-------------------------------------------------------------------------------------------\n')
                            templateVars["trap_community_string"] = loop_count
                            os.environ['TF_VAR_snmp_trap_community_{loop_count}'] = input_string
                            valid = True
                        elif question == '' or question == 'N':
                            valid = True
                        else:
                            print(f'\n------------------------------------------------------\n')
                            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                            print(f'\n------------------------------------------------------\n')

                    templateVars["snmp_engine_input_id"] = ''
                    valid = False
                    while valid == False:
                        question = input(f'Note: By default this is derived from the BMC serial number.\n'\
                            'Would you like to configure a Unique string to identify the device for administration purpose?  Enter "Y" or "N" [N]: ')
                        if question == 'Y':
                            input_valid = False
                            while input_valid == False:
                                input_string = input(f'What is the SNMP Engine Input ID? ')
                                if not input_string == '':
                                    input_valid = validating_ucs.string_length('SNMP Engine Input ID', input_string, 1, 27)
                                else:
                                    print(f'\n-------------------------------------------------------------------------------------------\n')
                                    print(f'  Error!! Invalid Value.  Please Re-enter the SNMP Engine Input ID.')
                                    print(f'\n-------------------------------------------------------------------------------------------\n')
                            templateVars["snmp_engine_input_id"] = input_string
                            valid = True
                        elif question == '' or question == 'N':
                            valid = True
                        else:
                            print(f'\n------------------------------------------------------\n')
                            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                            print(f'\n------------------------------------------------------\n')

                    templateVars["users"] = []
                    inner_loop_count = 1
                    snmp_loop = False
                    while snmp_loop == False:
                        question = input(f'Would you like to configure an SNMPv3 User?  Enter "Y" or "N" [Y]: ')
                        if question == '' or question == 'Y':
                            valid = False
                            while valid == False:
                                snmp_user = input(f'What is your SNMPv3 username? ')
                                if not snmp_user == '':
                                    valid = validating_ucs.snmp_string('SNMPv3 User', snmp_user)
                                else:
                                    print(f'\n-------------------------------------------------------------------------------------------\n')
                                    print(f'  Error!! Invalid Value.  Please Re-enter the SNMPv3 Username.')
                                    print(f'\n-------------------------------------------------------------------------------------------\n')

                            templateVars["policy_file"] = 'snmp_privacy_type.txt'
                            templateVars["var_description"] = '    Security mechanism used for communication between agent and manager:\n'\
                                '    - AuthNoPriv - The user requires an authorization password but not a privacy password.\n'\
                                '    - AuthPriv - (Default) - The user requires both an authorization password and a privacy\n'\
                                '               password.\n'
                            templateVars["var_type"] = 'SNMP Privacy Level'
                            security_level = variable_loop(**templateVars)

                            if security_level == 'AuthNoPriv' or security_level == 'AuthPriv':
                                templateVars["policy_file"] = 'snmp_authorization_protocol.txt'
                                templateVars["var_description"] = '    Authorization protocol for authenticating the user.  Currently Options are:\n'\
                                    '    - MD5\n'\
                                    '    - SHA - (Default)\n'
                                templateVars["var_type"] = 'SNMP Authorization Protocol'
                                auth_type = variable_loop(**templateVars)

                            if security_level == 'AuthNoPriv' or security_level == 'AuthPriv':
                                valid = False
                                while valid == False:
                                    auth_password = input(f'What is the authorization password for {snmp_user}? ')
                                    if not auth_password == '':
                                        valid = validating_ucs.snmp_string('SNMPv3 Authorization Password', auth_password)
                                    else:
                                        print(f'\n-------------------------------------------------------------------------------------------\n')
                                        print(f'  Error!! Invalid Value.  Please Re-enter the SNMPv3 Username.')
                                        print(f'\n-------------------------------------------------------------------------------------------\n')
                                auth_password = inner_loop_count
                                os.environ[f'TF_VAR_snmp_auth_password_{inner_loop_count}'] = auth_password

                            if security_level == 'AuthPriv':
                                templateVars["policy_file"] = 'snmp_authorization_protocol.txt'
                                templateVars["var_description"] = '    Privacy protocol for the user.  Options are:\n'\
                                    '    - AES - (Default)\n'\
                                    '    - DES\n'
                                templateVars["var_type"] = 'SNMP Privacy Protocol'
                                privacy_type = variable_loop(**templateVars)

                            if security_level == 'AuthPriv':
                                valid = False
                                while valid == False:
                                    auth_pass = input(f'What is the privacy password for {snmp_user}? ')
                                    if not auth_pass == '':
                                        valid = validating_ucs.snmp_string('SNMPv3 Privacy Password', auth_pass)
                                    else:
                                        print(f'\n-------------------------------------------------------------------------------------------\n')
                                        print(f'  Error!! Invalid Value.  Please Re-enter the SNMPv3 Username.')
                                        print(f'\n-------------------------------------------------------------------------------------------\n')
                                privacy_password = inner_loop_count
                                os.environ[f'TF_VAR_snmp_privacy_password_{inner_loop_count}'] = '%s' % (auth_pass)

                            if security_level == 'AuthPriv':
                                snmp_user = {
                                    'auth_password':auth_password,
                                    'auth_type':auth_type,
                                    'name':snmp_user,
                                    'privacy_password':privacy_password,
                                    'privacy_type':privacy_type,
                                    'security_level':security_level
                                }
                            elif security_level == 'AuthNoPriv':
                                snmp_user = {
                                    'auth_password':auth_password,
                                    'auth_type':auth_type,
                                    'name':snmp_user,
                                    'security_level':security_level
                                }

                            print(f'\n-------------------------------------------------------------------------------------------\n')
                            print(f'   auth_password    = "Sensitive"')
                            print(f'   auth_type        = "{auth_type}"')
                            if security_level == 'AuthPriv':
                                print(f'   privacy_password = "Sensitive"')
                                print(f'   privacy_type     = "{privacy_type}"')
                            print(f'   security_level   = "{security_level}"')
                            print(f'   snmp_user        = "{snmp_user}"')
                            print(f'\n-------------------------------------------------------------------------------------------\n')
                            valid_confirm = False
                            while valid_confirm == False:
                                confirm_v = input('Do you want to accept the above configuration?  Enter "Y" or "N" [Y]: ')
                                if confirm_v == 'Y' or confirm_v == '':
                                    templateVars["users"].append(snmp_user)
                                    valid_exit = False
                                    while valid_exit == False:
                                        loop_exit = input(f'Would You like to Configure another SNMP User?  Enter "Y" or "N" [N]: ')
                                        if loop_exit == 'Y':
                                            inner_loop_count += 1
                                            valid_confirm = True
                                            valid_exit = True
                                        elif loop_exit == 'N' or loop_exit == '':
                                            snmp_loop = True
                                            valid_confirm = True
                                            valid_exit = True
                                        else:
                                            print(f'\n------------------------------------------------------\n')
                                            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                                            print(f'\n------------------------------------------------------\n')

                                elif confirm_v == 'N':
                                    print(f'\n-------------------------------------------------------------------------------------------\n')
                                    print(f'  Starting Remote Host Configuration Over.')
                                    print(f'\n-------------------------------------------------------------------------------------------\n')
                                    valid_confirm = True
                                else:
                                    print(f'\n------------------------------------------------------\n')
                                    print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                                    print(f'\n------------------------------------------------------\n')

                        elif question == 'N':
                            snmp_loop = True
                        else:
                            print(f'\n------------------------------------------------------\n')
                            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                            print(f'\n------------------------------------------------------\n')


                    snmp_user_list = []
                    if len(templateVars["snmp_users"]):
                        for item in templateVars["snmp_users"]:
                            for k, v in item.items:
                                if k == 'name':
                                    snmp_user_list.append(v)

                    templateVars["snmp_trap_destinations"] = []
                    inner_loop_count = 1
                    snmp_loop = False
                    while snmp_loop == False:
                        question = input(f'Would you like to configure SNMP Trap Destionations?  Enter "Y" or "N" [Y]: ')
                        if question == '' or question == 'Y':
                            if len(snmp_user_list) == 0:
                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                print(f'  There are no valid SNMP Users so Trap Destinations can only be set to SNMPv2.')
                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                snmp_version = 'V2'
                            else:
                                templateVars["policy_file"] = 'snmp_version.txt'
                                templateVars["var_description"] = '    What Version of SNMP will be used for this Trap Destination?\n'\
                                    '    - V2 - SNMPv2c.\n'\
                                    '    - V3 - (Defualt - SNMPv3\n'
                                templateVars["var_type"] = 'SNMP Version'
                                snmp_version = variable_loop(**templateVars)

                            if snmp_version == 'V2':
                                valid = False
                                while valid == False:
                                    community_string = input(f'What is the Community String for the Destination? ')
                                    if not community_string == '':
                                        valid = validating_ucs.snmp_string('SNMP Community String', community_string)
                                    else:
                                        print(f'\n-------------------------------------------------------------------------------------------\n')
                                        print(f'  Error!! Invalid Value.  Please Re-enter the SNMP Community String.')
                                        print(f'\n-------------------------------------------------------------------------------------------\n')
                                community_string = inner_loop_count
                                os.environ[f'TF_VAR_community_string_{inner_loop_count}'] = community_string

                            if snmp_version == 'V3':
                                templateVars["multi_select"] = False
                                templateVars["var_description"] = '    Please Select the SNMP User to assign to this Destination:\n'
                                templateVars["var_type"] = 'SNMP User'
                                snmp_user = vars_from_list(snmp_user_list, **templateVars)

                            if snmp_version == 'V2':
                                templateVars["policy_file"] = 'snmp_trap_type.txt'
                                templateVars["var_description"] = '    Type of trap which decides whether to receive a notification when a trap is received at the destination.\n'\
                                    '    - Inform - Receive notifications when trap is sent to the destination. This option is valid only for SNMPv2.\n'\
                                    '    - Trap - Do not receive notifications when trap is sent to the destination.\n'
                                templateVars["var_type"] = 'Trap Type'
                                trap_type = variable_loop(**templateVars)
                            else:
                                trap_type = 'Trap'

                            valid = False
                            while valid == False:
                                destination_address = input(f'What is the SNMP Trap Destination Hostname/Address? ')
                                if not destination_address == '':
                                    if re.search(r'^[0-9a-fA-F]+[:]+[0-9a-fA-F]$') or re.search(r'^(\d{1,3}\.){3}\d{1,3}$'):
                                        valid = validating_ucs.ip_address('SNMP Trap Destination', destination_address)
                                    else:
                                        valid = validating_ucs.dns_name('SNMP Trap Destination', destination_address)
                                else:
                                    print(f'\n-------------------------------------------------------------------------------------------\n')
                                    print(f'  Error!! Invalid Value.  Please Re-enter the SNMP Trap Destination Hostname/Address.')
                                    print(f'\n-------------------------------------------------------------------------------------------\n')

                            valid = False
                            while valid == False:
                                port = input(f'Enter the Port to Assign to this Destination.  Valid Range is 1-65535.  [162]: ')
                                if port == '':
                                    port = 162
                                if re.search(r'[0-9]{1,4}', str(port)):
                                    valid = validating_ucs.snmp_port('SNMP Port', port, 1, 65535)
                                else:
                                    print(f'\n-------------------------------------------------------------------------------------------\n')
                                    print(f'  Invalid Entry!  Please Enter a valid Port in the range of 1-65535.')
                                    print(f'\n-------------------------------------------------------------------------------------------\n')

                            if snmp_version == 'V3':
                                snmp_destination = {
                                    'destination_address':destination_address,
                                    'enabled':True,
                                    'port':port,
                                    'trap_type':trap_type,
                                    'user':snmp_user,
                                    'version':snmp_version
                                }
                            else:
                                snmp_destination = {
                                    'community':community_string,
                                    'destination_address':destination_address,
                                    'enabled':True,
                                    'port':port,
                                    'trap_type':trap_type,
                                    'version':snmp_version
                                }

                            print(f'\n-------------------------------------------------------------------------------------------\n')
                            if snmp_version == 'V2':
                                print(f'   community_string    = "Sensitive"')
                            print(f'   destination_address = "{destination_address}"')
                            print(f'   enabled             = True')
                            print(f'   trap_type           = "{trap_type}"')
                            print(f'   snmp_version        = "{snmp_version}"')
                            if snmp_version == 'V3':
                                print(f'   user                = "{snmp_user}"')
                            print(f'\n-------------------------------------------------------------------------------------------\n')
                            valid_confirm = False
                            while valid_confirm == False:
                                confirm_v = input('Do you want to accept the above configuration?  Enter "Y" or "N" [Y]: ')
                                if confirm_v == 'Y' or confirm_v == '':
                                    templateVars["snmp_trap_destinations"].append(snmp_destination)
                                    valid_exit = False
                                    while valid_exit == False:
                                        loop_exit = input(f'Would You like to Configure another SNMP Trap Destination?  Enter "Y" or "N" [N]: ')
                                        if loop_exit == 'Y':
                                            inner_loop_count += 1
                                            valid_confirm = True
                                            valid_exit = True
                                        elif loop_exit == 'N' or loop_exit == '':
                                            snmp_loop = True
                                            valid_confirm = True
                                            valid_exit = True
                                        else:
                                            print(f'\n------------------------------------------------------\n')
                                            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                                            print(f'\n------------------------------------------------------\n')

                                elif confirm_v == 'N':
                                    print(f'\n-------------------------------------------------------------------------------------------\n')
                                    print(f'  Starting Remote Host Configuration Over.')
                                    print(f'\n-------------------------------------------------------------------------------------------\n')
                                    valid_confirm = True
                                else:
                                    print(f'\n------------------------------------------------------\n')
                                    print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                                    print(f'\n------------------------------------------------------\n')

                        elif question == 'N':
                            snmp_loop = True
                        else:
                            print(f'\n------------------------------------------------------\n')
                            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                            print(f'\n------------------------------------------------------\n')

                    templateVars["enabled"] = True
                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    print(f'  Do you want to accept the following configuration?')
                    print(f'    access_community_string = "Sensitive"')
                    print(f'    description             = {templateVars["descr"]}')
                    print(f'    enable_snmp             = "{templateVars["enabled"]}"')
                    print(f'    name                    = "{templateVars["name"]}"')
                    print(f'    snmp_community_access   = "{templateVars["snmp_community_access"]}"')
                    print(f'    snmp_engine_input_id    = "{templateVars["snmp_engine_input_id"]}"')
                    print(f'    snmp_port               = "{templateVars["port"]}"')
                    if len(templateVars["snmp_trap_destinations"]) > 0:
                        print(f'    snmp_trap_destinations = ''{')
                        print(templateVars["snmp_trap_destinations"])
                        for item in templateVars["snmp_trap_destinations"]:
                            for k, v in item.items():
                                if k == 'destination_address':
                                    print(f'      "{destination_address}" = ''{')
                            for k, v in item.items():
                                if k == 'community':
                                    print(f'        community_string = "Sensitive"')
                                elif k == 'enabled':
                                    print(f'        enable           = {"%s".lower() % (v)}')
                                elif k == 'trap_type':
                                    print(f'        trap_type        = "{v}"')
                                elif k == 'port':
                                    print(f'        port             = {v}')
                                elif k == 'user':
                                    print(f'        user             = "{v}"')
                                elif k == 'version':
                                    print(f'        snmp_server      = "{v}"')
                            print(f'      ''}')
                        print(f'    ''}')
                    if len(templateVars["users"]) > 0:
                        print(f'    snmp_users = ''{')
                        print(templateVars["users"])
                        for item in templateVars["users"]:
                            for k, v in item.items():
                                if k == 'destination_address':
                                    print(f'      "{name}" = ''{')
                            for k, v in item.items():
                                if k == 'auth_password':
                                    print(f'        auth_password    = "Sensitive"')
                                elif k == 'auth_type':
                                    print(f'        auth_type        = {v}')
                                elif k == 'privacy_password':
                                    print(f'        privacy_password = "Sensitive"')
                                elif k == 'security_level':
                                    print(f'        security_level   = "{v}"')
                            print(f'      ''}')
                        print(f'    ''}')
                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    valid_confirm = False
                    while valid_confirm == False:
                        confirm_policy = input('Do you want to accept the above configuration?  Enter "Y" or "N" [Y]: ')
                        if confirm_policy == 'Y' or confirm_policy == '':
                            confirm_policy = 'Y'

                            # Write Policies to Template File
                            templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                            write_to_template(self, **templateVars)

                            # Add Template Name to Policies Output
                            policy_names.append(templateVars["name"])

                            configure_loop, policy_loop = exit_default_no(templateVars["policy_type"])
                            valid_confirm = True

                        elif confirm_policy == 'N':
                            print(f'\n------------------------------------------------------\n')
                            print(f'  Starting {templateVars["policy_type"]} Section over.')
                            print(f'\n------------------------------------------------------\n')
                            valid_confirm = True

                        else:
                            print(f'\n------------------------------------------------------\n')
                            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                            print(f'\n------------------------------------------------------\n')

            elif configure == 'N':
                configure_loop = True
            else:
                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                print(f'\n-------------------------------------------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names



def choose_policy(policy, **templateVars):
    if 'policies' in policy:
        policy_short = policy.replace('policies', 'policy')
    elif 'pools' in policy:
        policy_short = policy.replace('pools', 'pool')
    x = policy_short.split('_')
    policy_description = []
    for y in x:
        y = y.capitalize()
        policy_description.append(y)
    policy_description = " ".join(policy_description)
    policy_description = policy_description.replace('Ip', 'IP')
    policy_description = policy_description.replace('Ntp', 'NTP')
    policy_description = policy_description.replace('Snmp', 'SNMP')

    if len(policy) > 0:
        templateVars["policy"] = policy_description
        policy_short = policies_list(templateVars["policies"], **templateVars)
    else:
        policy_short = ""
    return policy_short

def exit_default_no(policy_type):
    valid_exit = False
    while valid_exit == False:
        exit_answer = input(f'Would You like to Configure another {policy_type}?  Enter "Y" or "N" [N]: ')
        if exit_answer == '' or exit_answer == 'N':
            policy_loop = True
            configure_loop = True
            valid_exit = True
        elif exit_answer == 'Y':
            policy_loop = False
            configure_loop = False
            valid_exit = True
        else:
            print(f'\n------------------------------------------------------\n')
            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
            print(f'\n------------------------------------------------------\n')
    return configure_loop, policy_loop

def exit_default_yes(policy_type):
    valid_exit = False
    while valid_exit == False:
        exit_answer = input(f'Would You like to Configure another {policy_type}?  Enter "Y" or "N" [Y]: ')
        if exit_answer == '' or exit_answer == 'Y':
            policy_loop = False
            configure_loop = False
            valid_exit = True
        elif exit_answer == 'N':
            policy_loop = True
            configure_loop = True
            valid_exit = True
        else:
            print(f'\n------------------------------------------------------\n')
            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
            print(f'\n------------------------------------------------------\n')
    return configure_loop, policy_loop

def exit_loop_default_yes(loop_count, policy_type):
    valid_exit = False
    while valid_exit == False:
        if loop_count % 2 == 0:
            exit_answer = input(f'Would You like to Configure another {policy_type}?  Enter "Y" or "N" [Y]: ')
        else:
            exit_answer = input(f'Would You like to Configure another {policy_type}?  Enter "Y" or "N" [N]: ')
        if (loop_count % 2 == 0 and exit_answer == '') or exit_answer == 'Y':
            policy_loop = False
            configure_loop = False
            loop_count += 1
            valid_exit = True
        elif not loop_count % 2 == 0 and exit_answer == '':
            policy_loop = True
            configure_loop = True
            valid_exit = True
        elif exit_answer == 'N':
            policy_loop = True
            configure_loop = True
            valid_exit = True
        else:
            print(f'\n------------------------------------------------------\n')
            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
            print(f'\n------------------------------------------------------\n')
    return configure_loop, loop_count, policy_loop

def naming_rule(name_prefix, name_suffix, org):
    if not name_prefix == '':
        name = '%s_%s' % (name_prefix, name_suffix)
    else:
        name = '%s_%s' % (org, name_suffix)
    return name

def naming_rule_fabric(loop_count, name_prefix, org):
    if loop_count % 2 == 0:
        if not name_prefix == '':
            name = '%s_A' % (name_prefix)
        elif not org == 'default':
            name = '%s_A' % (org)
        else:
            name = 'Fabric_A'
    else:
        if not name_prefix == '':
            name = '%s_B' % (name_prefix)
        elif not org == 'default':
            name = '%s_B' % (org)
        else:
            name = 'Fabric_B'
    return name

def policies_list(policies_list, **templateVars):
    valid = False
    while valid == False:
        print(f'\n-------------------------------------------------------------------------------------------\n')
        print(f'  {templateVars["policy"]} Options:')
        for i, v in enumerate(policies_list):
            i += 1
            if i < 10:
                print(f'     {i}. {v}')
            else:
                print(f'    {i}. {v}')
        if templateVars["allow_opt_out"] == True:
            print(f'     99. Do not assign a(n) {templateVars["policy"]}.')
        print(f'\n-------------------------------------------------------------------------------------------\n')
        policy_temp = input(f'Enter the Index for the {templateVars["policy"]} to Assign to {templateVars["name"]}: ')
        for i, v in enumerate(policies_list):
            i += 1
            if int(policy_temp) == i:
                policy = v
                valid = True
                return policy
            elif int(policy_temp) == 99:
                policy = ''
                valid = True
                return policy

        if policy_temp == '':
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  Error!! Invalid Selection.  Please Select a valid Index from the List.')
            print(f'\n-------------------------------------------------------------------------------------------\n')
        elif int(policy_temp) == 99:
            policy = ''
            valid = True
            return policy

def policy_loop_standard(self, header, initial_policy, template_type):
    # Set the org_count to 0 for the First Organization
    org_count = 0

    # Loop through the orgs discovered by the Class
    for org in self.orgs:

        # Pull in Variables from Class
        templateVars = self.templateVars
        templateVars["org"] = org

        # Define the Template Source
        templateVars["header"] = header
        templateVars["template_type"] = template_type
        template_file = "template_open.jinja2"
        template = self.templateEnv.get_template(template_file)


        # Process the template
        dest_dir = '%s' % (self.type)
        dest_file = '%s.auto.tfvars' % (template_type)
        if initial_policy == True:
            write_method = 'w'
        else:
            write_method = 'a'
        process_method(write_method, dest_dir, dest_file, template, **templateVars)

        # Define the Template Source
        template_file = '%s.jinja2' % (template_type)
        template = self.templateEnv.get_template(template_file)

        if template_type in self.json_data["config"]["orgs"][org_count]:
            for item in self.json_data["config"]["orgs"][org_count][template_type]:
                # Reset TemplateVars to Default for each Loop
                templateVars = {}
                templateVars["org"] = org

                # Define the Template Source
                templateVars["header"] = header

                # Loop Through Json Items to Create templateVars Blocks
                for k, v in item.items():
                    templateVars[k] = v

                # if template_type == 'iscsi_boot_policies':
                #     print(templateVars)
                # Process the template
                dest_dir = '%s' % (self.type)
                dest_file = '%s.auto.tfvars' % (template_type)
                process_method('a', dest_dir, dest_file, template, **templateVars)

        # Define the Template Source
        template_file = "template_close.jinja2"
        template = self.templateEnv.get_template(template_file)

        # Process the template
        dest_dir = '%s' % (self.type)
        dest_file = '%s.auto.tfvars' % (template_type)
        process_method('a', dest_dir, dest_file, template, **templateVars)

        # Increment the org_count for the next Organization Loop
        org_count += 1

def policy_descr(name, policy_type):
    valid = False
    while valid == False:
        descr = input(f'What is the Description for the {policy_type}?  [{name} {policy_type}]: ')
        if descr == '':
            descr = '%s %s' % (name, policy_type)
        valid = validating_ucs.description(f'{policy_type} Description', descr, 1, 62)
        if valid == True:
            return descr

def policy_name(namex, policy_type):
    valid = False
    while valid == False:
        name = input(f'What is the Name for the {policy_type}?  [{namex}]: ')
        if name == '':
            name = '%s' % (namex)
        valid = validating_ucs.name_rule(f'{policy_type} Name', name, 1, 62)
        if valid == True:
            return name

def policy_template(self, **templateVars):
    policy_names = []
    configure_loop = False
    while configure_loop == False:
        policy_loop = False
        while policy_loop == False:

            valid = False
            while valid == False:
                policy_file = 'ucs_templates/variables/%s' % (templateVars["policy_file"])
                if os.path.isfile(policy_file):
                    template_file = open(policy_file, 'r')
                    template_file.seek(0)
                    policy_templates = []
                    for line in template_file:
                        line = line.strip()
                        policy_templates.append(line)
                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    print(f'  {templateVars["policy_type"]} Templates:')
                    for i, v in enumerate(policy_templates):
                        i += 1
                        if i < 10:
                            print(f'     {i}. {v}')
                        else:
                            print(f'    {i}. {v}')
                    print(f'\n-------------------------------------------------------------------------------------------\n')
                policy_temp = input(f'Enter the Index Number for the {templateVars["policy_type"]} Template to Create: ')
                for i, v in enumerate(policy_templates):
                    i += 1
                    if int(policy_temp) == i:
                        templateVars["policy_template"] = v
                        valid = True
                if valid == False:
                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    print(f'  Error!! Invalid Selection.  Please Select a valid Index from the List.')
                    print(f'\n-------------------------------------------------------------------------------------------\n')
                template_file.close()

            if not templateVars["name_prefix"] == '':
                name = '%s_%s' % (templateVars["name_prefix"], templateVars["policy_template"])
            else:
                name = '%s_%s' % (templateVars["org"], templateVars["policy_template"])

            templateVars["name"] = policy_name(name, templateVars["policy_type"])
            templateVars["descr"] = policy_descr(templateVars["name"], templateVars["policy_type"])

            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  Do you want to accept the following configuration?')
            if templateVars["template_type"] == 'bios_policies':
                print(f'   bios_template = "{templateVars["policy_template"]}"')
                print(f'   description   = "{templateVars["descr"]}"')
                print(f'   name          = "{templateVars["name"]}"')
            else:
                print(f'   adapter_template = "{templateVars["policy_template"]}"')
                print(f'   description      = "{templateVars["descr"]}"')
                print(f'   name             = "{templateVars["name"]}"')
            print(f'\n-------------------------------------------------------------------------------------------\n')
            valid_confirm = False
            while valid_confirm == False:
                confirm_policy = input('Enter "Y" or "N" [Y]: ')
                if confirm_policy == 'Y' or confirm_policy == '':
                    confirm_policy = 'Y'

                    # Write Policies to Template File
                    write_to_template(self, **templateVars)

                    # Add Template Name to Policies Output
                    policy_names.append(templateVars["name"])

                    configure_loop, policy_loop = exit_default_yes(templateVars["policy_type"])
                    valid_confirm = True

                elif confirm_policy == 'N':
                    print(f'\n------------------------------------------------------\n')
                    print(f'  Starting {templateVars["policy_type"]} Section over.')
                    print(f'\n------------------------------------------------------\n')
                    valid_confirm = True

                else:
                    print(f'\n------------------------------------------------------\n')
                    print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                    print(f'\n------------------------------------------------------\n')

    return policy_names

def vars_from_list(var_options, **templateVars):
    selection = []
    selection_count = 0
    valid = False
    while valid == False:
        print(f'\n-------------------------------------------------------------------------------------------\n')
        print(f'{templateVars["var_description"]}')
        for index, value in enumerate(var_options):
            index += 1
            if index < 10:
                print(f'     {index}. {value}')
            else:
                print(f'    {index}. {value}')
        print(f'\n-------------------------------------------------------------------------------------------\n')
        exit_answer = False
        while exit_answer == False:
            var_selection = input(f'Please Enter the Option Number to Select for {templateVars["var_type"]}: ')
            if not var_selection == '':
                if re.search(r'[0-9]+', str(var_selection)):
                    xcount = 1
                    for index, value in enumerate(var_options):
                        index += 1
                        if int(var_selection) == index:
                            selection.append(value)
                            xcount = 0
                    if xcount == 0:
                        if selection_count % 2 == 0 and templateVars["multi_select"] == True:
                            answer_finished = input(f'Would you like to add another port to the {templateVars["port_type"]}?  Enter "Y" or "N" [Y]: ')
                        elif templateVars["multi_select"] == True:
                            answer_finished = input(f'Would you like to add another port to the {templateVars["port_type"]}?  Enter "Y" or "N" [N]: ')
                        elif templateVars["multi_select"] == False:
                            answer_finished = 'N'
                        if (selection_count % 2 == 0 and answer_finished == '') or answer_finished == 'Y':
                            exit_answer = True
                            selection_count += 1
                        elif answer_finished == '' or answer_finished == 'N':
                            exit_answer = True
                            valid = True
                        elif templateVars["multi_select"] == False:
                            exit_answer = True
                            valid = True
                        else:
                            print(f'\n------------------------------------------------------\n')
                            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                            print(f'\n------------------------------------------------------\n')
                    else:
                        print(f'\n-------------------------------------------------------------------------------------------\n')
                        print(f'  Error!! Invalid Selection.  Please select a valid option from the List.')
                        print(f'\n-------------------------------------------------------------------------------------------\n')

                else:
                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    print(f'  Error!! Invalid Selection.  Please Select a valid Option from the List.')
                    print(f'\n-------------------------------------------------------------------------------------------\n')
            else:
                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Error!! Invalid Selection.  Please Select a valid Option from the List.')
                print(f'\n-------------------------------------------------------------------------------------------\n')
    return selection

def process_method(wr_method, dest_dir, dest_file, template, **templateVars):
    dest_dir = './Intersight/%s/%s' % (templateVars["org"], dest_dir)
    if not os.path.isdir(dest_dir):
        mk_dir = 'mkdir -p %s' % (dest_dir)
        os.system(mk_dir)
    dest_file_path = '%s/%s' % (dest_dir, dest_file)
    if not os.path.isfile(dest_file_path):
        create_file = 'touch %s' % (dest_file_path)
        os.system(create_file)
    tf_file = dest_file_path
    wr_file = open(tf_file, wr_method)

    # Render Payload and Write to File
    payload = template.render(templateVars)
    wr_file.write(payload)
    wr_file.close()

def variable_loop(**templateVars):
    valid = False
    while valid == False:
        print(f'\n-------------------------------------------------------------------------------------------\n')
        print(f'{templateVars["var_description"]}')
        policy_file = 'ucs_templates/variables/%s' % (templateVars["policy_file"])
        if os.path.isfile(policy_file):
            variable_file = open(policy_file, 'r')
            varsx = []
            for line in variable_file:
                varsx.append(line.strip())
            for index, value in enumerate(varsx):
                index += 1
                if index < 10:
                    print(f'     {index}. {value}')
                else:
                    print(f'    {index}. {value}')
        print(f'\n-------------------------------------------------------------------------------------------\n')
        var_selection = input(f'Please Enter the Option Number to Select for {templateVars["var_type"]}: ')
        if not var_selection == '':
            if re.search(r'[0-9]+', str(var_selection)):
                for index, value in enumerate(varsx):
                    index += 1
                    if int(var_selection) == index:
                        selection = value
                        valid = True
            else:
                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Error!! Invalid Selection.  Please Select a valid Option from the List.')
                print(f'\n-------------------------------------------------------------------------------------------\n')
        else:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  Error!! Invalid Selection.  Please Select a valid Option from the List.')
            print(f'\n-------------------------------------------------------------------------------------------\n')
    return selection

def vlan_list_full(vlan_list):
    full_vlan_list = []
    if re.search(r',', str(vlan_list)):
        vlist = vlan_list.split(',')
        for v in vlist:
            if re.fullmatch('^\\d{1,4}\\-\\d{1,4}$', v):
                a,b = v.split('-')
                a = int(a)
                b = int(b)
                vrange = range(a,b+1)
                for vl in vrange:
                    full_vlan_list.append(vl)
            elif re.fullmatch('^\\d{1,4}$', v):
                full_vlan_list.append(v)
    elif re.search('\\-', str(vlan_list)):
        a,b = vlan_list.split('-')
        a = int(a)
        b = int(b)
        vrange = range(a,b+1)
        for v in vrange:
            full_vlan_list.append(v)
    else:
        full_vlan_list.append(vlan_list)
    return full_vlan_list

def write_to_template(self, **templateVars):
    # Define the Template Source
    template = self.templateEnv.get_template(templateVars["template_file"])

    # Process the template
    dest_dir = '%s' % (self.type)
    dest_file = '%s.auto.tfvars' % (templateVars["template_type"])
    if templateVars["initial_write"] == True:
        write_method = 'w'
    else:
        write_method = 'a'
    process_method(write_method, dest_dir, dest_file, template, **templateVars)
