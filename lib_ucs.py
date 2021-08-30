#!/usr/bin/env python3

import ipaddress
import json
import jinja2
import os
import pkg_resources
import re
from pathlib import Path

ucs_template_path = pkg_resources.resource_filename('lib_ucs', 'ucs_conversion/')

class config_conversion(object):
    def __init__(self, json_data, type):
        self.json_data = json_data
        self.templateLoader = jinja2.FileSystemLoader(
            searchpath=(ucs_template_path + '%s/') % (type))
        self.templateEnv = jinja2.Environment(loader=self.templateLoader)
        self.templateVars = {}
        self.type = type
        self.orgs = []
        for item in json_data['config']['orgs']:
            for k, v in item.items():
                if k == 'name':
                    self.orgs.append(v)
    # Config Templates
    def bios_policies(self):
        header = 'BIOS Policies'
        initial_policy = True
        template_type = 'bios_policies'

        # Set the org_count to 0 for the First Organization
        org_count = 0

        # Loop through the orgs discovered by the Class
        for org in self.orgs:

            # Pull in Variables from Class
            templateVars = self.templateVars
            templateVars['org'] = org

            # Define the Template Source
            templateVars['header'] = header
            templateVars['variable_block'] = template_type
            template_file = "template_open.jinja2"
            template = self.templateEnv.get_template(template_file)

            # Process the template
            dest_dir = '%s' % (self.type)
            dest_file = '%s.auto.tfvars' % (template_type)
            if initial_policy == True:
                write_method = 'w'
            else:
                write_method = 'a'
            process_method(write_method, dest_dir, dest_file, template, **templateVars)

            # Define the Template Source
            template_file = '%s.jinja2' % (template_type)
            template = self.templateEnv.get_template(template_file)

            if template_type in self.json_data['config']['orgs'][org_count]:
                for item in self.json_data['config']['orgs'][org_count][template_type]:
                    for k, v in item.items():
                        if (k == 'name' or k == 'descr' or k == 'tags'):
                            templateVars[k] = v

                    templateVars['bios_settings'] = {}
                    for k, v in item.items():
                        if not (k == 'name' or k == 'descr' or k == 'tags'):
                            templateVars['bios_settings'][k] = v

                    # Process the template
                    dest_dir = '%s' % (self.type)
                    dest_file = '%s.auto.tfvars' % (template_type)
                    process_method('a', dest_dir, dest_file, template, **templateVars)

            # Define the Template Source
            template_file = "template_close.jinja2"
            template = self.templateEnv.get_template(template_file)

            # Process the template
            dest_dir = '%s' % (self.type)
            dest_file = '%s.auto.tfvars' % (template_type)
            process_method('a', dest_dir, dest_file, template, **templateVars)

            # Increment the org_count for the next Organization Loop
            org_count += 1

    def boot_order_policies(self, json_data):
        # Define the Template Source
        template_file = "boot_order_open.jinja2"
        template = self.templateEnv.get_template(template_file)

        # Variables
        templateVars = self.templateVars

        # Process the template
        dest_dir = 'profiles_servers'
        dest_file = '%s.auto.tfvars' % templateVars['org']
        wr_method = 'a'
        process_method(wr_method, dest_dir, dest_file, template, **templateVars)


        # Define the Template Source
        template_file = "boot_order_san.jinja2"
        template = self.templateEnv.get_template(template_file)

        for i in json_data['config']['orgs'][0]['boot_policies']:
            templateVars['boot_policies'] = {}
            templateVars['boot_policies']['boot_order'] = {}
            for k, v in i.items():
                if k == 'name':
                    templateVars['boot_policies'].update({"name": v})
                    print(f'\n-------------------------------------------------\r')
                    print(f'Converting Boot Order Policy {v}')
                    print(f'-------------------------------------------------\r')
            for k, v in i.items():
                order_count = 0
                if k == 'boot_mode':
                    boot_mode = k
                    templateVars['boot_policies'].update({boot_mode: v})
                elif k == 'boot_order':
                    for item in v:
                        for key, value in item.items():
                            if key == 'order':
                                if int(value) > int(order_count):
                                    order_count = value
                    order_count = int(order_count) + 1
                    for c in range(1,order_count):
                        #c = str(c)
                        templateVars['boot_policies']['boot_order'].update({c: []})
                    print(json.dumps(templateVars['boot_policies'], indent=4))
                    for item in v:
                        for key, value in item.items():
                            if key == 'device_type' and value == 'cd-dvd':
                                print(f'hello {value}')
                            elif key == 'device_type' and value == 'floppy':
                                print(f'hello {value}')
                            elif key == 'device_type' and value == 'lan':
                                print(f'hello {value}')
                            elif key == 'device_type' and value == 'remote_cd-dvd':
                                print(f'hello {value}')
                            elif key == 'device_type' and value == 'sd_card':
                                print(f'hello {value}')
                elif re.search('(enforce_vnic_name|reboot_on_boot_order_change)', k):
                    print(f'The Following UCSM Boot Policy Setting is Currently Not Supported in IMM:\r\n  {k}\r\n')

            # Process the template
            dest_dir = 'profiles_servers'
            dest_file = '%s.auto.tfvars' % templateVars['org']
            wr_method = 'a'
            # print(json.dumps(templateVars['bios'], indent=4))
            templateVars['boot_policies'] = [templateVars['boot_policies']]
            exit()
            process_method(wr_method, dest_dir, dest_file, template, **templateVars)

        # Define the Template Source
        template_file = "close.jinja2"
        template = self.templateEnv.get_template(template_file)

        # Variables
        templateVars = self.templateVars

        # Process the template
        dest_dir = 'profiles_servers'
        dest_file = '%s.auto.tfvars' % templateVars['org']
        wr_method = 'a'
        process_method(wr_method, dest_dir, dest_file, template, **templateVars)

        # for org in self.orgs:
        #     templateVars = self.templateVars
        #     templateVars['org'] = org
        #     for i in json_data['config']['orgs'][0]['bios_policies']:
        #         templateVars['bios'] = {}
        #         jfile = 'bios_map.json'
        #         jopen = open(jfile, 'r')
        #         jdata = json.load(jopen)
        #         for k, v in i.items():
        #             if not v == 'platform-default':
        #                 imm_setting = jdata['bios_map'][0][k]
        #                 if imm_setting == "MISSING":
        #                     print(f'UCSM BIOS Setting is {k} and IMM BIOS Setting is {imm_setting}')
        #                 else:
        #                     templateVars['bios'].update({imm_setting: v})
        #         # print(json.dumps(templateVars['bios'], indent=4))
        #
        #         # Process the template
        #         dest_dir = 'profiles_servers'
        #         dest_file = '%s.auto.tfvars' % templateVars['org']
        #         wr_method = 'w'
        #         process_method(wr_method, dest_dir, dest_file, template, **templateVars)

    def ethernet_adapter_policies(self):
        header = 'Ethernet (vNIC) Adapter Policies'
        initial_policy = True
        template_type = 'ethernet_adapter_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def ethernet_network_control_policies(self):
        header = 'Ethernet (vNIC) Network Control Policies'
        initial_policy = True
        template_type = 'ethernet_network_control_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def ethernet_network_group_policies(self):
        header = 'Ethernet (vNIC) Network (VLAN) Group Policies'
        initial_policy = True
        template_type = 'ethernet_network_group_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def ethernet_qos_policies(self):
        header = 'Ethernet (vNIC) QoS Policies'
        initial_policy = True
        template_type = 'ethernet_qos_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def fibre_channel_adapter_policies(self):
        header = 'Fibre Channel (vHBA) Adapter Policies'
        initial_policy = True
        template_type = 'fibre_channel_adapter_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def fibre_channel_network_policies(self):
        header = 'Fibre Channel (vHBA) Network Policies'
        initial_policy = True
        template_type = 'fibre_channel_network_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def fibre_channel_qos_policies(self):
        header = 'Fibre Channel (vHBA) QoS Policies'
        initial_policy = True
        template_type = 'fibre_channel_qos_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def flow_control_policies(self):
        header = 'Flow Control Policies'
        initial_policy = True
        template_type = 'flow_control_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def imc_access_policies(self):
        header = 'IMC Access Policies'
        initial_policy = True
        template_type = 'imc_access_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def ip_pools(self):
        header = 'IP Pools'
        initial_policy = True
        template_type = 'ip_pools'

        # Set the org_count to 0 for the First Organization
        org_count = 0

        # Loop through the orgs discovered by the Class
        for org in self.orgs:

            # Pull in Variables from Class
            templateVars = self.templateVars
            templateVars['org'] = org

            # Define the Template Source
            templateVars['header'] = header
            templateVars['variable_block'] = template_type
            template_file = "template_open.jinja2"
            template = self.templateEnv.get_template(template_file)

            # Process the template
            dest_dir = '%s' % (self.type)
            dest_file = '%s.auto.tfvars' % (template_type)
            if initial_policy == True:
                write_method = 'w'
            else:
                write_method = 'a'
            process_method(write_method, dest_dir, dest_file, template, **templateVars)

            # Define the Template Source
            template_file = '%s.jinja2' % (template_type)
            template = self.templateEnv.get_template(template_file)

            if template_type in self.json_data['config']['orgs'][org_count]:
                for item in self.json_data['config']['orgs'][org_count][template_type]:
                    for k, v in item.items():
                        templateVars[k] = v

                    if 'ipv6_blocks' in templateVars:
                        index_count = 0
                        for i in templateVars['ipv6_blocks']:
                             index_count += 1

                        for r in range(0,index_count):
                            if 'to' in templateVars['ipv6_blocks'][r]:
                                templateVars['ipv6_blocks'][r]['size'] = templateVars['ipv6_blocks'][r].pop('to')
                                templateVars['ipv6_blocks'][r]['size'] = int(
                                    ipaddress.IPv6Address(templateVars['ipv6_blocks'][r]["size"])
                                    ) - int(ipaddress.IPv6Address(templateVars['ipv6_blocks'][r]["from"])) + 1

                    # Process the template
                    dest_dir = '%s' % (self.type)
                    dest_file = '%s.auto.tfvars' % (template_type)
                    process_method('a', dest_dir, dest_file, template, **templateVars)

            # Define the Template Source
            template_file = "template_close.jinja2"
            template = self.templateEnv.get_template(template_file)

            # Process the template
            dest_dir = '%s' % (self.type)
            dest_file = '%s.auto.tfvars' % (template_type)
            process_method('a', dest_dir, dest_file, template, **templateVars)

            # Increment the org_count for the next Organization Loop
            org_count += 1

    def ipmi_over_lan_policies(self):
        header = 'IPMI over LAN Policies'
        initial_policy = True
        template_type = 'ipmi_over_lan_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def iqn_pools(self):
        header = 'IQN Pools'
        initial_policy = True
        template_type = 'iqn_pools'

        # Set the org_count to 0 for the First Organization
        org_count = 0

        # Loop through the orgs discovered by the Class
        for org in self.orgs:

            # Pull in Variables from Class
            templateVars = self.templateVars
            templateVars['org'] = org

            # Define the Template Source
            templateVars['header'] = header
            templateVars['variable_block'] = template_type
            template_file = "template_open.jinja2"
            template = self.templateEnv.get_template(template_file)

            # Process the template
            dest_dir = '%s' % (self.type)
            dest_file = '%s.auto.tfvars' % (template_type)
            if initial_policy == True:
                write_method = 'w'
            else:
                write_method = 'a'
            process_method(write_method, dest_dir, dest_file, template, **templateVars)

            # Define the Template Source
            template_file = '%s.jinja2' % (template_type)
            template = self.templateEnv.get_template(template_file)

            if template_type in self.json_data['config']['orgs'][org_count]:
                for item in self.json_data['config']['orgs'][org_count][template_type]:
                    for k, v in item.items():
                        templateVars[k] = v

                    if 'iqn_blocks' in templateVars:
                        index_count = 0
                        for i in templateVars['iqn_blocks']:
                             index_count += 1

                        for r in range(0,index_count):
                            if 'to' in templateVars['iqn_blocks'][r]:
                                templateVars['iqn_blocks'][r]['size'] = templateVars['iqn_blocks'][r].pop('to')
                                templateVars['iqn_blocks'][r]['size'] = int(
                                    templateVars['iqn_blocks'][r]["size"]
                                    ) - int(templateVars['iqn_blocks'][r]["from"]) + 1

                    # Process the template
                    dest_dir = '%s' % (self.type)
                    dest_file = '%s.auto.tfvars' % (template_type)
                    process_method('a', dest_dir, dest_file, template, **templateVars)

            # Define the Template Source
            template_file = "template_close.jinja2"
            template = self.templateEnv.get_template(template_file)

            # Process the template
            dest_dir = '%s' % (self.type)
            dest_file = '%s.auto.tfvars' % (template_type)
            process_method('a', dest_dir, dest_file, template, **templateVars)

            # Increment the org_count for the next Organization Loop
            org_count += 1

    def iscsi_adapter_policies(self):
        header = 'iSCSI Adapter Policies'
        initial_policy = True
        template_type = 'iscsi_adapter_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def iscsi_boot_policies(self):
        header = 'iSCSI Boot Policies'
        initial_policy = True
        template_type = 'iscsi_boot_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def iscsi_static_target_policies(self):
        header = 'iSCSI Static Target Policies'
        initial_policy = True
        template_type = 'iscsi_static_target_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def lan_connectivity_policies(self):
        header = 'LAN Connectivity Policies'
        initial_policy = True
        template_type = 'lan_connectivity_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def lan_port_channel(self, json_data):
        # Variables
        templateVars = self.templateVars
        template_file = "uplink_lan_port_channel_open.jinja2"
        template = self.templateEnv.get_template(template_file)
        # Process the template
        dest_dir = 'profiles_domains'
        dest_file = '%s.auto.tfvars' % templateVars['org']
        wr_method = 'a'
        process_method(wr_method, dest_dir, dest_file, template, **templateVars)

        # Define the Template Source
        template_file = "uplink_lan_port_channel.jinja2"
        template = self.templateEnv.get_template(template_file)

        # Variables
        templateVars['lan_port_channel'] = json_data['config']['lan_port_channels']
        pc_count = 0
        for v in json_data['config']['lan_port_channels']:
            pc_count += 1

        for c in range(0,pc_count):
            int_count = 0
            for v in json_data['config']['lan_port_channels'][c]['interfaces']:
                int_count += 1
            int_count -= 1
            templateVars['flow_control'] = json_data['config']['lan_port_channels'][c]['flow_control_policy']
            templateVars['link_aggregation'] = json_data['config']['lan_port_channels'][c]['lacp_policy']
            templateVars['link_controln'] = 'default'
            templateVars['name'] = json_data['config']['lan_port_channels'][c]['name']
            templateVars['begin'] = json_data['config']['lan_port_channels'][c]['interfaces'][0]['port_id']
            templateVars['end'] = json_data['config']['lan_port_channels'][c]['interfaces'][int_count]['port_id']

            # Process the template
            dest_dir = 'profiles_domains'
            dest_file = '%s.auto.tfvars' % templateVars['org']
            wr_method = 'a'
            process_method(wr_method, dest_dir, dest_file, template, **templateVars)

        # Variables
        templateVars = self.templateVars
        template_file = "uplink_lan_port_channel_close.jinja2"
        template = self.templateEnv.get_template(template_file)
        # Process the template
        dest_dir = 'profiles_domains'
        dest_file = '%s.auto.tfvars' % templateVars['org']
        wr_method = 'a'
        process_method(wr_method, dest_dir, dest_file, template, **templateVars)

    def link_aggregation_policies(self):
        header = 'Link Aggregation Policies'
        initial_policy = True
        template_type = 'link_aggregation_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def link_control_policies(self):
        header = 'Link Control Policies'
        initial_policy = True
        template_type = 'link_control_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def mac_pools(self):
        header = 'MAC Pools'
        initial_policy = True
        template_type = 'mac_pools'

        policy_loop_standard(self, header, initial_policy, template_type)

    def multicast_policies(self):
        header = 'Multicast Policies'
        initial_policy = True
        template_type = 'multicast_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def network_connectivity_policies(self):
        header = 'Network Connectivity (DNS) Policies'
        initial_policy = True
        template_type = 'network_connectivity_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def ntp_policies(self):
        header = 'NTP Policies'
        initial_policy = True
        template_type = 'ntp_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def port_policies(self):
        header = 'Port Policies'
        initial_policy = True
        template_type = 'port_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def power_policies(self):
        header = 'Power Policies'
        initial_policy = True
        template_type = 'power_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def san_connectivity_policies(self):
        header = 'SAN Connectivity Policies'
        initial_policy = True
        template_type = 'san_connectivity_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def sd_card_policies(self):
        header = 'SD Card Policies'
        initial_policy = True
        template_type = 'sd_card_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def serial_over_lan_policies(self):
        header = 'Serial over LAN Policies'
        initial_policy = True
        template_type = 'serial_over_lan_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def snmp_policies(self):
        header = 'SNMP Policies'
        initial_policy = True
        template_type = 'snmp_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def switch_control_policies(self):
        header = 'Switch Control Policies'
        initial_policy = True
        template_type = 'switch_control_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def syslog_policies(self):
        header = 'Syslog Policies'
        initial_policy = True
        template_type = 'syslog_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def system_qos_policies(self):
        header = 'System QoS'
        initial_policy = True
        template_type = 'system_qos_policies'

        # Set the org_count to 0 for the First Organization
        org_count = 0

        # Loop through the orgs discovered by the Class
        for org in self.orgs:

            # Pull in Variables from Class
            templateVars = self.templateVars
            templateVars['org'] = org

            # Define the Template Source
            templateVars['header'] = header
            templateVars['variable_block'] = template_type
            template_file = "template_open.jinja2"
            template = self.templateEnv.get_template(template_file)

            # Process the template
            dest_dir = '%s' % (self.type)
            dest_file = '%s.auto.tfvars' % (template_type)
            if initial_policy == True:
                write_method = 'w'
            else:
                write_method = 'a'
            process_method(write_method, dest_dir, dest_file, template, **templateVars)

            # Define the Template Source
            template_file = '%s.jinja2' % (template_type)
            template = self.templateEnv.get_template(template_file)

            if template_type in self.json_data['config']['orgs'][org_count]:
                for item in self.json_data['config']['orgs'][org_count][template_type]:
                    for k, v in item.items():
                        if (k == 'name' or k == 'descr' or k == 'tags'):
                            templateVars[k] = v

                templateVars['classes'] = []
                for r in range(0,6):
                    xdict = {}
                    templateVars['classes'].append(xdict)

                class_count = 0
                for item in self.json_data['config']['orgs'][org_count][template_type][0]['classes']:
                    for k, v in item.items():
                        if k == 'multicast_optimized':
                            templateVars['classes'][class_count]['multicast_optimize'] = v
                        elif k == 'state':
                            templateVars['classes'][class_count]['admin_state'] = v
                        elif k == 'priority':
                            templateVars['classes'][class_count]['name'] = v
                        else:
                            templateVars['classes'][class_count][k] = v

                    class_count += 1

                total_weight = 0

                for r in range(0,6):
                    if templateVars['classes'][r]['admin_state'] == 'Enabled':
                        total_weight += int(templateVars['classes'][r]['weight'])

                for r in range(0,6):
                    if templateVars['classes'][r]['admin_state'] == 'Enabled':
                        x = ((int(templateVars['classes'][r]['weight']) / total_weight) * 100)
                        templateVars['classes'][r]['bandwidth_percent'] = str(x).split('.')[0]
                    else:
                        templateVars['classes'][r]['bandwidth_percent'] = 0

                # Process the template
                dest_dir = '%s' % (self.type)
                dest_file = '%s.auto.tfvars' % (template_type)
                process_method('a', dest_dir, dest_file, template, **templateVars)

            # Define the Template Source
            template_file = "template_close.jinja2"
            template = self.templateEnv.get_template(template_file)

            # Process the template
            dest_dir = '%s' % (self.type)
            dest_file = '%s.auto.tfvars' % (template_type)
            process_method('a', dest_dir, dest_file, template, **templateVars)

            # Increment the org_count for the next Organization Loop
            org_count += 1

    def thermal_policies(self):
        header = 'Thermal Policies'
        initial_policy = True
        template_type = 'thermal_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def ucs_domain_profiles(self):
        header = 'UCS Domain Profiles'
        initial_policy = True
        template_type = 'ucs_domain_profiles'

        policy_loop_standard(self, header, initial_policy, template_type)

    def ucs_server_profiles(self):
        header = 'UCS Server Profiles'
        initial_policy = True
        template_type = 'ucs_server_profiles'

        policy_loop_standard(self, header, initial_policy, template_type)

    def ucs_server_profile_templates(self):
        header = 'UCS Server Profile Templates'
        initial_policy = True
        template_type = 'ucs_server_profile_templates'

        policy_loop_standard(self, header, initial_policy, template_type)

    def virtual_kvm_policies(self):
        header = 'Virtual KVM Policies'
        initial_policy = True
        template_type = 'virtual_kvm_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def virtual_media_policies(self):
        header = 'Virtual Media Policies'
        initial_policy = True
        template_type = 'virtual_media_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def vlan_policies(self):
        header = 'VLAN Policies'
        initial_policy = True
        template_type = 'vlan_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def vsan_policies(self):
        header = 'VSAN Policies'
        initial_policy = True
        template_type = 'vsan_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def wwnn_pools(self):
        header = 'Fibre Channel WWNN Pools'
        initial_policy = True
        template_type = 'wwnn_pools'

        policy_loop_standard(self, header, initial_policy, template_type)

    def wwpn_pools(self):
        header = 'Fibre Channel WWPN Pools'
        initial_policy = True
        template_type = 'wwpn_pools'

        policy_loop_standard(self, header, initial_policy, template_type)

def policy_loop_standard(self, header, initial_policy, template_type):
    # Set the org_count to 0 for the First Organization
    org_count = 0

    # Loop through the orgs discovered by the Class
    for org in self.orgs:

        # Pull in Variables from Class
        templateVars = self.templateVars
        templateVars['org'] = org

        # Define the Template Source
        templateVars['header'] = header
        templateVars['variable_block'] = template_type
        template_file = "template_open.jinja2"
        template = self.templateEnv.get_template(template_file)

        # Process the template
        dest_dir = '%s' % (self.type)
        dest_file = '%s.auto.tfvars' % (template_type)
        if initial_policy == True:
            write_method = 'w'
        else:
            write_method = 'a'
        process_method(write_method, dest_dir, dest_file, template, **templateVars)

        # Define the Template Source
        template_file = '%s.jinja2' % (template_type)
        template = self.templateEnv.get_template(template_file)

        if template_type in self.json_data['config']['orgs'][org_count]:
            for item in self.json_data['config']['orgs'][org_count][template_type]:
                for k, v in item.items():
                    templateVars[k] = v

                # Process the template
                dest_dir = '%s' % (self.type)
                dest_file = '%s.auto.tfvars' % (template_type)
                process_method('a', dest_dir, dest_file, template, **templateVars)

        # Define the Template Source
        template_file = "template_close.jinja2"
        template = self.templateEnv.get_template(template_file)

        # Process the template
        dest_dir = '%s' % (self.type)
        dest_file = '%s.auto.tfvars' % (template_type)
        process_method('a', dest_dir, dest_file, template, **templateVars)

        # Increment the org_count for the next Organization Loop
        org_count += 1

def process_method(wr_method, dest_dir, dest_file, template, **templateVars):
    # create_tfvars_file(wr_method, dest_dir, dest_file, template, **templateVars)
    dest_dir = './UCS/%s/%s' % (templateVars['org'], dest_dir)
    if not os.path.isdir(dest_dir):
        mk_dir = 'mkdir -p %s' % (dest_dir)
        os.system(mk_dir)
    dest_file_path = '%s/%s' % (dest_dir, dest_file)
    if not os.path.isfile(dest_file_path):
        create_file = 'touch %s' % (dest_file_path)
        os.system(create_file)
    tf_file = dest_file_path
    wr_file = open(tf_file, wr_method)

    # Render Payload and Write to File
    payload = template.render(templateVars)
    wr_file.write(payload)
    wr_file.close()

