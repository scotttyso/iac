#!/usr/bin/env python3

import aci_lib
import getpass
import ipaddress
import openpyxl
import pathlib
import re, os, sys, time
import requests
import urllib3
from openpyxl import load_workbook,workbook
from openpyxl.styles import Alignment, colors, Border, Font, NamedStyle, PatternFill, Protection, Side 
from openpyxl.utils.dataframe import dataframe_to_rows
from ordered_set import OrderedSet
from pathlib import Path

Access_regex = re.compile('(brk_out|add_apg|add_pcg|add_vpc)')
Admin_regex = re.compile('(backup|radius|tacacs|realm)')
Fabric_regex = re.compile('(dns|dns_mgmt|domain|ntp|smartcallhome|snmp_(client|comm|info|trap|user)|syslog_(dg|rmt))')
Inventory_regex = re.compile('(inband_vlan|switch|95[0-1][4-8]|vpc_pair|apic_inb)')
netseg_regex = re.compile('(add_to_apic)')
System_regex = re.compile('(bgp_(as|rr))')
Tenant_regex = re.compile('(add_tenant)')
VRF_regex = re.compile('(add_vrf)')

# Log levels 0 = None, 1 = Class only, 2 = Line
log_level = 1

excel_workbook = None
home = Path.home()

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


def read_in(excel_workbook):
    try:
        wb = load_workbook(excel_workbook)
        print("Workbook Loaded.")
    except Exception as e:
        print("Something went wrong while opening the workbook - ABORT!")
        sys.exit(e)
    return wb


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

def countKeys(ws, func):
    count = 0
    for i in ws.rows:
        if any(i):
            if str(i[0].value) == func:
                count += 1
    return count


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
    print(f'var dictionary is {var_dict}')
    return var_dict

def wb_update(wr_ws, status, i):
    # build green and red style sheets for excel
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
    green_st = NamedStyle(name="ws_odd")
    green_st.alignment = Alignment(horizontal="center", vertical="center")
    green_st.border = Border(left=bd2, top=bd2, right=bd2, bottom=bd2)
    green_st.fill = PatternFill("solid", fgColor="D9E1F2")
    green_st.font = Font(bold=False, size=12, color="44546A")
    red_st = NamedStyle(name="ws_even")
    red_st.alignment = Alignment(horizontal="center", vertical="center")
    red_st.border = Border(left=bd2, top=bd2, right=bd2, bottom=bd2)
    red_st.font = Font(bold=False, size=12, color="44546A")
    yellow_st = NamedStyle(name="ws_even")
    yellow_st.alignment = Alignment(horizontal="center", vertical="center")
    yellow_st.border = Border(left=bd2, top=bd2, right=bd2, bottom=bd2)
    yellow_st.font = Font(bold=False, size=12, color="44546A")
    # green_st = xlwt.easyxf('pattern: pattern solid;')
    # green_st.pattern.pattern_fore_colour = 3
    # red_st = xlwt.easyxf('pattern: pattern solid;')
    # red_st.pattern.pattern_fore_colour = 2
    # yellow_st = xlwt.easyxf('pattern: pattern solid;')
    # yellow_st.pattern.pattern_fore_colour = 5
    # if stanzas to catch the status code from the request
    # and then input the appropriate information in the workbook
    # this then writes the changes to the doc
    if status == 200:
        wr_ws.write(i, 1, 'Success (200)', green_st)
    if status == 400:
        print("Error 400 - Bad Request - ABORT!")
        print("Probably have a bad URL or payload")
        wr_ws.write(i, 1, 'Bad Request (400)', red_st)
        pass
    if status == 401:
        print("Error 401 - Unauthorized - ABORT!")
        print("Probably have incorrect credentials")
        wr_ws.write(i, 1, 'Unauthorized (401)', red_st)
        pass
    if status == 403:
        print("Error 403 - Forbidden - ABORT!")
        print("Server refuses to handle your request")
        wr_ws.write(i, 1, 'Forbidden (403)', red_st)
        pass
    if status == 404:
        print("Error 404 - Not Found - ABORT!")
        print("Seems like you're trying to POST to a page that doesn't"
              " exist.")
        wr_ws.write(i, 1, 'Not Found (400)', red_st)
        pass
    if status == 666:
        print("Error - Something failed!")
        print("The POST failed, see stdout for the exception.")
        wr_ws.write(i, 1, 'Unkown Failure', yellow_st)
        pass
    if status == 667:
        print("Error - Invalid Input!")
        print("Invalid integer or other input.")
        wr_ws.write(i, 1, 'Unkown Failure', yellow_st)
        pass

def read_worksheet(wb, ws, wr_file, aci_lib_ref):
    rows = ws.max_row
    func_list = findKeys(ws)
    class_init = '%s(ws)' % (aci_lib_ref)
    stdout_log(ws, None)
    for func in func_list:
        count = countKeys(ws, func)
        var_dict = findVars(ws, func, rows, count)
        for pos in var_dict:
            row_num = var_dict[pos]['row']
            del var_dict[pos]['row']
            for x in list(var_dict[pos].keys()):
                if var_dict[pos][x] == '':
                    del var_dict[pos][x]
            stdout_log(ws, row_num)
            eval("%s.%s(row_num, wr_file, **var_dict[pos])" % (class_init, func))
            # status = eval("%s.%s(wr_file, row_num, **var_dict[pos])" % (aci_lib_ref, func))
            # print(status)
            #wb_update(wr_ws, status, row_num)

def process_Access(wb):
    cp_main = 'cp ./templates/main.tf ./templates/variables.tf ./Access/'
    cp_access = 'cp ./templates/defaults_Fabric_Access_Policies.tf ./templates/vars_Fabric_Access_Policies.tf ./Access/'
    os.system(cp_main)
    os.system(cp_access)

    # Creating User Input Access Policies File to attached policies for
    # Policies Related to Fabric > Access Policies.
    file_Access_Policies = './Access/resources_Fabric_Access_Policies.tf'
    wr_file = open(file_Access_Policies, 'w')
    wr_file.write('/*\n This File will include Policies Related to Fabric > Access Policies\n*/\n\n')

    # Evaluate Inventory Worksheet
    ws = wb['Inventory']
    aci_lib_ref = 'aci_lib.Access_Policies'
    read_worksheet(wb, ws, wr_file, aci_lib_ref)

    # Evaluate Access Worksheet
    ws = wb['Access']
    read_worksheet(wb, ws, wr_file, aci_lib_ref)
    wr_file.close()
    
def process_Admin(wb):
    cp_main = 'cp ./templates/main.tf ./templates/variables.tf ./Admin/'
    cp_admin = 'cp ./templates/defaults_Admin.tf ./templates/vars_Admin.tf ./Admin/'
    os.system(cp_main)
    os.system(cp_admin)

    # Creating User Input Admin Policies File to attached policies for
    # Backup Policy, RADIUS, TACACS, and Authentication Realms.
    file_Admin_Policies = './Admin/resources_Admin_Policies.tf'
    wr_file = open(file_Admin_Policies, 'w')
    wr_file.write('/*\n This File will include Backup Policies, RADIUS, TACACS+ and Authentication Realm Policies\n*/\n\n')

    # Evaluate Admin Worksheet
    ws = wb['Admin']
    aci_lib_ref = 'aci_lib.Admin_Policies'
    read_worksheet(wb, ws, wr_file, aci_lib_ref)
    wr_file.close()
    
def process_Fabric(wb):
    cp_main = 'cp ./templates/main.tf ./templates/variables.tf ./Fabric/'
    cp_fabric = 'cp ./templates/defaults_Fabric_Access_Policies.tf ./templates/vars_Fabric_Access_Policies.tf ./Fabric/'
    cp_best = 'cp ./templates/defaults_Fabric_Fabric_Policies.tf ./templates/vars_Fabric_Fabric_Policies.tf ./Fabric/'
    os.system(cp_main)
    os.system(cp_fabric)
    os.system(cp_best)

    # Creating User Input Fabric Policies File to attached policies for
    # DNS, Domain, NTP, SmartCallHome, SNMP, Syslog, TACACS Accounting etc.
    file_Fabric_Policies = './Fabric/resources_Fabric_Fabric_Policies.tf'
    wr_file = open(file_Fabric_Policies, 'w')
    wr_file.write('/*\n This File will include DNS, Domain, NTP, SmartCallHome,\n SNMP, Syslog and other Fabric Policy Configurations\n*/\n\n')

    # Evaluate Fabric Worksheet
    ws = wb['Fabric']
    aci_lib_ref = 'aci_lib.Fabric_Policies'
    read_worksheet(wb, ws, wr_file, aci_lib_ref)
    wr_file.close()

def process_Tenants(wb):
    cp_main = 'cp ./templates/main.tf ./templates/variables.tf ./Tenants/'
    cp_tenant = 'cp ./templates/defaults_Tenants.tf ./Tenants/'
    os.system(cp_main)
    os.system(cp_tenant)

    # Creating User Input Tenant File to attached policies for
    # Policies Related to Tenants.
    file_Access_Policies = './Tenant/resources_Tenants.tf'
    wr_file = open(file_Access_Policies, 'w')
    wr_file.write('/*\n This File will include Policies Related to Tenants\n*/\n\n')

    # Evaluate Tenants Worksheet
    ws = wb['Tenants']
    aci_lib_ref = 'aci_lib.Tenant_Policies'
    read_worksheet(wb, ws, wr_file, aci_lib_ref)

    # Evaluate VRF Worksheet
    ws = wb['VRF']
    read_worksheet(wb, ws, wr_file, aci_lib_ref)
    wr_file.close()
    
def main():
    # Disable urllib3 warnings
    urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

    # Ask user for required Information: ACI_DEPLOY_FILE
    if sys.argv[1:]:
        if os.path.isfile(sys.argv[1]):
            excel_workbook = sys.argv[1]
        else:
            print('\nWorkbook not Found.  Please enter a valid /path/filename for the source you will be using.')
            while True:
                print('Please enter a valid /path/filename for the source you will be using.')
                excel_workbook = input('/Path/Filename: ')
                if os.path.isfile(excel_workbook):
                    print(f'\n-----------------------------------------------------------------------------\n')
                    print(f'   {excel_workbook} exists.  Will Now Check for API Variables...')
                    print(f'\n-----------------------------------------------------------------------------\n')
                    break
                else:
                    print('\nWorkbook not Found.  Please enter a valid /path/filename for the source you will be using.')
    else:
        while True:
            print('Please enter a valid /path/filename for the source you will be using.')
            excel_workbook = input('/Path/Filename: ')
            if os.path.isfile(excel_workbook):
                print(f'\n-----------------------------------------------------------------------------\n')
                print(f'   {excel_workbook} exists.  Will Now Check for API Variables...')
                print(f'\n-----------------------------------------------------------------------------\n')
                break
            else:
                print('\nWorkbook not Found.  Please enter a valid /path/filename for the source you will be using.')

    # Load Workbook
    wb = read_in(excel_workbook)

    # Run Proceedures for Worksheets in the Workbook
    process_Fabric(wb)
    # process_Inventory(wb)
    # process_Access(wb)
    process_Admin(wb)
    # process_System(wb)
    # process_Tenant(wb)
    
if __name__ == '__main__':
    main()