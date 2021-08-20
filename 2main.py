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
    lib_ucs.config_conversion(name, org, type, json_data).flow_control(json_data)
    name = '%s_linkagg' % (org)
    lib_ucs.config_conversion(name, org, type, json_data).link_aggregation(json_data)
    name = '%s_linkctrl' % (org)
    lib_ucs.config_conversion(name, org, type, json_data).link_control(json_data)
    name = '%s_portchannel' % (org)
    lib_ucs.config_conversion(name, org, type, json_data).lan_port_channel(json_data)
    name = '%s_multicast' % (org)
    lib_ucs.config_conversion(name, org, type, json_data).multicast(json_data)
    type = 'policies'
    name = '%s_bios' % (org)
    lib_ucs.config_conversion(name, org, type, json_data).bios(json_data)
    name = '%s_devcon' % (org)
    lib_ucs.config_conversion(name, org, type, json_data).device_connector(json_data)
    name = '%s_dns' % (org)
    lib_ucs.config_conversion(name, org, type, json_data).network_connectivity(json_data)
    name = '%s_ntp' % (org)
    lib_ucs.config_conversion(name, org, type, json_data).ntp(json_data)
    type = 'domains'
    name = '%s_swctrl' % (org)
    lib_ucs.config_conversion(name, org, type, json_data).switch_control(json_data)
    # eval("%s.%s(name, org, json_data)" % (class_init, func))
    name = '%s_systemqos' % (org)
    lib_ucs.config_conversion(name, org, type, json_data).system_qos(json_data)
    name = '%s_vlans' % (org)
    lib_ucs.config_conversion(name, org, type, json_data).vlans(json_data)

def main():
    process_config_conversion(json_data)

if __name__ == '__main__':
    main()
