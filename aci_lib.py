#!/usr/bin/env python3

import ast
import jinja2
import openpyxl
import os, re, subprocess
import pkg_resources
import validating
from openpyxl import load_workbook,workbook
from openpyxl.worksheet.datavalidation import DataValidation
from openpyxl.styles import Alignment, colors, Border, Font, NamedStyle, PatternFill, Protection, Side 
from openpyxl.utils.dataframe import dataframe_to_rows
from ordered_set import OrderedSet
from os import path

re_aep = re.compile('attentp-([a-zA-Z\\-_)\\"')
re_cdp = re.compile('cdpIfP-([a-zA-Z\\-_)\\"')
re_llp = re.compile('hintfpol-([a-zA-Z\\-_)\\"')
re_lldp = re.compile('lldpIfP-([a-zA-Z\\-_)\\"')
re_mtu = re.compile('attentp-([a-zA-Z\\-_)\\"')
re_stp = re.compile('ifPol-([a-zA-Z\\-_)\\"')

# Log levels 0 = None, 1 = Class only, 2 = Line
log_level = 2

# Global path to main Template directory
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
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def add_apg(self, wb, ws, row_num, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'Name': '',
                         'AAEP': '',
                         'MTU': '',
                         'Speed': '',
                         'CDP': '',
                         'LLDP_Rx': '',
                         'LLDP_Tx': '',
                         'STP': ''}
        optional_args = {'Description': ''}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Required Arguments
            validating.site_group(row_num, ws, 'Site_Group', templateVars['Site_Group'])
            validating.mtu(row_num, ws, 'MTU', templateVars['MTU'])
            validating.mtu(row_num, ws, 'MTU', templateVars['MTU'])
            validating.link_level(row_num, ws, 'Speed', templateVars['Speed'])
            validating.stp(row_num, ws, 'STP', templateVars['STP'])
            validating.noyes(row_num, ws, 'CDP', templateVars['CDP'])
            validating.noyes(row_num, ws, 'LLDP_Rx', templateVars['LLDP_Rx'])
            validating.noyes(row_num, ws, 'LLDP_Tx', templateVars['LLDP_Tx'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
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

        # Define the Template Source
        template_file = "add_apg.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = 'pg_access_%s.tf' % (templateVars['Name'])
        dest_dir = 'Access'
        process_method(wb, ws, row_num, 'w', dest_dir, dest_file, template, **templateVars)

    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def add_bundle(self, wb, ws, row_num, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'Name': '',
                         'AAEP': '',
                         'MTU': '',
                         'Speed': '',
                         'CDP': '',
                         'LLDP_Rx': '',
                         'LLDP_Tx': '',
                         'STP': '',
                         'Port_Type': ''}
        optional_args = {'Description': ''}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Required Arguments
            validating.site_group(row_num, ws, 'Site_Group', templateVars['Site_Group'])
            validating.int_type(row_num, ws, 'Port_Type', templateVars['Port_Type'])
            validating.link_level(row_num, ws, 'Speed', templateVars['Speed'])
            validating.mtu(row_num, ws, 'MTU', templateVars['MTU'])
            validating.stp(row_num, ws, 'STP', templateVars['STP'])
            validating.noyes(row_num, ws, 'CDP', templateVars['CDP'])
            validating.noyes(row_num, ws, 'LLDP_Rx', templateVars['LLDP_Rx'])
            validating.noyes(row_num, ws, 'LLDP_Tx', templateVars['LLDP_Tx'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        if templateVars['CDP'] == 'no':
            templateVars['CDP'] = 'cdp_Disabled'
        else:
            templateVars['CDP'] = 'cdp_Enabled'
        if templateVars['LLDP_Tx'] == 'no':
            templateVars['LLDP'] = 'lldp_Disabled'
        else:
            templateVars['LLDP'] = 'lldp_Enabled'

        if templateVars['Port_Type'] == 'port-channel':
            file_prefix = 'pg_pc'
            templateVars['LAG_Type'] = 'link'
        elif templateVars['Port_Type'] == 'vpc':
            file_prefix = 'pg_vpc'
            templateVars['LAG_Type'] = 'node'
        
        # Define the Template Source
        template_file = "add_bundle.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = '%s_%s.tf' % (file_prefix, templateVars['Name'])
        dest_dir = 'Access'
        process_method(wb, ws, row_num, 'w', dest_dir, dest_file, template, **templateVars)

    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def apic_inb(self, wb, ws, row_num, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'Name': '',
                         'Node_ID': '',
                         'Pod_ID': '',
                         'Inband_IP': '',
                         'Inband_GW': ''}
        optional_args = { }

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Required Arguments
            validating.site_group(row_num, ws, 'Site_Group', templateVars['Site_Group'])
            validating.hostname(row_num, ws, 'Name', templateVars['Name'])
            validating.node_id_apic(row_num, ws, 'Node_ID', templateVars['Node_ID'])
            validating.pod_id(row_num, ws, 'Pod_ID', templateVars['Pod_ID'])
            validating.mgmt_network(row_num, ws, 'Inband_IP', templateVars['Inband_IP'], 'Inband_GW', templateVars['Inband_GW'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        templateVars['Inband_GW_'] = templateVars['Inband_GW'].replace('.', '_')

        # Define the Template Source
        template_file = "mgmt_inb.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = '%s_inb_%s.tf' % (templateVars['Name'], templateVars['Inband_GW_'])
        dest_dir = 'Tenant_mgmt'
        process_method(wb, ws, row_num, 'w', dest_dir, dest_file, template, **templateVars)

    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def inb_subnet(self, wb, ws, row_num, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'Inband_VLAN': '',
                         'Inband_GW': ''}
        optional_args = { }

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Required Arguments
            validating.site_group(row_num, ws, 'Site_Group', templateVars['Site_Group'])
            validating.ip_address(row_num, ws, 'Inband_GW', templateVars['Inband_GW'])
            validating.vlans(row_num, ws, 'Inband_VLAN', templateVars['Inband_VLAN'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        # Define the Template Source
        template_file = "inband_subnet.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = 'inband_subnet.tf'
        dest_dir = 'Tenants_mgmt'
        process_method(wb, ws, row_num, 'w', dest_dir, dest_file, template, **templateVars)

    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def intf_selector(self, wb, ws, row_num, Site_Group, Name, Switch_Role, **kwargs):
        # Dicts for required and optional args
        required_args = {'Interface_Selector': '',
                         'Port': ''}
        optional_args = {'Policy_Group': '',
                         'Port_Type': '',
                         'Bundle_ID': '',
                         'Description': '',
                         'Switchport_Mode': '',
                         'Access_or_Native': '',
                         'Trunk_Allowed_VLANs': ''}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)
        templateVars['Name'] = Name
        templateVars['Site_Group'] = Site_Group

        if re.search('(port-channel|vpc)', templateVars['Port_Type']):
            for line in runProcess("terraform state show 'aci_leaf_access_port_policy_group.inband_apg'"):
                if not line == None:
                    if re.search(re_aep, line):
                        templateVars['AAEP'] = re.search(re_aep, line).group(1)
                    elif re.search(re_cdp, line):
                        templateVars['CDP'] = re.search(re_cdp, line).group(1)
                    elif re.search(re_lldp, line):
                        templateVars['LLDP'] = re.search(re_lldp, line).group(1)
                    elif re.search(re_mtu, line):
                        templateVars['MTU'] = re.search(re_mtu, line).group(1)
                    elif re.search(re_llp, line):
                        templateVars['Speed'] = re.search(re_llp, line).group(1)
                    elif re.search(re_stp, line):
                        templateVars['STP'] = re.search(re_stp, line).group(1)
            

        xa = templateVars['Port'].split('/')
        xcount = len(xa)
        templateVars['Module'] = xa[0]
        templateVars['Port'] = xa[1]
        if Switch_Role == 'leaf':
            # Define the Template Source
            template_file = "leaf_portselect.template"
            template = self.templateEnv.get_template(template_file)

            # Process the template through the Sites
            dest_file = '%s.tf' % (Name)
            dest_dir = 'Access/%s' % (Name)
            process_method(wb, ws, row_num, 'w+', dest_dir, dest_file, template, **templateVars)

            # Define the Template Source
            if xcount == 3:
                templateVars['Sub_Port'] = xa[2]
                template_file = "leaf_portblock_sub.template"
            else:
                template_file = "leaf_portblock.template"
            template = self.templateEnv.get_template(template_file)

            # Process the template through the Sites
            dest_file = '%s.tf' % (Name)
            dest_dir = 'Access/%s' % (Name)
            process_method(wb, ws, row_num, 'w+', dest_dir, dest_file, template, **templateVars)

        elif Switch_Role == 'spine':
            # Define the Template Source
            template_file = "spine_portselect.template"
            template = self.templateEnv.get_template(template_file)

            # Process the template through the Sites
            dest_file = '%s.tf' % (Name)
            dest_dir = 'Access/%s' % (Name)
            process_method(wb, ws, row_num, 'w+', dest_dir, dest_file, template, **templateVars)

        # DN_Policy_Group
        # uni/infra/funcprof/accportgrp-access_host_apg
        # uni/infra/funcprof/brkoutportgrp-4x25g_pg
        # uni/infra/funcprof/accbundle-asgard-ucs-a_vpc

        # Define the Template Source
        if not (templateVars['Policy_Group'] == '' or templateVars['Policy_Group'] == None):
            if Switch_Role == 'leaf':
                if not templateVars['Port_Type'] == 'breakout':
                    templateVars['Resource_Type'] = 'aci_leaf_access_port_policy_group'
                if templateVars['Port_Type'] == 'access':
                    templateVars['PG_Type'] = 'accportgrp'
                elif templateVars['Port_Type'] == 'breakout':
                    templateVars['Resource_Type'] = 'aci_rest'
                    templateVars['PG_Type'] = 'brkoutportgrp'
                elif re.search('(port-channel|vpc)', templateVars['Port_Type']):
                    templateVars['PG_Type'] = 'accbundle'

                template_file = "leaf_pg_to_selector.template"
            elif Switch_Role == 'spine':
                template_file = "spine_pg_to_select.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = '%s.tf' % (Name)
        dest_dir = 'Access/%s' % (Name)
        process_method(wb, ws, row_num, 'w+', dest_dir, dest_file, template, **templateVars)

    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def port_cnvt(self, wb, ws, row_num, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'Name': '',
                         'Node_ID': '',
                         'Port': ''}
        optional_args = { }

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Required Arguments
            validating.site_group(row_num, ws, 'Site_Group', templateVars['Site_Group'])
            validating.hostname(row_num, ws, 'Name', templateVars['Name'])
            validating.node_id(row_num, ws, 'Node_ID', templateVars['Node_ID'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        # Create Port Name Var
        zz = templateVars['Port'].split('/')
        templateVars['Port_Name'] = '%s_%s' % (zz[0], zz[1])

        # Define the Template Source
        template_file = "downlink.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = 'downlink_convert_%s.tf' % (templateVars['Port_Name'])
        dest_dir = 'Access/%s' % (templateVars['Name'])
        process_method(wb, ws, row_num, 'w', dest_dir, dest_file, template, **templateVars)

    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def switch(self, wb, ws, row_num, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'Serial': '',
                         'Name': '',
                         'Node_ID': '',
                         'Node_Type': '',
                         'Pod_ID': '',
                         'Switch_Role': '',
                         'Switch_Type': '',
                         'Inband_IP': '',
                         'Inband_GW': ''}
        optional_args = {'OOB_IP': '',
                         'OOB_GW': ''}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        # Use Switch_Type to Determine the Number of ports on the switch
        modules,port_count = query_switch_model(row_num, templateVars['Switch_Type'])
        
        try:
            # Validate Required Arguments
            validating.site_group(row_num, ws, 'Site_Group', templateVars['Site_Group'])
            validating.hostname(row_num, ws, 'Name', templateVars['Name'])
            validating.node_id(row_num, ws, 'Node_ID', templateVars['Node_ID'])
            validating.node_type(row_num, templateVars['Name'], templateVars['Node_Type'])
            validating.pod_id(row_num, ws, 'Pod_ID', templateVars['Pod_ID'])
            validating.role(row_num, templateVars['Name'], templateVars['Switch_Role'])
            validating.modules(row_num, templateVars['Name'], templateVars['Switch_Role'], modules)
            validating.port_count(row_num, templateVars['Name'], templateVars['Switch_Role'], port_count)
            validating.mgmt_network(row_num, ws, 'Inband_IP', templateVars['Inband_IP'], 'Inband_GW', templateVars['Inband_GW'])
            if not templateVars['OOB_IP'] == None:
                validating.mgmt_network(row_num, ws, 'OOB_IP', templateVars['OOB_IP'], 'OOB_GW', templateVars['OOB_GW'])
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
            ws_sw.column_dimensions['E'].width = 20
            ws_sw.column_dimensions['F'].width = 15
            ws_sw.column_dimensions['G'].width = 30
            ws_sw.column_dimensions['H'].width = 20
            ws_sw.column_dimensions['I'].width = 20
            ws_sw.column_dimensions['J'].width = 30
            dv1 = DataValidation(type="list", formula1='"intf_selector"', allow_blank=True)
            dv2 = DataValidation(type="list", formula1='"access,breakout,port-channel,vpc"', allow_blank=True)
            ws_sw.add_data_validation(dv1)
            ws_sw.add_data_validation(dv2)
            ws_header = '%s Interface Selectors' % (templateVars['Name'])
            data = [ws_header]
            ws_sw.append(data)
            ws_sw.merge_cells('A1:J1')
            for cell in ws_sw['1:1']:
                cell.style = 'Heading 1'
            data = ['','Notes: Breakout Policy Group Names are 2x100g_pg, 4x10g_pg, 4x25g_pg, 4x100g_pg, 8x50g_pg.']
            ws_sw.append(data)
            ws_sw.merge_cells('B2:J2')
            for cell in ws_sw['2:2']:
                cell.style = 'Heading 2'
            data = ['Type','Interface_Selector','Port','Policy_Group','Port_Type','Bundle_ID','Description','Switchport_Mode','Access_or_Native','Trunk_Allowed_VLANs']
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
        func_regex = re.compile('^intf_selector$')
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
                site_group = templateVars['Site_Group']
                sw_role = templateVars['Switch_Role']
                eval("%s.%s(wb, ws_sw, row_num_sw, wr_file, %s, %s, %s, **var_dict_sw[pos_sw])" % (class_init_sw, func_sw, site_group, sw_name, sw_role))
        wr_file.close()

    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def vlan_pool(self, wb, ws, row_num, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'Name': '',
                         'Allocation_Mode': '',
                         'VLAN_Grp1': '',
                         'VGRP1_Allocation': ''}
        optional_args = {'VLAN_Grp1': '',
                         'VGRP1_Allocation': '',
                         'VLAN_Grp2': '',
                         'VGRP2_Allocation': ''}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Required Arguments
            validating.site_group(row_num, ws, 'Site_Group', templateVars['Site_Group'])
            validating.alloc_mode(row_num, ws, 'Allocation_Mode', templateVars['Allocation_Mode'])
            validating.alloc_mode(row_num, ws, 'VGRP1_Allocation', templateVars['VGRP1_Allocation'])
            if not templateVars['VGRP2_Allocation'] == None:
                validating.alloc_mode(row_num, ws, 'VGRP2_Allocation', templateVars['VGRP2_Allocation'])
            validating.vlans(row_num, ws, 'VLAN_Grp1', templateVars['VLAN_Grp1'])
            if not templateVars['VLAN_Grp2'] == None:
                validating.vlans(row_num, ws, 'VLAN_Grp2', templateVars['VLAN_Grp2'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)

        if templateVars['Name'] == None:
            Error_Return = 'Error on Worksheet %s Row %s.  Could not Determine the Name of the VLAN Pool.' % (ws.title, row_num)
            raise ErrException(Error_Return)
        
        # Define the Template Source
        template_file = "vlan_pool.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = 'vlp_%s.tf' % (templateVars['Name'])
        dest_dir = 'Access'
        process_method(wb, ws, row_num, 'w', dest_dir, dest_file, template, **templateVars)

        # Define the Template Source
        template_file = "data_vlan_pool.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = 'data_vlp_%s.tf' % (templateVars['Name'])
        dest_dir = 'Access/VLANs'
        process_method(wb, ws, row_num, 'w', dest_dir, dest_file, template, **templateVars)

        # Add VLAN(s) to VLAN Pool FIle
        if re.search('Grp_[A-F]', templateVars['Site_Group']):
            Group_ID = '%s' % (templateVars['Site_Group'])
            site_group = ast.literal_eval(os.environ[Group_ID])
            for x in range(1, 13):
                sitex = 'Site_%s' % (x)
                if not site_group[sitex] == None:
                    Site_ID = 'Site_ID_%s' % (site_group[sitex])
                    site_dict = ast.literal_eval(os.environ[Site_ID])

                    # Create templateVars for Site_Name and APIC_URL
                    templateVars['Site_Name'] = site_dict.get('Site_Name')
                    templateVars['APIC_URL'] = site_dict.get('APIC_URL')

                    # Create Blank VLAN Pool VLAN(s) File
                    dest_file = './ACI/%s/Access/VLANs/vlp_%s.tf' % (templateVars['Site_Name'], templateVars['Name'])
                    wr_file = open(dest_file, 'w')
                    wr_file.close()
                    dest_file = 'vlp_%s.tf' % (templateVars['Name'])
                    dest_dir = 'Access/VLANs'
                    template_file = "add_vlan_to_pool.template"
                    template = self.templateEnv.get_template(template_file)

                    for z in range(1, 3):
                        vgroup = 'VLAN_Grp%s' % (z)
                        vgrp = 'VGRP%s_Allocation' % (z)
                        templateVars['Allocation_Mode'] = templateVars[vgrp]
                        if re.search(r'\d+', str(templateVars[vgroup])):
                            vlan_list = vlan_list_full(templateVars[vgroup])
                            for v in vlan_list:
                                vlan = str(v)
                                if re.fullmatch(r'\d+', vlan):
                                    templateVars['VLAN_ID'] = int(vlan)

                                    # Add VLAN to VLAN Pool File
                                    create_tf_file('w+', dest_dir, dest_file, template, **templateVars)

        elif re.search(r'\d+', templateVars['Site_Group']):
            Site_ID = 'Site_ID_%s' % (templateVars['Site_Group'])
            site_dict = ast.literal_eval(os.environ[Site_ID])

            # Create templateVars for Site_Name and APIC_URL
            templateVars['Site_Name'] = site_dict.get('Site_Name')
            templateVars['APIC_URL'] = site_dict.get('APIC_URL')

            # Create Blank VLAN Pool VLAN(s) File
            dest_file = './ACI/%s/Access/VLANs/vlp_%s.tf' % (templateVars['Site_Name'], templateVars['Name'])
            wr_file = open(dest_file, 'w')
            wr_file.close()
            dest_file = 'vlp_%s.tf' % (templateVars['Name'])
            dest_dir = 'Access/VLANs'
            template_file = "add_vlan_to_pool.template"
            template = self.templateEnv.get_template(template_file)

            for z in range(1, 3):
                vgroup = 'VLAN_Grp%s' % (z)
                vgrp = 'VGRP%s_Allocation' % (z)
                templateVars['Allocation_Mode'] = templateVars[vgrp]
                if re.search(r'\d+', str(templateVars[vgroup])):
                    vlan_list = vlan_list_full(templateVars[vgroup])
                    for v in vlan_list:
                        vlan = str(v)
                        if re.fullmatch(r'\d+', vlan):
                            templateVars['VLAN_ID'] = int(vlan)

                            # Add VLAN to VLAN Pool File
                            create_tf_file('w+', dest_dir, dest_file, template, **templateVars)
        else:
            print(f"\n-----------------------------------------------------------------------------\n")
            print(f"   Error on Worksheet {ws.title}, Row {row_num} Site_Group, value {templateVars['Site_Group']}.")
            print(f"   Unable to Determine if this is a Single or Group of Site(s).  Exiting....")
            print(f"\n-----------------------------------------------------------------------------\n")
            exit()

    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def vpc_pair(self, wb, ws, row_num, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'VPC_ID': '',
                         'Name': '',
                         'Node1_ID': '',
                         'Node2_ID': ''}
        optional_args = { }

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Required Arguments
            validating.site_group(row_num, ws, 'Site_Group', templateVars['Site_Group'])
            validating.vpc_id(row_num, ws, 'VPC_ID', templateVars['VPC_ID'])
            validating.node_id(row_num, ws, 'Node1_ID', templateVars['Node1_ID'])
            validating.node_id(row_num, ws, 'Node2_ID', templateVars['Node2_ID'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        # Define the Template Source
        template_file = "vpc_domain.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = 'vpc_domain_%s.tf' % (templateVars['VPC_ID'])
        dest_dir = 'Access'
        process_method(wb, ws, row_num, 'w', dest_dir, dest_file, template, **templateVars)

# Terraform ACI Provider - Admin Policies
# Class must be instantiated with Variables
class Admin_Policies(object):
    def __init__(self, ws):
        self.templateLoader = jinja2.FileSystemLoader(
            searchpath=(aci_template_path + 'Admin_Policies/'))
        self.templateEnv = jinja2.Environment(loader=self.templateLoader)
    
    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def backup(self, wb, ws, row_num, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'Encryption_Key': '',
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
            # Validate Required Arguments
            validating.site_group(row_num, ws, 'Site_Group', templateVars['Site_Group'])
            validating.auth_type(row_num, ws, 'Auth_Type', templateVars['Auth_Type'])
            validating.encryption_key(row_num, ws, 'Encryption_Key', templateVars['Encryption_Key'])
            validating.hour(row_num, ws, 'Backup_Hour', templateVars['Backup_Hour'])
            validating.minute(row_num, ws, 'Backup_Minute', templateVars['Backup_Minute'])
            validating.port(row_num, ws, 'Port', templateVars['Port'])
            templateVars['Mgmt_Domain'] = validating.mgmt_domain(row_num, ws, 'Mgmt_Domain', templateVars['Mgmt_Domain'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        templateVars['Remote_Host_'] = templateVars['Remote_Host'].replace('.', '_')
        if templateVars['Auth_Type'] == 'password':
            templateVars['Auth_Type'] = 'usePassword'
        elif templateVars['Auth_Type'] == 'ssh-key':
            templateVars['Auth_Type'] = 'useSshKeyContents'

        # Define the Template Source
        template_file = "global_key.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = 'backup_remotehost.tf'
        dest_dir = 'Admin'
        process_method(wb, ws, row_num, 'w', dest_dir, dest_file, template, **templateVars)

        # Define the Template Source
        template_file = "backup_host.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        process_method(wb, ws, row_num, 'w+', dest_dir, dest_file, template, **templateVars)

        # Define the Template Source
        template_file = "backup_policy.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        process_method(wb, ws, row_num, 'w+', dest_dir, dest_file, template, **templateVars)
    
    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def realm(self, wb, ws, row_num, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'Auth_Realm': '',
                         'Domain_Type': ''}
        optional_args = {'Login_Domain': ''}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Required Arguments
            validating.site_group(row_num, ws, 'Site_Group', templateVars['Site_Group'])
            validating.auth_realm(row_num, ws, 'Auth_Realm', templateVars['Auth_Realm'])
            validating.login_type(row_num, ws, 'Auth_Realm', templateVars['Auth_Realm'], 'Domain_Type', templateVars['Domain_Type'])
            if not templateVars['Domain_Type'] == 'local':
                validating.login_domain(row_num, ws, 'Login_Domain', templateVars['Login_Domain'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        if templateVars['Auth_Realm'] == 'console':
            templateVars['child_class'] = 'aaaDefaultAuth'
        elif templateVars['Auth_Realm'] == 'default':
            templateVars['child_class'] = 'aaaConsoleAuth'

        # Define the Template Source
        template_file = "realm.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = 'realm.tf'
        dest_dir = 'Admin'
        process_method(wb, ws, row_num, 'w', dest_dir, dest_file, template, **templateVars)

    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def radius(self, wb, ws, row_num, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'Login_Domain': '',
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
            # Validate Required Arguments
            validating.site_group(row_num, ws, 'Site_Group', templateVars['Site_Group'])
            validating.auth_proto(row_num, ws, 'Authz_Proto', templateVars['Authz_Proto'])  
            validating.ipv4(row_num, ws, 'RADIUS_Server', templateVars['RADIUS_Server'])
            validating.login_domain(row_num, ws, 'Login_Domain', templateVars['Login_Domain'])
            validating.secret(row_num, ws, 'Shared_Secret', templateVars['Shared_Secret'])
            validating.retry(row_num, ws, 'Retry_Interval', templateVars['Retry_Interval'])
            validating.timeout(row_num, ws, 'Timeout', templateVars['Timeout'])
            templateVars['Mgmt_Domain'] = validating.mgmt_domain(row_num, ws, 'Mgmt_Domain', templateVars['Mgmt_Domain'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        templateVars['RADIUS_Server_'] = templateVars['RADIUS_Server'].replace('.', '_')
        
        # Define the Template Source
        template_file = "radius.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = 'radius_%s.tf' % (templateVars['RADIUS_Server_'])
        dest_dir = 'Admin'
        process_method(wb, ws, row_num, 'w', dest_dir, dest_file, template, **templateVars)

    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def tacacs(self, wb, ws, row_num, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'Login_Domain': '',
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
            # Validate Required Arguments
            validating.site_group(row_num, ws, 'Site_Group', templateVars['Site_Group'])
            validating.auth_proto(row_num, ws, 'Auth_Proto', templateVars['Auth_Proto'])  
            validating.ipv4(row_num, ws, 'TACACS_Server', templateVars['TACACS_Server'])
            validating.login_domain(row_num, ws, 'Login_Domain', templateVars['Login_Domain'])
            validating.secret(row_num, ws, 'Shared_Secret', templateVars['Shared_Secret'])
            validating.retry(row_num, ws, 'Retry_Interval', templateVars['Retry_Interval'])
            validating.timeout(row_num, ws, 'Timeout', templateVars['Timeout'])
            templateVars['Mgmt_Domain'] = validating.mgmt_domain(row_num, ws, 'Mgmt_Domain', templateVars['Mgmt_Domain'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        templateVars['TACACS_Server_'] = templateVars['TACACS_Server'].replace('.', '_')

        # Define the Template Source
        template_file = "tacacs.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = 'tacacs_%s.tf' % (templateVars['TACACS_Server_'])
        dest_dir = 'Admin'
        process_method(wb, ws, row_num, 'w', dest_dir, dest_file, template, **templateVars)

    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def web_security(self, wb, ws, row_num, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'Passwd_Strength': '',
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

        try:
            # Validate Required Arguments
            validating.site_group(row_num, ws, 'Site_Group', templateVars['Site_Group'])
            validating.enable(row_num, ws, 'Enforce_Intv', templateVars['Enforce_Intv'])
            validating.enable(row_num, ws, 'Lockout', templateVars['Lockout'])
            validating.noyes(row_num, ws, 'Passwd_Strength', templateVars['Passwd_Strength'])
            validating.number_check(row_num, ws, 'Passwd_Intv', templateVars['Passwd_Intv'])
            validating.number_check(row_num, ws, 'Number_Allowed', templateVars['Number_Allowed'])
            validating.number_check(row_num, ws, 'Passwd_Store', templateVars['Passwd_Store'])  
            validating.number_check(row_num, ws, 'Failed_Attempts', templateVars['Failed_Attempts'])
            validating.number_check(row_num, ws, 'Time_Period', templateVars['Time_Period'])  
            validating.number_check(row_num, ws, 'Dur_Lockout', templateVars['Dur_Lockout'])  
            validating.number_check(row_num, ws, 'Token_Timeout', templateVars['Token_Timeout'])  
            validating.number_check(row_num, ws, 'Maximum_Valid', templateVars['Maximum_Valid'])  
            validating.number_check(row_num, ws, 'Web_Timeout', templateVars['Web_Timeout'])  
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        # Define the Template Source
        template_file = "web_security.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = 'web_security.tf'
        dest_dir = 'Admin'
        process_method(wb, ws, row_num, 'w', dest_dir, dest_file, template, **templateVars)

# Terraform ACI Provider - Fabric Policies
# Class must be instantiated with Variables
class Fabric_Policies(object):
    def __init__(self, ws):
        self.templateLoader = jinja2.FileSystemLoader(
            searchpath=(aci_template_path + 'Fabric_Policies/'))
        self.templateEnv = jinja2.Environment(loader=self.templateLoader)
    
    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def bgp_rr(self, wb, ws, row_num, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'Node_ID': ''}
        optional_args = {}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Required Arguments
            validating.site_group(row_num, ws, 'Site_Group', templateVars['Site_Group'])
            validating.node_id(row_num, ws, 'Node_ID', templateVars['Node_ID'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        # Define the Template Source
        template_file = "bgp_rr.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = 'bgp_rr_%s.tf' % (templateVars['Node_ID'])
        dest_dir = 'Fabric'
        process_method(wb, ws, row_num, 'w', dest_dir, dest_file, template, **templateVars)

    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def dns(self, wb, ws, row_num, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'DNS_Server': '',
                         'Preferred': ''}
        optional_args = {}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Required Arguments
            validating.site_group(row_num, ws, 'Site_Group', templateVars['Site_Group'])
            validating.ipv4(row_num, ws, 'DNS_Server', templateVars['DNS_Server'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        templateVars['DNS_Server_'] = templateVars['DNS_Server'].replace('.', '_')

        # Define the Template Source
        template_file = "dns.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = 'dns_%s.tf' % (templateVars['DNS_Server_'])
        dest_dir = 'Fabric'
        process_method(wb, ws, row_num, 'w', dest_dir, dest_file, template, **templateVars)

    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def dns_mgmt(self, wb, ws, row_num, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'Mgmt_Domain': ''}
        optional_args = {}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Required Arguments
            validating.site_group(row_num, ws, 'Site_Group', templateVars['Site_Group'])
            templateVars['Mgmt_Domain'] = validating.mgmt_domain(row_num, ws, 'Mgmt_Domain', templateVars['Mgmt_Domain'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        # Define the Template Source
        template_file = "dns_mgmt.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = 'dns_mgmt.tf'
        dest_dir = 'Fabric'
        process_method(wb, ws, row_num, 'w', dest_dir, dest_file, template, **templateVars)

    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def domain(self, wb, ws, row_num, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'Domain': '',
                         'Default_Domain': ''}
        optional_args = {}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Required Arguments
            validating.site_group(row_num, ws, 'Site_Group', templateVars['Site_Group'])
            validating.domain(row_num, ws, 'Domain', templateVars['Domain'])
            validating.noyes(row_num, ws, 'Default_Domain', templateVars['Default_Domain'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        templateVars['Domain_'] = templateVars['Domain'].replace('.', '_')

        # Define the Template Source
        template_file = "domain.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = 'domain_%s.tf' % (templateVars['Domain_'])
        dest_dir = 'Fabric'
        process_method(wb, ws, row_num, 'w', dest_dir, dest_file, template, **templateVars)

    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def ntp(self, wb, ws, row_num, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'NTP_Server': '',
                         'Preferred': '',
                         'Mgmt_Domain': ''}
        optional_args = {}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Required Arguments
            validating.site_group(row_num, ws, 'Site_Group', templateVars['Site_Group'])
            validating.ipv4(row_num, ws, 'NTP_Server', templateVars['NTP_Server'])
            validating.noyes(row_num, ws, 'Preferred', templateVars['Preferred'])
            templateVars['Mgmt_Domain'] = validating.mgmt_domain(row_num, ws, 'Mgmt_Domain', templateVars['Mgmt_Domain'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        templateVars['NTP_Server_'] = templateVars['NTP_Server'].replace('.', '_')

        # Define the Template Source
        template_file = "ntp.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = 'ntp_%s.tf' % (templateVars['NTP_Server_'])
        dest_dir = 'Fabric'
        process_method(wb, ws, row_num, 'w', dest_dir, dest_file, template, **templateVars)

    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def smartcallhome(self, wb, ws, row_num, **kwargs):
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
            # Validate Required Arguments
            validating.site_group(row_num, ws, 'Site_Group', templateVars['Site_Group'])
            validating.email(row_num, ws, 'From_Email', templateVars['From_Email'])
            validating.email(row_num, ws, 'Reply_Email', templateVars['Reply_Email'])
            validating.email(row_num, ws, 'To_Email', templateVars['To_Email'])
            if not templateVars['Phone_Number'] == None:
                validating.phone(row_num, ws, 'Phone_Number', templateVars['Phone_Number'])
            templateVars['Mgmt_Domain'] = validating.mgmt_domain(row_num, ws, 'Mgmt_Domain', templateVars['Mgmt_Domain'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        # Define the Template Source
        template_file = "smartcallhome.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = 'smartcallhome.tf'
        dest_dir = 'Fabric'
        if re.search('Grp_[A-F]', templateVars['Site_Group']):
            Group_ID = '%s' % (templateVars['Site_Group'])
            site_group = ast.literal_eval(os.environ[Group_ID])
            for x in range(1, 13):
                sitex = 'Site_%s' % (x)
                if not site_group[sitex] == None:
                    Site_ID = 'Site_ID_%s' % (site_group[sitex])
                    site_dict = ast.literal_eval(os.environ[Site_ID])

                    # Create templateVars for Site_Name and APIC_URL
                    templateVars['Site_Name'] = site_dict.get('Site_Name')
                    templateVars['APIC_URL'] = site_dict.get('APIC_URL')
                    templateVars['Street_Address'] = site_dict.get('Street_Address')
                    templateVars['Contract_ID'] = site_dict.get('Contract_ID')
                    templateVars['Customer_Identifier'] = site_dict.get('Customer_Identifier')
                    templateVars['Site_Identifier'] = site_dict.get('Site_Identifier')

                    # Create Terraform file from Template
                    create_tf_file('w', dest_dir, dest_file, template, **templateVars)

        elif re.search(r'\d+', templateVars['Site_Group']):
            Site_ID = 'Site_ID_%s' % (templateVars['Site_Group'])
            site_dict = ast.literal_eval(os.environ[Site_ID])

            # Create templateVars for Site_Name and APIC_URL
            templateVars['Site_Name'] = site_dict.get('Site_Name')
            templateVars['APIC_URL'] = site_dict.get('APIC_URL')
            templateVars['Street_Address'] = site_dict.get('Street_Address')
            templateVars['Contract_ID'] = site_dict.get('Contract_ID')
            templateVars['Customer_Identifier'] = site_dict.get('Customer_Identifier')
            templateVars['Site_Identifier'] = site_dict.get('Site_Identifier')

            # Create Terraform file from Template
            create_tf_file('w', dest_dir, dest_file, template, **templateVars)
        else:
            print(f"\n-----------------------------------------------------------------------------\n")
            print(f"   Error on Worksheet {ws.title}, Row {row_num} Site_Group, value {templateVars['Site_Group']}.")
            print(f"   Unable to Determine if this is a Single or Group of Site(s).  Exiting....")
            print(f"\n-----------------------------------------------------------------------------\n")
            exit()

    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def snmp_client(self, wb, ws, row_num, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'SNMP_Client_Name': '',
                         'SNMP_Client': '',
                         'Mgmt_Domain': ''}
        optional_args = { }

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Required Arguments
            validating.site_group(row_num, ws, 'Site_Group', templateVars['Site_Group'])
            validating.ipv4(row_num, ws, 'SNMP_Client', templateVars['SNMP_Client'])
            templateVars['Mgmt_Domain'] = validating.snmp_mgmt(row_num, ws, 'Mgmt_Domain', templateVars['Mgmt_Domain'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        templateVars['SNMP_Client_'] = templateVars['SNMP_Client'].replace('.', '_')

        # Define the Template Source
        template_file = "snmp_client.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = 'snmp_client_%s.tf' % (templateVars['SNMP_Client_'])
        dest_dir = 'Fabric'
        process_method(wb, ws, row_num, 'w', dest_dir, dest_file, template, **templateVars)

    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def snmp_comm(self, wb, ws, row_num, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'SNMP_Community': ''}
        optional_args = {'Description': ''}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Required Arguments
            validating.site_group(row_num, ws, 'Site_Group', templateVars['Site_Group'])
            validating.snmp_string(row_num, ws, 'SNMP_Community', templateVars['SNMP_Community'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        # Define the Template Source
        template_file = "snmp_comm.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = 'snmp_comm_%s.tf' % (templateVars['SNMP_Community'])
        dest_dir = 'Fabric'
        process_method(wb, ws, row_num, 'w', dest_dir, dest_file, template, **templateVars)

    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def snmp_info(self, wb, ws, row_num, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'SNMP_Contact': ''}
        optional_args = { }

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Required Arguments
            validating.site_group(row_num, ws, 'Site_Group', templateVars['Site_Group'])
            validating.snmp_info(row_num, ws, 'SNMP_Contact', templateVars['SNMP_Contact'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        # Define the Template Source
        template_file = "snmp_info.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = 'snmp_info.tf'
        dest_dir = 'Fabric'
        if re.search('Grp_[A-F]', templateVars['Site_Group']):
            Group_ID = '%s' % (templateVars['Site_Group'])
            site_group = ast.literal_eval(os.environ[Group_ID])
            for x in range(1, 13):
                sitex = 'Site_%s' % (x)
                if not site_group[sitex] == None:
                    Site_ID = 'Site_ID_%s' % (site_group[sitex])
                    site_dict = ast.literal_eval(os.environ[Site_ID])

                    # Create templateVars for Site_Name and APIC_URL
                    templateVars['Site_Name'] = site_dict.get('Site_Name')
                    templateVars['APIC_URL'] = site_dict.get('APIC_URL')
                    templateVars['SNMP_Location'] = site_dict.get('SNMP_Location')

                    # Create Terraform file from Template
                    create_tf_file('w', dest_dir, dest_file, template, **templateVars)

        elif re.search(r'\d+', templateVars['Site_Group']):
            Site_ID = 'Site_ID_%s' % (templateVars['Site_Group'])
            site_dict = ast.literal_eval(os.environ[Site_ID])

            # Create templateVars for Site_Name and APIC_URL
            templateVars['Site_Name'] = site_dict.get('Site_Name')
            templateVars['APIC_URL'] = site_dict.get('APIC_URL')
            templateVars['SNMP_Location'] = site_dict.get('SNMP_Location')

            # Create Terraform file from Template
            create_tf_file('w', dest_dir, dest_file, template, **templateVars)
        else:
            print(f"\n-----------------------------------------------------------------------------\n")
            print(f"   Error on Worksheet {ws.title}, Row {row_num} Site_Group, value {templateVars['Site_Group']}.")
            print(f"   Unable to Determine if this is a Single or Group of Site(s).  Exiting....")
            print(f"\n-----------------------------------------------------------------------------\n")
            exit()
    
    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def snmp_trap(self, wb, ws, row_num, **kwargs):
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
            # Validate Required Arguments
            validating.site_group(row_num, ws, 'Site_Group', templateVars['Site_Group'])
            validating.ipv4(row_num, ws, 'Trap_Server', templateVars['Trap_Server'])
            validating.port(row_num, ws, 'Destination_Port', templateVars['Destination_Port'])
            validating.snmp_ver(row_num, ws, 'Version', templateVars['Version'])
            validating.snmp_sec(row_num, ws, 'Security_Level', templateVars['Security_Level'])
            validating.snmp_string(row_num, ws, 'Community_or_Username', templateVars['Community_or_Username'])
            templateVars['Mgmt_Domain'] = validating.mgmt_domain(row_num, ws, 'Mgmt_Domain', templateVars['Mgmt_Domain'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        templateVars['Trap_Server_'] = templateVars['Trap_Server'].replace('.', '_')

        # Define the Template Source
        template_file = "snmp_trap.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = 'snmp_trap_%s.tf' % (templateVars['Trap_Server_'])
        dest_dir = 'Fabric'
        process_method(wb, ws, row_num, 'w', dest_dir, dest_file, template, **templateVars)

    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def snmp_user(self, wb, ws, row_num, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'SNMP_User': '',
                         'Authorization_Type': '',
                         'Authorization_Key': ''}
        optional_args = {'Privacy_Type': '',
                         'Privacy_Key': ''}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Required Arguments
            validating.site_group(row_num, ws, 'Site_Group', templateVars['Site_Group'])
            auth_type = templateVars['Authorization_Type']
            auth_key = templateVars['Authorization_Key']
            validating.snmp_auth(row_num, ws, templateVars['Privacy_Type'], templateVars['Privacy_Key'], auth_type, auth_key)
            validating.snmp_string(row_num, ws, 'SNMP_User', templateVars['SNMP_User'])
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
    
        # Define the Template Source
        template_file = "snmp_user.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = 'snmp_user_%s.tf' % (templateVars['SNMP_User'])
        dest_dir = 'Fabric'
        process_method(wb, ws, row_num, 'w', dest_dir, dest_file, template, **templateVars)

    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def syslog_dg(self, wb, ws, row_num, **kwargs):
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
            # Validate Required Arguments
            validating.site_group(row_num, ws, 'Site_Group', templateVars['Site_Group'])
            validating.enabled(row_num, ws, 'Console', templateVars['Console'])
            validating.enabled(row_num, ws, 'Local', templateVars['Local'])
            validating.log_level(row_num, ws, 'Minimum_Level', templateVars['Minimum_Level'])
            validating.log_level(row_num, ws, 'Local_Level', templateVars['Local_Level'])
            validating.log_level(row_num, ws, 'Console_Level', templateVars['Console_Level'])
            validating.true(row_num, ws, 'Include_msec', templateVars['Include_msec'])
            validating.true(row_num, ws, 'Include_timezone', templateVars['Include_timezone'])
            validating.true(row_num, ws, 'Audit', templateVars['Audit'])
            validating.true(row_num, ws, 'Events', templateVars['Events'])
            validating.true(row_num, ws, 'Faults', templateVars['Faults'])
            validating.true(row_num, ws, 'Session', templateVars['Session'])
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

        # Define the Template Source
        template_file = "syslog_dg.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = 'syslog_dg.tf'
        dest_dir = 'Fabric'
        process_method(wb, ws, row_num, 'w', dest_dir, dest_file, template, **templateVars)

    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def syslog_rmt(self, wb, ws, row_num, **kwargs):
        # Dicts for required and optional args
        required_args = {'Dest_Group_Name': '',
                         'Syslog_Server': '',
                         'Port': '',
                         'Mgmt_Domain': '',
                         'Severity': '',
                         'Facility': ''}
        optional_args = { }

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Required Arguments
            validating.site_group(row_num, ws, 'Site_Group', templateVars['Site_Group'])
            validating.ipv4(row_num, ws, 'Syslog_Server', templateVars['Syslog_Server'])
            validating.log_level(row_num, ws, 'Severity', templateVars['Severity'])
            validating.port(row_num, ws, 'Port', templateVars['Port'])
            validating.syslog_fac(row_num, ws, 'Facility', templateVars['Facility'])
            templateVars['Mgmt_Domain'] = validating.mgmt_domain(row_num, ws, 'Mgmt_Domain', templateVars['Mgmt_Domain'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        templateVars['Syslog_Server_'] = templateVars['Syslog_Server'].replace('.', '_')

        # Define the Template Source
        template_file = "syslog_rmt.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = 'syslog_rmt_%s.tf' % (templateVars['Syslog_Server_'])
        dest_dir = 'Fabric'
        process_method(wb, ws, row_num, 'w', dest_dir, dest_file, template, **templateVars)

# Terraform ACI Provider - Site Policies
# Class must be instantiated with Variables
class Site_Policies(object):
    def __init__(self, ws):
        self.templateLoader = jinja2.FileSystemLoader(
            searchpath=(aci_template_path))
        self.templateEnv = jinja2.Environment(loader=self.templateLoader)
    
    # Method must be called with the following kwargs.
    # Site_ID: Required.  Number to Represeent the Site
    # Site_Name: Required.  A Name for the Site.  Must only contain alphanumeric and underscore
    # APIC_URL: Required.  URL for the APIC for the Site
    # BGP_AS: Required.  Autonomous System for BGP Process
    # SNMP_Location: Required.  SNMP Location for the APIC Cluster
    # Contract_ID: Required.  Contract for Equipment to be used with Smart CallHome Function
    # Customer_Identifier: Required.  Customer Identifier to be used with Smart CallHome Function
    # Site_Identifier: Required.  Site Identifier to be used with Smart CallHome Function
    # Street_Address: Optional.  Street Address for the Site to be used with Smart CallHome Function
    def site_id(self, wb, ws, row_num, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_ID': '',
                         'Site_Name': '',
                         'APIC_URL': '',
                         'BGP_AS': '',
                         'SNMP_Location': '',
                         'Contract_ID': '',
                         'Customer_Identifier': '',
                         'Site_Identifier': ''}
        optional_args = {'Street_Address': ''}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate BGP AS Number
            validating.bgp_as(row_num, ws, 'BGP_AS', templateVars['BGP_AS'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)

        # Save the Site Information into Environment Variables
        Site_ID = 'Site_ID_%s' % (templateVars['Site_ID'])
        os.environ[Site_ID] = '%s' % (templateVars)

        # Copy the Default Templates to the Appropriate Folders
        copy_defaults(templateVars['Site_Name'], 'Access')
        copy_defaults(templateVars['Site_Name'], 'Access/VLANs')
        copy_defaults(templateVars['Site_Name'], 'Admin')
        copy_defaults(templateVars['Site_Name'], 'Fabric')
        copy_defaults(templateVars['Site_Name'], 'Tenant_common')
        copy_defaults(templateVars['Site_Name'], 'Tenant_infra')
        copy_defaults(templateVars['Site_Name'], 'Tenant_mgmt')

        # Write the variables.tf to the Appropriate Directories
        template_file = "variables.tf"
        template = self.templateEnv.get_template(template_file)
        create_tf_file('w', 'Access/VLANs', template_file, template, **templateVars)
        create_tf_file('w', 'Admin', template_file, template, **templateVars)
        create_tf_file('w', 'Fabric', template_file, template, **templateVars)
        create_tf_file('w', 'Tenant_common', template_file, template, **templateVars)
        create_tf_file('w', 'Tenant_infra', template_file, template, **templateVars)
        create_tf_file('w', 'Tenant_mgmt', template_file, template, **templateVars)

        # Create Directories and default Terraform Files for Tenants in the Tenants Tab if Needed
        ws_tenants = wb['Tenants']
        rows = ws_tenants.max_row
        func_regex = re.compile('^add_tenant$')
        func_list = findKeys(ws, func_regex)
        for func in func_list:
            count = countKeys(ws, func)
            var_dict = findVars(ws, func, rows, count)
            tenant_dir = 'Tenant_%s' % (var_dict['Tenant'])
            copy_defaults(templateVars['Site_Name'], tenant_dir)
            create_tf_file('w', tenant_dir, template_file, template, **templateVars)

        # Create Directories and default Terraform Files for Tenants in the Networks Tab if Needed
        ws_tenants = wb['Networks']
        rows = ws_tenants.max_row
        func_regex = re.compile('^add_net$')
        func_list = findKeys(ws, func_regex)
        for func in func_list:
            count = countKeys(ws, func)
            var_dict = findVars(ws, func, rows, count)
            tenant_dir = 'Tenant_%s' % (var_dict['Tenant'])
            copy_defaults(templateVars['Site_Name'], tenant_dir)
            create_tf_file('w', tenant_dir, template_file, template, **templateVars)

        # Create Directories and default Terraform Files for Switches in the Inventory Tab if Needed
        ws_switches = wb['Inventory']
        rows = ws_switches.max_row
        func_regex = re.compile('^switch$')
        func_list = findKeys(ws, func_regex)
        for func in func_list:
            count = countKeys(ws, func)
            var_dict = findVars(ws, func, rows, count)
            switch_dir = 'Access/%s' % (var_dict['Name'])
            copy_defaults(templateVars['Site_Name'], switch_dir)
            create_tf_file('w', switch_dir, template_file, template, **templateVars)

        # Create TF File for the bgp_as in the Fabric Folder
        template_file = "bgp_as.template"
        template = self.templateEnv.get_template(template_file)
        tf_file = 'bgp_as.tf'
        create_tf_file('w', 'Fabric', tf_file, template, **templateVars)

    # Method must be called with the following kwargs.
    # Group: Required.  A Group Name to represent a list of Site_ID's
    # Site_1: Required.  The Site_ID for the First Site
    # Site_2: Required.  The Site_ID for the Second Site
    # Site_[3-12]: Optional.  The Site_ID for the 3rd thru the 12th Site(s)
    def grp_id(self, wb, ws, row_num, **kwargs):
        # Dicts for required and optional args
        required_args = {'Group': '',
                         'Site_1': '',
                         'Site_2': ''}
        optional_args = {'Site_3': '',
                         'Site_4': '',
                         'Site_5': '',
                         'Site_6': '',
                         'Site_7': '',
                         'Site_8': '',
                         'Site_9': '',
                         'Site_10': '',
                         'Site_11': '',
                         'Site_12': ''}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        for x in range(1, 13):
            site = 'Site_%s' % (x)
            if not templateVars[site] == None:
                validating.site_group(wb, ws, site, templateVars[site])

        grp_count = 0
        for x in list(map(chr, range(ord('A'), ord('F')+1))):
            grp = 'Grp_%s' % (x)
            if templateVars['Group'] == grp:
                grp_count += 1
        if grp_count == 0:
            print(f'\n-----------------------------------------------------------------------------\n')
            print(f'   Error on Worksheet {ws.title}, Row {row_num} Group, Group_Name "{templateVars["Group"]}" is invalid.')
            print(f'   A valid Group Name is Grp_A thru Grp_F.  Exiting....')
            print(f'\n-----------------------------------------------------------------------------\n')
            exit()

        # Save the Site Information into Environment Variables
        Group_ID = '%s' % (templateVars['Group'])
        os.environ[Group_ID] = '%s' % (templateVars)

# Terraform ACI Provider - Tenants Policies
# Class must be instantiated with Variables
class Tenant_Policies(object):
    def __init__(self, ws):
        self.templateLoader = jinja2.FileSystemLoader(
            searchpath=(aci_template_path + 'Tenant_Policies/'))
        self.templateEnv = jinja2.Environment(loader=self.templateLoader)

    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def add_app(self, wb, ws, row_num, **kwargs):
        # Open the Network Policies Worksheet
        ws_net = wb['Network Policies']
        rowcount = ws_net.max_row

        # Dicts for Application Profile; required and optional args
        required_args = {'Site_Group': '',
                        'Tenant': '',
                        'App_Profile': '',
                        'App_Policy': '',
                        'Policy_Name': '',
                        'prio': '',
                        'monEPGPol': ''}
        optional_args = {'annotation': '',
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
            validating.site_group(row_num, ws, 'Site_Group', templateVars['Site_Group'])
            validating.name_rule(row_num, ws, 'Tenant', templateVars['Tenant'])
            validating.name_rule(row_num, ws, 'App_Profile', templateVars['App_Profile'])
            validating.qos_priority(row_count, ws_net, 'prio', templateVars['prio'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)
        
        if templateVars['monEPGPol'] == 'default':
            templateVars['monEPGPol'] = 'uni/tn-common/monepg-default'

        # Define the Template Source
        template_file = "app.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = 'app_%s.tf' % (templateVars['App_Profile'])
        dest_dir = 'Tenant_%s' % (templateVars['Tenant'])
        process_method(wb, ws, row_num, 'w', dest_dir, dest_file, template, **templateVars)

    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def add_bd(self, wb, ws, row_num, **kwargs):
        # Open the Network Policies Worksheet
        ws_net = wb['Network Policies']
        rowcount = ws_net.max_row

        # Dicts for Bridge Domain required and optional args
        required_args = {'Site_Group': '',
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
        optional_args = {'BD_Description': '',
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
            validating.site_group(row_num, ws, 'Site_Group', templateVars['Site_Group'])
            validating.name_rule(row_num, ws, 'Tenant', templateVars['Tenant'])
            validating.name_rule(row_num, ws, 'VRF', templateVars['VRF'])
            validating.name_rule(row_num, ws, 'Bridge_Domain', templateVars['Bridge_Domain'])
            validating.bd_type(row_count, ws_net, 'bd_type', templateVars['bd_type'])
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

        # Define the Template Source
        template_file = "bd.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = 'bd_%s.tf' % (templateVars['Bridge_Domain'])
        dest_dir = 'Tenant_%s' % (templateVars['Tenant'])
        process_method(wb, ws, row_num, 'w', dest_dir, dest_file, template, **templateVars)

    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def add_epg(self, wb, ws, row_num, **kwargs):
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
            validating.site_group(row_num, ws, 'Site_Group', templateVars['Site_Group'])
            validating.name_rule(row_num, ws, 'Tenant', templateVars['Tenant'])
            validating.name_rule(row_num, ws, 'Bridge_Domain', templateVars['Bridge_Domain'])
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

        # Define the Template Source
        template_file = "epg.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = 'epg_%s_%s.tf' % (templateVars['App_Profile'], templateVars['EPG'])
        dest_dir = 'Tenant_%s' % (templateVars['Tenant'])
        process_method(wb, ws, row_num, 'w', dest_dir, dest_file, template, **templateVars)

    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def add_net(self, wb, ws, row_num, **kwargs):
        # Assignt he kwargs to a initial var for each process
        initial_kwargs = kwargs

        # Initialize the Class
        aci_lib_ref = 'Tenant_Policies'
        class_init = '%s(ws)' % (aci_lib_ref)

        # Create Bridge Domain
        eval("%s.%s(wb, ws, row_num, wr_file, **kwargs)" % (class_init, 'add_bd'))
            
        # Create the Subnet if it Exists
        if not kwargs.get('Subnet') == None:
            eval("%s.%s(wb, ws, row_num, wr_file, **kwargs)" % (class_init, 'add_subnet'))

        # Reset kwargs back to initial kwargs
        kwargs = initial_kwargs

        # Create the Application Profile if it Exists
        if not kwargs.get('App_Profile') == None:
            eval("%s.%s(wb, ws, row_num, wr_file, **kwargs)" % (class_init, 'add_app'))

        # Reset kwargs back to initial kwargs
        kwargs = initial_kwargs

        # Create the EPG if it Exists
        if not kwargs.get('EPG') == None:
            eval("%s.%s(wb, ws, row_num, wr_file, **kwargs)" % (class_init, 'add_epg'))

        # Reset kwargs back to initial kwargs
        kwargs = initial_kwargs

    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def add_subnet(self, wb, ws, row_num, **kwargs):
        # Open the Network Policies Worksheet
        ws_net = wb['Network Policies']
        rowcount = ws_net.max_row

        # Dicts for Subnet required and optional args
        required_args = {'Site_Group': '',
                        'Tenant': '',
                        'Bridge_Domain': '',
                        'Subnet': '',
                        'Subnet_Policy': '',
                        'L3Out': '',
                        'Policy_Name': '',
                        'nd': '',
                        'no-default-gateway': '',
                        'querier': '',
                        'preferred': '',
                        'scope': '',
                        'virtual': ''}
        optional_args = {'Subnet_Description': '',
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
            validating.site_group(row_num, ws, 'Site_Group', templateVars['Site_Group'])
            validating.ip_address(row_num, ws, 'Subnet', templateVars['Subnet'])
            validating.name_rule(row_num, ws, 'L3Out', templateVars['L3Out'])
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

        templateVars['Subnet_'] = templateVars['Subnet'].replace('.', '_')

        # Define the Template Source
        template_file = "subnet.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = 'bd_%s_subnet_%s.tf' % (templateVars['Bridge_Domain'], templateVars['Subnet_'])
        dest_dir = 'Tenant_%s' % (templateVars['Tenant'])
        process_method(wb, ws, row_num, 'w', dest_dir, dest_file, template, **templateVars)

    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def add_tenant(self, wb, ws, row_num, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'Tenant': ''}
        optional_args = {'Description': ''}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Required Arguments
            validating.site_group(row_num, ws, 'Site_Group', templateVars['Site_Group'])
            validating.name_rule(row_num, ws, 'Tenant', templateVars['Tenant'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)



        # Define the Template Source
        template_file = "tenant.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = 'tenant_%s.tf' % (templateVars['Tenant'])
        dest_dir = 'Tenant_%s' % (templateVars['Tenant'])
        process_method(wb, ws, row_num, 'w', dest_dir, dest_file, template, **templateVars)

    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def add_vrf(self, wb, ws, row_num, **kwargs):
        # Open the Network Policies Worksheet
        ws_net = wb['Network Policies']
        rowcount = ws_net.max_row

        # Dicts for required and optional args
        required_args = {'Site_Group': '',
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
        optional_args = {'Description': '',
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
            # Validate Required Arguments
            validating.site_group(row_num, ws, 'Site_Group', templateVars['Site_Group'])
            validating.name_rule(row_num, ws, 'Tenant', templateVars['Tenant'])
            validating.name_rule(row_num, ws, 'VRF', templateVars['VRF'])
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


        # Define the Template Source
        template_file = "vrf.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = 'vrf_%s.tf' % (templateVars['VRF'])
        dest_dir = 'Tenant_%s' % (templateVars['Tenant'])
        process_method(wb, ws, row_num, 'w', dest_dir, dest_file, template, **templateVars)

        if templateVars['enf_type'] == 'pref_grp':
            # Define the Template Source
            template_file = "pref_grp.template"
            template = self.templateEnv.get_template(template_file)

            # Process the template through the Sites
            dest_file = 'vrf_%s.tf' % (templateVars['VRF'])
            dest_dir = 'Tenant_%s' % (templateVars['Tenant'])
            process_method(wb, ws, row_num, 'w+', dest_dir, dest_file, template, **templateVars)

        elif templateVars['enf_type'] == 'vzAny':
            # Define the Template Source
            template_file = "vzAny.template"
            template = self.templateEnv.get_template(template_file)

            # Process the template through the Sites
            dest_file = 'vrf_%s.tf' % (templateVars['VRF'])
            dest_dir = 'Tenant_%s' % (templateVars['Tenant'])
            process_method(wb, ws, row_num, 'w+', dest_dir, dest_file, template, **templateVars)

        # Define the Template Source
        template_file = "snmp_ctx.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = 'vrf_%s.tf' % (templateVars['VRF'])
        dest_dir = 'Tenant_%s' % (templateVars['Tenant'])
        process_method(wb, ws, row_num, 'w+', dest_dir, dest_file, template, **templateVars)

    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def ctx_comm(self, wb, ws, row_num, **kwargs):
        # Dicts for required and optional args
        required_args = {'Site_Group': '',
                         'Tenant': '',
                         'VRF': '',
                         'Ctx_Community': ''}
        optional_args = {'Description': ''}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        try:
            # Validate Required Arguments
            validating.site_group(row_num, ws, 'Site_Group', templateVars['Site_Group'])
            validating.name_rule(row_num, ws, 'Tenant', templateVars['Tenant'])
            validating.name_rule(row_num, ws, 'VRF', templateVars['VRF'])
            validating.snmp_string(row_num, ws, 'Ctx_Community', templateVars['Ctx_Community'])
        except Exception as err:
            Error_Return = '%s\nError on Worksheet %s Row %s.  Please verify Input Information.' % (SystemExit(err), ws, row_num)
            raise ErrException(Error_Return)

        # Define the Template Source
        template_file = "snmp_ctx_community.template"
        template = self.templateEnv.get_template(template_file)

        # Process the template through the Sites
        dest_file = 'vrf_%s.tf' % (templateVars['VRF'])
        dest_dir = 'Tenant_%s' % (templateVars['Tenant'])
        process_method(wb, ws, row_num, 'w+', dest_dir, dest_file, template, **templateVars)

    # Method must be called with the following kwargs.
    # Please Refer to the "Excel Spreadsheet Guidance" PDF File  
    # for Detailed information on the Arguments used by this Method.
    def static_path(self, wb, ws, row_num, **kwargs):
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
                validating.node_id(row_num, ws, 'Node_ID', node_1)
                validating.node_id(row_num, ws, 'Node_ID', node_2)
            else:
                validating.node_id(row_num, ws, 'Node_ID', node_id)
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

def copy_defaults(Site_Name, dest_dir):
    src_dir = './ACI/templates'
    dest_dir = './ACI/%s/%s' % (Site_Name, dest_dir)
    if not os.path.isdir(dest_dir):
        mk_dir = 'mkdir -p %s' % (dest_dir)
        os.system(mk_dir)
    cp_main = 'cp %s/main.tf %s/.gitignore %s/' % (src_dir, src_dir, dest_dir)
    os.system(cp_main)

    if dest_dir == 'Access':
        cp_template = 'cp %s/defaults_Fabric_Access_Policies.tf %s/vars_Fabric_Access_Policies.tf %s/' % (src_dir, src_dir, dest_dir)
        os.system(cp_template)
    if dest_dir == 'Admin':
        cp_template = 'cp %s/defaults_Admin.tf %s/' % (src_dir, dest_dir)
        os.system(cp_template)
    elif dest_dir == 'Fabric':
        cp_template = 'cp %s/defaults_Fabric_Fabric_Policies.tf %s/vars_Fabric_Fabric_Policies.tf %s/' % (src_dir, src_dir, dest_dir)
        os.system(cp_template)
    elif dest_dir == 'Tenant_common':
        cp_template = 'cp %s/defaults_Tenant_common.tf %s/' % (src_dir, dest_dir)
        os.system(cp_template)
    elif dest_dir == 'Tenant_infra':
        cp_template = 'cp %s/defaults_Tenant_infra.tf %s/' % (src_dir, dest_dir)
        os.system(cp_template)
    elif dest_dir == 'Tenant_mgmt':
        cp_template = 'cp %s/defaults_Tenant_mgmt.tf %s/' % (src_dir, dest_dir)
        os.system(cp_template)

def create_tf_file(wr_method, dest_dir, dest_file, template, **templateVars):
    # Create File for the Template in the Destination Folder
    tf_file = './ACI/%s/%s/%s' % (templateVars['Site_Name'], dest_dir, dest_file)
    wr_file = open(tf_file, wr_method)
    
    # Render Payload and Write to File
    payload = template.render(templateVars)
    wr_file.write(payload + '\n\n')
    wr_file.close()

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

# Function to Apply Method to Site(s)
def process_method(wb, ws, row_num, wr_method, dest_dir, dest_file, template, **templateVars):
    if re.search('Grp_[A-F]', templateVars['Site_Group']):
        Group_ID = '%s' % (templateVars['Site_Group'])
        site_group = ast.literal_eval(os.environ[Group_ID])
        for x in range(1, 13):
            sitex = 'Site_%s' % (x)
            if not site_group[sitex] == None:
                Site_ID = 'Site_ID_%s' % (site_group[sitex])
                site_dict = ast.literal_eval(os.environ[Site_ID])

                # Create templateVars for Site_Name and APIC_URL
                templateVars['Site_Name'] = site_dict.get('Site_Name')
                templateVars['APIC_URL'] = site_dict.get('APIC_URL')

                # Create Terraform file from Template
                create_tf_file(wr_method, dest_dir, dest_file, template, **templateVars)

    elif re.search(r'\d+', templateVars['Site_Group']):
        Site_ID = 'Site_ID_%s' % (templateVars['Site_Group'])
        site_dict = ast.literal_eval(os.environ[Site_ID])

        # Create templateVars for Site_Name and APIC_URL
        templateVars['Site_Name'] = site_dict.get('Site_Name')
        templateVars['APIC_URL'] = site_dict.get('APIC_URL')

        # Create Terraform file from Template
        create_tf_file(wr_method, dest_dir, dest_file, template, **templateVars)
    else:
        print(f"\n-----------------------------------------------------------------------------\n")
        print(f"   Error on Worksheet {ws.title}, Row {row_num} Site_Group, value {templateVars['Site_Group']}.")
        print(f"   Unable to Determine if this is a Single or Group of Site(s).  Exiting....")
        print(f"\n-----------------------------------------------------------------------------\n")
        exit()

# Function to Determine Port Count on Modules
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

def runProcess(exe):    
    p = subprocess.Popen(exe, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    while(True):
        # returns None while subprocess is running
        retcode = p.poll() 
        line = p.stdout.readline()
        yield line
        if retcode is not None:
            break

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