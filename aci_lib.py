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
from openpyxl.worksheet.datavalidation import DataValidation
from openpyxl.styles import Alignment, colors, Border, Font, NamedStyle, PatternFill, Protection, Side 
from openpyxl.utils.dataframe import dataframe_to_rows
from ordered_set import OrderedSet
from os import path

# Log levels 0 = None, 1 = Class only, 2 = Line
log_level = 1

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

Access_regex = re.compile('(add_polgrp|vlan_pool)')
Admin_regex = re.compile('(backup|radius|tacacs|realm|web_security)')
Fabric_regex = re.compile('(dns|dns_mgmt|domain|ntp|smartcallhome|snmp_(client|comm|info|trap|user)|syslog_(dg|rmt))')
Inventory_regex = re.compile('(apic_inb|inband_mgmt|switch|95[0-1][4-8]|vpc_pair)')
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

# Terraform ACI Provider - Access Policies
# Class must be instantiated with Variables
class Access_Policies(object):
    def __init__(self, ws):
        self.templateLoader = jinja2.FileSystemLoader(
            searchpath=(aci_template_path + 'Access_Policies/'))
        self.templateEnv = jinja2.Environment(loader=self.templateLoader)
    
    # Method must be called with the following kwargs.
    # Policy_Type: This is access, port-channel or vpc
    # AAEP: Access Attachable Entity Profile
    # Name: Name of the Policy Group
    # LACP: Select Option from Drop Down
    # Speed: Select Option from Drop Down
    # CDP: CDP - Enable or Disable.
    # LLDP_Rx: Recieve LLDP - Enable or Disable.
    # LLDP_Tx: Transmit LLDP - Enable or Disable.
    # STP: Spanning Tree Policy.  Whether ot Enable Guard and Filter or Not
    # Description: Optional
    def add_polgrp(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'Policy_Type': '',
                         'AAEP': '',
                         'Name': '',
                         'LACP': '',
                         'Speed': '',
                         'CDP': '',
                         'LLDP_Rx': '',
                         'LLDP_Tx': '',
                         'STP': ''}
        optional_args = {'Description': ''}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        if templateVars['CDP'] == 'no':
            templateVars['CDP'] = 'cdp_Disabled'
        else:
            templateVars['CDP'] = 'cdp_Enabled'
        if templateVars['LLDP_Tx'] == 'no':
            templateVars['LLDP'] = 'lldp_Disabled'
        else:
            templateVars['LLDP'] = 'lldp_Enabled'

        if templateVars['Policy_Type'] == 'port-channel':
            templateVars['LAG_Type'] = 'link'
        elif templateVars['Policy_Type'] == 'vpc':
            templateVars['LAG_Type'] = 'node'
        
        # Write Template to File
        if templateVars['Policy_Type'] == 'access':
            template_file = "mgmt_inb.template"
        elif re.search('(port-channel|vpc', templateVars['Policy_Type']):
            template_file = "mgmt_inb.template"
        else:
            Error_Return = 'Error on Row %s.  Unable to Determine Policy_Type.  Please verify Input Information.' % (row_num)
            raise ErrException(Error_Return)

        template = self.templateEnv.get_template(template_file)
        payload = template.render(templateVars)
        wr_file.write(payload + '\n\n')

    # Method must be called with the following kwargs.
    # Name: APIC Hostname.  Will be used to create APIC Configuration Files
    # Node_ID: Unique Identifier used in the APIC Database.
    # Pod_ID: Email alias to use for Receiving email responses
    # Inband_IPv4: Point of Contact or Team Alias
    # Inband_GWv4: Physical Address of Equipment.
    def apic_inb(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'Name': '',
                         'Node_ID': '',
                         'Pod_ID': '',
                         'Inband_IPv4': '',
                         'Inband_GWv4': ''}
        optional_args = { }

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate APIC Node_ID, Pod_ID, ad Inband Network
            validating.hostname(row_num, templateVars['Name'])
            validating.node_id_apic(row_num, templateVars['Name'], templateVars['Node_ID'])
            validating.pod_id(row_num, templateVars['Name'], templateVars['Pod_ID'])
            validating.inband(row_num, templateVars['Name'], templateVars['Inband_IPv4'], templateVars['Inband_GWv4'])
        except Exception as err:
            Error_Return = '%s\nError on Row %s.  Please verify Input Information.' % (SystemExit(err), row_num)
            raise ErrException(Error_Return)
        
        # Check if there is a Directory for the APIC and if not Create it
        apic_dir = './ACI/%s' % (templateVars['Name'])
        if not os.path.isdir(apic_dir):
            apic_dir = 'mkdir ./ACI/%s' % (templateVars['Name'])
            os.system(apic_dir)

        # Copy main.tf to Working Directory
        src_dir = './ACI/templates'
        cp_main = 'cp %s/main.tf %s/variables.tf %s/.gitignore.tf %s/' % (src_dir, src_dir, src_dir, apic_dir)
        os.system(cp_main)

        # Create Template file for Switch
        file_apic = './ACI/%s/%s.tf' % (templateVars['Name'], templateVars['Name'])
        wr_file = open(file_apic, 'w')

        # Copy the Inband Management Template to APIC Profile
        template_file = "mgmt_inb.template"
        template = self.templateEnv.get_template(template_file)
        payload = template.render(templateVars)
        wr_file.write(payload + '\n\n')
        wr_file.close()

    # Method must be called with the following kwargs.
    # Serial: Serial Number of the Switch
    # Name: APIC Hostname.  Will be used to create APIC Configuration Files
    # Node_ID: Unique Identifier used in the APIC Database.
    # Pod_ID: Email alias to use for Receiving email responses
    # Inband_IPv4: Point of Contact or Team Alias
    # Inband_GWv4: Physical Address of Equipment.
    def inband_mgmt(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'Inband_VLAN': '',
                         'Inband_GWv4': ''}
        optional_args = { }

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Inband VLAN and Gateway
            gw = templateVars['Inband_GWv4'].split('/')
            Gateway = gw[0]
            validating.inb_vlan(row_num, templateVars['Inband_VLAN'])
            validating.inband(row_num, templateVars['Name'], templateVars['Inband_GWv4'], Gateway)
        except Exception as err:
            Error_Return = '%s\nError on Row %s.  Please verify Input Information.' % (SystemExit(err), row_num)
            raise ErrException(Error_Return)
        
        # Create Template file for Inband VLAN
        file_inb_mgmt = './ACI/Tenants_mgmt/inband_mgmt.tf'
        wr_file = open(file_inb_mgmt, 'w')

        # Copy the Inband Management Template to APIC Profile
        template_file = "inband_subnet.template"
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
    def intf_selector(self, wb, ws, row_num, wr_file, Name, Switch_Role, **kwargs):
        # Dicts for required and optional args
        required_args = {'Interface_Selector': '',
                         'Port': ''}
        optional_args = {'Policy_Group': '',
                         'PG_Type': '',
                         'Description': '',
                         'Switchport_Mode': '',
                         'Access_or_Native': '',
                         'Trunk_Allowed_VLANs': ''}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)
        templateVars['Name'] = Name
        if templateVars['Description'] == None:
            templateVars['Description'] = ''
        xa = templateVars['Port'].split('/')
        xcount = len(xa)
        templateVars['Module'] = xa[0]
        templateVars['Port'] = xa[1]
        if templateVars['Switch_Role'] == 'leaf':
            template_file = "leaf_portselect.template"
            template = self.templateEnv.get_template(template_file)
            payload = template.render(templateVars)
            wr_file.write(payload + '\n\n')

            if xcount == 3:
                templateVars['Sub_Port'] = xa[2]
                template_file = "leaf_portblock_sub.template"
            else:
                template_file = "leaf_portblock.template"

            template = self.templateEnv.get_template(template_file)
            payload = template.render(templateVars)
            wr_file.write(payload + '\n\n')
        elif templateVars['Switch_Role'] == 'spine':
            template_file = "spine_portselect.template"
            template = self.templateEnv.get_template(template_file)
            payload = template.render(templateVars)
            wr_file.write(payload + '\n\n')

        if not templateVars['Policy_Group'] == None:
            if templateVars['Switch_Role'] == 'leaf':
                if templateVars['PG_Type'] == 'access':
                    templateVars['Resource_Type'] = 'aci_leaf_access_port_policy_group'
                    templateVars['Port_Type'] = 'accportgrp'
                elif templateVars['PG_Type'] == 'breakout':
                    templateVars['Resource_Type'] = 'aci_rest'
                    templateVars['Port_Type'] = 'brkoutportgrp'
                elif templateVars['PG_Type'] == 'bundle':
                    templateVars['Resource_Type'] = 'aci_leaf_access_bundle_policy_group'
                    templateVars['Port_Type'] = 'accbundle'
                template_file = "leaf_pg_to_selector.template"
            elif templateVars['Switch_Role'] == 'spine':
                template_file = "spine_pg_to_select.template"
            template = self.templateEnv.get_template(template_file)
            payload = template.render(templateVars)
            wr_file.write(payload + '\n\n')

    # Method must be called with the following kwargs.
    # VPC_ID: Domain ID for the VPC Pair
    # Name: A Name for the VPC Pair
    # Node1_ID: First Leaf Unique Identifier used in the APIC Database.
    # Node2_ID: Second Leaf Unique Identifier used in the APIC Database.
    def port_cnvt(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'Name': '',
                         'Node_ID': '',
                         'Port': ''}
        optional_args = { }

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate VPC Domain ID and Node ID 1 & 2
            validating.node_id(row_num, templateVars['Node_ID'])
            validating.node_id(row_num, templateVars['Node2_ID'])
        except Exception as err:
            Error_Return = '%s\nError on Row %s.  Please verify Input Information.' % (SystemExit(err), row_num)
            raise ErrException(Error_Return)
        
        # Create Port Name Var
        zz = templateVars['Port'].split('/')
        templateVars['Port_Name'] = '%s_%s' % (zz[0], zz[1])
        # Create Template file for Switch
        file_downlink_conv = './ACI/%s/downlink_convert_%s.tf' % (templateVars['Name'], templateVars['Port_Name'])
        wr_file = open(file_downlink_conv, 'w')

        # Copy the Inband Management Template to APIC Profile
        template_file = "downlink.template"
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
            ws_sw.column_dimensions['A'].width = 15
            ws_sw.column_dimensions['B'].width = 20
            ws_sw.column_dimensions['C'].width = 10
            ws_sw.column_dimensions['D'].width = 20
            ws_sw.column_dimensions['E'].width = 15
            ws_sw.column_dimensions['F'].width = 30
            ws_sw.column_dimensions['G'].width = 20
            ws_sw.column_dimensions['H'].width = 20
            ws_sw.column_dimensions['I'].width = 30
            ws_sw.merge_cells('A1:I1')
            ws_sw.merge_cells('B2:I2')
            dv1 = DataValidation(type="list", formula1='"access,breakout,bundle"', allow_blank=True)
            ws_sw.add_data_validation(dv1)
            for cell in ws_sw['1:1']:
                cell.style = 'Heading 1'
            ws_header = '%s Interface Selectors' % (templateVars['Name'])
            data = [ws_header]
            for cell in ws_sw['2:2']:
                cell.style = 'Heading 2'
            data = ['','Notes: Breakout Policy Group Names are 2x100g_pg, 4x10g_pg, 4x25g_pg, 4x100g_pg, 8x50g_pg.  PG_Type Should be access, breakout or\
                    bundle.']
            ws_sw.append(data)
            for cell in ws_sw['A2:H2']:
                cell.style = 'Heading 3'
            data = ['Type','Interface_Selector','Port','Policy_Group','PG_Type','Description','Switchport_Mode','Access_or_Native','Trunk_Allowed_VLANs']
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
                            dv_cell = 'E%s' % (ws_sw_row_count)
                            dv1.add(dv_cell)
                            ws_sw_row_count += 1

        # Check if there is a Directory for the Switch and if not Create it
        switch_dir = './ACI/%s' % (templateVars['Name'])
        if not os.path.isdir(switch_dir):
            switch_dir = 'mkdir %s' % (switch_dir)
            os.system(switch_dir)

        # Copy main.tf to Working Directory
        src_dir = './ACI/templates'
        cp_main = 'cp %s/main.tf %s/variables.tf %s/.gitignore.tf %s/' % (src_dir, src_dir, src_dir, switch_dir)
        os.system(cp_main)

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
        template_file = "mgmt_inb.template"
        template = self.templateEnv.get_template(template_file)
        payload = template.render(templateVars)
        wr_file.write(payload + '\n\n')

        if not templateVars['OOB_IPv4'] == None:
            # Copy the OOB Management Template to Switch Profile
            template_file = "mgmt_oob.template"
            template = self.templateEnv.get_template(template_file)
            payload = template.render(templateVars)
            wr_file.write(payload + '\n\n')

        aci_lib_ref_sw = 'Admin_Policies'
        rows_sw = ws_sw.max_row
        func_list_sw = findKeys(ws_sw)
        class_init_sw = '%s(ws_sw)' % (aci_lib_ref_sw)
        stdout_log(ws_sw, None)
        for func_sw in func_list_sw:
            count_sw = countKeys(ws_sw, func_sw)
            var_dict_sw = findVars(ws_sw, func_sw, rows_sw, count_sw)
            for pos_sw in var_dict_sw:
                row_num_sw = var_dict_sw[pos_sw]['row']
                del var_dict_sw[pos_sw]['row']
                for x_sw in list(var_dict_sw[pos_sw].keys()):
                    if var_dict_sw[pos_sw][x_sw] == '':
                        del var_dict_sw[pos_sw][x_sw]
                stdout_log(ws_sw, row_num_sw)
                eval("%s.%s(wb, ws_sw, row_num_sw, wr_file, templateVars['Name'], templateVars['Switch_Role'], **var_dict_sw[pos_sw])" % (class_init_sw, func_sw))
        wr_file.close()

    # Method must be called with the following kwargs.
    # Name: APIC Hostname.  Will be used to create APIC Configuration Files
    # Node_ID: Unique Identifier used in the APIC Database.
    # Pod_ID: Email alias to use for Receiving email responses
    # Inband_IPv4: Point of Contact or Team Alias
    # Inband_GWv4: Physical Address of Equipment.
    def vlan_pool(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'Name': '',
                         'Allocation_Mode': ''}
        optional_args = {'VLAN_Grp1': '',
                         'VGRP1_Allocation': '',
                         'VLAN_Grp2': '',
                         'VGRP2_Allocation': ''}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        if templateVars['Name'] == None:
            Error_Return = 'Error on Row %s.  Could not Determine the Name of the VLAN Pool.' % (row_num)
            raise ErrException(Error_Return)
        
        # Create the VLAN Pool Resource's
        template_file = "vlan_pool.template"
        template = self.templateEnv.get_template(template_file)
        payload = template.render(templateVars)
        wr_file.write(payload + '\n\n')

        # Check if there is a Directory for the VLAN Pool VLAN's
        vlan_dir = './ACI/VLANs'
        if not os.path.isdir(vlan_dir):
            vlan_dir = 'mkdir %s' % (vlan_dir)
            os.system(vlan_dir)

        # Create VLAN Pool Data File if Needed
        vlan_data_file = './ACI/VLANs/data_vl_pool_%s.tf' % (templateVars['Name'])
        if not os.path.isfile(vlan_data_file):
            wr_vl_file = open(vlan_data_file, 'w')
            template_file = "data_vlan_pool.template"
            template = self.templateEnv.get_template(template_file)
            payload = template.render(templateVars)
            wr_vl_file.write(payload + '\n\n')
            wr_vl_file.close()

        # Create VLAN Pool VLAN File
        vlan_file = './ACI/VLANs/vlan_pool_%s.tf' % (templateVars['Name'])
        wr_vl_file = open(vlan_file, 'w')

        template_file = "add_vlan_to_pool.template"
        # Add VLAN's to Pools from VLAN List 1
        if re.search(r'\d+', templateVars['VLAN_Grp1']):
            vlan_list = vlan_list_full(templateVars['VLAN_Grp1'])
            for v in vlan_list:
                vlan = str(v)
                if re.fullmatch(r'\d+', vlan):
                    templateVars['VLAN_ID'] = int(vlan)

                    # Add VLAN to VLAN Pool
                    template_file = "add_vlan_to_pool.template"
                    template = self.templateEnv.get_template(template_file)
                    payload = template.render(templateVars)
                    wr_vl_file.write(payload + '\n\n')

        # Add VLAN's to Pools from VLAN List 2
        if re.search(r'\d+', templateVars['VLAN_Grp2']):
            vlan_list = vlan_list_full(templateVars['VLAN_Grp2'])
            for v in vlan_list:
                vlan = str(v)
                if re.fullmatch(r'\d+', vlan):
                    templateVars['VLAN_ID'] = int(vlan)

                    # Add VLAN to VLAN Pool
                    template_file = "add_vlan_to_pool.template"
                    template = self.templateEnv.get_template(template_file)
                    payload = template.render(templateVars)
                    wr_vl_file.write(payload + '\n\n')
        wr_vl_file.close()

    # Method must be called with the following kwargs.
    # VPC_ID: Domain ID for the VPC Pair
    # Name: A Name for the VPC Pair
    # Node1_ID: First Leaf Unique Identifier used in the APIC Database.
    # Node2_ID: Second Leaf Unique Identifier used in the APIC Database.
    def vpc_pair(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'VPC_ID': '',
                         'Name': '',
                         'Node1_ID': '',
                         'Node2_ID': ''}
        optional_args = { }

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate VPC Domain ID and Node ID 1 & 2
            validating.vpc_id(row_num, templateVars['VPC_ID'])
            validating.node_id(row_num, templateVars['Node1_ID'])
            validating.node_id(row_num, templateVars['Node2_ID'])
        except Exception as err:
            Error_Return = '%s\nError on Row %s.  Please verify Input Information.' % (SystemExit(err), row_num)
            raise ErrException(Error_Return)
        
        # Create Template file for default VPC Domain's
        file_vpc_domain = './ACI/Access/vpc_domains.tf'
        wr_file = open(file_vpc_domain, 'w')

        # Copy the Inband Management Template to APIC Profile
        template_file = "vpc_domain_%s.template" % (templateVars['VPC_ID'])
        template = self.templateEnv.get_template(template_file)
        payload = template.render(templateVars)
        wr_file.write(payload + '\n\n')
        wr_file.close()

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
        template_file = "global_key.template"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload + '\n\n')

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
        wr_file.write(payload + '\n\n')

        # Locate template for method
        template_file = "backup_policy.template"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload + '\n\n')

    
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
        wr_file.write(payload + '\n\n')

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
        wr_file.write(payload + '\n\n')
    
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
        wr_file.write(payload + '\n\n')
    
    # Method must be called with the following kwargs.
    # Web_Timeout: Idle Timeout for the Web Interface
    def web_security(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'Passwd_Strength': '',
                         'Enforce_Intv': '',
                         'Passwd_Intv': '',
                         'Number_Allowed': '',
                         'Passwd_Store': '',
                         'Lockout': '',
                         'Failed_Attempts': '',
                         'Time_Period': '',
                         'Dur_Lockout': '',
                         'Token_Timeout': '',
                         'Maximum_Valid': '',
                         'Web_Timeout': ''}
        optional_args = { }

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        # Locate template for method
        template_file = "web_security.template"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload + '\n\n')
    
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
        wr_file.write(payload + '\n\n')
    
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
        wr_file.write(payload + '\n\n')

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
        wr_file.write(payload + '\n\n')
    
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
        wr_file.write(payload + '\n\n')
    
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
        wr_file.write(payload + '\n\n')
    
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
        wr_file.write(payload + '\n\n')
    
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
        if templateVars['Description'] == None:
            templateVars['Description'] = ''
        template_file = "snmp_comm.template"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload + '\n\n')
    
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
        wr_file.write(payload + '\n\n')
    
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
        wr_file.write(payload + '\n\n')
    
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
        wr_file.write(payload + '\n\n')
    
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
        wr_file.write(payload + '\n\n')
    
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
        wr_file.write(payload + '\n\n')
    
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

# Terraform ACI Provider - System Policies
# Class must be instantiated with Variables
class System_Policies(object):
    def __init__(self, ws):
        self.templateLoader = jinja2.FileSystemLoader(
            searchpath=(aci_template_path + 'System_Policies/'))
        self.templateEnv = jinja2.Environment(loader=self.templateLoader)

    # Method must be called with the following kwargs.
    # AS_Number: Autonomous System for BGP Process
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
        wr_file.write(payload + '\n\n')

    # Method must be called with the following kwargs.
    # Spine_Name: Name of the Spine
    # Node_ID: Node ID of the Spine
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
        wr_file.write(payload + '\n\n')

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
    if re.search('^9396', switch_type):
        modules = '2'
        port_count = '48'
    elif re.search('^93', switch_type):
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

def stdout_log(sheet, line):
    if log_level == 0:
        return
    elif ((log_level == (1) or log_level == (2)) and
            (sheet) and (line is None)):
        #print('*' * 80)
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Starting work on {sheet}')
        print(f'\n-----------------------------------------------------------------------------\n')
        #print('*' * 80)
    elif log_level == (2) and (sheet) and (line is not None):
        print('Evaluating line %s from %s...' % (line, sheet))
    else:
        return

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