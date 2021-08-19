#!/usr/bin/env python3
import json
import lib_ucs
import sys
from pathlib import Path

home = Path.home()
json_file = sys.argv[1]
json_open = open(json_file, 'r')
json_data = json.load(json_open)
org = 'Asgard'

def process_config_conversion(json_data):
    class_init = '%s(json_data)' % (lib_ucs.config_conversion)
    func = 'device_connector'
    name = '%s_devcon' % (org)
    lib_ucs.config_conversion(name, org).device_connector(json_data)
    name = '%s_dns' % (org)
    lib_ucs.config_conversion(name, org).network_connectivity(json_data)
    name = '%s_vlans' % (org)
    lib_ucs.config_conversion(name, org).vlans(json_data)
    # eval("%s.%s(name, org, json_data)" % (class_init, func))

def main():
    process_config_conversion(json_data)

if __name__ == '__main__':
    main()
