#!/usr/bin/env python3

import ipaddress
import phonenumbers
import re
import validators


# Validations
def auth_proto(row_num, ws, var, var_value):
    if not re.search('^(chap|mschap|pap)$', var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, {var_value}. ')
        print(f'   Valid Values are: "chap|mschap|pap".  ')
        print(f'   Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def auth_type(row_num, ws, var, var_value):
    if not re.search('^(password|ssh-key)$', var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}. Valid Values are:')
        print(f'   password or ssh-key.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def alloc_mode(row_num, ws, var, var_value):
    if not re.search('^(dynamic|static)$', var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}. Valid Values are:')
        print(f'   dynamic or static.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def auth_realm(row_num, ws, var, var_value):
    if not re.fullmatch('^(console|default)$', var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, "{var_value}"')
        print(f'   The Authentication Realm should be one of the following: ')
        print(f'   [console|default]')
        print(f'   "{var_value}" did not match one of these types.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def bgp_as(row_num, ws, var, var_value):
    bgp_as=int(var_value)
    if not validators.between(int(bgp_as), min=1, max=4294967295):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, AS "{bgp_as}" is invalid.')
        print(f'   A valid BGP AS is between 1 and 4294967295.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def bd_type(row_num, ws, var, var_value):
    if not re.search('^(fc|regular)$', var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}. Valid Values are:')
        print(f'   fc or regular.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def brkout_pg(row_num, brkout_pg):
    if not re.search('(2x100g_pg|4x100g_pg|4x10g_pg|4x25g_pg|8x50g_pg)', brkout_pg):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Row {row_num}. Breakout Port Group is Invalid.  Valid Values are:')
        print(f'   2x100g_pg, 4x100g_pg, 4x10g_pg, 4x25g_pg, and 8x50g_pg.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def controller(row_num, ws, var, var_value):
    if not re.search('^(APIC|MSO)$', var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}. Valid Values are:')
        print(f'   APIC or MSO.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def deny(row_num, ws, var, var_value):
    if not re.search('^(deny|permit)$', var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}. Valid Values are:')
        print(f'   deny or permit.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def direction(row_num, ws, var, var_value):
    if not re.search('^(egress|ingress)$', var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}. Valid Values are:')
        print(f'   egress or ingress.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def domain(row_num, ws, var, var_value):
    if not validators.domain(var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}. Domain {var_value}')
        print(f'   is invalid.  Please Validate the domain and retry.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def email(row_num, ws, var, var_value):
    if not validators.email(var_value, whitelist=None):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}. Email address "{var_value}"')
        print(f'   is invalid.  Please Validate the email and retry.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def enable(row_num, ws, var, var_value):
    var_value = var_value.lower()
    if not re.search('^(disable|enable)$', var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}. Valid Values are:')
        print(f'   disable or enable.  Please select from the drop-down.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def enabled(row_num, ws, var, var_value):
    if not re.search('^(disabled|enabled)$', var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}. Valid Values are:')
        print(f'   disabled or enabled.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def encryption_key(row_num, ws, var, var_value):
    if not validators.length(str(var_value), min=16, max=32):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}. The Encryption Key')
        print(f'   Length must be between 16 and 32 characters.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def enforcement(row_num, ws, var, var_value):
    if not re.search('^(enforced|unenforced)$', var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}. Valid Values are:')
        print(f'   enforced or unenforced.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def enforce_type(row_num, ws, var, var_value):
    if not re.search('^(contract|pref_grp|vzAny)$', var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}. Valid Values are:')
        print(f'   contract, pref_grp or vzAny.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def error_enforce(row_num, vrf):
    print(f'\n-----------------------------------------------------------------------------\n')
    print(f'   Error on Row {row_num}. VRF {vrf}, Enforcement was not defined in the')
    print(f'   VRF Worksheet.  Exiting....')
    print(f'\n-----------------------------------------------------------------------------\n')
    exit()

def error_enforcement(row_num, epg, ws2, ws3):
    print(f'\n-----------------------------------------------------------------------------\n')
    print(f'   Error on Row {row_num} of Worksheet {ws3}. Enforcement on the EPG {epg}')
    print(f'   is set to enforced but the VRF is unenforced in {ws2}.  Exiting....')
    print(f'\n-----------------------------------------------------------------------------\n')
    exit()

def error_int_selector(row_num, ws, int_select):
    print(f'\n-----------------------------------------------------------------------------\n')
    print(f'   Error on Row {row_num} of Worksheet {ws}. Interface Selector {int_select}')
    print(f'   was not found in the terraform state file.  Exiting....')
    print(f'\n-----------------------------------------------------------------------------\n')
    exit()


def error_switch(row_num, ws, switch_ipr):
    print(f'\n-----------------------------------------------------------------------------\n')
    print(f'   Error on Row {row_num} of Worksheet {ws}. Interface Profile {switch_ipr}')
    print(f'   was not found in the terraform state file.  Exiting....')
    print(f'\n-----------------------------------------------------------------------------\n')
    exit()

def error_tenant(row_num, tenant, ws1, ws2):
    print(f'\n-----------------------------------------------------------------------------\n')
    print(f'   Error on Row {row_num} of Worksheet {ws2}. Tenant {tenant} was not found')
    print(f'   in the {ws1} Worksheet.  Exiting....')
    print(f'\n-----------------------------------------------------------------------------\n')
    exit()

def error_vlan_to_epg(row_num, vlan, ws):
    print(f'\n-----------------------------------------------------------------------------\n')
    print(f'   Error on Row {row_num}. Did not Find EPG corresponding to VLAN {vlan}')
    print(f'   in Worksheet {ws}.  Exiting....')
    print(f'\n-----------------------------------------------------------------------------\n')
    exit()

def error_vrf(row_num, vrf):
    print(f'\n-----------------------------------------------------------------------------\n')
    print(f'   Error on Row {row_num}. VRF {vrf} was not found in the VRF Worksheet.')
    print(f'   Exiting....')
    print(f'\n-----------------------------------------------------------------------------\n')
    exit()

def flood(row_num, ws, var, var_value):
    if not re.search('^(flood|opt-flood)$', var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}. Valid Values are:')
        print(f'   flood or opt-flood.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def flood_bd(row_num, ws, var, var_value):
    if not re.search('^(bd-flood|drop|encap-flood)$', var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}. Valid Values are:')
        print(f'   bd-flood, drop or encap-flood.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def garp(row_num, ws, var, var_value):
    if not re.search('^garp$', var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}. Valid Values are:')
        print(f'   garp.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def hostname(row_num, ws, var, var_value):
    pattern = re.compile('^[a-zA-Z0-9\\-]+$')
    if not re.search(pattern, var_value) and validators.length(var_value, min=1, max=63):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, {var_value} ')
        print(f'   is not a valid Hostname.  Be sure you are not using the FQDN.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def hour(row_num, ws, var, var_value):
    if not validators.between(int(var_value), min=0, max=23):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num}. {var} "{var_value}" is invalid.')
        print(f'   Hour of the Day should be between 0 and 23.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def include(row_num, ws, var, var_value):
    if not re.search('^(exclude|include)$', var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}. Valid Values are:')
        print(f'   exclude or include.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def int_type(row_num, ws, var, var_value):
    if not re.search('^(port-channel|vpc)$', var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, value {var_value}:')
        print(f'   The Bundle Type should be port-channel or vpc.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def ip_address(row_num, ws, var, var_value):
    x = var_value.split('/')
    ip_add = x[0]
    if not ipaddress.ip_address(ip_add):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title} Row {row_num}. {var} {var_value} is not ')
        print(f'   a valid IP Address.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def ipv4(row_num, ws, var, var_value):
    if not ipaddress.IPv4Address(var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title} Row {row_num}. {var} {var_value} is not ')
        print(f'   a valid IPv4 Address.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def link_level(row_num, ws, var, var_value):
    if not re.search('(_Auto|_NoNeg)$', var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, value {var_value}:')
        print(f'   Please Select a valid Link Level from the drop-down menu.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()
    if not re.search('^(100M_|1G_|(1|4|5)0G_|25G_|[1-2]00G_|400G_|inherit_)', var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, value {var_value}:')
        print(f'   Please Select a valid Link Level from the drop-down menu.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def log_level(row_num, ws, var, var_value):
    if var == 'Severity' or var == 'Local_Level' or var == 'Minimum_Level':
        if not re.match('(emergencies|alerts|critical|errors|warnings|notifications|information|debugging)', var_value):
            print(f'\n-----------------------------------------------------------------------------\n')
            print(f'   Error on Worksheet {ws.title} Row {row_num}. Logging Level for "{var}"')
            print(f'   with "{var_value}" is not valid.  Logging Levels can be:')
            print(f'   [emergencies|alerts|critical|errors|warnings|notifications|information|debugging]')
            print(f'   Exiting....')
            print(f'\n-----------------------------------------------------------------------------\n')
            exit()
    elif var == 'Console_Level':
        if not re.match('^(emergencies|alerts|critical)$', var_value):
            print(f'\n-----------------------------------------------------------------------------\n')
            print(f'   Error on Worksheet {ws.title} Row {row_num}. Logging Level for "{var}"  with "{var_value}"')
            print(f'   is not valid.  Logging Levels can be: [emergencies|alerts|critical].  Exiting....')
            print(f'\n-----------------------------------------------------------------------------\n')
            exit()

def login_domain(row_num, ws, var, var_value):
    login_domain_count = 0
    if not re.fullmatch('^([a-zA-Z0-9\\_+]+)$', var_value):
        login_domain_count += 1
    elif not validators.length(var_value, min=1, max=10):
        login_domain_count += 1
    if not login_domain_count == 0:
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num}, {var}, {var_value}.  To Keep things simple')
        print(f'   for users, the login domain must be between 1 and 10 characters.  The only non')
        print(f'   alphanumericcharacters allowed is "_" or "+"; but it must not start with "_".')
        print(f'   "{var_value}" did not meet these restrictions.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def login_type(row_num, ws, var1, var1_value, var2, var2_value):
    login_type_count = 0
    if var1_value == 'console':
        if not re.fullmatch('^(local|ldap|radius|tacacs|rsa)$', var2_value):
            login_type_count += 1
    elif var1_value == 'default':
        if not re.fullmatch('^(local|ldap|radius|tacacs|rsa|saml)$', var2_value):
            login_type_count += 1
    if not login_type_count == 0:
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error in Worksheet {ws.title} Row {row_num}.  The Login Domain Type should be')
        print(f'   one of the following:')
        if var1_value == 'console':
            print(f'       [local|ldap|radius|tacacs|rsa]')
        elif var1_value == 'default':
            print(f'       [local|ldap|radius|tacacs|rsa|saml]')
        print(f'   "{var2_value}" did not match one of these types.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def match_t(row_num, ws, var, var_value):
    if not re.search('^(All|AtleastOne|AtmostOne|None)$', var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}. Valid Values are:')
        print(f'   All, AtleastOne, AtmostOne or None.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def match_current_gw(row_num, current_inb_gwv4, inb_gwv4):
    if not current_inb_gwv4 == inb_gwv4:
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Line {row_num}.  Current inband = "{current_inb_gwv4}" and found')
        print(f'   "{inb_gwv4}".  The Inband Network should be the same on all APICs and Switches.')
        print(f'   A Different Gateway was found.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def minute(row_num, ws, var, var_value):
    if not validators.between(int(var_value), min=0, max=59):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num}. {var} "{var_value}" is invalid.')
        print(f'   Minute of the Hour should be between 0 and 59.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def mgmt_domain(row_num, ws, var, var_value):
    if var_value == 'oob':
        var_value = 'oob-default'
    elif var_value == 'inband':
        var_value = 'inb-default'
    else:
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var} value {var_value}.')
        print(f'   The Management Domain Should be inband or oob.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()
    return var_value

def mgmt_network(row_num, ws, var1, var1_value, var2, var2_value):
    mgmt_check_ip = ipaddress.IPv4Interface(var1_value)
    mgmt_network = mgmt_check_ip.network
    if not ipaddress.IPv4Address(var2_value) in ipaddress.IPv4Network(mgmt_network):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num}.')
        print(f'   {var1} Network does not Match {var2} Network.')
        print(f'   Mgmt IP/Network: "{var1_value}"')
        print(f'   Gateway IP: "{var2_value}".  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def modules(row_num, name, switch_role, modules):
    module_count = 0
    if switch_role == 'leaf' and int(modules) == 1:
        module_count += 1
    elif switch_role == 'leaf':
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Row {row_num}. {name} module count is not valid.')
        print(f'   A Leaf can only have one module.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()
    elif switch_role == 'spine' and int(modules) < 17:
        module_count += 1
    elif switch_role == 'spine':
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Row {row_num}. {name} module count is not valid.')
        print(f'   A Spine needs between 1 and 16 modules.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def mtu(row_num, ws, var, var_value):
    if not validators.between(int(var_value), min=1300, max=9000):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, value {var_value}:')
        print(f'   The MTU Should be between 1300 and 9000.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def name_rule(row_num, ws, var, var_value):
    if not re.fullmatch(r'^[a-zA-Z0-9\_\-]+$', var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, value {var_value}:')
        print(f'   {var_value} does not meet complexity rules.')
        print(f'   Allowed Characters are A-Z, a-z, 0-9, underscore or dash.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def node_id(row_num, ws, var, var_value):
    if not validators.between(int(var_value), min=101, max=4001):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, value {var_value}:')
        print(f'   A valid Node ID is between 101 and 4000.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def node_id_apic(row_num, ws, var, var_value):
    if not validators.between(int(var_value), min=1, max=7):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, value {var_value}:')
        print(f'   A valid APIC ID is between 1 and 7.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def node_type(row_num, name, node_type):
   if not re.search('^(remote-leaf-wan|unspecified)$', node_type):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Row {row_num}. {name} node_type "{node_type}" is not valid.')
        print(f'   Valid node_types are remote-leaf-wan or unspecified.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def noyes(row_num, ws, var, var_value):
    if not re.search('^(no|yes)$', var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}. Valid Values are:')
        print(f'   yes or no.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def number_check(row_num, ws, var, var_value):
    if var == 'Passwd_Intv':
        min_x, max_x = 0, 745
    elif var == 'Number_Allowed':
        min_x, max_x = 0, 10
    elif var == 'Passwd_Store':
        min_x, max_x = 0, 15
    elif var == 'Failed_Attempts':
        min_x, max_x = 1, 15
    elif var == 'Time_Period':
        min_x, max_x = 1, 720
    elif var == 'Dur_Lockout':
        min_x, max_x = 1, 1440
    elif var == 'Token_Timeout':
        min_x, max_x = 300, 9600
    elif var == 'Maximum_Valid':
        min_x, max_x = 0, 24
    elif var == 'Web_Timeout':
        min_x, max_x = 60, 65525
    if not (var_value >= min_x and var_value <= max_x):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, {var_value}. Valid Values ')
        print(f'   are between {min_x} and {max_x}.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def phone(row_num, ws, var, var_value):
    phone_number = phonenumbers.parse(var_value, None)
    if not phonenumbers.is_possible_number(phone_number):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}. Phone Number "{phone_number}" ')
        print(f'   is invalid.  Make sure you are including the country code and the full phone number.')
        print(f'   Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def pod_id(row_num, ws, var, var_value):
    if not validators.between(int(var_value), min=1, max=12):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}. Pod_ID "{var_value}" ')
        print(f'   is invalid.  A valid Pod ID is between 1 and 12.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def port(row_num, ws, var, var_value):
    if not validators.between(int(var_value), min=1, max=65535):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}. Port "{var_value}" ')
        print(f'   is invalid.  A valid Port Number is between 1 and 65535.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def port_count(row_num, name, switch_role, port_count):
    if not re.search('^(16|32|34|36|48|54|60|64|66|102|108)$', port_count):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Row {row_num}. {name} port count of {port_count} is not valid.')
        print(f'   Valid port counts are 16, 32, 34, 36, 48, 54, 60, 64, 66, 102, 108.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def proxy(row_num, ws, var, var_value):
    if not re.search('^(flood|proxy)$', var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}. Valid Values are:')
        print(f'   flood or proxy.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def proxy_arp(row_num, ws, var, var_value):
    if not re.search('^(none|proxy-arp)$', var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}. Valid Values are:')
        print(f'   none or proxy-arp.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def qos_priority(row_num, ws, var, var_value):
    if not re.search('^(level[1-6]|unspecified)$', var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}. Valid Values are:')
        print(f'   level1, level2, level3, level4, level5, level6 or unspecified.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def retry(row_num, ws, var, var_value):
    if not validators.between(int(var_value), min=1, max=5):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, {var_value}. ')
        print(f'   The Retry shold be between 1 and 5.  "{var_value}" does not meet this.')
        print(f'   Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def role(row_num, name, switch_role):
    if not re.search('^(leaf|spine)$', switch_role):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Row {row_num}. {name} role {switch_role} is not valid.')
        print(f'   Valid switch_roles are leaf or spine, which are required by the')
        print(f'   script to determine resources to build.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def site_group(row_num, ws, var, var_value):
    if re.search('Grp_', var_value):
        if not re.search('Grp_[A-F]', var_value):
            print(f'\n-----------------------------------------------------------------------------\n')
            print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, Site_Group "{var_value}"')
            print(f'   is invalid.  A valid Group Name is Grp_A thru Grp_F.  Exiting....')
            print(f'\n-----------------------------------------------------------------------------\n')
            exit()
    elif re.search(r'\d+', var_value):
        if not validators.between(int(var_value), min=1, max=12):
            print(f'\n-----------------------------------------------------------------------------\n')
            print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, Site_Group "{var_value}"')
            print(f'   is invalid.  A valid Site ID is between 1 and 12.  Exiting....')
            print(f'\n-----------------------------------------------------------------------------\n')
            exit()
    else:
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, Site_Group "{var_value}"')
        print(f'   is invalid.  A valid Site_Group is either 1 thru 12 or Group_A thru Group_F.')
        print(f'   Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def secret(row_num, ws, var, var_value):
    if not validators.length(var_value, min=1, max=32):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num}, {var}, {var_value}')
        print(f'   The Shared Secret Length must be between 1 and 32 characters.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()
    if re.search('[\\\\ #]+', var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num}, {var}, {var_value}')
        print(f'   The Shared Secret cannot contain backslash, space or hashtag.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def snmp_auth(row_num, ws, priv_type, priv_key, auth_type, auth_key):
    if not (priv_type == None or priv_type == 'none' or priv_type == 'aes-128' or priv_type == 'des'):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'    Error on Worksheet {ws.title}, Row {row_num}. priv_type {priv_type} is not ')
        print(f'    [none|des|aes-128].  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()
    if not (priv_type == 'none' or priv_type == None):
        if not validators.length(priv_key, min=8, max=32):
            print(f'\n-----------------------------------------------------------------------------\n')
            print(f'   Error on Worksheet {ws.title}, Row {row_num}. priv_key does not ')
            print(f'   meet the minimum character count of 8 or the maximum of 32.  Exiting....')
            print(f'\n-----------------------------------------------------------------------------\n')
            exit()
    if not (auth_type == 'md5' or auth_type == 'sha1'):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'    Error on Worksheet {ws.title}, Row {row_num}. priv_type {priv_type} is not ')
        print(f'    [md5|sha1].  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()
    if not validators.length(auth_key, min=8, max=32):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num}. auth_key does not ')
        print(f'   meet the minimum character count of 8 or the maximum of 32.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def snmp_info(row_num, ws, var, var_value):
    if var_value == None:
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var} value {var_value}.')
        print(f'   Please add Information for Contact and Location.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def snmp_mgmt(row_num, ws, var, var_value):
    if var_value == 'oob':
        var_value = 'Out-of-Band'
    elif var_value == 'inband':
        var_value = 'Inband'
    else:
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var} value {var_value}.')
        print(f'   The Management Domain Should be inband or oob.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()
    return var_value

def snmp_sec(row_num, ws, var, var_value):
    if not re.search('^(auth|noauth|priv)$', var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, "{var_value}" is invalid.')
        print(f'   The Security_Level must either be "auth", "noauth", or "priv".  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def snmp_string(row_num, ws, var, var_value):
    if not (validators.length(var_value, min=8, max=32) and re.fullmatch('^([a-zA-Z0-9\\-\\_\\.]+)$', var_value)):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, "{var_value}" is invalid.')
        print(f'   The community/username policy name must be a minimum of 8 and maximum of 32 ')
        print(f'   characters in length.  The name can contain only letters, numbers and the ')
        print(f'   special characters of underscore (_), hyphen (-), or period (.). The name ')
        print(f'   cannot contain the @ symbol.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def snmp_ver(row_num, ws, var, var_value):
    if not re.search('^(v1|v2c|v3)$', var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, "{var_value}" is invalid.')
        print(f'   Valid SNMP versions are [v1|v2c|v3].  Exiting....\n')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def stp(row_num, ws, var, var_value):
    if not re.search('^(BPDU_)', var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, value {var_value}:')
        print(f'   Please Select a valid STP Policy from the drop-down menu.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()
    if not re.search('(ft_and_gd|ft_or_gd|_ft|_gd)$', var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, value {var_value}:')
        print(f'   Please Select a valid STP Policy from the drop-down menu.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def syslog_fac(row_num, ws, var, var_value):
    if not re.match("^local[0-7]$", var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, "{var_value}" is invalid.')
        print(f'   Please verify Syslog Facility {var_value}.  Exiting...\n')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def timeout(row_num, ws, var, var_value):
    timeout_count = 0
    if not validators.between(int(var_value), min=5, max=60):
        timeout_count += 1
    if not (int(var_value) % 5 == 0):
        timeout_count += 1
    if not timeout_count == 0:
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, {var_value}. ')
        print(f'   {var} should be between 5 and 60 and be a factor of 5.  "{var_value}" ')
        print(f'   does not meet this.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def true(row_num, ws, var, var_value):
    if not re.search('^(false|true)$', var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, "{var_value}" is invalid.')
        print(f'   Valid values are true or false.  Exiting....\n')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def vlans(row_num, ws, var, var_value):
    if re.search(',', str(var_value)):
        vlan_split = var_value.split(',')
        for x in vlan_split:
            if re.search('\\-', x):
                dash_split = x.split('-')
                for z in dash_split:
                    if not validators.between(int(z), min=1, max=4095):
                        print(f'\n-----------------------------------------------------------------------------\n')
                        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}. Valid VLAN Values are:')
                        print(f'   between 1 and 4095.  Exiting....')
                        print(f'\n-----------------------------------------------------------------------------\n')
                        exit()
            elif not validators.between(int(x), min=1, max=4095):
                print(f'\n-----------------------------------------------------------------------------\n')
                print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}. Valid VLAN Values are:')
                print(f'   between 1 and 4095.  Exiting....')
                print(f'\n-----------------------------------------------------------------------------\n')
                exit()
    elif re.search('\\-', str(var_value)):
        dash_split = var_value.split('-')
        for x in dash_split:
            if not validators.between(int(x), min=1, max=4095):
                print(f'\n-----------------------------------------------------------------------------\n')
                print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}. Valid VLAN Values are:')
                print(f'   between 1 and 4095.  Exiting....')
                print(f'\n-----------------------------------------------------------------------------\n')
                exit()
    elif not validators.between(int(var_value), min=1, max=4095):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}. Valid VLAN Values are:')
        print(f'   between 1 and 4095.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()


def vpc_id(row_num, ws, var, var_value):
    if not validators.between(int(var_value), min=1, max=1000):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num}. {var} "{var_value}" is invalid.')
        print(f'   A valid VPC ID is between 1 and 1000.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()