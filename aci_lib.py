#!/usr/bin/env python3

import collections
import getpass
import ipaddress
import jinja2
import json
import openpyxl
import os, re, sys, traceback, validators
import phonenumbers
import pkg_resources
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
log_level = 2

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

switch_regex = re.compile('(intf_selector)')

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
            template_file = "add_pg_access.template"
        elif re.search('(port-channel|vpc)', templateVars['Policy_Type']):
            template_file = "add_pg_bundle.template"
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
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        # Check if there is a Directory for the APIC and if not Create it
        apic_dir = './ACI/%s' % (templateVars['Name'])
        if not os.path.isdir(apic_dir):
            apic_dir_mk = 'mkdir %s' % (templateVars['Name'])
            os.system(apic_dir_mk)

        # Copy main.tf to Working Directory
        src_dir = './ACI/templates'
        cp_main = 'cp %s/main.tf %s/variables.tf %s/.gitignore %s/' % (src_dir, src_dir, src_dir, apic_dir)
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
            validating.ipv4(row_num, Gateway)
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
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
        if Switch_Role == 'leaf':
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
        elif Switch_Role == 'spine':
            template_file = "spine_portselect.template"
            template = self.templateEnv.get_template(template_file)
            payload = template.render(templateVars)
            wr_file.write(payload + '\n\n')
        if not (templateVars['Policy_Group'] == '' or templateVars['Policy_Group'] == None):
            if Switch_Role == 'leaf':
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
            elif Switch_Role == 'spine':
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
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
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
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
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
            dv1 = DataValidation(type="list", formula1='"intf_selector"', allow_blank=True)
            dv2 = DataValidation(type="list", formula1='"access,breakout,bundle"', allow_blank=True)
            ws_sw.add_data_validation(dv1)
            ws_sw.add_data_validation(dv2)
            ws_header = '%s Interface Selectors' % (templateVars['Name'])
            data = [ws_header]
            ws_sw.append(data)
            ws_sw.merge_cells('A1:I1')
            for cell in ws_sw['1:1']:
                cell.style = 'Heading 1'
            data = ['','Notes: Breakout Policy Group Names are 2x100g_pg, 4x10g_pg, 4x25g_pg, 4x100g_pg, 8x50g_pg.']
            ws_sw.append(data)
            ws_sw.merge_cells('B2:I2')
            for cell in ws_sw['2:2']:
                cell.style = 'Heading 2'
            data = ['Type','Interface_Selector','Port','Policy_Group','PG_Type','Description','Switchport_Mode','Access_or_Native','Trunk_Allowed_VLANs']
            ws_sw.append(data)
            for cell in ws_sw['3:3']:
                cell.style = 'Heading 3'

            ws_sw_row_count = 4

            if templateVars['Switch_Role'] == 'leaf':
                for modx in range(1, 2):
                    for px in range(1, int(port_count) + 1):
                        templateVars['Module'] = modx
                        templateVars['Port'] = px
                        if px < 10:
                            templateVars['Port_Selector'] = 'Eth%s-0%s' % (modx, px)
                        elif px < 100:
                            templateVars['Port_Selector'] = 'Eth%s-%s' % (modx, px)
                        elif px > 99:
                            templateVars['Port_Selector'] = 'Eth%s_%s' % (modx, px)
                        modp = '%s/%s' % (templateVars['Module'],templateVars['Port'])
                        pselect = templateVars['Port_Selector']
                        # Copy the Port Selector to the Worksheet
                        data = ['intf_selector',pselect,modp,'','','','','','']
                        ws_sw.append(data)
                        rc = '%s:%s' % (ws_sw_row_count, ws_sw_row_count)
                        for cell in ws_sw[rc]:
                            if ws_sw_row_count % 2 == 0:
                                cell.style = 'ws_even'
                            else:
                                cell.style = 'ws_odd'
                        dv1_cell = 'A%s' % (ws_sw_row_count)
                        dv2_cell = 'E%s' % (ws_sw_row_count)
                        dv1.add(dv1_cell)
                        dv2.add(dv2_cell)
                        ws_sw_row_count += 1
                sw_type = str(templateVars['Switch_Type'])
                sw_name = str(templateVars['Name'])
                if re.search('9396', sw_type):
                    row_line_count = ws.max_row
                    while row_line_count > 0:
                        row_count = 1
                        for row in ws.rows:
                            if str(row[0].value) == sw_type and str(row[1].value) == sw_name:
                                mx = 2
                                module_type = row[mx + 1].value
                                if module_type == None:
                                    module_type = 'none'
                                if re.search('M(4|6|12)P', module_type):
                                    port_count = query_module_type(row_count, module_type)
                                    for px in range(1, int(port_count) + 1):
                                        templateVars['Module'] = mx
                                        templateVars['Port'] = px
                                        if px < 10:
                                            templateVars['Port_Selector'] = 'Eth%s-0%s' % (mx, px)
                                        elif px < 100:
                                            templateVars['Port_Selector'] = 'Eth%s-%s' % (mx, px)
                                        modp = '%s/%s' % (templateVars['Module'],templateVars['Port'])
                                        pselect = templateVars['Port_Selector']
                                        # Copy the Port Selector to the Worksheet
                                        data = ['intf_selector',pselect,modp,'','','','','','']
                                        ws_sw.append(data)
                                        rc = '%s:%s' % (ws_sw_row_count, ws_sw_row_count)
                                        for cell in ws_sw[rc]:
                                            if ws_sw_row_count % 2 == 0:
                                                cell.style = 'ws_even'
                                            else:
                                                cell.style = 'ws_odd'
                                        dv1_cell = 'A%s' % (ws_sw_row_count)
                                        dv2_cell = 'E%s' % (ws_sw_row_count)
                                        dv1.add(dv1_cell)
                                        dv2.add(dv2_cell)
                                        ws_sw_row_count += 1
                                break
                            row_line_count -= 1
                            row_count += 1
            elif templateVars['Switch_Role'] == 'spine':
                sw_type = str(templateVars['Switch_Type'])
                sw_name = str(templateVars['Name'])
                if re.search('95[0-1][4-8]', sw_type):
                    row_line_count = ws.max_row
                    while row_line_count > 0:
                        row_count = 1
                        for row in ws.rows:
                            if str(row[0].value) == sw_type and str(row[1].value) == sw_name:
                                for mx in range(1, int(modules) + 1):
                                    module_type = row[mx + 1].value
                                    if module_type == None:
                                        module_type = 'none'
                                    if re.search('X97', module_type):
                                        port_count = query_module_type(row_count, module_type)
                                        for px in range(1, int(port_count) + 1):
                                            templateVars['Module'] = mx
                                            templateVars['Port'] = px
                                            if px < 10:
                                                templateVars['Port_Selector'] = 'Eth%s-0%s' % (mx, px)
                                            elif px < 100:
                                                templateVars['Port_Selector'] = 'Eth%s-%s' % (mx, px)
                                            modp = '%s/%s' % (templateVars['Module'],templateVars['Port'])
                                            pselect = templateVars['Port_Selector']
                                            # Copy the Port Selector to the Worksheet
                                            data = ['intf_selector',pselect,modp,'','','','','','']
                                            ws_sw.append(data)
                                            rc = '%s:%s' % (ws_sw_row_count, ws_sw_row_count)
                                            for cell in ws_sw[rc]:
                                                if ws_sw_row_count % 2 == 0:
                                                    cell.style = 'ws_even'
                                                else:
                                                    cell.style = 'ws_odd'
                                            dv1_cell = 'A%s' % (ws_sw_row_count)
                                            dv2_cell = 'E%s' % (ws_sw_row_count)
                                            dv1.add(dv1_cell)
                                            dv2.add(dv2_cell)
                                            ws_sw_row_count += 1
                                break
                            row_line_count -= 1
                            row_count += 1
                elif re.search('^93', sw_type):
                    for modx in range(1, 2):
                        for px in range(1, int(port_count) + 1):
                            templateVars['Module'] = modx
                            templateVars['Port'] = px
                            if px < 10:
                                templateVars['Port_Selector'] = 'Eth%s-0%s' % (modx, px)
                            elif px < 100:
                                templateVars['Port_Selector'] = 'Eth%s-%s' % (modx, px)
                            elif px > 99:
                                templateVars['Port_Selector'] = 'Eth%s_%s' % (modx, px)
                            modp = '%s/%s' % (templateVars['Module'],templateVars['Port'])
                            pselect = templateVars['Port_Selector']
                            # Copy the Port Selector to the Worksheet
                            data = ['intf_selector',pselect,modp,'','','','','','']
                            ws_sw.append(data)
                            rc = '%s:%s' % (ws_sw_row_count, ws_sw_row_count)
                            for cell in ws_sw[rc]:
                                if ws_sw_row_count % 2 == 0:
                                    cell.style = 'ws_even'
                                else:
                                    cell.style = 'ws_odd'
                            dv1_cell = 'A%s' % (ws_sw_row_count)
                            dv2_cell = 'E%s' % (ws_sw_row_count)
                            dv1.add(dv1_cell)
                            dv2.add(dv2_cell)
                            ws_sw_row_count += 1
            # Save the Workbook
            wb.save
        else:
            ws_sw = wb[templateVars['Name']]

        # Check if there is a Directory for the Switch and if not Create it
        switch_dir = './ACI/%s' % (templateVars['Name'])
        if not os.path.isdir(switch_dir):
            switch_dir_mk = 'mkdir %s' % (switch_dir)
            os.system(switch_dir_mk)

        # Copy main.tf to Working Directory
        src_dir = './ACI/templates'
        cp_main = 'cp %s/main.tf %s/variables.tf %s/.gitignore %s/' % (src_dir, src_dir, src_dir, switch_dir)
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

        aci_lib_ref_sw = 'Access_Policies'
        rows_sw = ws_sw.max_row
        func_regex = switch_regex
        func_list_sw = findKeys(ws_sw, func_regex)
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
            vlan_dir_mk = 'mkdir %s' % (vlan_dir)
            os.system(vlan_dir_mk)

        # Copy main.tf to Working Directory
        src_dir = './ACI/templates'
        cp_main = 'cp %s/main.tf %s/variables.tf %s/.gitignore %s/' % (src_dir, src_dir, src_dir, vlan_dir)
        os.system(cp_main)

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
        if re.search(r'\d+', str(templateVars['VLAN_Grp1'])):
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
        if re.search(r'\d+', str(templateVars['VLAN_Grp2'])):
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
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        # Create Template file for default VPC Domain's
        file_vpc_domain = './ACI/Access/vpc_domain_%s.tf' % (templateVars['VPC_ID'])
        wr_file = open(file_vpc_domain, 'w')

        # Copy the Inband Management Template to APIC Profile
        template_file = "vpc_domain.template"
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
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
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
        elif templateVars['Auth_Type'] == 'ssh-key':
            templateVars['Auth_Type'] = 'useSshKeyContents'
        else:
            print(f'\n-----------------------------------------------------------------------------\n')
            print(f'   Error on ws {ws.title} Row {row_num}.  Authentication type should be ')
            print(f'   password or ssh-key.  Exiting....')
            print(f'\n-----------------------------------------------------------------------------\n')
            exit()

        # Assign Template and Apply Input
        template_file = "backup_host.template"
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
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
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
    # RADIUS_Server: IPv4 Address of RADIUS Server
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
                         'RADIUS_Server': '',
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
            validating.ipv4(row_num, templateVars['RADIUS_Server'])
            validating.auth_proto(row_num, templateVars['Authz_Proto'])  
            validating.secret(row_num, templateVars['Shared_Secret'])
            validating.timeout(row_num, templateVars['Timeout'])
            validating.retry(row_num, templateVars['Retry_Interval'])
            templateVars['Mgmt_Domain'] = validating.mgmt_domain(row_num, templateVars['Mgmt_Domain'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        templateVars['RADIUS_Server_'] = templateVars['RADIUS_Server'].replace('.', '_')
        
        # Locate template for method
        template_file = "radius.template"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload + '\n\n')
    
    # Method must be called with the following kwargs.
    # Login_Domain: Used to Create a Authentication Domain
    # TACACS_Server: IPv4 Address of TACACS Server
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
                         'TACACS_Server': '',
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
            validating.ipv4(row_num, templateVars['TACACS_Server'])
            validating.auth_proto(row_num, templateVars['Auth_Proto'])  
            validating.secret(row_num, templateVars['Shared_Secret'])
            validating.timeout(row_num, templateVars['Timeout'])
            validating.retry(row_num, templateVars['Retry_Interval'])
            templateVars['Mgmt_Domain'] = validating.mgmt_domain(row_num, templateVars['Mgmt_Domain'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        templateVars['TACACS_Server_'] = templateVars['TACACS_Server'].replace('.', '_')

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
    # Site_Group: Name of the Site Group
    # AS_Number: Autonomous System for BGP Process
    def bgp_as(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'AS_Number': ''}
        optional_args = {}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate BGP AS Number
            validating.bgp_as(row_num, templateVars['AS_Number'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)

        # Locate template for method
        template_file = "bgp_as.template"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload + '\n\n')

    # Method must be called with the following kwargs.
    # Site_Group: Name of the Site Group
    # Node_ID: Node ID of the Spine
    def bgp_rr(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'Node_ID': ''}
        optional_args = {}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Node ID
            validating.node_id(row_num, templateVars['Node_ID'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)

        # Locate template for method
        template_file = "bgp_rr.template"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload + '\n\n')

    # Method must be called with the following kwargs.
    # Site_Group: Name of the Site Group
    # DNS_IPv4: IPv4 Address of DNS Server
    # Preferred: IPv4 Address of DNS Server
    def dns(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'DNS_Server': '',
                         'Preferred': ''}
        optional_args = {}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate DNS IPv4 Address
            validating.ipv4(row_num, templateVars['DNS_Server'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        templateVars['DNS_Server_'] = templateVars['DNS_Server'].replace('.', '_')

        # Locate template for method
        template_file = "dns.template"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload + '\n\n')
    
    # Method must be called with the following kwargs.
    # Site_Group: Name of the Site Group
    # Mgmt_Domain: Which Management Domain to use: inb or oob
    def dns_mgmt(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'Mgmt_Domain': ''}
        optional_args = {}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Management Domain
            templateVars['Mgmt_Domain'] = validating.mgmt_domain(row_num, templateVars['Mgmt_Domain'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)

        # Locate template for method
        template_file = "dns_mgmt.template"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload + '\n\n')

    # Method must be called with the following kwargs.
    # Site_Group: Name of the Site Group
    # Domain: Domain to add as a Search domain or Default Domain
    # Default_Domain: Is the Domain the Default Domain.  Only one Domain can be default.
    def domain(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'Domain': '',
                         'Default_Domain': ''}
        optional_args = {}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Domain
            validating.domain(row_num, templateVars['Domain'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        templateVars['Domain_'] = templateVars['Domain'].replace('.', '_')

        # Locate template for method
        template_file = "domain.template"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload + '\n\n')
    
    # Method must be called with the following kwargs.
    # Site_Group: Name of the Site Group
    # NTP_Server: IPv4 Address of NTP Server
    # Preferred: Is the preferred NTP server or not.  Only one NTP Server can be Preferred.
    # Mgmt_Domain: Which Mgmt Network to use: inb or oob.
    def ntp(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'NTP_Server': '',
                         'Preferred': '',
                         'Mgmt_Domain': ''}
        optional_args = {}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate DNS IPv4 Address
            validating.ipv4(row_num, templateVars['NTP_Server'])
            templateVars['Mgmt_Domain'] = validating.mgmt_domain(row_num, templateVars['Mgmt_Domain'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        templateVars['NTP_Server_'] = templateVars['NTP_Server'].replace('.', '_')

        # Locate template for method
        template_file = "ntp.template"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload + '\n\n')
    
    # Method must be called with the following kwargs.
    # Site_Group: Name of the Site Group
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
        required_args = {'Site_Group': '',
                         'SMTP_Port': '',
                         'SMTP_Relay': '',
                         'Mgmt_Domain': '',
                         'From_Email': '',
                         'Reply_Email': '',
                         'To_Email': ''}
        optional_args = {'Phone_Number': '',
                         'Contact_Info': ''}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate All the Email Addresses, Phone Number, and Management Domain
            validating.email(row_num, templateVars['From_Email'])
            validating.email(row_num, templateVars['Reply_Email'])
            validating.email(row_num, templateVars['To_Email'])
            if not templateVars['Phone_Number'] == None:
                validating.phone(row_num, templateVars['Phone_Number'])
            templateVars['Mgmt_Domain'] = validating.mgmt_domain(row_num, templateVars['Mgmt_Domain'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        # Locate template for method
        template_file = "smartcallhome.template"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload + '\n\n')
    
    # Method must be called with the following kwargs.
    # Site_Group: Name of the Site Group
    # SNMP_Client_Name: A Name for the SNMP Client
    # SNMP_Client_IPv4: IPv4 Address of the SNMP Client
    # Mgmt_Domain: Which Mgmt Network to use: inb or oob.
    def snmp_client(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'SNMP_Client_Name': '',
                         'SNMP_Client': '',
                         'Mgmt_Domain': ''}
        optional_args = { }

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate SNMP IPv4 Client Address and Management Domain
            validating.ipv4(row_num, templateVars['SNMP_Client'])
            templateVars['Mgmt_Domain'] = validating.snmp_mgmt(row_num, templateVars['Mgmt_Domain'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        templateVars['SNMP_Client_'] = templateVars['SNMP_Client'].replace('.', '_')

        # Locate template for method
        template_file = "snmp_client.template"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload + '\n\n')
    
    # Method must be called with the following kwargs.
    # Site_Group: Name of the Site Group
    # SNMP_Community: SNMP Community String
    # Description: Description is Optional
    def snmp_comm(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'SNMP_Community': ''}
        optional_args = {'Description': ''}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate SNMP Community
            validating.snmp_string(row_num, templateVars['SNMP_Community'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
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
    # Site_Group: Name of the Site Group
    # SNMP_Contact: SNMP Contact
    # SNMP_Location: SNMP Location of the APIC's.  Use Geolocation for Leaf and spine's
    def snmp_info(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'SNMP_Contact': '',
                         'SNMP_Location': ''}
        optional_args = { }

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate SNMP Information STrings
            validating.snmp_info(row_num, templateVars['SNMP_Contact'], templateVars['SNMP_Location'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        # Locate template for method
        template_file = "snmp_info.template"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload + '\n\n')
    
    # Method must be called with the following kwargs.
    # Site_Group: Name of the Site Group
    # Trap_Server_IPv4: IPv4 of the SNMP Trap Server
    # Destination_Port: UDP Port for the SNMP Trap Server.  162 is Default
    # Version: v1, v2c, or v3
    # Community_or_Username: Community for v1 or v2c, and user for v3
    # Security_Level: must be auth, noauth, or priv.  auth and priv is only for v3
    # Mgmt_Domain: Which Mgmt Network to use: inb or oob.
    def snmp_trap(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'Trap_Server': '',
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
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
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
    # Site_Group: Name of the Site Group
    # SNMP_User: Username
    # Privacy_Type: Privacy Key Type.
    # Privacy_Key: Privacy Key... Optional if Privacy Type is none
    # Authorization_Type: Authorization Type
    # Authorization_Key: Authorization Key
    def snmp_user(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'SNMP_User': '',
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
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        # Modify User Input of templateVars['Privacy_Type'] or templateVars['Authorization_Type'] to send to APIC
        if templateVars['Privacy_Type'] == 'none':
            templateVars['Privacy_Type'] = None
        if templateVars['Authorization_Type'] == 'md5':
            templateVars['Authorization_Type'] = None
        if templateVars['Authorization_Type'] == 'sha1':
            templateVars['Authorization_Type'] = 'hmac-sha1-96'
    
        # Read Template File
        template_file = "snmp_user.template"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload + '\n\n')
    
    # Method must be called with the following kwargs.
    # Site_Group: Name of the Site Group
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
        required_args = {'Dest_Grp_Name': '',
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
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
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
    # Site_Group: Name of the Site Group
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
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        templateVars['Syslog_Server_IPv4_'] = templateVars['Syslog_Server_IPv4'].replace('.', '_')

        # Locate template for method
        template_file = "syslog_rmt.template"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload + '\n\n')
    
# Terraform ACI Provider - Tenants Policies
# Class must be instantiated with Variables
class Tenant_Policies(object):
    def __init__(self, ws):
        self.templateLoader = jinja2.FileSystemLoader(
            searchpath=(aci_template_path + 'Tenant_Policies/'))
        self.templateEnv = jinja2.Environment(loader=self.templateLoader)

    # Method must be called with the following kwargs.
    # Site_Group: Name of the Site Group
    # Tenant: Name of the Tenant
	# App_Profile: Name of the Application Profile
	# App_Policy: Name of the Application Profile Policy defined on the Network Policies Tab.
	# Policy_Name: Name of the Application Profile Policy.
	# prio: QoS Class.  See Documentation for more Information
	# monEPGPol: Monitoring Policy.  See Documentation for more Info.
	# MSO_Policy:  MSO Policy in the MSO Policy Tab.  Only required if Controller is MSO
	# annotation: Tags to assign to Application Profile
	# name_alias: Global Alias for Application Profile, since Application Profile Name cannot Change
    def add_app(self, wb, ws, row_num, wr_file, **kwargs):
        # Open the Network Policies Worksheet
        ws_net = wb['Network Policies']
        rowcount = ws_net.max_row

        # Dicts for Application Profile; required and optional args
        required_args = {'Controller': '',
                        'Tenant': '',
                        'App_Profile': '',
                        'App_Policy': '',
                        'Policy_Name': '',
                        'prio': '',
                        'monEPGPol': ''}
        optional_args = {'MSO_Policy': '',
                        'annotation': '',
                        'name_alias': ''}

        # Get the Application Profile Policies from the Network Policies Tab
        func = 'app'
        count = countKeys(ws_net, func)
        row_count = ''
        var_dict = findVars(ws_net, func, rowcount, count)
        for pos in var_dict:
            if var_dict[pos].get('Policy_Name') == kwargs.get('App_Policy'):
                row_count = var_dict[pos]['row']
                del var_dict[pos]['row']
                kwargs = {**kwargs, **var_dict[pos]}
                break

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Required Arguments
            validating.name_rule(row_num, templateVars['App_Profile'])
            validating.qos_priority(row_count, ws_net, 'prio', templateVars['prio'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        if templateVars['monEPGPol'] == 'default':
            templateVars['monEPGPol'] = 'uni/tn-common/monepg-default'

        # Locate template for method
        if templateVars['Controller'] == 'APIC':
            template_file = "aci_app.template"
        elif templateVars['Controller'] == 'MSO':
            template_file = "mso_app.template"
        template = self.templateEnv.get_template(template_file)
        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload + '\n\n')

	# Controller: Must be ACI or MSO to tell the script which controller to run against
	# Tenant: Name of the Tenant
	# Bridge_Domain: Bridge Domain Name
	# BD_Policy: Bridge Domain Network Policy
	# VRF: Name of the VRF
	# bd_type: regular or fc
	# host_routing: Advertise Host Routes.  no by default
	# ep_clear: Represents the parameter used by the node (i.e. Leaf) to clear all EPs in all leaves for this BD. Allowed values are "yes" and "no". Default is "no".
	# ep_move: Endpoint Move Detection.  Always Enable GARP
	# unk_mac: Unkown MAC Forwarding.  For ACI only BD's set to proxy.  For VLAN's that extend outside ACI set to flood
	# unk_mcast: Unkown Multicast Forwarding.  Typically this is going to be flood.
	# v6unk_mcast:  Unkown IPv6 Multicast Forwarding.  Typically this is going to be flood.
	# multi_dst: Multi-Destination Flooding.  Typically this should be bd-flood
	# mcast_allow: Multicast Allow.  Default is no
	# ipv6_mcast: ipv6 multicast.  Typically this is no
	# arp_flood: ARP flooding.  For ACI only BD's set to no.  For VLAN's that extend outside ACI set to yes.
	# limit_learn: Limit IP Learning to BD Subnets.  Recommended to set to this to yes.
	# fvEpRetPol: Endpoint Retention Policy.  See Documentation for more Info.
	# unicast_route: Disable until you configure Subnets.
	# intersight_l2: Stretch BD to Multiple sites.  no by default
	# intersight_bum: When stretched should broadcast and multicast (BUM) be forwarded
	# optimize_wan: To optimize WAN traffic.  default is no.
	# monEPGPol: Monitoring Policy.  See Documentation for more Info.
	# ip_learning: IP Data Plane Learning.  See Documentation for more Info.
	# MSO_Policy:  MSO Policy in the MSO Policy Tab.  Only required if Controller is MSO
	# BD_Description: Description for the BD.
	# annotation: Tags to assign to BD
	# name_alias: Global Alias for BD, since BD Name cannot Change
	# dhcpRelayP: DHCP Relay Policy.  See Documentation for more Info.
	# igmpIfPol: IGMP Interface Policy.  See Documentation for more Info.
	# igmpSnoopPol: IGMP Snooping Policy.  See Documentation for more Info.
	# mldSnoopPol: MLD Snooping Policy.  See Documentation for more Info.
	# mac: Allow you to assign a custom MAC to the BD.
	# l3extOut: Endpoint Retention Policy.  See Documentation for more Info.
	# rtctrlProfile: Endpoint Retention Policy.  See Documentation for more Info.
	# ndIfPol: Endpoint Retention Policy.  See Documentation for more Info.
	# ll_addr:  Assign a specific IPv6 Link Local Address.
	# fhsBDPol: First Hop Security Policy.  See Documentation for more Info.
	# netflowMonitorPol: Netflow Monitoring Policy.  See Documentation for more Info.
    def add_bd(self, wb, ws, row_num, wr_file, **kwargs):
        # Open the Network Policies Worksheet
        ws_net = wb['Network Policies']
        rowcount = ws_net.max_row

        # Dicts for Bridge Domain required and optional args
        required_args = {'Controller': '',
                        'Tenant': '',
                        'Bridge_Domain': '',
                        'BD_Policy': '',
                        'VRF': '',
                        'Policy_Name': '',
                        'bd_type': '',
                        'host_routing': '',
                        'ep_clear': '',
                        'ep_move': '',
                        'unk_mac': '',
                        'unk_mcast': '',
                        'v6unk_mcast': '',
                        'multi_dst': '',
                        'mcast_allow': '',
                        'ipv6_mcast': '',
                        'arp_flood': '',
                        'limit_learn': '',
                        'fvEpRetPol': '',
                        'unicast_route': '',
                        'intersight_l2': '',
                        'intersight_bum': '',
                        'optimize_wan': '',
                        'monEPGPol': '',
                        'ip_learning': ''}
        optional_args = {'MSO_Policy': '',
                        'BD_Description': '',
                        'annotation': '',
                        'name_alias': '',
                        'dhcpRelayP': '',
                        'igmpIfPol': '',
                        'igmpSnoopPol': '',
                        'mldSnoopPol': '',
                        'mac': '',
                        'l3extOut': '',
                        'rtctrlProfile': '',
                        'ndIfPol': '',
                        'll_addr': '',
                        'fhsBDPol': '',
                        'netflowMonitorPol': ''}

        # Get the BD Policies from the Network Policies Tab
        func = 'bd'
        count = countKeys(ws_net, func)
        var_dict = findVars(ws_net, func, rowcount, count)
        for pos in var_dict:
            if var_dict[pos].get('Policy_Name') == kwargs.get('BD_Policy'):
                row_count = var_dict[pos]['row']
                del var_dict[pos]['row']
                kwargs = {**kwargs, **var_dict[pos]}
                break

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Required Arguments
            validating.name_rule(row_num, templateVars['Bridge_Domain'])
            validating.name_rule(row_num, templateVars['Tenant'])
            validating.name_rule(row_num, templateVars['VRF'])
            validating.bd_type(row_count, ws_net, 'bd_type', templateVars['bd_type'])
            validating.controller(row_count, ws_net, 'Controller', templateVars['Controller'])
            validating.flood(row_count, ws_net, 'unk_mcast', templateVars['unk_mcast'])
            validating.flood(row_count, ws_net, 'v6unk_mcast', templateVars['v6unk_mcast'])
            validating.flood_bd(row_count, ws_net, 'multi_dst', templateVars['multi_dst'])
            validating.garp(row_count, ws_net, 'ep_move', templateVars['ep_move'])
            validating.noyes(row_count, ws_net, 'ep_clear', templateVars['ep_clear'])
            validating.noyes(row_count, ws_net, 'host_routing', templateVars['host_routing'])
            validating.noyes(row_count, ws_net, 'mcast_allow', templateVars['mcast_allow'])
            validating.noyes(row_count, ws_net, 'ipv6_mcast', templateVars['ipv6_mcast'])
            validating.noyes(row_count, ws_net, 'arp_flood', templateVars['arp_flood'])
            validating.noyes(row_count, ws_net, 'limit_learn', templateVars['limit_learn'])
            validating.noyes(row_count, ws_net, 'unicast_route', templateVars['unicast_route'])
            validating.noyes(row_count, ws_net, 'limit_learn', templateVars['limit_learn'])
            validating.noyes(row_count, ws_net, 'intersight_l2', templateVars['intersight_l2'])
            validating.noyes(row_count, ws_net, 'intersight_bum', templateVars['intersight_bum'])
            validating.noyes(row_count, ws_net, 'optimize_wan', templateVars['optimize_wan'])
            validating.noyes(row_count, ws_net, 'ip_learning', templateVars['ip_learning'])
            validating.proxy(row_count, ws_net, 'unk_mac', templateVars['unk_mac'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        if templateVars['dhcpRelayP'] == 'default':
            templateVars['dhcpRelayP'] = 'uni/tn-common/relayp-default'
        if templateVars['fhsBDPol'] == 'default':
            templateVars['fhsBDPol'] = 'uni/tn-common/bdpol-default'
        if templateVars['fvEpRetPol'] == 'default':
            templateVars['fvEpRetPol'] = 'uni/tn-common/epRPol-default'
        if templateVars['igmpIfPol'] == 'default':
            templateVars['igmpIfPol'] = 'uni/tn-common/igmpIfPol-default'
        if templateVars['igmpSnoopPol'] == 'default':
            templateVars['igmpSnoopPol'] = 'uni/tn-common/snPol-default'
        if templateVars['mldSnoopPol'] == 'default':
            templateVars['mldSnoopPol'] = 'uni/tn-common/mldsnoopPol-default'
        if templateVars['monEPGPol'] == 'default':
            templateVars['monEPGPol'] = 'uni/tn-common/monepg-default'
        if templateVars['ndIfPol'] == 'default':
            templateVars['ndIfPol'] = 'uni/tn-common/ndifpol-default'
        if templateVars['netflowMonitorPol'] == 'default':
            templateVars['netflowMonitorPol'] = 'uni/tn-common/monitorpol-default'

        # Locate template for method
        if templateVars['Controller'] == 'APIC':
            template_file = "aci_bd.template"
        elif templateVars['Controller'] == 'MSO':
            template_file = "mso_bd.template"
        template = self.templateEnv.get_template(template_file)
        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload + '\n\n')

    # Controller: Must be ACI or MSO to tell the script which controller to run against
    # Tenant: Name of the Tenant
	# Bridge_Domain: Bridge Domain Name
	# App_Profile: Name of the Application Profile
	# EPG: EPG Name
	# EPG_Policy: Name of the EPG Policy defined on the Network Policies Tab.
	# Policy_Name: Name of the EPG Profile Policy.
	# is_attr_based: Is this a micro-segment EPG
	# prio: QoS Class.  See Documentation for more Information
	# pc_enf_pref: Turn on Intra-EPG Isolation.  See Documentation for more Information.
	# fwd_ctrl: When doing Intra-EPG Isolation turn on proxy-arp
	# pref_gr_memb: include will add the EPG as a Preferred Group Member.  Default is exclude
	# flood: Turn on flood in encapsulation.  Default is disabled.  See Documentation for more Information.
	# match_t:  What behavior to apply when assigning contracts.  See Documentation for more Information.
	# monEPGPol: Monitoring Policy.  See Documentation for more Info.
	# shutdown: Use this option to disable the EPG without deleting.
	# has_mcast: Should this EPG behave as a Multicast Source
	# MSO_Policy: MSO Policy in the MSO Policy Tab.  Only required if Controller is MSO
	# EPG_Description: Description for the EPG
	# annotation: Tags to assign to Application Profile
	# name_alias: Global Alias for Application Profile, since Application Profile Name cannot Change
	# Physical_Domains:  Assign one or more physical domains to the EPG for static path binding
	# VMM_Domains:  Assign one or more virtual domains to the EPG for dynamic path binding
	# cons_vzBrCP:  Assign consumer Contracts.  See Documentation for more Information.
	# prov_vzBrCP: Assign Provider Contracts.  See Documentation for more Information.
	# Master_fvEPg:  Assign a Contract Master.  See Documentation for more Information.
	# vzCPIf:  Assign an Interface Contract.  See Documentation for more Information.
	# vzCtrctEPgCont:  Provider default Contract.  See Documentation for more Information.
	# vzTaboo:  Assign a Taboo Contract.  See Documentation for more Information.
	# exception_tag:  Assign an exception tag.  See Documentation for more Information.
	# qosCustomPol:  Assign a custom QoS DSCP marking policy.  See Documentation for more Information.
	# qosDppPol:  Assign a Data-plane policing policy.  See Documentation for more Information.
	# intra_vzBrCP:  Assign a Contract for intra-EPG isolation.  See Documentation for more Information.
	# fhsTrustCtrlPol:  Assign a First Hop Security Trust Control Policy.  See Documentation for more Information.
	# fabricNode: ?
	# fabricPathEp: ?
	# vzGraphCont: ?
    def add_epg(self, wb, ws, row_num, wr_file, **kwargs):
        # Open the Network Policies Worksheet
        ws_net = wb['Network Policies']
        rowcount = ws_net.max_row

        # Dicts for Bridge Domain required and optional args
        required_args = {'Controller': '',
                        'Tenant': '',
                        'Bridge_Domain': '',
                        'App_Profile': '',
                        'EPG': '',
                        'EPG_Policy': '',
                        'Policy_Name': '',
                        'is_attr_based': '',
                        'prio': '',
                        'pc_enf_pref': '',
                        'fwd_ctrl': '',
                        'pref_gr_memb': '',
                        'flood': '',
                        'match_t': '',
                        'monEPGPol': '',
                        'shutdown': '',
                        'has_mcast': ''}
        optional_args = {'MSO_Policy': '',
                        'EPG_Description': '',
                        'annotation': '',
                        'name_alias': '',
                        'Physical_Domains': '',
                        'VMM_Domains': '',
                        'cons_vzBrCP': '',
                        'prov_vzBrCP': '',
                        'Master_fvEPg': '',
                        'vzCPIf': '',
                        'vzCtrctEPgCont': '',
                        'vzTaboo': '',
                        'exception_tag': '',
                        'qosCustomPol': '',
                        'qosDppPol': '',
                        'intra_vzBrCP': '',
                        'fhsTrustCtrlPol': '',
                        'fabricNode': '',
                        'fabricPathEp': '',
                        'vzGraphCont': ''}

        # Get the EPG Policies from the Network Policies Tab
        func = 'epg'
        count = countKeys(ws_net, func)
        row_count = ''
        var_dict = findVars(ws_net, func, rowcount, count)
        for pos in var_dict:
            if var_dict[pos].get('Policy_Name') == kwargs.get('EPG_Policy'):
                row_count = var_dict[pos]['row']
                del var_dict[pos]['row']
                kwargs = {**kwargs, **var_dict[pos]}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Required Arguments
            validating.name_rule(row_num, templateVars['Bridge_Domain'])
            validating.name_rule(row_num, templateVars['Tenant'])
            validating.controller(row_count, ws_net, 'Controller', templateVars['Controller'])
            validating.enabled(row_count, ws_net, 'pc_enf_pref', templateVars['pc_enf_pref'])
            validating.enabled(row_count, ws_net, 'flood', templateVars['flood'])
            validating.include(row_count, ws_net, 'pref_gr_memb', templateVars['pref_gr_memb'])
            validating.match_t(row_count, ws_net, 'match_t', templateVars['match_t'])
            validating.noyes(row_count, ws_net, 'is_attr_based', templateVars['is_attr_based'])
            validating.noyes(row_count, ws_net, 'shutdown', templateVars['shutdown'])
            validating.proxy_arp(row_count, ws_net, 'fwd_ctrl', templateVars['fwd_ctrl'])
            validating.qos_priority(row_count, ws_net, 'prio', templateVars['prio'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        # Left off Here:
        if templateVars['cons_vzBrCP'] == 'default':
            templateVars['cons_vzBrCP'] = 'uni/tn-common/brc-default'
        if templateVars['prov_vzBrCP'] == 'default':
            templateVars['prov_vzBrCP'] = 'uni/tn-common/brc-default'
        if templateVars['fvEpRetPol'] == 'default':
            templateVars['fvEpRetPol'] = 'uni/tn-common/epRPol-default'
        if templateVars['igmpIfPol'] == 'default':
            templateVars['igmpIfPol'] = 'uni/tn-common/igmpIfPol-default'
        if templateVars['igmpSnoopPol'] == 'default':
            templateVars['igmpSnoopPol'] = 'uni/tn-common/snPol-default'
        if templateVars['mldSnoopPol'] == 'default':
            templateVars['mldSnoopPol'] = 'uni/tn-common/mldsnoopPol-default'
        if templateVars['monEPGPol'] == 'default':
            templateVars['monEPGPol'] = 'uni/tn-common/monepg-default'
        if templateVars['ndIfPol'] == 'default':
            templateVars['ndIfPol'] = 'uni/tn-common/ndifpol-default'
        if templateVars['netflowMonitorPol'] == 'default':
            templateVars['netflowMonitorPol'] = 'uni/tn-common/monitorpol-default'

        # Locate template for method
        if templateVars['Controller'] == 'APIC':
            template_file = "aci_bd.template"
        elif templateVars['Controller'] == 'MSO':
            template_file = "mso_bd.template"
        template = self.templateEnv.get_template(template_file)
        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload + '\n\n')

    def add_net(self, wb, ws, row_num, wr_file, **kwargs):
        # Assignt he kwargs to a initial var for each process
        initial_kwargs = kwargs

        # Initialize the Class
        aci_lib_ref = 'Tenant_Policies'
        class_init = '%s(ws)' % (aci_lib_ref)

        # Confirm if the Tenant Directory Exists
        dest_dir = './ACI/Tenants_%s' % (kwargs.get('Tenant'))
        if not os.path.isdir(dest_dir):
            create_dir = 'mkdir %s' % (dest_dir)
            os.system(create_dir)
        
        # Check if the Main File is Already in the Directory; If Not Create
        main_file = '.ACI/Tenants_%s/main.tf' % (kwargs.get('Tenant'))
        if not os.path.isfile(main_file):
            src_dir = './ACI/templates'
            cp_main = 'cp %s/main.tf %s/variables.tf %s/.gitignore %s/' % (src_dir, src_dir, src_dir, dest_dir)
            os.system(cp_main)

        # Assign the Filename for the Bridge Domain
        file_BD = './ACI/Tenants_%s/bd_%s.tf' % (kwargs.get('Tenant'), kwargs.get('Bridge_Domain'))

        # Check if Bridge Domain Currently Exists
        if os.path.isfile(file_BD):
            afile = open(file_BD, 'a+')
            rsc_bd = 'resource "aci_bridge_domain" "%s_%s"' % (kwargs.get('Tenant'), kwargs.get('Bridge_Domain'))
            afile.seek(0)
            if not rsc_bd in afile.read():
                wr_file = open(file_BD, 'w+')
                eval("%s.%s(wb, ws, row_num, wr_file, **kwargs)" % (class_init, 'add_bd'))
                wr_file.close()
        else:
            wr_file = open(file_BD, 'w')
            bdz = '/*\n This File will include Policies Related to Tenant "%s" BD "%s"\n*/\n\n' % (kwargs.get('Tenant'), kwargs.get('Bridge_Domain'))
            wr_file.write(bdz)
            eval("%s.%s(wb, ws, row_num, wr_file, **kwargs)" % (class_init, 'add_bd'))
            wr_file.close()
            
        # Reset kwargs back to initial kwargs
        kwargs = initial_kwargs

        # Add Subnet if there is one
        if not kwargs.get('Subnets') == None:
            # Check if Bridge Domain Currently Exists
            if os.path.isfile(file_BD):
                afile = open(file_BD, 'a+')
                rsc_subnet = 'resource "aci_subnet" "%s"' % (kwargs.get('Subnets'))
                afile.seek(0)
                if not rsc_subnet in afile.read():
                    wr_file = open(file_BD, 'w+')
                    eval("%s.%s(wb, ws, row_num, wr_file, **kwargs)" % (class_init, 'add_subnet'))
                    wr_file.close()

        # Reset kwargs back to initial kwargs
        kwargs = initial_kwargs

        # Assign the Filename for the Application Profile
        file_App = './ACI/Tenants_%s/app_%s.tf' % (kwargs.get('Tenant'), kwargs.get('App_Profile'))

        # Check if Application Profile Currently Exists
        if os.path.isfile(file_App):
            afile = open(file_App, 'a+')
            rsc_app = 'resource "aci_application_profile" "%s_%s"' % (kwargs.get('Tenant'), kwargs.get('App_Profile'))
            afile.seek(0)
            if not rsc_app in afile.read():
                wr_file = open(file_App, 'w+')
                eval("%s.%s(wb, ws, row_num, wr_file, **kwargs)" % (class_init, 'add_app'))
                wr_file.close()
        else:
            wr_file = open(file_App, 'w')
            appz = '/*\n This File will include Policies Related to Tenant "%s" App Profile "%s"\n*/\n\n' % (kwargs.get('Tenant'), kwargs.get('App_Profile'))
            wr_file.write(appz)
            eval("%s.%s(wb, ws, row_num, wr_file, **kwargs)" % (class_init, 'add_app'))
            wr_file.close()

        # Reset kwargs back to initial kwargs
        kwargs = initial_kwargs

        # Assign the Filename for the Application Profile
        file_App = './ACI/Tenants_%s/app_%s.tf' % (kwargs.get('Tenant'), kwargs.get('App_Profile'))

        # Check if Endpoint Group (EPG) Currently Exists
        # if os.path.isfile(file_App):
        #     afile = open(file_App, 'a+')
        #     rsc_epg = 'resource "aci_application_epg" "%s_%s"' % (kwargs.get('App_Profile'), kwargs.get('EPG'))
        #     afile.seek(0)
        #     if not rsc_epg in afile.read():
        #         wr_file = open(file_App, 'w+')
        #         eval("%s.%s(wb, ws, row_num, wr_file, **kwargs)" % (class_init, 'add_epg'))
        #         wr_file.close()

    # Method must be called with the following kwargs.
    # Controller: Must be ACI or MSO to tell the script which controller to run against
    # Tenant: Name of the Tenant
	# Bridge_Domain: Bridge Domain Name
	# Subnets: IP/Prefix of the Gateway
	# Subnet_Policy: Name of the Subnet Policy defined on the Network Policies Tab.
	# L3Out: Name of the L3Out
	# nd: Enable ND RA Prefix.  Default is yes
	# no-default-gateway: disable the default SVI Gateway.  Default is no
	# querier: Should this Subnet be used as an IGMP querier.  Default is no
	# preferred: Make this IP address primary.  Default is no
	# scope: Whether the Subnet should be private, advertised, and/or shared between VRF's
	# virtual: Treat as virtual IP address.  Default is no
	# MSO_Policy:  MSO Policy in the MSO Policy Tab.  Only required if Controller is MSO
	# Subnet_Description: Description for Subnet
	# annotation: Tags to assign to Subnet
	# name_alias: Global Alias for Subnet, since Subnet Name cannot Change
	# rtctrlProfile: Endpoint Retention Policy.  See Documentation for more Info.
	# ndIfPol: Neighbor Discovery Interface Policy
	# ndPfxPol: Neibhbor Discovery Prefix Policy
    def add_subnet(self, wb, ws, row_num, wr_file, **kwargs):
        # Open the Network Policies Worksheet
        ws_net = wb['Network Policies']
        rowcount = ws_net.max_row

        # Dicts for Subnet required and optional args
        required_args = {'Controller': '',
                        'Tenant': '',
                        'Bridge_Domain': '',
                        'Subnets': '',
                        'Subnet_Policy': '',
                        'L3Out': '',
                        'Policy_Name': '',
                        'nd': '',
                        'no-default-gateway': '',
                        'querier': '',
                        'preferred': '',
                        'scope': '',
                        'virtual': ''}
        optional_args = {'MSO_Policy': '',
                        'Subnet_Description': '',
                        'annotation': '',
                        'name_alias': '',
                        'rtctrlProfile': '',
                        'ndIfPol': '',
                        'ndPfxPol': ''}

        # Get the Subnet Policies from the Network Policies Tab
        func = 'subnet'
        count = countKeys(ws_net, func)
        row_count = ''
        var_dict = findVars(ws_net, func, rowcount, count)
        for pos in var_dict:
            if var_dict[pos].get('Policy_Name') == kwargs.get('Subnet_Policy'):
                row_count = var_dict[pos]['row']
                del var_dict[pos]['row']
                kwargs = {**kwargs, **var_dict[pos]}
                break

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Required Arguments
            validating.ip_address(row_num, ws, 'Subnets', templateVars['Subnets'])
            validating.name_rule(row_num, templateVars['L3Out'])
            validating.noyes(row_count, ws_net, 'nd', templateVars['nd'])
            validating.noyes(row_count, ws_net, 'no-default-gateway', templateVars['no-default-gateway'])
            validating.noyes(row_count, ws_net, 'querier', templateVars['querier'])
            validating.noyes(row_count, ws_net, 'preferred', templateVars['preferred'])
            validating.noyes(row_count, ws_net, 'virtual', templateVars['virtual'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        if templateVars['ndIfPol'] == 'default':
            templateVars['ndIfPol'] = 'uni/tn-common/ndifpol-default'
        if templateVars['ndPfxPol'] == 'default':
            templateVars['ndPfxPol'] = 'uni/tn-common/ndpfxpol-default'

        # Create ctrl templateVars
        templateVars['ctrl'] = ''
        if templateVars['nd'] == 'yes':
            templateVars['ctrl'].append('"%s"') % (templateVars['nd'])
        if templateVars['no-default-gateway'] == 'yes':
            templateVars['ctrl'].append('"%s"') % (templateVars['no-default-gateway'])
        if templateVars['querier'] == 'yes':
            templateVars['ctrl'].append('"%s"') % (templateVars['querier'])
        if templateVars['ctrl'] == '':
            templateVars['ctrl'] = '"unspecified"'

        # Modify scope templateVars
        if re.search('^(private|public|shared)$', templateVars['scope']):
            templateVars['scope'] = '"%s"' % (templateVars['scope'])
        elif re.search('^(private|public)\\-shared$', templateVars['scope']):
            x = templateVars['scope'].split('-')
            templateVars['scope'] = '"%s", "%s"' & (x[0], x[1])

        # Locate template for method
        if templateVars['Controller'] == 'APIC':
            template_file = "aci_subnet.template"
        elif templateVars['Controller'] == 'MSO':
            template_file = "mso_subnet.template"
        template = self.templateEnv.get_template(template_file)
        # Render template w/ values from dicts
        payload = template.render(templateVars)
        wr_file.write(payload + '\n\n')

    # Method must be called with the following kwargs.
    # Tenant: Name of the Tenant
    # Description: Optional
    def add_tenant(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'Controller': '',
                         'Tenant': ''}
        optional_args = {'MSO_Policy': '',
                         'Description': ''}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate the Tenant Name
            validating.name_rule(row_num, templateVars['Tenant'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)

        # Check if there is a Directory for the Switch and if not Create it
        tenant_dir = './ACI/Tenants_%s' % (templateVars['Tenant'])
        if not os.path.isdir(tenant_dir):
            tenant_dir_mk = 'mkdir %s' % (tenant_dir)
            os.system(tenant_dir_mk)

        # Copy main.tf to Working Directory
        src_dir = './ACI/templates'
        cp_main = 'cp %s/main.tf %s/variables.tf %s/.gitignore %s/' % (src_dir, src_dir, src_dir, tenant_dir)
        os.system(cp_main)

        # Create Tenant File
        dest_dir = './ACI/Tenants_%s' % (templateVars['Tenant'])
        if not os.path.isdir(dest_dir):
            create_dir = 'mkdir %s' % (dest_dir)
            os.system(create_dir)
        file_Tenant = './ACI/Tenants_%s/%s.tf' % (templateVars['Tenant'], templateVars['Tenant'])
        tenant_file = open(file_Tenant, 'w')
        tenant_file.write('/*\n This File will include Policies Related to Tenant "%s"\n*/\n\n' % (templateVars['Tenant']))

        # Locate template for method
        if templateVars['Controller'] == 'APIC':
            template_file = "aci_tenant.template"
        elif templateVars['Controller'] == 'MSO':
            template_file = "mso_tenant.template"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        tenant_file.write(payload + '\n\n')
        tenant_file.close()

    # Method must be called with the following kwargs.
    # Controller: Must be ACI or MSO to tell the script which controller to run against
    # Tenant: Name of the Tenant
    # VRF: Name of the VRF
    # VRF_Policy: Name of the VRF Policy on the Network Policies Tab
    # Policy_Name: Name of the VRF Policy
    # pc_enf_pref: Enforcement Preference... enforced or unenforced
    # pc_enf_dir: Enforcement Direction... egress or ingress.
    # bd_enforce: Restrict communication between BDs and EPGs.  See Documentation for more Info.
    # enf_type: What white list model to use: contracts, Preferred Group or vzAny
    # fvEpRetPol: Endpoint Retention Policy.  See Documentation for more Info.
    # monEPGPol: Monitoring Policy.  See Documentation for more Info.
    # dp_learning: Data Plane Learning.  See Documentation for more Info.
    # knw_mcast: Known Multicast.  See Documentation for more Info.
    # MSO_Policy:  MSO Policy in the MSO Policy Tab.  Only required if Controller is MSO
    # Description: Optional
    # annotation: Tags to assign to VRF
    # name_alias: Global Alias for VRF, since VRF Name cannot Change
    # bgpCtxPol: BGP Timers Policy.  See Documentation for more Info.
    # bgpCtxAfPol: BGP Address Family Timers Policy.  See Documentation for more Info.
    # ospfCtxPol: OSPF Timers Policy.  See Documentation for more Info.
    # ospfCtxAfPol: OSPF Address Family Timers Policy.  See Documentation for more Info.
    # eigrpCtxAfPol: EIGRP Address Family Timers Policy.  See Documentation for more Info.
    # l3extRouteTagPol: Route Tag Policy.  See Documentation for more Info.
    # l3extVrfValidationPol: L3 Validation Policy.  See Documentation for more Info.
    def add_vrf(self, wb, ws, row_num, wr_file, **kwargs):
        # Open the Network Policies Worksheet
        ws_net = wb['Network Policies']
        rowcount = ws_net.max_row

        # Dicts for required and optional args
        required_args = {'Controller': '',
                        'Tenant': '',
                        'VRF': '',
                        'VRF_Policy': '',
                        'Policy_Name': '',
                        'pc_enf_pref': '',
                        'pc_enf_dir': '',
                        'bd_enforce': '',
                        'enf_type': '',
                        'fvEpRetPol': '',
                        'monEPGPol': '',
                        'dp_learning': '',
                        'knw_mcast': ''}
        optional_args = {'MSO_Policy': '',
                        'Description': '',
                        'annotation': '',
                        'name_alias': '',
                        'bgpCtxPol': '',
                        'bgpCtxAfPol': '',
                        'ospfCtxPol': '',
                        'ospfCtxAfPol': '',
                        'eigrpCtxAfPol': '',
                        'l3extRouteTagPol': '',
                        'l3extVrfValidationPol': ''}

        # Get the VRF Policies from the Network Policies Tab
        func = 'VRF'
        count = countKeys(ws_net, func)
        row_count = ''
        # print(f'count is {count}')
        var_dict = findVars(ws_net, func, rowcount, count)
        for pos in var_dict:
            if var_dict[pos].get('Policy_Name') == kwargs.get('VRF_Policy'):
                row_count = var_dict[pos]['row']
                del var_dict[pos]['row']
                kwargs = {**kwargs, **var_dict[pos]}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Tenant and VRF Name
            validating.name_rule(row_num, templateVars['Tenant'])
            validating.name_rule(row_num, templateVars['VRF'])
            validating.controller(row_count, ws_net, 'Controller', templateVars['Controller'])
            validating.deny(row_count, ws_net, 'knw_mcast', templateVars['knw_mcast'])
            validating.direction(row_count, ws_net, 'pc_enf_dir', templateVars['pc_enf_dir'])
            validating.enabled(row_count, ws_net, 'dp_learning', templateVars['dp_learning'])
            validating.enforcement(row_count, ws_net, 'pc_enf_pref', templateVars['pc_enf_pref'])
            validating.enforce_type(row_count, ws_net, 'enf_type', templateVars['enf_type'])
            validating.noyes(row_count, ws_net, 'bd_enforce', templateVars['bd_enforce'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)

        if templateVars['bgpCtxPol'] == 'default':
            templateVars['bgpCtxPol'] = 'uni/tn-common/bgpCtxP-default'
        if templateVars['bgpCtxAfPol'] == 'default':
            templateVars['bgpCtxAfPol'] = 'uni/tn-common/bgpCtxAfP-default'
        if templateVars['eigrpCtxAfPol'] == 'default':
            templateVars['eigrpCtxAfPol'] = 'uni/tn-common/eigrpCtxAfP-default'
        if templateVars['ospfCtxPol'] == 'default':
            templateVars['ospfCtxPol'] = 'uni/tn-common/ospfCtxP-default'
        if templateVars['ospfCtxAfPol'] == 'default':
            templateVars['ospfCtxAfPol'] = 'uni/tn-common/ospfCtxP-default'
        if templateVars['fvEpRetPol'] == 'default':
            templateVars['fvEpRetPol'] = 'uni/tn-common/epRPol-default'
        if templateVars['monEPGPol'] == 'default':
            templateVars['monEPGPol'] = 'uni/tn-common/monepg-default'
        if templateVars['l3extVrfValidationPol'] == 'default':
            templateVars['l3extVrfValidationPol'] = 'uni/tn-common/vrfvalidationpol-default'

        # Create VRF File
        dest_dir = './ACI/Tenants_%s' % (templateVars['Tenant'])
        if not os.path.isdir(dest_dir):
            create_dir = 'mkdir %s' % (dest_dir)
            os.system(create_dir)

        # Check if the Main File is Already in the Directory; If Not Create
        main_file = '.ACI/Tenants_%s/main.tf'
        if not os.path.isfile(main_file):
            src_dir = './ACI/templates'
            cp_main = 'cp %s/main.tf %s/variables.tf %s/.gitignore %s/' % (src_dir, src_dir, src_dir, dest_dir)
            os.system(cp_main)

        file_VRF = './ACI/Tenants_%s/vrf_%s.tf' % (templateVars['Tenant'], templateVars['VRF'])
        vrf_file = open(file_VRF, 'w')
        vrf_file.write('/*\n This File will include Policies Related to Tenant "%s" VRF "%s"\n*/\n\n' % (templateVars['Tenant'], templateVars['VRF']))


        # Locate template for method
        if templateVars['Controller'] == 'APIC':
            template_file = "aci_vrf.template"
        elif templateVars['Controller'] == 'MSO':
            template_file = "mso_vrf.template"
        template = self.templateEnv.get_template(template_file)
        # Render template w/ values from dicts
        payload = template.render(templateVars)
        vrf_file.write(payload + '\n\n')

        if templateVars['enf_type'] == 'pref_grp':
            # Locate template for method
            if templateVars['Controller'] == 'APIC':
                template_file = "aci_pref_grp.template"
            elif templateVars['Controller'] == 'MSO':
                template_file = "mso_pref_grp.template"
            template = self.templateEnv.get_template(template_file)

            # Render template w/ values from dicts
            payload = template.render(templateVars)
            vrf_file.write(payload + '\n\n')
        elif templateVars['enf_type'] == 'vzAny':
            # Locate template for method
            if templateVars['Controller'] == 'APIC':
                template_file = "aci_vzAny.template"
            elif templateVars['Controller'] == 'MSO':
                template_file = "mso_vzAny.template"
            template = self.templateEnv.get_template(template_file)

            # Render template w/ values from dicts
            payload = template.render(templateVars)
            vrf_file.write(payload + '\n\n')

        # Locate template for method
        if templateVars['Controller'] == 'APIC':
            template_file = "aci_snmp_ctx.template"
        elif templateVars['Controller'] == 'MSO':
            template_file = "aci_snmp_ctx.template"
        template = self.templateEnv.get_template(template_file)
        # Render template w/ values from dicts
        payload = template.render(templateVars)
        vrf_file.write(payload + '\n\n')

        vrf_file.close()

    # Method must be called with the following kwargs.
    # Tenant: Name of the Tenant
    # VRF: Name of the VRF
    # Ctx_Community: The SNMP Community you would like to add to the Context
    # Description: Optional
    def ctx_comm(self, wb, ws, row_num, wr_file, **kwargs):
        # Dicts for required and optional args
        required_args = {'Tenant': '',
                         'VRF': '',
                         'Ctx_Community': ''}
        optional_args = {'Description': ''}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate SNMP Community
            validating.snmp_string(row_num, templateVars['Ctx_Community'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)

        # Create VRF File
        file_ctx_comm = './ACI/Tenants_%s/snmp_ctx_%s_comm%s.tf' % (templateVars['Tenant'], templateVars['VRF'], row_num)
        ctx_file = open(file_ctx_comm, 'w')
        ctx_file.write('/*\n This File will include the SNMP Community %s for SNMP Context "%s"\n*/\n\n' % (templateVars['Ctx_Community'], templateVars['VRF']))

        # Locate template for method
        template_file = "snmp_ctx_community.template"
        template = self.templateEnv.get_template(template_file)
        # Render template w/ values from dicts
        payload = template.render(templateVars)
        ctx_file.write(payload + '\n\n')

        ctx_file.close()

    # Method must be called with the following kwargs.
    # Tenant: Name of the Tenant
    # VRF: Name of the VRF
    # BD_Enforcement: Bridge Domain Enforcement. options are yes or no
    # DP_Learning: enabled or disabled for Data Plane Learning
    # Policy_Enforce: Autonomous System for BGP Process
    # Enforce_Type: Autonomous System for BGP Process
    # Enforce_Direction: Autonomous System for BGP Process
    # Monitor_Policy: DN of the Monitor Policy.  default for example is 'uni/tn-common/monepg-default'
    # EP_Retention: DN of the Endpoint Retention Policy.  default for example is 'uni/tn-common/epRPol-default'
    # VRF_Valid_Policy: DN of the VRF Validations Policy.  default for example is 'uni/tn-common/vrfvalidationpol-default'
    # Description: Optional
    def static_path(self, wb, ws, row_num, wr_file, **kwargs):
        add_type = ''
        ws8 = ''
        pod = ''
        app = ''
        epg = ''
        tenant = ''
        vlan = ''
        vl_mode = ''
        # Dicts for required and optional args
        required_args = {'Tenant': '',
                         'VRF': '',
                         'Ctx_Community': ''}
        optional_args = {'Description': ''}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        if add_type == 'static_vpc':
            if not ',' in node_id:
                print(f'\n-----------------------------------------------------------------------------\n')
                print(f'   Error on Row {row_num} of {ws8}.  There should be ')
                print(f'   two nodes; comma seperatred for static_vpc type.  Exiting....')
                print(f'\n-----------------------------------------------------------------------------\n')
                exit()

            x = node_id.split(',')
            node_1 = x[0]
            node_2 = x[1]
            node_id = node_1
        try:
            # Validate User Inputs
            if add_type == 'static_vpc':
                validating.node_id(row_num, node_1)
                validating.node_id(row_num, node_2)
            else:
                validating.node_id(row_num, node_id)
        except Exception as err:
            print(f'\n-----------------------------------------------------------------------------\n')
            print(f'   {SystemExit(err)}')
            print(f'   Error on Row {row_num}.  Please verify input information.  Exiting....')
            print(f'\n-----------------------------------------------------------------------------\n')
            exit()

        if not '{}_count'.format(node_id) in locals():
            x = '{}_count'.format(node_id)
            x = 0
        if '{}_count'.format(node_id) == 0:
            x += 1
            delete_file = 'rm ./fabric/resources_user_static_bindings_%s.tf' % (node_id)
            os.system(delete_file)



        node_name = node_id
        # Create tDn attribute based on Type of Port being Configured
        if add_type == 'static_apg':
            # Need to modify the port name from Eth1-1 to eth1/1 in example
            pg_name_1 = pg_name
            # pg_name = convert_selector_to_port(pg_name)
            tDn = 'topology/pod-%s/paths-%s/pathep-[%s]' % (pod, node_id, pg_name)
            pg_name = pg_name_1
        elif 'pcg' in add_type:
            tDn = 'topology/pod-%s/paths-%s/pathep-[%s]' % (pod, node_id, pg_name)
        elif 'vpc' in add_type:
            tDn = 'topology/pod-%s/protpaths-%s-%s/pathep-[%s]' % (pod, node_1, node_2, pg_name)
            node_id = '%s_%s' % (node_1, node_2)
            node_name = node_1

        # Define File for adding static Path Binding and Open for Appending resources
        file_stbind = './fabric/resources_user_static_bindings_%s.tf' % (node_name)
        afile = open(file_stbind, 'a+')

        # Verify if Static Binding Currently Exists or Not
        rsc_pg_to_epg = 'resource "aci_epg_to_static_path" "%s_%s_%s_%s_%s"' % (tenant, app, epg, node_id, pg_name)
        afile.seek(0)
        if not rsc_pg_to_epg in afile.read():
            # Add Static Path to static_path Resource File for Selected Switch
            afile.write('resource "aci_epg_to_static_path" "%s_%s_%s_%s_%s" {\n' % (tenant, app, epg, node_id, pg_name))
            afile.write('\tdepends_on           = [aci_application_epg.%s_%s_%s,aci_ranges.st_vlan_pool_add_%s]\n' % (tenant, app, epg, vlan))
            afile.write('\tapplication_epg_dn   = aci_application_epg.%s_%s_%s.id\n' % (tenant, app, epg))
            afile.write('\ttdn                  = "%s"\n' % (tDn))
            afile.write('\tencap                = "vlan-%s"\n' % (vlan))
            afile.write('\tmode                 = "%s"\n' % (vl_mode))
            afile.write('}\n\n')

        afile.close()

def countKeys(ws, func):
    count = 0
    for i in ws.rows:
        if any(i):
            if str(i[0].value) == func:
                count += 1
    return count

def findKeys(ws, func_regex):
    func_list = OrderedSet()
    for i in ws.rows:
        if any(i):
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
                for x in range(2, 34):
                    if (ws.cell(row=i - 1, column=x)).value:
                        var_list.append(str(ws.cell(row=i - 1, column=x).value))
                    else:
                        x += 1
            except Exception as e:
                e = e
                pass
            break
    vcount = 1
    while vcount <= count:
        var_dict[vcount] = {}
        var_count = 0
        for z in var_list:
            var_dict[vcount][z] = ws.cell(row=i + vcount - 1, column=2 + var_count).value
            var_count += 1
        var_dict[vcount]['row'] = i + vcount - 1
        vcount += 1
    return var_dict

# Function to validate input for each method
def process_kwargs(required_args, optional_args, **kwargs):
    # Validate all required kwargs passed
    if all(item in kwargs for item in required_args.keys()) is not True:
        error_ = '\n***ERROR***\nREQUIRED ARGS ARE:\n "%s"\nOPTIONAL ARGS ARE:\n "%s"\nPROVIDED ARGS ARE:\n"%s"\nInsufficient required arguments.' % (required_args, optional_args, kwargs)
        raise InsufficientArgs(error_)

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
    if re.search('^M4', module_type):
        port_count = '4'
    elif re.search('^M6', module_type):
        port_count = '6'
    elif re.search('^M12', module_type):
        port_count = '12'
    elif re.search('X9716D-GX', module_type):
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
    switch_type = str(switch_type)
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
        print(f'   Starting work on {sheet.title} Worksheet')
        print(f'\n-----------------------------------------------------------------------------\n')
        #print('*' * 80)
    elif log_level == (2) and (sheet) and (line is not None):
        print('Evaluating line %s from %s Worksheet...' % (line, sheet.title))
    else:
        return

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
        a,b = v.split('-')
        a = int(a)
        b = int(b)
        vrange = range(a,b+1)
        for vl in vrange:
            full_vlan_list.append(vl)
    else:
        full_vlan_list.append(vlan_list)
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