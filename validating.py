#!/usr/bin/env python3

import ipaddress
import phonenumbers
import re
import validators

# Validations
def alias(row_num, ws, var, var_value):
    if not (re.search(r'^[a-zA-Z0-9_.-]+$',  var_value) and validators.length(str(var_value), min=0, max=63)):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, {var_value}. ')
        print(f'   The Alias is an invalid Value... It falied one of the complexity tests:')
        print(f'    - Min Length 0')
        print(f'    - Max Length 63')
        print(f'    - Regex [a-zA-Z0-9_.-]+')
        print(f'    Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def brkout_pg(row_num, brkout_pg):
    if not re.search('(2x100g_pg|4x100g_pg|4x10g_pg|4x25g_pg|8x50g_pg)', brkout_pg):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Row {row_num}. Breakout Port Group is Invalid.  Valid Values are:')
        print(f'   2x100g_pg, 4x100g_pg, 4x10g_pg, 4x25g_pg, and 8x50g_pg.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def description(row_num, ws, var, var_value):
    if not (re.search(r'^[a-zA-Z0-9\\!#$%()*,-./:;@ _{|}~?&+]+$',  var_value) and validators.length(str(var_value), min=0, max=128)):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, {var_value}. ')
        print(f'   The description is an invalid Value... It falied one of the complexity tests:')
        print(f'    - Min Length 0')
        print(f'    - Max Length 128')
        print('    - Regex [a-zA-Z0-9\\!#$%()*,-./:;@ _{|}~?&+]+')
        print(f'    Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def dscp(row_num, ws, var, var_value):
    if not re.search('^(AF[1-4][1-3]|CS[0-7]|EF|VA|unspecified)$', var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}. Valid Values are:')
        print(f'   AF11, AF12, AF13, AF21, AF22, AF23, AF31, AF32, AF33, AF41, AF42, AF43,')
        print(f'   CS0, CS1, CS2, CS3, CS4, CS5, CS6, CS7, EF, VA or unspecified.  Exiting....')
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

def encryption_key(row_num, ws, var, var_value):
    if not validators.length(str(var_value), min=16, max=32):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}. The Encryption Key')
        print(f'   Length must be between 16 and 32 characters.  Exiting....')
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

def hostname(row_num, ws, var, var_value):
    if not (re.search('^[a-zA-Z0-9\\-]+$', var_value) and validators.length(var_value, min=1, max=63)):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, {var_value} ')
        print(f'   is not a valid Hostname.  Be sure you are not using the FQDN.  Exiting....')
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

def name_complexity(row_num, ws, var, var_value):
    login_domain_count = 0
    if not re.fullmatch('^([a-zA-Z0-9\\_]+)$', var_value):
        login_domain_count += 1
    elif not validators.length(var_value, min=1, max=10):
        login_domain_count += 1
    if not login_domain_count == 0:
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num}, {var}, {var_value}.  The Value')
        print(f'   must be between 1 and 10 characters.  The only non alphanumeric characters')
        print(f'   allowed is "_"; but it must not start with "_".  "{var_value}" did not')
        print(f'   meet these restrictions.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def name_rule(row_num, ws, var, var_value):
    if not (re.fullmatch(r'^[a-zA-Z0-9\_\-]+$', var_value) and validators.length(var_value, min=1, max=63)):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, value {var_value}:')
        print(f'   {var_value} does not meet complexity rules.')
        print(f'   Allowed Characters are A-Z, a-z, 0-9, underscore or dash.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def number_check(row_num, ws, var, var_value, min_x, max_x):
    if not (int(var_value) >= int(min_x) and int(var_value) <= int(max_x)):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, {var_value}. Valid Values ')
        print(f'   are between {min_x} and {max_x}.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def not_empty(row_num, ws, var, var_value):
    if var_value == None:
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, {var_value}. This is a  ')
        print(f'   required variable.  Exiting....')
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

def port_count(row_num, name, switch_role, port_count):
    if not re.search('^(16|32|34|36|48|54|60|64|66|102|108)$', port_count):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Row {row_num}. {name} port count of {port_count} is not valid.')
        print(f'   Valid port counts are 16, 32, 34, 36, 48, 54, 60, 64, 66, 102, 108.  Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def qos_priority(row_num, ws, var, var_value):
    if not re.search('^(level[1-6]|unspecified)$', var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}. Valid Values are:')
        print(f'   level1, level2, level3, level4, level5, level6 or unspecified.  Exiting....')
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

def tag_check(row_num, ws, var, var_value):
    tag_list = ['alice-blue', 'antique-white', 'aqua', 'aquamarine', 'azure', 'beige', 'bisque', 'black', 'blanched-almond', 'blue', 'blue-violet',
    'brown', 'burlywood', 'cadet-blue', 'chartreuse', 'chocolate', 'coral', 'cornflower-blue', 'cornsilk', 'crimson', 'cyan', 'dark-blue', 'dark-cyan',
    'dark-goldenrod', 'dark-gray', 'dark-green', 'dark-khaki', 'dark-magenta', 'dark-olive-green', 'dark-orange', 'dark-orchid', 'dark-red', 'dark-salmon',
    'dark-sea-green', 'dark-slate-blue', 'dark-slate-gray', 'dark-turquoise', 'dark-violet', 'deep-pink', 'deep-sky-blue', 'dim-gray', 'dodger-blue',
    'fire-brick', 'floral-white', 'forest-green', 'fuchsia', 'gainsboro', 'ghost-white', 'gold', 'goldenrod', 'gray', 'green', 'green-yellow', 'honeydew',
    'hot-pink', 'indian-red', 'indigo', 'ivory', 'khaki', 'lavender', 'lavender-blush', 'lawn-green', 'lemon-chiffon', 'light-blue', 'light-coral',
    'light-cyan', 'light-goldenrod-yellow', 'light-gray', 'light-green', 'light-pink', 'light-salmon', 'light-sea-green', 'light-sky-blue',
    'light-slate-gray', 'light-steel-blue', 'light-yellow', 'lime', 'lime-green', 'linen', 'magenta', 'maroon', 'medium-aquamarine', 'medium-blue',
    'medium-orchid', 'medium-purple', 'medium-sea-green', 'medium-slate-blue', 'medium-spring-green', 'medium-turquoise', 'medium-violet-red', 'midnight-blue',
    'mint-cream', 'misty-rose', 'moccasin', 'navajo-white', 'navy', 'old-lace', 'olive', 'olive-drab', 'orange', 'orange-red', 'orchid', 'pale-goldenrod',
    'pale-green', 'pale-turquoise', 'pale-violet-red', 'papaya-whip', 'peachpuff', 'peru', 'pink', 'plum', 'powder-blue', 'purple', 'red', 'rosy-brown',
    'royal-blue', 'saddle-brown', 'salmon', 'sandy-brown', 'sea-green', 'seashell', 'sienna', 'silver', 'sky-blue', 'slate-blue', 'slate-gray', 'snow',
    'spring-green', 'steel-blue', 'tan', 'teal', 'thistle', 'tomato', 'turquoise', 'violet', 'wheat', 'white', 'white-smoke', 'yellow', 'yellow-green' ]
    regx = re.compile('%s') % (var_value)
    if not list(filter(regx.match, tag_list)):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, "{var_value}" is invalid.')
        print(f'   Valid Tag Values are:')
        print(f'   alice-blue, antique-white, aqua, aquamarine, azure, beige, bisque, black,')
        print(f'   blanched-almond, blue, blue-violet, brown, burlywood, cadet-blue, chartreuse,')
        print(f'   chocolate, coral, cornflower-blue, cornsilk, crimson, cyan, dark-blue, dark-cyan,')
        print(f'   dark-goldenrod, dark-gray, dark-green, dark-khaki, dark-magenta, dark-olive-green,')
        print(f'   dark-orange, dark-orchid, dark-red, dark-salmon, dark-sea-green, dark-slate-blue,')
        print(f'   dark-slate-gray, dark-turquoise, dark-violet, deep-pink, deep-sky-blue, dim-gray,')
        print(f'   dodger-blue, fire-brick, floral-white, forest-green, fuchsia, gainsboro, ghost-white,')
        print(f'   gold, goldenrod, gray, green, green-yellow, honeydew, hot-pink, indian-red, indigo,')
        print(f'   ivory, khaki, lavender, lavender-blush, lawn-green, lemon-chiffon, light-blue,')
        print(f'   light-coral, light-cyan, light-goldenrod-yellow, light-gray, light-green, light-pink,')
        print(f'   light-salmon, light-sea-green, light-sky-blue, light-slate-gray, light-steel-blue,')
        print(f'   light-yellow, lime, lime-green, linen, magenta, maroon, medium-aquamarine, medium-blue,')
        print(f'   medium-orchid, medium-purple, medium-sea-green, medium-slate-blue, medium-spring-green,')
        print(f'   medium-turquoise, medium-violet-red, midnight-blue, mint-cream, misty-rose, moccasin,')
        print(f'   navajo-white, navy, old-lace, olive, olive-drab, orange, orange-red, orchid,')
        print(f'   pale-goldenrod, pale-green, pale-turquoise, pale-violet-red, papaya-whip, peachpuff,')
        print(f'   peru, pink, plum, powder-blue, purple, red, rosy-brown, royal-blue, saddle-brown,')
        print(f'   salmon, sandy-brown, sea-green, seashell, sienna, silver, sky-blue, slate-blue,')
        print(f'   slate-gray, snow, spring-green, steel-blue, tan, teal, thistle, tomato, turquoise,')
        print(f'   violet, wheat, white, white-smoke, yellow, and yellow-green')
        print(f'   Exiting...\n')
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

def url(row_num, ws, var, var_value):
    if not validators.url(var_value):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, {var_value}. ')
        print(f'   {var} should be a valid URL.  The Following is not a valid URL:')
        print(f'    - {var_value}')
        print(f'    Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def values_1(row_num, ws, var, var_value, var1):
    if not var_value ==  var1:
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, {var_value}. ')
        print(f'   {var} should be:')
        print(f'    - {var1}')
        print(f'    Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def values_2(row_num, ws, var, var_value, var1, var2):
    if not (var_value ==  var1 or var_value ==  var2):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, {var_value}. ')
        print(f'   {var} should be either:')
        print(f'    - {var1}')
        print(f'    - {var2}')
        print(f'    Exiting....')
        print(f'\n-----------------------------------------------------------------------------\n')
        exit()

def values_3(row_num, ws, var, var_value, var1, var2, var3):
    if not (var_value ==  var1 or var_value ==  var2 or var_value == var3):
        print(f'\n-----------------------------------------------------------------------------\n')
        print(f'   Error on Worksheet {ws.title}, Row {row_num} {var}, {var_value}. ')
        print(f'   {var} should be one of the following:')
        print(f'    - {var1}')
        print(f'    - {var2}')
        print(f'    - {var3}')
        print(f'    Exiting....')
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
