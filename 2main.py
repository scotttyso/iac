#!/usr/bin/env python3
import json
import lib_ucs
import sys
from pathlib import Path

home = Path.home()
json_file = sys.argv[1]
json_open = open(json_file, 'r')
json_data = json.load(json_open)

def process_config_conversion(json_data):
    # class_init = '%s(json_data)' % (lib_ucs.config_conversion)
    # func = 'device_connector'
    type = 'domains'
    lib_ucs.config_conversion(json_data, type).flow_control_policies()
    lib_ucs.config_conversion(json_data, type).link_aggregation_policies()
    lib_ucs.config_conversion(json_data, type).link_control_policies()
    lib_ucs.config_conversion(json_data, type).switch_control_policies()
    lib_ucs.config_conversion(json_data, type).system_qos_policies()
    type = 'domains_vlans'
    lib_ucs.config_conversion(json_data, type).multicast_policies()
    type = 'policies'
    lib_ucs.config_conversion(json_data, type).bios_policies()
    lib_ucs.config_conversion(json_data, type).boot_order_policies()
    lib_ucs.config_conversion(json_data, type).network_connectivity_policies()
    lib_ucs.config_conversion(json_data, type).ntp_policies()
    exit()
    lib_ucs.config_conversion(json_data, type).lan_port_channel()
    lib_ucs.config_conversion(json_data, type).vlans()
    lib_ucs.config_conversion(json_data, type).device_connector()

def main():
    process_config_conversion(json_data)

if __name__ == '__main__':
    main()
