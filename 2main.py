#!/usr/bin/env python3
import json
import lib_ucs
import sys
from pathlib import Path

home = Path.home()
json_file = sys.argv[1]
json_open = open(json_file, 'r')
json_data = json.load(json_open)
org = 'default'

def process_config_conversion(json_data):
    # class_init = '%s(json_data)' % (lib_ucs.config_conversion)
    # func = 'device_connector'
    type = 'domains'
    name = '%s_flowctrl' % (org)
    lib_ucs.config_conversion(name, org, type).flow_control(json_data)
    name = '%s_linkagg' % (org)
    lib_ucs.config_conversion(name, org, type).link_aggregation(json_data)
    name = '%s_linkctrl' % (org)
    lib_ucs.config_conversion(name, org, type).link_control(json_data)
    name = '%s_multicast' % (org)
    lib_ucs.config_conversion(name, org, type).multicast(json_data)
    name = '%s_vlans' % (org)
    lib_ucs.config_conversion(name, org, type).vlans(json_data)
    type = 'policies'
    name = '%s_devcon' % (org)
    lib_ucs.config_conversion(name, org, type).device_connector(json_data)
    name = '%s_dns' % (org)
    lib_ucs.config_conversion(name, org, type).network_connectivity(json_data)
    name = '%s_ntp' % (org)
    lib_ucs.config_conversion(name, org, type).ntp(json_data)
    # eval("%s.%s(name, org, json_data)" % (class_init, func))

def main():
    process_config_conversion(json_data)

if __name__ == '__main__':
    main()
