#!/usr/bin/env python3

import requests
import json
import sys
import collections
import jinja2
import ipaddress
import pkg_resources
import getpass
import ipaddress
import json
import phonenumbers
import openpyxl
import os, re, sys, traceback, validators
import requests
import time
import urllib3
import validating
from datetime import datetime, timedelta
from openpyxl import load_workbook,workbook
from openpyxl.styles import Alignment, colors, Border, Font, NamedStyle, PatternFill, Protection, Side 
from openpyxl.utils.dataframe import dataframe_to_rows
from ordered_set import OrderedSet
from os import path

# Global options for debugging
PRINT_PAYLOAD = False
PRINT_RESPONSE_TEXT_ALWAYS = False
PRINT_RESPONSE_TEXT_ON_FAIL = True

# Global path to main Template directory
# json_path = pkg_resources.resource_filename('aci_lib', 'ACI/templates/')
aci_template_path = pkg_resources.resource_filename('aci_lib', 'ACI/templates/')

# Worksheet Style Reference
bd1 = Side(style="thick", color="8EA9DB")
bd2 = Side(style="medium", color="8EA9DB")
wsh1 = NamedStyle(name="wsh1")
wsh1.alignment = Alignment(horizontal="center", vertical="center", wrap_text="True")
wsh1.border = Border(left=bd1, top=bd1, right=bd1, bottom=bd1)
wsh1.font = Font(bold=True, size=15, color="FFFFFF")
wsh2 = NamedStyle(name="wsh2")
wsh2.alignment = Alignment(horizontal="center", vertical="center", wrap_text="True")
wsh2.border = Border(left=bd2, top=bd2, right=bd2, bottom=bd2)
wsh2.fill = PatternFill("solid", fgColor="305496")
wsh2.font = Font(bold=True, size=15, color="FFFFFF")
ws_odd = NamedStyle(name="ws_odd")
ws_odd.alignment = Alignment(horizontal="center", vertical="center")
ws_odd.border = Border(left=bd2, top=bd2, right=bd2, bottom=bd2)
ws_odd.fill = PatternFill("solid", fgColor="D9E1F2")
ws_odd.font = Font(bold=False, size=12, color="44546A")
ws_even = NamedStyle(name="ws_even")
ws_even.alignment = Alignment(horizontal="center", vertical="center")
ws_even.border = Border(left=bd2, top=bd2, right=bd2, bottom=bd2)
ws_even.font = Font(bold=False, size=12, color="44546A")

Access_regex = re.compile('(brk_out|add_apg|add_pcg|add_vpc)')
Admin_regex = re.compile('(backup|radius|tacacs|realm)')
Fabric_regex = re.compile('(dns|dns_mgmt|domain|ntp|smartcallhome|snmp_(client|comm|info|trap|user)|syslog_(dg|rmt))')
Inventory_regex = re.compile('(inband_vlan|switch|95[0-1][4-8]|vpc_pair|apic_inb)')
netseg_regex = re.compile('(add_to_apic)')
System_regex = re.compile('(bgp_(as|rr))')
Tenant_regex = re.compile('(add_tenant)')
VRF_regex = re.compile('(add_vrf)')

# Global list of allowed statuses
valid_status = ['created', 'created,modified', 'deleted']

# Exception Classes
class InsufficientArgs(Exception):
    pass

class ErrException(Exception):
    pass

class InvalidArg(Exception):
    pass

class LoginFailed(Exception):
    pass

class Access_Policies(object):
    def __init__(self, ws):
        self.templateLoader = jinja2.FileSystemLoader(
            searchpath=(aci_template_path + 'Access_Policies/'))
        self.templateEnv = jinja2.Environment(loader=self.templateLoader)
    
    # Method must be called with the following kwargs.
    # Serial: Serial Number of the Switch
    # Name: Switch Hostname.  Will be used to create switch profile and interface selector profiles as well
    # Node_ID: Unique Identifier used in the APIC Database.
    # Node_Type: unspecified or remote_leaf_wan
    # Pod_ID: Email alias to use for Receiving email responses
    # Switch_Role: Email alias to to send to
    # Switch_Type: Support Phone Number to associate with TAC Cases
    # Inband_IPv4: Point of Contact or Team Alias
    # Inband_GWv4: Physical Address of Equipment.
    # OOB_IPv4: Support Contract to be used for Opening TAC Cases
    # OOB_GWv4: The Customer Identifier is contained in the contract
    def sw_xlsx(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'Serial': '',
                         'Name': '',
                         'Node_ID': '',
                         'Node_Type': '',
                         'Pod_ID': '',
                         'Switch_Role': '',
                         'Switch_Type': '',
                         'Inband_IPv4': '',
                         'Inband_GWv4': ''}
        optional_args = {'OOB_IPv4': '',
                         'OOB_GWv4': ''}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        # Use Switch_Type to Determine the Number of ports on the switch
        modules,port_count = query_switch_model(row_num, templateVars['Switch_Type'])
        
        try:
            # Validate Serial, Name, Node_ID, Node_Type, Pod_ID, Switch_Role,
            # modules, port_count, Inband_IPv4, Inband_GWv4, OOB_IPv4, OOB_GWv4
            validating.hostname(row_num, templateVars['Name'])
            validating.node_id(row_num, templateVars['Node_ID'])
            validating.node_type(row_num, templateVars['Name'], templateVars['Node_Type'])
            validating.pod_id(row_num, templateVars['Name'], templateVars['Pod_ID'])
            validating.role(row_num, templateVars['Name'], templateVars['Switch_Role'])
            validating.modules(row_num, templateVars['Name'], templateVars['Switch_Role'], modules)
            validating.port_count(row_num, templateVars['Name'], templateVars['Switch_Role'], port_count)
            validating.inband(row_num, templateVars['Name'], templateVars['Inband_IPv4'], templateVars['Inband_GWv4'])
            if not templateVars['OOB_IPv4'] == None:
                validating.oob(row_num, templateVars['Name'], templateVars['OOB_IPv4'], templateVars['OOB_GWv4'])
        except Exception as err:
            Error_Return = '%s\nError on Row %s.  Please verify Input Information.' % (SystemExit(err), row_num)
            raise ErrException(Error_Return)
        
        # Check if there is a Directory for the Switch and if not Create it
        switch_dir = './ACI/%s' % (templateVars['Name'])
        if not os.path.isdir(switch_dir):
            switch_dir = 'mkdir ./ACI/%s' % (templateVars['Name'])
            os.system(switch_dir)

        # Create Template file for Switch
        file_switch = './ACI/%s/%s.tf' % (templateVars['Name'], templateVars['Name'])
        wr_file = open(file_switch, 'w')

        # Determine if this is an odd or even switch
        templateVars['Node_ID'] = int(templateVars['Node_ID'])
        if templateVars['Node_ID'] % 2 == 0:
            templateVars['Maint_Grp'] = 'MgB'
        else:
            templateVars['Maint_Grp'] = 'MgA'
        templateVars['Node_ID'] = str(templateVars['Node_ID'])

        # Locate template; Render Template; Then Write to the File
        if templateVars['Switch_Role'] == 'leaf':
            template_file = "leaf.template"
        elif templateVars['Switch_Role'] == 'spine':
            template_file = "spine.template"
        template = self.templateEnv.get_template(template_file)
        payload = template.render(templateVars)
        wr_file.write(payload + '\n\n')

        # Copy the Inband Management Template to Switch Profile
        template_file = "switch_inb.template"
        template = self.templateEnv.get_template(template_file)
        payload = template.render(templateVars)
        wr_file.write(payload + '\n\n')

        if not templateVars['OOB_IPv4'] == None:
            # Copy the OOB Management Template to Switch Profile
            template_file = "switch_oob.template"
            template = self.templateEnv.get_template(template_file)
            payload = template.render(templateVars)
            wr_file.write(payload + '\n\n')

        if templateVars['Switch_Role'] == 'leaf':
            for modx in range(1, modules):
                for px in range(1, port_count):
                    templateVars['Module'] = modx
                    templateVars['Port'] = px
                    if px < 10:
                        templateVars['Port_Selector'] = 'Eth%s-0%s' & (modx, px)
                    elif px < 100:
                        templateVars['Port_Selector'] = 'Eth%s-%s' & (modx, px)
                    elif px > 99:
                        templateVars['Port_Selector'] = 'Eth%s_%s' & (modx, px)
                    # Copy the Port Selector Template to Switch Profile
                    template_file = "leaf_portselect.template"
                    template = self.templateEnv.get_template(template_file)
                    payload = template.render(templateVars)
                    wr_file.write(payload + '\n\n')
        elif templateVars['Switch_Role'] == 'spine':
            for modx in range(1, modules):
                for px in range(1, port_count):
                    templateVars['Module'] = modx
                    templateVars['Port'] = px
                    if px < 10:
                        templateVars['Port_Selector'] = 'Eth%s-0%s' & (modx, px)
                    elif px < 100:
                        templateVars['Port_Selector'] = 'Eth%s-%s' & (modx, px)
                    # Copy the Port Selector Template to Switch Profile
                    template_file = "spine_portselect.template"
                    template = self.templateEnv.get_template(template_file)
                    payload = template.render(templateVars)
                    wr_file.write(payload + '\n\n')
        wr_file.close()
    
    # Method must be called with the following kwargs.
    # Serial: Serial Number of the Switch
    # Name: Switch Hostname.  Will be used to create switch profile and interface selector profiles as well
    # Node_ID: Unique Identifier used in the APIC Database.
    # Node_Type: unspecified or remote_leaf_wan
    # Pod_ID: Email alias to use for Receiving email responses
    # Switch_Role: Email alias to to send to
    # Switch_Type: Support Phone Number to associate with TAC Cases
    # Inband_IPv4: Point of Contact or Team Alias
    # Inband_GWv4: Physical Address of Equipment.
    # OOB_IPv4: Support Contract to be used for Opening TAC Cases
    # OOB_GWv4: The Customer Identifier is contained in the contract
    def switch(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'Serial': '',
                         'Name': '',
                         'Node_ID': '',
                         'Node_Type': '',
                         'Pod_ID': '',
                         'Switch_Role': '',
                         'Switch_Type': '',
                         'Inband_IPv4': '',
                         'Inband_GWv4': ''}
        optional_args = {'OOB_IPv4': '',
                         'OOB_GWv4': ''}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        # Use Switch_Type to Determine the Number of ports on the switch
        modules,port_count = query_switch_model(row_num, templateVars['Switch_Type'])
        
        try:
            # Validate Serial, Name, Node_ID, Node_Type, Pod_ID, Switch_Role,
            # modules, port_count, Inband_IPv4, Inband_GWv4, OOB_IPv4, OOB_GWv4
            validating.hostname(row_num, templateVars['Name'])
            validating.node_id(row_num, templateVars['Node_ID'])
            validating.node_type(row_num, templateVars['Name'], templateVars['Node_Type'])
            validating.pod_id(row_num, templateVars['Name'], templateVars['Pod_ID'])
            validating.role(row_num, templateVars['Name'], templateVars['Switch_Role'])
            validating.modules(row_num, templateVars['Name'], templateVars['Switch_Role'], modules)
            validating.port_count(row_num, templateVars['Name'], templateVars['Switch_Role'], port_count)
            validating.inband(row_num, templateVars['Name'], templateVars['Inband_IPv4'], templateVars['Inband_GWv4'])
            if not templateVars['OOB_IPv4'] == None:
                validating.oob(row_num, templateVars['Name'], templateVars['OOB_IPv4'], templateVars['OOB_GWv4'])
        except Exception as err:
            Error_Return = '%s\nError on Row %s.  Please verify Input Information.' % (SystemExit(err), row_num)
            raise ErrException(Error_Return)
        
        # Check if there is a Worksheet for the Switch Already
        if not templateVars['Name'] in wb.sheetnames:
            ws_sw = wb.create_sheet(title = templateVars['Name'])
            ws_sw = wb[templateVars['Name']]
            ws_sw.column_dimensions['A'].width = 10
            ws_sw.column_dimensions['B'].width = 20
            ws_sw.column_dimensions['C'].width = 10
            ws_sw.column_dimensions['D'].width = 20
            ws_sw.column_dimensions['E'].width = 30
            ws_sw.column_dimensions['F'].width = 20
            ws_sw.column_dimensions['G'].width = 20
            ws_sw.column_dimensions['H'].width = 30
            ws_sw.merge_cells('A1:N1')
            for cell in ws_sw['1:1']:
                cell.style = 'Heading 1'
            ws_header = '%s Interface Selectors' % (templateVars['Name'])
            data = [ws_header]
            ws_sw.append(data)
            for cell in ws_sw['A2:H2']:
                cell.style = 'Heading 3'
            data = ['Type','Interface_Selector','Port','Policy_Group','Description','Switchport_Mode','Access_or_Native','Trunk_Allowed_VLANs']
            ws_sw.append(data)

            ws_sw_row_count = 3

            if templateVars['Switch_Role'] == 'leaf':
                for modx in range(1, modules):
                    for px in range(1, port_count):
                        templateVars['Module'] = modx
                        templateVars['Port'] = px
                        if px < 10:
                            templateVars['Port_Selector'] = 'Eth%s-0%s' & (modx, px)
                        elif px < 100:
                            templateVars['Port_Selector'] = 'Eth%s-%s' & (modx, px)
                        elif px > 99:
                            templateVars['Port_Selector'] = 'Eth%s_%s' & (modx, px)
                        modp = '%s/%s' % (templateVars['Module'],templateVars['Port'])
                        pselect = templateVars['Port_Selector']
                        # Copy the Port Selector to the Worksheet
                        data = ['add_selct',pselect,modp,'','','','','','']
                        ws_sw.append(data)
                        rc = '%s:%s' % (ws_sw_row_count, ws_sw_row_count)
                        for cell in ws_sw[rc]:
                            if ws_sw_row_count % 2 == 0:
                                cell.style = 'ws_even'
                            else:
                                cell.style = 'ws_odd'
                        ws_sw_row_count += 1
            elif templateVars['Switch_Role'] == 'spine':
                for modx in range(1, modules):
                    module_type = None
                    row_count = 1
                    for row in ws.rows:
                        sw_type = templateVars['Switch_Type']
                        sw_name = templateVars['Name']
                        if row[1].value == sw_type and row[2].value == sw_name:
                            mod_count = modx + 2
                            module_type = row[mod_count].value
                        row_count += 1
                    if re.search('X97', module_type):
                        port_count = query_module_type(row_count, module_type)
                        for px in range(1, port_count):
                            templateVars['Module'] = modx
                            templateVars['Port'] = px
                            if px < 10:
                                templateVars['Port_Selector'] = 'Eth%s-0%s' & (modx, px)
                            elif px < 100:
                                templateVars['Port_Selector'] = 'Eth%s-%s' & (modx, px)
                            modp = '%s/%s' % (templateVars['Module'],templateVars['Port'])
                            pselect = templateVars['Port_Selector']
                            # Copy the Port Selector to the Worksheet
                            data = ['add_selct',pselect,modp,'','','','','','']
                            ws_sw.append(data)
                            rc = '%s:%s' % (ws_sw_row_count, ws_sw_row_count)
                            for cell in ws_sw[rc]:
                                if ws_sw_row_count % 2 == 0:
                                    cell.style = 'ws_even'
                                else:
                                    cell.style = 'ws_odd'
                            ws_sw_row_count += 1

        # Check if there is a Directory for the Switch and if not Create it
        switch_dir = './ACI/%s' % (templateVars['Name'])
        if not os.path.isdir(switch_dir):
            switch_dir = 'mkdir ./ACI/%s' % (templateVars['Name'])
            os.system(switch_dir)

        # Create Template file for Switch
        file_switch = './ACI/%s/%s.tf' % (templateVars['Name'], templateVars['Name'])
        wr_file = open(file_switch, 'w')

        # Determine if this is an odd or even switch
        templateVars['Node_ID'] = int(templateVars['Node_ID'])
        if templateVars['Node_ID'] % 2 == 0:
            templateVars['Maint_Grp'] = 'MgB'
        else:
            templateVars['Maint_Grp'] = 'MgA'
        templateVars['Node_ID'] = str(templateVars['Node_ID'])

        # Locate template; Render Template; Then Write to the File
        if templateVars['Switch_Role'] == 'leaf':
            template_file = "leaf.template"
        elif templateVars['Switch_Role'] == 'spine':
            template_file = "spine.template"
        template = self.templateEnv.get_template(template_file)
        payload = template.render(templateVars)
        wr_file.write(payload + '\n\n')

        # Copy the Inband Management Template to Switch Profile
        template_file = "switch_inb.template"
        template = self.templateEnv.get_template(template_file)
        payload = template.render(templateVars)
        wr_file.write(payload + '\n\n')

        if not templateVars['OOB_IPv4'] == None:
            # Copy the OOB Management Template to Switch Profile
            template_file = "switch_oob.template"
            template = self.templateEnv.get_template(template_file)
            payload = template.render(templateVars)
            wr_file.write(payload + '\n\n')

        ws_sw = wb[templateVars['Name']]

    
# Terraform ACI Provider - Admin Policies
# Class must be instantiated with Variables
class Admin_Policies(object):
    def __init__(self, ws):
        self.templateLoader = jinja2.FileSystemLoader(
            searchpath=(aci_template_path + 'Admin_Policies/'))
        self.templateEnv = jinja2.Environment(loader=self.templateLoader)
    
    # Method must be called with the following kwargs.
    # Encryption_Key: This Key is used to encrypt the backup configurations
    # Backup_Hour: Hour of the Day
    # Backup_Minute: Minute of the Day
    # Remote_Host: IP or Hostname of the Remote Server
    # Mgmt_Domain: Which Mgmt Network to use: inb or oob.
    # Protocol: ftp, scp or sftp
    # Remote_Path: Where to Backup the Files to on the Remote Server
    # Port: Port for the Remote Server.
    # Auth_Type: Use Username/Password or SSH Keys for Authentication
    # Username: If using password authentication what is the username to use.  Optional
    # Passwd_or_SSH_Pass: password or SSH Passphrase
    # SSH_Key: Optional.  Only required for SSH Based Authentication
    # Description: Optional
    def backup(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'Encryption_Key': '',
                         'Backup_Hour': '',
                         'Backup_Minute': '',
                         'Remote_Host': '',
                         'Mgmt_Domain': '',
                         'Protocol': '',
                         'Remote_Path': '',
                         'Port': '',
                         'Auth_Type': '',
                         'Passwd_or_SSH_Pass': ''}
        optional_args = {'Username': '',
                         'SSH_Key': '',
                         'Description': ''}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Encryption Key Length & Management Domain
            validating.encryption_key(row_num, templateVars['Encryption_Key'])
            templateVars['Mgmt_Domain'] = validating.mgmt_domain(row_num, templateVars['Mgmt_Domain'])
        except Exception as err:
            Error_Return = '%s\nError on Row %s.  Please verify Input Information.' % (SystemExit(err), row_num)
            raise ErrException(Error_Return)
        
        templateVars['Remote_Host_'] = templateVars['Remote_Host'].replace('.', '_')

        # Locate template for method
        if templateVars['Auth_Type'] == 'password':
            templateVars['Auth_Type'] = 'usePassword'
            template_file = "backup_passwd.template"
        elif templateVars['Auth_Type'] == 'ssh-key':
            templateVars['Auth_Type'] = 'useSshKeyContents'
            template_file = "backup_ssh_key.template"
        else:
            print(f'\n-----------------------------------------------------------------------------\n')
            print(f'   Error on Row {row_num}.  Authentication type should be password or ssh-key.')
            print(f'   Exiting....')
            print(f'\n-----------------------------------------------------------------------------\n')
            exit()

        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload)
        wr_file.write('\n\n')
    
    # Method must be called with the following kwargs.
    # Auth_Realm: console or default
    # Login_Domain: Login Domain to Use.  Optional
    # Domain_Type: local, ldap, radius, tacacs, rsa, saml.
    #              Currently the Script only supports local, radius, or tacacs
    def realm(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'Auth_Realm': '',
                         'Domain_Type': ''}
        optional_args = {'Login_Domain': ''}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Realm and Login Domain
            validating.auth_realm(row_num, templateVars['Auth_Realm'])
            validating.login_type(row_num, templateVars['Auth_Realm'], templateVars['Domain_Type'])
            if not templateVars['Domain_Type'] == 'local':
                validating.login_domain(row_num, templateVars['Login_Domain'])
        except Exception as err:
            Error_Return = '%s\nError on Row %s.  Please verify Input Information.' % (SystemExit(err), row_num)
            raise ErrException(Error_Return)
        
        if templateVars['Login_Domain'] == None:
            templateVars['Login_Domain'] = ''

        if templateVars['Auth_Realm'] == 'console':
            templateVars['child_class'] = 'aaaDefaultAuth'
        elif templateVars['Auth_Realm'] == 'default':
            templateVars['child_class'] = 'aaaConsoleAuth'
        # Locate template for method
        template_file = "realm.template"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload)
        wr_file.write('\n\n')

    # Method must be called with the following kwargs.
    # Login_Domain: Used to Create a Authentication Domain
    # Radius_IPv4: IPv4 Address of RADIUS Server
    # Port: Radius Port for the Remote Server. Typically should be 1812 or 1645.
    # Shared_Secret: Secret to user for RADIUS Authentication and Authorization
    # Authz_Proto: chap, mschap or pap.  pap is the default
    # Timeout: Default if 5 seconds
    # Retry_Interval: How Long to Wait for Retry after Timeout.  Default is 5 seconds
    # Mgmt_Domain: Which Mgmt Network to use: inb or oob.
    # Domain Order: When Adding Servers to the Authentication Domain.  What Order should they be
    def radius(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'Login_Domain': '',
                         'Radius_IPv4': '',
                         'Port': '',
                         'Shared_Secret': '',
                         'Authz_Proto': '',
                         'Timeout': '',
                         'Retry_Interval': '',
                         'Mgmt_Domain': '',
                         'Domain_Order': ''}
        optional_args = {}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate RADIUS IPv4 Address, Login Domain, Authentication Protocol,
            # secret, Timeout, Retry Limit and Management Domain
            validating.login_domain(row_num, templateVars['Login_Domain'])
            validating.ipv4(row_num, templateVars['Radius_IPv4'])
            validating.auth_proto(row_num, templateVars['Authz_Proto'])  
            validating.secret(row_num, templateVars['Shared_Secret'])
            validating.timeout(row_num, templateVars['Timeout'])
            validating.retry(row_num, templateVars['Retry_Interval'])
            templateVars['Mgmt_Domain'] = validating.mgmt_domain(row_num, templateVars['Mgmt_Domain'])
        except Exception as err:
            Error_Return = '%s\nError on Row %s.  Please verify Input Information.' % (SystemExit(err), row_num)
            raise ErrException(Error_Return)
        
        templateVars['Radius_IPv4_'] = templateVars['Radius_IPv4'].replace('.', '_')
        
        # Locate template for method
        template_file = "radius.template"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload)
        wr_file.write('\n\n')
    
    # Method must be called with the following kwargs.
    # Login_Domain: Used to Create a Authentication Domain
    # TACACS_IPv4: IPv4 Address of TACACS Server
    # Port: TACACS Port for the Remote Server. Default is 49.
    # Shared_Secret: Secret to user for TACACS Authentication and Authorization
    # Auth_Proto: chap, mschap or pap.  pap is the default
    # Timeout: Default if 5 seconds
    # Retry_Interval: How Long to Wait for Retry after Timeout.  Default is 5 seconds
    # Mgmt_Domain: Which Mgmt Network to use: inb or oob.
    # Domain Order: When Adding Servers to the Authentication Domain.  What Order should they be
    def tacacs(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'Login_Domain': '',
                         'TACACS_IPv4': '',
                         'Port': '',
                         'Shared_Secret': '',
                         'Auth_Proto': '',
                         'Timeout': '',
                         'Retry_Interval': '',
                         'Mgmt_Domain': '',
                         'Domain_Order': ''}
        optional_args = {}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate RADIUS IPv4 Address, Login Domain, Authentication Protocol,
            # secret, Timeout, Retry Limit and Management Domain
            validating.login_domain(row_num, templateVars['Login_Domain'])
            validating.ipv4(row_num, templateVars['TACACS_IPv4'])
            validating.auth_proto(row_num, templateVars['Auth_Proto'])  
            validating.secret(row_num, templateVars['Shared_Secret'])
            validating.timeout(row_num, templateVars['Timeout'])
            validating.retry(row_num, templateVars['Retry_Interval'])
            templateVars['Mgmt_Domain'] = validating.mgmt_domain(row_num, templateVars['Mgmt_Domain'])
        except Exception as err:
            Error_Return = '%s\nError on Row %s.  Please verify Input Information.' % (SystemExit(err), row_num)
            raise ErrException(Error_Return)
        
        templateVars['TACACS_IPv4_'] = templateVars['TACACS_IPv4'].replace('.', '_')

        # Locate template for method
        template_file = "tacacs.template"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload)
        wr_file.write('\n\n')
    
# Terraform ACI Provider - Fabric Policies
# Class must be instantiated with Variables
class Fabric_Policies(object):
    def __init__(self, ws):
        self.templateLoader = jinja2.FileSystemLoader(
            searchpath=(aci_template_path + 'Fabric_Policies/'))
        self.templateEnv = jinja2.Environment(loader=self.templateLoader)
    
    # Method must be called with the following kwargs.
    # DNS_IPv4: IPv4 Address of DNS Server
    # Preferred: IPv4 Address of DNS Server
    def dns(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'DNS_IPv4': '',
                         'Preferred': ''}
        optional_args = {}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate DNS IPv4 Address
            validating.ipv4(row_num, templateVars['DNS_IPv4'])
        except Exception as err:
            Error_Return = '%s\nError on Row %s.  Please verify Input Information.' % (SystemExit(err), row_num)
            raise ErrException(Error_Return)
        
        templateVars['DNS_IPv4_'] = templateVars['DNS_IPv4'].replace('.', '_')

        # Locate template for method
        template_file = "dns.template"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload)
        wr_file.write('\n\n')
    
    # Method must be called with the following kwargs.
    # Mgmt_Domain: Which Management Domain to use: inb or oob
    def dns_mgmt(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'Mgmt_Domain': ''}
        optional_args = {}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Management Domain
            templateVars['Mgmt_Domain'] = validating.mgmt_domain(row_num, templateVars['Mgmt_Domain'])
        except Exception as err:
            Error_Return = '%s\nError on Row %s.  Please verify Input Information.' % (SystemExit(err), row_num)
            raise ErrException(Error_Return)

        # Locate template for method
        template_file = "dns_mgmt.template"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload)
        wr_file.write('\n\n')

    # Method must be called with the following kwargs.
    # Domain: Domain to add as a Search domain or Default Domain
    # Default_Domain: Is the Domain the Default Domain.  Only one Domain can be default.
    def domain(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'Domain': '',
                         'Default_Domain': ''}
        optional_args = {}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Domain
            validating.domain(row_num, templateVars['Domain'])
        except Exception as err:
            Error_Return = '%s\nError on Row %s.  Please verify Input Information.' % (SystemExit(err), row_num)
            raise ErrException(Error_Return)
        
        templateVars['Domain_'] = templateVars['Domain'].replace('.', '_')

        # Locate template for method
        template_file = "domain.template"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload)
        wr_file.write('\n\n')
    
    # Method must be called with the following kwargs.
    # NTP_Server_IPv4: IPv4 Address of NTP Server
    # Preferred: Is the preferred NTP server or not.  Only one NTP Server can be Preferred.
    # Mgmt_Domain: Which Mgmt Network to use: inb or oob.
    def ntp(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'NTP_Server_IPv4': '',
                         'Preferred': '',
                         'Mgmt_Domain': ''}
        optional_args = {}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate DNS IPv4 Address
            validating.ipv4(row_num, templateVars['NTP_Server_IPv4'])
            templateVars['Mgmt_Domain'] = validating.mgmt_domain(row_num, templateVars['Mgmt_Domain'])
        except Exception as err:
            Error_Return = '%s\nError on Row %s.  Please verify Input Information.' % (SystemExit(err), row_num)
            raise ErrException(Error_Return)
        
        templateVars['NTP_Server_IPv4_'] = templateVars['NTP_Server_IPv4'].replace('.', '_')

        # Locate template for method
        template_file = "ntp.template"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload)
        wr_file.write('\n\n')
    
    # Method must be called with the following kwargs.
    # SMTP_Port: TCP Port for the SMTP Server.  25 is Default
    # SMTP_Relay: IP or Hostname of the SMTP Relay Server
    # Mgmt_Domain: Which Mgmt Network to use: inb or oob.
    # From_Email: Email alias to use for sending email's
    # Reply_Email: Email alias to use for Receiving email responses
    # To_Email: Email alias to to send to
    # Phone_Number: Support Phone Number to associate with TAC Cases
    # Contact_Info: Point of Contact or Team Alias
    # Street_Address: Physical Address of Equipment.
    # Contract_ID: Support Contract to be used for Opening TAC Cases
    # Customer_Identifier: The Customer Identifier is contained in the contract
    # Site_Identifier: The Site Identifier is under contract information to identify the Physical Site of the Equipment
    def smartcallhome(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'SMTP_Port': '',
                         'SMTP_Relay': '',
                         'Mgmt_Domain': '',
                         'From_Email': '',
                         'Reply_Email': '',
                         'To_Email': '',
                         'Phone_Number': '',
                         'Contact_Info': '',
                         'Street_Address': '',
                         'Contract_ID': '',
                         'Customer_Identifier': '',
                         'Site_Identifier': ''}
        optional_args = { }

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate All the Email Addresses, Phone Number, and Management Domain
            validating.email(row_num, templateVars['From_Email'])
            validating.email(row_num, templateVars['Reply_Email'])
            validating.email(row_num, templateVars['To_Email'])
            validating.phone(row_num, templateVars['Phone_Number'])
            templateVars['Mgmt_Domain'] = validating.mgmt_domain(row_num, templateVars['Mgmt_Domain'])
        except Exception as err:
            Error_Return = '%s\nError on Row %s.  Please verify Input Information.' % (SystemExit(err), row_num)
            raise ErrException(Error_Return)
        
        # Locate template for method
        template_file = "smartcallhome.template"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload)
        wr_file.write('\n\n')
    
    # Method must be called with the following kwargs.
    # SNMP_Client_Name: A Name for the SNMP Client
    # SNMP_Client_IPv4: IPv4 Address of the SNMP Client
    # Mgmt_Domain: Which Mgmt Network to use: inb or oob.
    def snmp_client(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'SNMP_Client_Name': '',
                         'SNMP_Client_IPv4': '',
                         'Mgmt_Domain': ''}
        optional_args = { }

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate SNMP IPv4 Client Address and Management Domain
            validating.ipv4(row_num, templateVars['SNMP_Client_IPv4'])
            templateVars['Mgmt_Domain'] = validating.snmp_mgmt(row_num, templateVars['Mgmt_Domain'])
        except Exception as err:
            Error_Return = '%s\nError on Row %s.  Please verify Input Information.' % (SystemExit(err), row_num)
            raise ErrException(Error_Return)
        
        templateVars['SNMP_Client_IPv4_'] = templateVars['SNMP_Client_IPv4'].replace('.', '_')

        # Locate template for method
        template_file = "snmp_client.template"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload)
        wr_file.write('\n\n')
    
    # Method must be called with the following kwargs.
    # SNMP_Community: SNMP Community String
    # Description: Description is Optional
    def snmp_comm(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'SNMP_Community': ''}
        optional_args = {'Description': ''}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate SNMP Community
            validating.snmp_string(row_num, templateVars['SNMP_Community'])
        except Exception as err:
            Error_Return = '%s\nError on Row %s.  Please verify Input Information.' % (SystemExit(err), row_num)
            raise ErrException(Error_Return)
        
        # Locate template for method
        template_file = "snmp_comm.template"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload)
        wr_file.write('\n\n')
    
    # Method must be called with the following kwargs.
    # SNMP_Contact: SNMP Contact
    # SNMP_Location: SNMP Location of the APIC's.  Use Geolocation for Leaf and spine's
    def snmp_info(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'SNMP_Contact': '',
                         'SNMP_Location': ''}
        optional_args = { }

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate SNMP Information STrings
            validating.snmp_info(row_num, templateVars['SNMP_Contact'], templateVars['SNMP_Location'])
        except Exception as err:
            Error_Return = '%s\nError on Row %s.  Please verify Input Information.' % (SystemExit(err), row_num)
            raise ErrException(Error_Return)
        
        # Locate template for method
        template_file = "snmp_info.template"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload)
        wr_file.write('\n\n')
    
    # Method must be called with the following kwargs.
    # Trap_Server_IPv4: IPv4 of the SNMP Trap Server
    # Destination_Port: UDP Port for the SNMP Trap Server.  162 is Default
    # Version: v1, v2c, or v3
    # Community_or_Username: Community for v1 or v2c, and user for v3
    # Security_Level: must be auth, noauth, or priv.  auth and priv is only for v3
    # Mgmt_Domain: Which Mgmt Network to use: inb or oob.
    def snmp_trap(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'Trap_Server_IPv4': '',
                         'Destination_Port': '',
                         'Version': '',
                         'Community_or_Username': '',
                         'Security_Level': '',
                         'Mgmt_Domain': ''}
        optional_args = { }

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        # Set noauth if v1 or v2c
        if re.search('(v1|v2c)', templateVars['Version']):
            templateVars['Security_Level'] = 'noauth'
    
        try:
            # Validate SNMP Trap Server IPv4 Address, SNMP Port, Check SNMP Version
            # Check SNMP Community/Username and Validate Management Domain
            validating.ipv4(row_num, templateVars['Trap_Server_IPv4'])
            validating.port(row_num, templateVars['Destination_Port'])
            validating.snmp_ver(row_num, templateVars['Version'])
            validating.snmp_string(row_num, templateVars['Community_or_Username'])
            templateVars['Mgmt_Domain'] = validating.mgmt_domain(row_num, templateVars['Mgmt_Domain'])
        except Exception as err:
            Error_Return = '%s\nError on Row %s.  Please verify Input Information.' % (SystemExit(err), row_num)
            raise ErrException(Error_Return)
        
        templateVars['Trap_Server_IPv4_'] = templateVars['Trap_Server_IPv4'].replace('.', '_')

        # Locate template for method
        template_file = "snmp_trap.template"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        # print(payload)
        wr_file.write(payload)
        wr_file.write('\n\n')
    
    # Method must be called with the following kwargs.
    # SNMP_User: Username
    # Privacy_Type: Privacy Key Type.
    # Privacy_Key: Privacy Key... Optional if Privacy Type is none
    # Authorization_Type: Authorization Type
    # Authorization_Key: Authorization Key
    def snmp_user(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'SNMP_User': '',
                         'Privacy_Type': '',
                         'Authorization_Type': '',
                         'Authorization_Key': ''}
        optional_args = { 'Privacy_Key': ''}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate SNMP User Authentication Information
            validating.snmp_auth(row_num, templateVars['Authorization_Key'], templateVars['Privacy_Key'], templateVars['Privacy_Type'])
        except Exception as err:
            Error_Return = '%s\nError on Row %s.  Please verify Input Information.' % (SystemExit(err), row_num)
            raise ErrException(Error_Return)
        
        # Modify User Input of templateVars['Privacy_Type'] or templateVars['Authorization_Type'] to send to APIC
        if templateVars['Privacy_Key'] == None:
            templateVars['Privacy_Key'] = ''
        if templateVars['Privacy_Type'] == None:
            templateVars['Privacy_Type'] = ''
        if templateVars['Authorization_Type'] == 'md5':
            templateVars['Authorization_Type'] = ''
        if templateVars['Authorization_Type'] == 'sha1':
            templateVars['Authorization_Type'] = 'hmac-sha1-96'
    
        # Locate template for method
        if not templateVars['Privacy_Type'] == '':
            if not templateVars['Authorization_Type'] == '':
                template_file = "snmp_user_auth_priv.template"
            else:
                template_file = "snmp_user_priv.template"
        elif not templateVars['Authorization_Type'] == '':
            template_file = "snmp_user_auth.template"
        else:
            template_file = "snmp_user.template"

        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        # print(payload)
        wr_file.write(payload)
        wr_file.write('\n\n')
    
    # Method must be called with the following kwargs.
    # Dest_Group_Name: Name of the Syslog Destination Group.  Typically default is good for this.
    # Minimum_Log_Level: IPv4 Address of the Syslog Server
    # Log_Format: UDP Port for the Syslog Server.  514 is Default
    # Console: This only Needs to be Defined One time.
    # Console_Level: Logging Level for Console Logging. Optional
    # Local: This only Needs to be Defined One time.
    # Local_Level: Logging Level for Local Logging. Optional
    # Include_msec: true or false
    # Include_timezone: true or false
    # Audit: true or false
    # Events: true or false
    # Faults: true or false
    # Session: true or false
    def syslog_dg(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'Dest_Group_Name': '',
                         'Minimum_Level': '',
                         'Log_Format': '',
                         'Console': '',
                         'Console_Level': '',
                         'Local': '',
                         'Local_Level': '',
                         'Include_msec': '',
                         'Include_timezone': '',
                         'Audit': '',
                         'Events': '',
                         'Faults': '',
                         'Session': ''}
        optional_args = { }

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Syslog Server IPv4 Address, Port, Facility, Logging Levels and Management Domain
            validating.log_level(row_num, 'minimum', templateVars['Minimum_Level'])
            validating.log_level(row_num, 'local', templateVars['Local_Level'])
            validating.log_level(row_num, 'console', templateVars['Console_Level'])
        except Exception as err:
            Error_Return = '%s\nError on Row %s.  Please verify Input Information.' % (SystemExit(err), row_num)
            raise ErrException(Error_Return)
        incl_list = ''
        if not templateVars['Audit'] == 'false':
            incl_list = 'audit'
        if not templateVars['Events'] == 'false':
            if incl_list == '':
                incl_list = 'events'
            else:
                incl_list = incl_list + ',events'
        if not templateVars['Faults'] == 'false':
            if incl_list == '':
                incl_list = 'faults'
            else:
                incl_list = incl_list + ',faults'
        if not templateVars['Session'] == 'false':
            if incl_list == '':
                incl_list = 'session'
            else:
                incl_list = incl_list + ',session'
        templateVars['Included_Types'] = incl_list
        # Locate template for method
        template_file = "syslog_dg.template"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload)
        wr_file.write('\n\n')
    
    # Method must be called with the following kwargs.
    # Dest_Group_Name: Remote Syslog Destination Group Name
    # Syslog_Server_IPv4: IPv4 Address of the Syslog Server
    # Port: UDP Port for the Syslog Server.  514 is Default
    # Mgmt_Domain: Which Mgmt Network to use: inb or oob.
    # Severity: Remote Syslog Severity Level
    # Facility: Remote Syslog Server Facility
    def syslog_rmt(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'Dest_Group_Name': '',
                         'Syslog_Server_IPv4': '',
                         'Port': '',
                         'Mgmt_Domain': '',
                         'Severity': '',
                         'Facility': ''}
        optional_args = { }

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Syslog Server IPv4 Address, Port, Facility, Logging Levels and Management Domain
            validating.ipv4(row_num, templateVars['Syslog_Server_IPv4'])
            validating.port(row_num, templateVars['Port'])
            validating.syslog_fac(row_num, templateVars['Facility'])
            validating.log_level(row_num, 'remote', templateVars['Severity'])
            templateVars['Mgmt_Domain'] = validating.mgmt_domain(row_num, templateVars['Mgmt_Domain'])
        except Exception as err:
            Error_Return = '%s\nError on Row %s.  Please verify Input Information.' % (SystemExit(err), row_num)
            raise ErrException(Error_Return)
        
        templateVars['Syslog_Server_IPv4_'] = templateVars['Syslog_Server_IPv4'].replace('.', '_')

        # Locate template for method
        template_file = "syslog_rmt.template"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload)
        wr_file.write('\n\n')
    
class Inventory_Policies(object):
    def __init__(self, apic, cookies):
        self.apic = apic
        self.cookies = cookies
        self.templateLoader = jinja2.FileSystemLoader(
            searchpath=(aci_template_path + 'Mpod/'))
        self.templateEnv = jinja2.Environment(loader=self.templateLoader)

    # Method must be called with the following kwargs.
    # name: name of the spine policy group
    # cdp: name of the cdp policy
    # aep: name of the AEP
    # int: name of the interface policy
    # status: created | created,modified | deleted
    def spine_pol_grp(self, **kwargs):
        required_args = {'name': '',
                         'cdp': '',
                         'aep': '',
                         'int': '',
                         'status': ''}
        optional_args = {}

        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        if templateVars['status'] not in valid_status:
            raise InvalidArg('Status invalid')

        template_file = "spine_pol_grp.json"
        template = self.templateEnv.get_template(template_file)

        payload = template.render(templateVars)

        uri = ('mo/uni/infra/funcprof/spaccportgrp-{}'
               .format(templateVars['name']))
        status = post(self.apic, payload, self.cookies, uri, template_file)
        return status

class System_Policies(object):
    def __init__(self, ws):
        self.templateLoader = jinja2.FileSystemLoader(
            searchpath=(aci_template_path + 'System_Policies/'))
        self.templateEnv = jinja2.Environment(loader=self.templateLoader)

    # Method must be called with the following kwargs.
    # Mgmt_Domain: Which Management Domain to use: inb or oob
    def bgp_as(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'AS_Number': ''}
        optional_args = {}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate BGP AS Number
            validating.bgp_as(row_num, templateVars['AS_Number'])
        except Exception as err:
            Error_Return = '%s\nError on Row %s.  Please verify Input Information.' % (SystemExit(err), row_num)
            raise ErrException(Error_Return)

        # Locate template for method
        template_file = "bgp_as.template"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload)
        wr_file.write('\n\n')

    def bgp_rr(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'Spine_Name': '',
                         'Node_ID': ''}
        optional_args = {}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Node ID
            validating.node_id(row_num, templateVars['Node_ID'])
        except Exception as err:
            Error_Return = '%s\nError on Row %s.  Please verify Input Information.' % (SystemExit(err), row_num)
            raise ErrException(Error_Return)

        # Locate template for method
        template_file = "bgp_rr.template"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload)
        wr_file.write('\n\n')

class Tenant_Policies(object):
    def __init__(self, apic, cookies):
        self.apic = apic
        self.cookies = cookies
        self.templateLoader = jinja2.FileSystemLoader(
            searchpath=(aci_template_path + 'Mpod/'))
        self.templateEnv = jinja2.Environment(loader=self.templateLoader)

    # Method must be called with the following kwargs.
    # name: name of the spine policy group
    # cdp: name of the cdp policy
    # aep: name of the AEP
    # int: name of the interface policy
    # status: created | created,modified | deleted
    def spine_pol_grp(self, **kwargs):
        required_args = {'name': '',
                         'cdp': '',
                         'aep': '',
                         'int': '',
                         'status': ''}
        optional_args = {}

        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        if templateVars['status'] not in valid_status:
            raise InvalidArg('Status invalid')

        template_file = "spine_pol_grp.json"
        template = self.templateEnv.get_template(template_file)

        payload = template.render(templateVars)

        uri = ('mo/uni/infra/funcprof/spaccportgrp-{}'
               .format(templateVars['name']))
        status = post(self.apic, payload, self.cookies, uri, template_file)
        return status

class VRF_Policies(object):
    def __init__(self, apic, cookies):
        self.apic = apic
        self.cookies = cookies
        self.templateLoader = jinja2.FileSystemLoader(
            searchpath=(aci_template_path + 'Mpod/'))
        self.templateEnv = jinja2.Environment(loader=self.templateLoader)

    # Method must be called with the following kwargs.
    # name: name of the spine policy group
    # cdp: name of the cdp policy
    # aep: name of the AEP
    # int: name of the interface policy
    # status: created | created,modified | deleted
    def spine_pol_grp(self, **kwargs):
        required_args = {'name': '',
                         'cdp': '',
                         'aep': '',
                         'int': '',
                         'status': ''}
        optional_args = {}

        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        if templateVars['status'] not in valid_status:
            raise InvalidArg('Status invalid')

        template_file = "spine_pol_grp.json"
        template = self.templateEnv.get_template(template_file)

        payload = template.render(templateVars)

        uri = ('mo/uni/infra/funcprof/spaccportgrp-{}'
               .format(templateVars['name']))
        status = post(self.apic, payload, self.cookies, uri, template_file)
        return status

class NetworkSegment_Policies(object):
    def __init__(self, apic, cookies):
        self.apic = apic
        self.cookies = cookies
        self.templateLoader = jinja2.FileSystemLoader(
            searchpath=(aci_template_path + 'Mpod/'))
        self.templateEnv = jinja2.Environment(loader=self.templateLoader)

    # Method must be called with the following kwargs.
    # name: name of the spine policy group
    # cdp: name of the cdp policy
    # aep: name of the AEP
    # int: name of the interface policy
    # status: created | created,modified | deleted
    def spine_pol_grp(self, **kwargs):
        required_args = {'name': '',
                         'cdp': '',
                         'aep': '',
                         'int': '',
                         'status': ''}
        optional_args = {}

        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        if templateVars['status'] not in valid_status:
            raise InvalidArg('Status invalid')

        template_file = "spine_pol_grp.json"
        template = self.templateEnv.get_template(template_file)

        payload = template.render(templateVars)

        uri = ('mo/uni/infra/funcprof/spaccportgrp-{}'
               .format(templateVars['name']))
        status = post(self.apic, payload, self.cookies, uri, template_file)
        return status

class L3Out_Policies(object):
    def __init__(self, apic, cookies):
        self.apic = apic
        self.cookies = cookies
        self.templateLoader = jinja2.FileSystemLoader(
            searchpath=(aci_template_path + 'Mpod/'))
        self.templateEnv = jinja2.Environment(loader=self.templateLoader)

    # Method must be called with the following kwargs.
    # name: name of the spine policy group
    # cdp: name of the cdp policy
    # aep: name of the AEP
    # int: name of the interface policy
    # status: created | created,modified | deleted
    def spine_pol_grp(self, **kwargs):
        required_args = {'name': '',
                         'cdp': '',
                         'aep': '',
                         'int': '',
                         'status': ''}
        optional_args = {}

        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        if templateVars['status'] not in valid_status:
            raise InvalidArg('Status invalid')

        template_file = "spine_pol_grp.json"
        template = self.templateEnv.get_template(template_file)

        payload = template.render(templateVars)

        uri = ('mo/uni/infra/funcprof/spaccportgrp-{}'
               .format(templateVars['name']))
        status = post(self.apic, payload, self.cookies, uri, template_file)
        return status

class Subnet_Policies(object):
    def __init__(self, apic, cookies):
        self.apic = apic
        self.cookies = cookies
        self.templateLoader = jinja2.FileSystemLoader(
            searchpath=(aci_template_path + 'Mpod/'))
        self.templateEnv = jinja2.Environment(loader=self.templateLoader)

    # Method must be called with the following kwargs.
    # name: name of the spine policy group
    # cdp: name of the cdp policy
    # aep: name of the AEP
    # int: name of the interface policy
    # status: created | created,modified | deleted
    def spine_pol_grp(self, **kwargs):
        required_args = {'name': '',
                         'cdp': '',
                         'aep': '',
                         'int': '',
                         'status': ''}
        optional_args = {}

        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        if templateVars['status'] not in valid_status:
            raise InvalidArg('Status invalid')

        template_file = "spine_pol_grp.json"
        template = self.templateEnv.get_template(template_file)

        payload = template.render(templateVars)

        uri = ('mo/uni/infra/funcprof/spaccportgrp-{}'
               .format(templateVars['name']))
        status = post(self.apic, payload, self.cookies, uri, template_file)
        return status

class DHCPRelay_Policies(object):
    def __init__(self, apic, cookies):
        self.apic = apic
        self.cookies = cookies
        self.templateLoader = jinja2.FileSystemLoader(
            searchpath=(aci_template_path + 'Mpod/'))
        self.templateEnv = jinja2.Environment(loader=self.templateLoader)

    # Method must be called with the following kwargs.
    # name: name of the spine policy group
    # cdp: name of the cdp policy
    # aep: name of the AEP
    # int: name of the interface policy
    # status: created | created,modified | deleted
    def spine_pol_grp(self, **kwargs):
        required_args = {'name': '',
                         'cdp': '',
                         'aep': '',
                         'int': '',
                         'status': ''}
        optional_args = {}

        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        if templateVars['status'] not in valid_status:
            raise InvalidArg('Status invalid')

        template_file = "spine_pol_grp.json"
        template = self.templateEnv.get_template(template_file)

        payload = template.render(templateVars)

        uri = ('mo/uni/infra/funcprof/spaccportgrp-{}'
               .format(templateVars['name']))
        status = post(self.apic, payload, self.cookies, uri, template_file)
        return status

def countKeys(ws, func):
    count = 0
    for i in ws.rows:
        if any(i):
            if str(i[0].value) == func:
                count += 1
    return count

def findKeys(ws):
    func_list = OrderedSet()
    for i in ws.rows:
        if any(i):
            if ws.title == 'Access':
                func_regex = Access_regex
            elif ws.title == 'Admin':
                func_regex = Admin_regex
            elif ws.title == 'Fabric':
                func_regex = Fabric_regex
            elif ws.title == 'Inventory':
                func_regex = Inventory_regex
            elif ws.title == 'Network Segment':
                func_regex = netseg_regex
            elif ws.title == 'System':
                func_regex = System_regex
            elif ws.title == 'Tenant':
                func_regex = Tenant_regex
            elif ws.title == 'VRF':
                func_regex = VRF_regex
            if re.search(func_regex, str(i[0].value)):
                func_list.add(str(i[0].value))
    return func_list

def findVars(ws, func, rows, count):
    var_list = []
    var_dict = {}
    for i in range(1, rows + 1):
        if (ws.cell(row=i, column=1)).value == func:
            print()
            try:
                for x in range(2, 17):
                    if (ws.cell(row=i - 1, column=x)).value:
                        var_list.append(str(ws.cell(row=i - 1, column=x).value))
                    else:
                        x += 1
            except Exception as e:
                e = e
                pass
            break
    while count > 0:
        var_dict[count] = {}
        var_count = 0
        for z in var_list:
            var_dict[count][z] = ws.cell(row=i + count - 1, column=2 + var_count).value
            var_count += 1
        var_dict[count]['row'] = i + count - 1
        count -= 1
    # print(f'var dictionary is {var_dict}')
    return var_dict

# Function to validate input for each method
def process_kwargs(required_args, optional_args, **kwargs):
    # Validate all required kwargs passed
    if all(item in kwargs for item in required_args.keys()) is not True:
        raise InsufficientArgs('Insufficient required arguments.')

    # Load all required args values from kwargs
    for item in kwargs:
        if item in required_args.keys():
            required_args[item] = kwargs[item]
    for item in kwargs:
        if item in optional_args.keys():
            optional_args[item] = kwargs[item]

    # Combine option and required dicts for Jinja template render
    templateVars = {**required_args, **optional_args}
    return(templateVars)

# Function to execute HTTP Post
def post(apic, payload, cookies, uri, section=''):
    if PRINT_PAYLOAD:
        print(payload)
    s = requests.Session()
    r = ''
    while r == '':
        try:
            r = s.post('https://{}/api/node/{}.json'.format(apic, uri),
                       data=payload, cookies=cookies, verify=False)
            status = r.status_code
        except requests.exceptions.ConnectionError as e:
            print("Connection error, pausing before retrying. Error: {}"
                  .format(e))
            time.sleep(5)
        except Exception as e:
            print("Method {} failed. Exception: {}".format(section[:-5], e))
            status = 666
            return(status)
    if PRINT_RESPONSE_TEXT_ALWAYS:
        print(r.text)
    if status != 200 and PRINT_RESPONSE_TEXT_ON_FAIL:
        print(r.text)
    return status

def query_module_type(row_num, module_type):
    if re.search('X9716D-GX', module_type):
        port_count = '16'
    elif re.search('X9732C-EX', module_type):
        port_count = '32'
    elif re.search('X9736', module_type):
        port_count = '36'
    else:
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Row {row_num}.  Unknown Switch Model {module_type}')
        print(f'   Please verify Input Information.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()
    return port_count

def query_switch_model(row_num, switch_type):
    if re.search('^93', switch_type):
        modules = '1'
    if re.search('^9316', switch_type):
        port_count = '16'
    elif re.search('^(93120)', switch_type):
        port_count = '102'
    elif re.search('^(93108|93120|93216|93360)', switch_type):
        port_count = '108'
    elif re.search('^(93180|93240|9348|9396)', switch_type):
        port_count = '54'
    elif re.search('^(93240)', switch_type):
        port_count = '60'
    elif re.search('^9332', switch_type):
        port_count = '34'
    elif re.search('^(9336|93600)', switch_type):
        port_count = '36'
    elif re.search('^9364C-GX', switch_type):
        port_count = '64'
    elif re.search('^9364', switch_type):
        port_count = '66'
    elif re.search('^95', switch_type):
        port_count = '36'
        if switch_type == '9504':
            modules = '4'
        elif switch_type == '9508':
            modules = '8'
        elif switch_type == '9516':
            modules = '16'
        else:
            print(f'\n-----------------------------------------------------------------------------\n')
            print(f'   Error on Row {row_num}.  Unknown Switch Model {switch_type}')
            print(f'   Please verify Input Information.  Exiting....')
            print(f'\n-----------------------------------------------------------------------------\n')
            exit()
    else:
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Row {row_num}.  Unknown Switch Model {switch_type}')
        print(f'   Please verify Input Information.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()
    return modules,port_count

def vlan_list_full(vlan_list):
    vlist = vlan_list.split(',')
    full_vlan_list = []
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
    return full_vlan_list

def vlan_to_netcentric(vlan):
    vlan = int(vlan)
    if vlan < 10:
        vlan = str(vlan)
        netcentric = 'v000' + vlan
        return netcentric
    elif vlan < 100:
        vlan = str(vlan)
        netcentric = 'v00' + vlan
        return netcentric
    elif vlan < 1000:
        vlan = str(vlan)
        netcentric = 'v0' + vlan
        return netcentric
    else:
        vlan = str(vlan)
        netcentric = 'v' + vlan
        return netcentric