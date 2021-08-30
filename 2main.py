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
    type = 'pools'
    lib_ucs.config_conversion(json_data, type).ip_pools()
    lib_ucs.config_conversion(json_data, type).iqn_pools()
    lib_ucs.config_conversion(json_data, type).mac_pools()
    lib_ucs.config_conversion(json_data, type).wwnn_pools()
    lib_ucs.config_conversion(json_data, type).wwpn_pools()
    # lib_ucs.config_conversion(json_data, type).uuid_pools()
    type = 'ucs_profiles'
    lib_ucs.config_conversion(json_data, type).bios_policies()
    # lib_ucs.config_conversion(json_data, type).boot_order_policies()
    lib_ucs.config_conversion(json_data, type).ethernet_adapter_policies()
    lib_ucs.config_conversion(json_data, type).ethernet_network_control_policies()
    lib_ucs.config_conversion(json_data, type).ethernet_network_group_policies()
    lib_ucs.config_conversion(json_data, type).ethernet_qos_policies()
    lib_ucs.config_conversion(json_data, type).fibre_channel_adapter_policies()
    lib_ucs.config_conversion(json_data, type).fibre_channel_network_policies()
    lib_ucs.config_conversion(json_data, type).fibre_channel_qos_policies()
    lib_ucs.config_conversion(json_data, type).flow_control_policies()
    lib_ucs.config_conversion(json_data, type).imc_access_policies()
    lib_ucs.config_conversion(json_data, type).ipmi_over_lan_policies()
    # lib_ucs.config_conversion(json_data, type).iscsi_adapter_policies()
    # lib_ucs.config_conversion(json_data, type).iscsi_boot_policies()
    # lib_ucs.config_conversion(json_data, type).iscsi_static_target_policies()
    lib_ucs.config_conversion(json_data, type).lan_connectivity_policies()
    lib_ucs.config_conversion(json_data, type).link_aggregation_policies()
    lib_ucs.config_conversion(json_data, type).link_control_policies()
    lib_ucs.config_conversion(json_data, type).network_connectivity_policies()
    lib_ucs.config_conversion(json_data, type).ntp_policies()
    # lib_ucs.config_conversion(json_data, type).port_policies()
    lib_ucs.config_conversion(json_data, type).power_policies()
    # lib_ucs.config_conversion(json_data, type).san_connectivity_policies()
    lib_ucs.config_conversion(json_data, type).sd_card_policies()
    lib_ucs.config_conversion(json_data, type).serial_over_lan_policies()
    # lib_ucs.config_conversion(json_data, type).snmp_policies()
    lib_ucs.config_conversion(json_data, type).switch_control_policies()
    lib_ucs.config_conversion(json_data, type).syslog_policies()
    lib_ucs.config_conversion(json_data, type).system_qos_policies()
    lib_ucs.config_conversion(json_data, type).thermal_policies()
    lib_ucs.config_conversion(json_data, type).ucs_domain_profiles()
    lib_ucs.config_conversion(json_data, type).ucs_server_profile_templates()
    lib_ucs.config_conversion(json_data, type).ucs_server_profiles()
    lib_ucs.config_conversion(json_data, type).virtual_kvm_policies()
    # lib_ucs.config_conversion(json_data, type).virtual_media_policies()
    lib_ucs.config_conversion(json_data, type).vsan_policies()
    type = 'ucs_domain_vlans'
    lib_ucs.config_conversion(json_data, type).multicast_policies()
    lib_ucs.config_conversion(json_data, type).vlan_policies()

def main():
    process_config_conversion(json_data)

if __name__ == '__main__':
    main()
