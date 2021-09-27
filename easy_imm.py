#!/usr/bin/env python3
import json
import lib_ucs
import sys
import validating_ucs
from pathlib import Path

home = Path.home()

def process_config_conversion(json_data):
    print(f'\n---------------------------------------------------------------------------------------\n')
    print(f'  Starting the Easy IMM Configuration Conversion Wizard!')
    print(f'\n---------------------------------------------------------------------------------------\n')

    type = 'pools'
    lib_ucs.config_conversion(json_data, type).ip_pools()
    lib_ucs.config_conversion(json_data, type).iqn_pools()
    lib_ucs.config_conversion(json_data, type).mac_pools()
    lib_ucs.config_conversion(json_data, type).uuid_pools()
    lib_ucs.config_conversion(json_data, type).wwnn_pools()
    lib_ucs.config_conversion(json_data, type).wwpn_pools()
    type = 'policies'
    lib_ucs.config_conversion(json_data, type).bios_policies()
    lib_ucs.config_conversion(json_data, type).boot_order_policies()
    lib_ucs.config_conversion(json_data, type).ethernet_adapter_policies()
    lib_ucs.config_conversion(json_data, type).ethernet_network_control_policies()
    lib_ucs.config_conversion(json_data, type).ethernet_network_group_policies()
    lib_ucs.config_conversion(json_data, type).ethernet_network_policies()
    lib_ucs.config_conversion(json_data, type).ethernet_qos_policies()
    lib_ucs.config_conversion(json_data, type).fibre_channel_adapter_policies()
    lib_ucs.config_conversion(json_data, type).fibre_channel_network_policies()
    lib_ucs.config_conversion(json_data, type).fibre_channel_qos_policies()
    lib_ucs.config_conversion(json_data, type).flow_control_policies()
    lib_ucs.config_conversion(json_data, type).imc_access_policies()
    lib_ucs.config_conversion(json_data, type).ipmi_over_lan_policies()
    lib_ucs.config_conversion(json_data, type).iscsi_adapter_policies()
    lib_ucs.config_conversion(json_data, type).iscsi_boot_policies()
    lib_ucs.config_conversion(json_data, type).iscsi_static_target_policies()
    lib_ucs.config_conversion(json_data, type).lan_connectivity_policies()
    lib_ucs.config_conversion(json_data, type).link_aggregation_policies()
    lib_ucs.config_conversion(json_data, type).link_control_policies()
    lib_ucs.config_conversion(json_data, type).network_connectivity_policies()
    lib_ucs.config_conversion(json_data, type).ntp_policies()
    lib_ucs.config_conversion(json_data, type).port_policies()
    lib_ucs.config_conversion(json_data, type).power_policies()
    lib_ucs.config_conversion(json_data, type).san_connectivity_policies()
    lib_ucs.config_conversion(json_data, type).sd_card_policies()
    lib_ucs.config_conversion(json_data, type).serial_over_lan_policies()
    lib_ucs.config_conversion(json_data, type).snmp_policies()
    lib_ucs.config_conversion(json_data, type).storage_policies()
    lib_ucs.config_conversion(json_data, type).switch_control_policies()
    lib_ucs.config_conversion(json_data, type).syslog_policies()
    lib_ucs.config_conversion(json_data, type).system_qos_policies()
    lib_ucs.config_conversion(json_data, type).thermal_policies()
    lib_ucs.config_conversion(json_data, type).virtual_kvm_policies()
    lib_ucs.config_conversion(json_data, type).virtual_media_policies()
    lib_ucs.config_conversion(json_data, type).vsan_policies()
    type = 'policies_vlans'
    lib_ucs.config_conversion(json_data, type).multicast_policies()
    lib_ucs.config_conversion(json_data, type).vlan_policies()
    type = 'ucs_domain_profiles'
    lib_ucs.config_conversion(json_data, type).ucs_domain_profiles()
    type = 'ucs_server_profiles'
    lib_ucs.config_conversion(json_data, type).ucs_server_profile_templates()
    lib_ucs.config_conversion(json_data, type).ucs_server_profiles()

    print(f'\n---------------------------------------------------------------------------------------\n')
    print(f'  Proceedures Complete!!! Closing Environment and Exiting Script.')
    print(f'\n---------------------------------------------------------------------------------------\n')
    exit()

def process_wizard():
    print(f'\n-------------------------------------------------------------------------------------------\n')
    print(f'  Starting the Easy IMM Initial Configuration Wizard!')
    print(f'\n-------------------------------------------------------------------------------------------\n')

    valid = False
    while valid == False:
        org = input('What is your Intersight Organization Name?  [default]: ')
        if org == '':
            org = 'default'
        valid = validating_ucs.org_rule('Intersight Organization', org, 1, 62)

    print(f'\n-------------------------------------------------------------------------------------------\n')
    print(f'  By Default, the Intersight Organization will be used as the Name Prefix for Pools ')
    print(f'  and Policies.  To Assign a different Prefix to the Pools and Policies use the prefix ')
    print(f'  options below.  As Options, a different prefix for UCS domain policies and a prefix')
    print(f'  for Pools and Server Policies can be entered to override the default behavior.')
    print(f'\n-------------------------------------------------------------------------------------------\n')

    valid = False
    while valid == False:
        domain_prefix = input('Enter a Name Prefix for Domain Profile Policies.  [press enter to skip]: ')
        if domain_prefix == '':
            valid = True
        else:
            valid = validating_ucs.name_rule(f"Name Prefix", domain_prefix, 1, 62)
    valid = False
    while valid == False:
        name_prefix = input('Enter a Name Prefix for Pools and Server Policies.  [press enter to skip]: ')
        if name_prefix == '':
            valid = True
        else:
            valid = validating_ucs.name_rule(f"Name Prefix", name_prefix, 1, 62)

    #========================================================
    # These are all settings used for Testing without
    # having to run the wizard through all of the policies
    #========================================================
    # domain_mtu = 9216
    # ip_pools = {'ip_pools': ['Asgard_ip_pool']}
    # policies.update(ip_pools)
    # vlan_policies_vlans = [{'default_vlans': [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}]
    # vlan_policies_vlans = [{'asgard_vlans': [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]},{'default_vlans': [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}]
    # vsan_policies_vsans = [{'Fabric_A': [{'fcoe_vlan_id': 100, 'name': 'VSAN-A', 'id': 100}]}, {'Fabric_B': [{'fcoe_vlan_id': 200, 'name': 'VSAN-B', 'id': 200}]}]
    # print(policies)

    policies = {}

    type = 'pools'
    # policies.update({'ip_pools': (lib_ucs.easy_imm_wizard(name_prefix, org, type).ip_pools())})
    # policies.update({'mac_pools': (lib_ucs.easy_imm_wizard(name_prefix, org, type).mac_pools())})
    # policies.update({'wwnn_pools': (lib_ucs.easy_imm_wizard(name_prefix, org, type).wwnn_pools())})
    # policies.update({'wwpn_pools': (lib_ucs.easy_imm_wizard(name_prefix, org, type).wwpn_pools())})

    type = 'policies_vlans'
    # policies.update({'multicast_policies': (lib_ucs.easy_imm_wizard(domain_prefix, org, type).multicast_policies())})
    # vlan_policies,vlan_policies_vlans = lib_ucs.easy_imm_wizard(domain_prefix, org, type).vlan_policies(policies)
    # policies.update({'vlan_policies': vlan_policies})

    type = 'policies'
    #========================================================
    # Completed Policies
    #========================================================
    # vsan_policies,vsan_policies_vsans = lib_ucs.easy_imm_wizard(domain_prefix, org, type).vsan_policies(vlan_policies_vlans)
    # policies.update({'vsan_policies': vsan_policies})
    # system_qos_policies,domain_mtu = lib_ucs.easy_imm_wizard(domain_prefix, org, type).system_qos_policies()
    # policies.update({'system_qos_policies': system_qos_policies})
    # policies.update({'ethernet_network_group_policies': (lib_ucs.easy_imm_wizard(name_prefix, org, type).ethernet_network_group_policies(vlan_policies_vlans))})
    # policies.update({'bios_policies': (lib_ucs.easy_imm_wizard(name_prefix, org, type).bios_policies())})
    # policies.update({'ethernet_adapter_policies': (lib_ucs.easy_imm_wizard(name_prefix, org, type).ethernet_adapter_policies())})
    # policies.update({'ethernet_network_control_policies': (lib_ucs.easy_imm_wizard(name_prefix, org, type).ethernet_network_control_policies())})
    # policies.update({'ethernet_qos_policies': (lib_ucs.easy_imm_wizard(name_prefix, org, type).ethernet_qos_policies(domain_mtu))})
    # policies.update({'fibre_channel_adapter_policies': (lib_ucs.easy_imm_wizard(name_prefix, org, type).fibre_channel_adapter_policies())})
    # policies.update({'fibre_channel_network_policies': (lib_ucs.easy_imm_wizard(name_prefix, org, type).fibre_channel_network_policies(vsan_policies_vsans))})
    # policies.update({'fibre_channel_qos_policies': (lib_ucs.easy_imm_wizard(name_prefix, org, type).fibre_channel_qos_policies())})
    # policies.update({'flow_control_policies': (lib_ucs.easy_imm_wizard(domain_prefix, org, type).flow_control_policies())})
    # policies.update({'imc_access_policies': (lib_ucs.easy_imm_wizard(name_prefix, org, type).imc_access_policies(vlan_policies_vlans, policies))})
    # policies.update({'ipmi_over_lan_policies': (lib_ucs.easy_imm_wizard(name_prefix, org, type).ipmi_over_lan_policies())})
    # policies.update({'link_aggregation_policies': (lib_ucs.easy_imm_wizard(domain_prefix, org, type).link_aggregation_policies())})
    # policies.update({'link_control_policies': (lib_ucs.easy_imm_wizard(domain_prefix, org, type).link_control_policies())})
    # policies.update({'network_connectivity_policies': (lib_ucs.easy_imm_wizard(name_prefix, org, type).network_connectivity_policies())})
    # policies.update({'ntp_policies': (lib_ucs.easy_imm_wizard(name_prefix, org, type).ntp_policies())})
    # policies.update({'power_policies': (lib_ucs.easy_imm_wizard(name_prefix, org, type).power_policies())})
    # policies.update({'serial_over_lan_policies': (lib_ucs.easy_imm_wizard(name_prefix, org, type).serial_over_lan_policies())})
    # policies.update({'switch_control_policies': (lib_ucs.easy_imm_wizard(domain_prefix, org, type).switch_control_policies())})
    # policies.update({'syslog_policies': (lib_ucs.easy_imm_wizard(name_prefix, org, type).syslog_policies())})
    # policies.update({'thermal_policies': (lib_ucs.easy_imm_wizard(name_prefix, org, type).thermal_policies())})
    # policies.update({'virtual_kvm_policies': (lib_ucs.easy_imm_wizard(name_prefix, org, type).virtual_kvm_policies())})
    # 29 Complete 10 to go

    #========================================================
    # Work in Progress
    #========================================================
    # policies.update({'local_user_policies': (lib_ucs.easy_imm_wizard(name_prefix, org, type).local_user_policies())})
    # policies.update({'snmp_policies': (lib_ucs.easy_imm_wizard(name_prefix, org, type).snmp_policies())})
    # policies.update({'port_policies': (lib_ucs.easy_imm_wizard(domain_prefix, org, type).port_policies())})
    # policies.update({'san_connectivity_policies': (lib_ucs.easy_imm_wizard(name_prefix, org, type).san_connectivity_policies(policies))})
    # policies.update({'lan_connectivity_policies': (lib_ucs.easy_imm_wizard(name_prefix, org, type).lan_connectivity_policies(policies))})
    # policies.update({'storage_policies': (lib_ucs.easy_imm_wizard(name_prefix, org, type).storage_policies())})
    # policies.update({'boot_order_policies': (lib_ucs.easy_imm_wizard(name_prefix, org, type).boot_order_policies())})
    # policies.update({'sd_card_policies': (lib_ucs.easy_imm_wizard(name_prefix, org, type).sd_card_policies())})
    # policies.update({'virtual_media_policies': (lib_ucs.easy_imm_wizard(name_prefix, org, type).virtual_media_policies())})

    # print(policies)
    type = 'ucs_domain_profiles'
    # lib_ucs.easy_imm_wizard(domain_prefix, org, type).ucs_domain_profiles(policies)

    type = 'ucs_server_profiles'
    # lib_ucs.easy_imm_wizard(name_prefix, org, type).ucs_server_profile_templates(policies)
    # lib_ucs.easy_imm_wizard(name_prefix, org, type).ucs_server_profiles(policies)

    #========================================================
    # Policies that Will not be Supported at initial Release
    #========================================================
    # policies.update({'uuid_pools': (lib_ucs.easy_imm_wizard(name_prefix, org, type).uuid_pools())})
    # policies.update({'iqn_pools': (lib_ucs.easy_imm_wizard(name_prefix, org, type).iqn_pools())})
    # policies.update({'ethernet_network_policies': (lib_ucs.easy_imm_wizard(name_prefix, org, type).ethernet_network_policies())})
    # policies.update({'iscsi_adapter_policies': (lib_ucs.easy_imm_wizard(name_prefix, org, type).iscsi_adapter_policies())})
    # policies.update({'iscsi_boot_policies': (lib_ucs.easy_imm_wizard(name_prefix, org, type).iscsi_boot_policies())})
    # policies.update({'iscsi_static_target_policies': (lib_ucs.easy_imm_wizard(name_prefix, org, type).iscsi_static_target_policies())})

    print(f'\n-------------------------------------------------------------------------------------------\n')
    print(f'  Proceedures Complete!!! Closing Environment and Exiting Script.')
    print(f'\n-------------------------------------------------------------------------------------------\n')
    exit()


def main():
    if len(sys.argv) > 1:
        json_file = sys.argv[1]
        json_open = open(json_file, 'r')
        json_data = json.load(json_open)
        process_config_conversion(json_data)
    else:
        process_wizard()

if __name__ == '__main__':
    main()
