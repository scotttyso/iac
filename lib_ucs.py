#!/usr/bin/env python3

import codecs
import copy
import getpass
import ipaddress
import jinja2
import os, re, sys
import pkg_resources
import validating_ucs
from pathlib import Path

ucs_template_path = pkg_resources.resource_filename('lib_ucs', 'ucs_templates/')

class config_conversion(object):
    def __init__(self, json_data, type):
        self.json_data = json_data
        self.templateLoader = jinja2.FileSystemLoader(
            searchpath=(ucs_template_path + '%s/') % (type))
        self.templateEnv = jinja2.Environment(loader=self.templateLoader)
        self.templateVars = {}
        self.type = type
        self.orgs = []
        for item in json_data["config"]["orgs"]:
            for k, v in item.items():
                if k == 'name':
                    self.orgs.append(v)

    def bios_policies(self):
        header = 'BIOS Policy Variables'
        initial_policy = True
        template_type = 'bios_policies'

        # Set the org_count to 0 for the First Organization
        org_count = 0

        # Loop through the orgs discovered by the Class
        for org in self.orgs:

            # Pull in Variables from Class
            templateVars = self.templateVars
            templateVars["org"] = org

            # Define the Template Source
            templateVars["header"] = header
            templateVars["template_type"] = template_type
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

            if template_type in self.json_data["config"]["orgs"][org_count]:
                for item in self.json_data["config"]["orgs"][org_count][template_type]:
                    # Reset TemplateVars to Default for each Loop
                    templateVars = {}
                    templateVars["org"] = org

                    # Define the Template Source
                    templateVars["header"] = header

                    for k, v in item.items():
                        if (k == 'name' or k == 'descr' or k == 'tags'):
                            templateVars[k] = v

                    templateVars["bios_settings"] = {}
                    for k, v in item.items():
                        if not (k == 'name' or k == 'descr' or k == 'tags'):
                            templateVars["bios_settings"][k] = v

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

    def boot_order_policies(self):
        header = 'Boot Order Policy Variables'
        initial_policy = True
        template_type = 'boot_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def ethernet_adapter_policies(self):
        header = 'Ethernet Adapter Policy Variables'
        initial_policy = True
        template_type = 'ethernet_adapter_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def ethernet_network_control_policies(self):
        header = 'Ethernet Network Control Policy Variables'
        initial_policy = True
        template_type = 'ethernet_network_control_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def ethernet_network_group_policies(self):
        header = 'Ethernet Network Group Policy Variables'
        initial_policy = True
        template_type = 'ethernet_network_group_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def ethernet_network_policies(self):
        header = 'Ethernet Network Policy Variables'
        initial_policy = True
        template_type = 'ethernet_network_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def ethernet_qos_policies(self):
        header = 'Ethernet QoS Policy Variables'
        initial_policy = True
        template_type = 'ethernet_qos_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def fibre_channel_adapter_policies(self):
        header = 'Fibre Channel Adapter Policy Variables'
        initial_policy = True
        template_type = 'fibre_channel_adapter_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def fibre_channel_network_policies(self):
        header = 'Fibre Channel Network Policy Variables'
        initial_policy = True
        template_type = 'fibre_channel_network_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def fibre_channel_qos_policies(self):
        header = 'Fibre Channel QoS Policy Variables'
        initial_policy = True
        template_type = 'fibre_channel_qos_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def flow_control_policies(self):
        header = 'Flow Control Policy Variables'
        initial_policy = True
        template_type = 'flow_control_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def imc_access_policies(self):
        header = 'IMC Access Policiy Variables'
        initial_policy = True
        template_type = 'imc_access_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def ip_pools(self):
        header = 'IP Pool Variables'
        initial_policy = True
        template_type = 'ip_pools'

        # Set the org_count to 0 for the First Organization
        org_count = 0

        # Loop through the orgs discovered by the Class
        for org in self.orgs:

            # Pull in Variables from Class
            templateVars = self.templateVars
            templateVars["org"] = org

            # Define the Template Source
            templateVars["header"] = header
            templateVars["template_type"] = template_type
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

            if template_type in self.json_data["config"]["orgs"][org_count]:
                for item in self.json_data["config"]["orgs"][org_count][template_type]:
                    # Reset TemplateVars to Default for each Loop
                    templateVars = {}
                    templateVars["org"] = org

                    # Define the Template Source
                    templateVars["header"] = header

                    for k, v in item.items():
                        templateVars[k] = v

                    if 'ipv6_blocks' in templateVars:
                        index_count = 0
                        for i in templateVars["ipv6_blocks"]:
                             index_count += 1

                        for r in range(0,index_count):
                            if 'to' in templateVars["ipv6_blocks"][r]:
                                templateVars["ipv6_blocks"][r]["size"] = templateVars["ipv6_blocks"][r].pop('to')
                                templateVars["ipv6_blocks"][r]["size"] = int(
                                    ipaddress.IPv6Address(templateVars["ipv6_blocks"][r]["size"])
                                    ) - int(ipaddress.IPv6Address(templateVars["ipv6_blocks"][r]["from"])) + 1

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
        header = 'IPMI over LAN Policy Variables'
        initial_policy = True
        template_type = 'ipmi_over_lan_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def iqn_pools(self):
        header = 'IQN Pool Variables'
        initial_policy = True
        template_type = 'iqn_pools'

        # Set the org_count to 0 for the First Organization
        org_count = 0

        # Loop through the orgs discovered by the Class
        for org in self.orgs:

            # Pull in Variables from Class
            templateVars = self.templateVars
            templateVars["org"] = org

            # Define the Template Source
            templateVars["header"] = header
            templateVars["template_type"] = template_type
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

            if template_type in self.json_data["config"]["orgs"][org_count]:
                for item in self.json_data["config"]["orgs"][org_count][template_type]:
                    # Reset TemplateVars to Default for each Loop
                    templateVars = {}
                    templateVars["org"] = org

                    # Define the Template Source
                    templateVars["header"] = header

                    for k, v in item.items():
                        templateVars[k] = v

                    if 'iqn_blocks' in templateVars:
                        index_count = 0
                        for i in templateVars["iqn_blocks"]:
                             index_count += 1

                        for r in range(0,index_count):
                            if 'to' in templateVars["iqn_blocks"][r]:
                                templateVars["iqn_blocks"][r]["size"] = templateVars["iqn_blocks"][r].pop('to')
                                templateVars["iqn_blocks"][r]["size"] = int(
                                    templateVars["iqn_blocks"][r]["size"]
                                    ) - int(templateVars["iqn_blocks"][r]["from"]) + 1

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
        header = 'iSCSI Adapter Policy Variables'
        initial_policy = True
        template_type = 'iscsi_adapter_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def iscsi_boot_policies(self):
        header = 'iSCSI Boot Policy Variables'
        initial_policy = True
        template_type = 'iscsi_boot_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def iscsi_static_target_policies(self):
        header = 'iSCSI Static Target Policy Variables'
        initial_policy = True
        template_type = 'iscsi_static_target_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def lan_connectivity_policies(self):
        header = 'LAN Connectivity Policy Variables'
        initial_policy = True
        template_type = 'lan_connectivity_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def link_aggregation_policies(self):
        header = 'Link Aggregation Policy Variables'
        initial_policy = True
        template_type = 'link_aggregation_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def link_control_policies(self):
        header = 'Link Control Policy Variables'
        initial_policy = True
        template_type = 'link_control_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def mac_pools(self):
        header = 'MAC Pool Variables'
        initial_policy = True
        template_type = 'mac_pools'

        policy_loop_standard(self, header, initial_policy, template_type)

    def multicast_policies(self):
        header = 'Multicast Policy Variables'
        initial_policy = True
        template_type = 'multicast_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def network_connectivity_policies(self):
        header = 'Network Connectivity (DNS) Policy Variables'
        initial_policy = True
        template_type = 'network_connectivity_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def ntp_policies(self):
        header = 'NTP Policy Variables'
        initial_policy = True
        template_type = 'ntp_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def port_policies(self):
        header = 'Port Policy Variables'
        initial_policy = True
        template_type = 'port_policies'

        # Set the org_count to 0 for the First Organization
        org_count = 0

        # Loop through the orgs discovered by the Class
        for org in self.orgs:

            # Pull in Variables from Class
            templateVars = self.templateVars
            templateVars["org"] = org

            # Define the Template Source
            templateVars["header"] = header
            templateVars["template_type"] = template_type
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

            if template_type in self.json_data["config"]["orgs"][org_count]:
                for item in self.json_data["config"]["orgs"][org_count][template_type]:
                    # Reset TemplateVars to Default for each Loop
                    templateVars = {}
                    templateVars["org"] = org

                    # Define the Template Source
                    templateVars["header"] = header
                    for k, v in item.items():
                        if re.search(r'(_port_channels)', k):
                            templateVars[k] = []
                            attribute_list = {}
                            for i in v:
                                interface_list = []
                                for key, value in i.items():
                                    #if key == 'interfaces':
                                    #    for interfaces in value:
                                    #        int_dict = {}
                                    #        for keys, values in interfaces.items():
                                    #            if keys == 'aggr_id':
                                    #                int_dict.update({'breakout_port_id': values})
                                    #            elif keys == 'port_id':
                                    #                int_dict.update({'port_id': values})
                                    #            elif keys == 'slot_id':
                                    #                int_dict.update({'slot_id': values})
                                    #        x = copy.deepcopy(int_dict)
                                    #        interface_list.append(x)
                                    #        int_dict = {}
                                    # else:
                                    #     attribute_list.update({key: value})
                                    # attribute_list.update({'interfaces': interface_list})
                                    attribute_list.update({key: value})

                                attribute_list = dict(sorted(attribute_list.items()))
                                xdeep = copy.deepcopy(attribute_list)
                                templateVars[k].append(xdeep)
                                # print(k, templateVars[k])
                        elif re.search(r'(server_ports)', k):
                            aggr_ids = []
                            ports_count = 0
                            templateVars[k] = []
                            slot_ids = []
                            for i in v:
                                for key, value in i.items():
                                    if key == 'aggr_id':
                                        aggr_ids.append(value)
                                    if key == 'slot_id':
                                        slot_ids.append(value)
                            aggr_ids = list(set(aggr_ids))
                            slot_ids = list(set(slot_ids))
                            if len(aggr_ids) or len(slot_ids) > 1:
                                for i in v:
                                    attribute_list = {}
                                    port_list = []
                                    for key, value in i.items():
                                        if key == 'aggr_id':
                                            attribute_list.update({'breakout_port_id': value})
                                        elif key == 'port_id':
                                            port_list.append(value)
                                        else:
                                            attribute_list.update({'slot_id': value})
                                    attribute_list.update({'key_id': ports_count})
                                    attribute_list.update({'port_list': port_list})
                                    attribute_list = dict(sorted(attribute_list.items()))
                                    xdeep = copy.deepcopy(attribute_list)
                                    templateVars[k].append(xdeep)
                                    ports_count += 1
                            else:
                                attribute_list = {}
                                port_list = []
                                for i in v:
                                    for key, value in i.items():
                                        if key == 'aggr_id':
                                            attribute_list.update({'aggr_id': value})
                                        elif key == 'port_id':
                                            port_list.append(value)
                                        elif key == 'slot_id':
                                            attribute_list.update({'slot_id': value})
                                attribute_list.update({'key_id': ports_count})
                                ports_count += 1
                                port_list = ",".join("{0}".format(n) for n in port_list)
                                attribute_list.update({'port_list': port_list})
                                attribute_list = dict(sorted(attribute_list.items()))
                                xdeep = copy.deepcopy(attribute_list)
                                templateVars[k].append(xdeep)
                            # print(k, templateVars[k])
                        elif re.search(r'(san_unified_ports)', k):
                            for key, value in v.items():
                                if key == 'port_id_start':
                                    begin = value
                                elif key == 'port_id_end':
                                    end = value
                                elif key == 'slot_id':
                                    slot_id = value
                            templateVars["port_modes"] = {'port_list': [begin, end], 'slot_id': slot_id}
                        elif re.search(r'(_ports)$', k):
                            ports_count = 0
                            templateVars[k] = []
                            attribute_list = {}
                            for i in v:
                                for key, value in i.items():
                                    attribute_list.update({key: value})
                                attribute_list.update({'key_id': ports_count})
                                attribute_list = dict(sorted(attribute_list.items()))
                                xdeep = copy.deepcopy(attribute_list)
                                templateVars[k].append(xdeep)
                                ports_count += 1
                            # print(k, templateVars[k])
                        else:
                            templateVars[k] = v
                    if 'appliance_port_channels' in templateVars:
                        templateVars["port_channel_appliances"] = templateVars["appliance_port_channels"]
                        del templateVars["appliance_port_channels"]
                    if 'lan_port_channels' in templateVars:
                        templateVars["port_channel_ethernet_uplinks"] = templateVars["lan_port_channels"]
                        del templateVars["lan_port_channels"]
                    if 'san_port_channels' in templateVars:
                        templateVars["port_channel_fc_uplinks"] = templateVars["san_port_channels"]
                        del templateVars["san_port_channels"]
                        print(templateVars["port_channel_fc_uplinks"])
                    if 'fcoe_port_channels' in templateVars:
                        templateVars["port_channel_fcoe_uplinks"] = templateVars["fcoe_port_channels"]
                        del templateVars["fcoe_port_channels"]
                    if 'appliance_ports' in templateVars:
                        templateVars["port_role_appliances"] = templateVars["appliance_ports"]
                        del templateVars["appliance_ports"]
                    if 'lan_uplink_ports' in templateVars:
                        templateVars["port_role_ethernet_uplinks"] = templateVars["lan_uplink_ports"]
                        del templateVars["lan_uplink_ports"]
                    if 'san_uplink_ports' in templateVars:
                        templateVars["port_role_fc_uplinks"] = templateVars["san_uplink_ports"]
                        del templateVars["san_uplink_ports"]
                    if 'fcoe_uplink_ports' in templateVars:
                        templateVars["port_role_fcoe_uplinks"] = templateVars["fcoe_uplink_ports"]
                        del templateVars["fcoe_uplink_ports"]
                    if 'server_ports' in templateVars:
                        templateVars["port_role_servers"] = templateVars["server_ports"]
                        del templateVars["server_ports"]

                    templateVars = dict(sorted(templateVars.items()))
                    # print(templateVars)

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

    def power_policies(self):
        header = 'Power Policy Variables'
        initial_policy = True
        template_type = 'power_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def san_connectivity_policies(self):
        header = 'SAN Connectivity Policy Variables'
        initial_policy = True
        template_type = 'san_connectivity_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def sd_card_policies(self):
        header = 'SD Card Policy Variables'
        initial_policy = True
        template_type = 'sd_card_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def serial_over_lan_policies(self):
        header = 'Serial over LAN Policy Variables'
        initial_policy = True
        template_type = 'serial_over_lan_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def snmp_policies(self):
        header = 'SNMP Policy Variables'
        initial_policy = True
        template_type = 'snmp_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def storage_policies(self):
        header = 'Storage Policy Variables'
        initial_policy = True
        template_type = 'storage_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def switch_control_policies(self):
        header = 'Switch Control Policy Variables'
        initial_policy = True
        template_type = 'switch_control_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def syslog_policies(self):
        header = 'Syslog Policy Variables'
        initial_policy = True
        template_type = 'syslog_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def system_qos_policies(self):
        header = 'System QoS Policy Variables'
        initial_policy = True
        template_type = 'system_qos_policies'

        # Set the org_count to 0 for the First Organization
        org_count = 0

        # Loop through the orgs discovered by the Class
        for org in self.orgs:

            # Pull in Variables from Class
            templateVars = self.templateVars
            templateVars["org"] = org

            # Define the Template Source
            templateVars["header"] = header
            templateVars["template_type"] = template_type
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

            if template_type in self.json_data["config"]["orgs"][org_count]:
                for item in self.json_data["config"]["orgs"][org_count][template_type]:
                    # Reset TemplateVars to Default for each Loop
                    templateVars = {}
                    templateVars["org"] = org

                    # Define the Template Source
                    templateVars["header"] = header

                    for k, v in item.items():
                        if (k == 'name' or k == 'descr' or k == 'tags'):
                            templateVars[k] = v

                templateVars["classes"] = []
                for r in range(0,6):
                    xdict = {}
                    templateVars["classes"].append(xdict)

                class_count = 0
                for item in self.json_data["config"]["orgs"][org_count][template_type][0]["classes"]:
                    for k, v in item.items():
                        templateVars["classes"][class_count][k] = v

                    class_count += 1

                total_weight = 0

                for r in range(0,6):
                    if templateVars["classes"][r]["state"] == 'Enabled':
                        total_weight += int(templateVars["classes"][r]["weight"])

                for r in range(0,6):
                    if templateVars["classes"][r]["state"] == 'Enabled':
                        x = ((int(templateVars["classes"][r]["weight"]) / total_weight) * 100)
                        templateVars["classes"][r]["bandwidth_percent"] = str(x).split('.')[0]
                    else:
                        templateVars["classes"][r]["bandwidth_percent"] = 0

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
        header = 'Thermal Policy Variables'
        initial_policy = True
        template_type = 'thermal_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def ucs_domain_profiles(self):
        header = 'UCS Domain Profile Variables'
        initial_policy = True
        template_type = 'ucs_domain_profiles'

        policy_loop_standard(self, header, initial_policy, template_type)

    def ucs_server_profiles(self):
        header = 'UCS Server Profile Variables'
        initial_policy = True
        template_type = 'ucs_server_profiles'

        policy_loop_standard(self, header, initial_policy, template_type)

    def ucs_server_profile_templates(self):
        header = 'UCS Server Profile Template Variables'
        initial_policy = True
        template_type = 'ucs_server_profile_templates'

        policy_loop_standard(self, header, initial_policy, template_type)

    def virtual_kvm_policies(self):
        header = 'Virtual KVM Policy Variables'
        initial_policy = True
        template_type = 'virtual_kvm_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def virtual_media_policies(self):
        header = 'Virtual Media Policy Variables'
        initial_policy = True
        template_type = 'virtual_media_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def vlan_policies(self):
        header = 'VLAN Policy Variables'
        initial_policy = True
        template_type = 'vlan_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def vsan_policies(self):
        header = 'VSAN Policy Variables'
        initial_policy = True
        template_type = 'vsan_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def uuid_pools(self):
        header = 'UUID Pool Variables'
        initial_policy = True
        template_type = 'uuid_pools'

        policy_loop_standard(self, header, initial_policy, template_type)

    def wwnn_pools(self):
        header = 'Fibre Channel WWNN Pool Variables'
        initial_policy = True
        template_type = 'wwnn_pools'

        policy_loop_standard(self, header, initial_policy, template_type)

    def wwpn_pools(self):
        header = 'Fibre Channel WWPN Pool Variables'
        initial_policy = True
        template_type = 'wwpn_pools'

        policy_loop_standard(self, header, initial_policy, template_type)

class easy_imm_wizard(object):
    def __init__(self, name_prefix, org, type):
        self.templateLoader = jinja2.FileSystemLoader(
            searchpath=(ucs_template_path + '%s/') % (type))
        self.templateEnv = jinja2.Environment(loader=self.templateLoader)
        self.name_prefix = name_prefix
        self.org = org
        self.type = type

    #========================================
    # BIOS Policy Module
    #========================================
    def bios_policies(self):
        name_prefix = self.name_prefix
        org = self.org
        policy_names = []
        policy_type = 'BIOS Policy'
        policy_x = 'BIOS'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["name_prefix"] = name_prefix
        templateVars["org"] = org
        templateVars["policy_file"] = 'bios_templates.txt'
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'bios_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        print(f'\n-------------------------------------------------------------------------------------------\n')
        print(f'  {policy_x} Policies:  To simplify your work, this wizard will use {policy_x}')
        print(f'  Templates that are pre-configured.  You can add custom {policy_x} policy')
        print(f'  configuration to the {templateVars["template_type"]}.auto.tfvars file at your descretion.')
        print(f'  That will not be covered by this wizard as the focus of the wizard is on simplicity.\n')
        print(f'  This wizard will save the configuraton for this section to the following file:')
        print(f'  - Intersight/{org}/{self.type}/{templateVars["template_type"]}.auto.tfvars')
        print(f'\n-------------------------------------------------------------------------------------------\n')

        templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
        policy_names = policy_template(self, **templateVars)

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # Boot Order Policy Module
    #========================================
    def boot_order_policies(self):
        name_prefix = self.name_prefix
        name_suffix = 'boot_order'
        org = self.org
        policy_names = []
        policy_type = 'Boot Order Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'boot_order_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            configure = input(f'Do You Want to Configure a {policy_type}.  Enter "Y" or "N" [Y]: ')
            if configure == 'Y' or configure == '':
                policy_loop = False
                while policy_loop == False:

                    if not name_prefix == '':
                        name = '%s_%s' % (name_prefix, name_suffix)
                    else:
                        name = '%s_%s' % (org, name_suffix)

                    templateVars["name"] = policy_name(name, policy_type)
                    templateVars["descr"] = policy_descr(templateVars["name"], policy_type)

                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    print(f'  Assignment order decides the order in which the next identifier is allocated.')
                    print(f'    1. default - (Intersight Default) Assignment order is decided by the system.')
                    print(f'    2. sequential - (Recommended) Identifiers are assigned in a sequential order.')
                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    valid = False
                    while valid == False:
                        templateVars["assignment_order"] = input('Specify the Index for the value to select [2]: ')
                        if templateVars["assignment_order"] == '' or templateVars["assignment_order"] == '2':
                            templateVars["assignment_order"] = 'sequential'
                            valid = True
                        elif templateVars["assignment_order"] == '1':
                            templateVars["assignment_order"] = 'default'
                            valid = True
                        else:
                            print(f'\n-------------------------------------------------------------------------------------------\n')
                            print(f'  Error!! Invalid Option.  Please Select a valid option from the List.')
                            print(f'\n-------------------------------------------------------------------------------------------\n')

                    # Write Policies to Template File
                    templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                    write_to_template(self, **templateVars)

                    # Add Template Name to Policies Output
                    policy_names.append(templateVars["name"])

                    exit_answer = input(f'Would You like to Configure another {policy_type}?  Enter "Y" or "N" [N]: ')
                    if exit_answer == 'N' or exit_answer == '':
                        policy_loop = True
                        configure_loop = True
            elif configure == 'N':
                configure_loop = True
            else:
                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                print(f'\n-------------------------------------------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # Ethernet Adapter Policy Module
    #========================================
    def ethernet_adapter_policies(self):
        name_prefix = self.name_prefix
        org = self.org
        policy_names = []
        policy_type = 'Ethernet Adapter Policy'
        policy_x = 'Ethernet Adapter'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["name_prefix"] = name_prefix
        templateVars["org"] = org
        templateVars["policy_file"] = 'ethernet_adapter_templates.txt'
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'ethernet_adapter_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        print(f'\n-------------------------------------------------------------------------------------------\n')
        print(f'  {policy_x} Policies:  To simplify your work, this wizard will use {policy_x}')
        print(f'  Templates that are pre-configured.  You can add custom {policy_x} policy')
        print(f'  configuration to the {templateVars["template_type"]}.auto.tfvars file at your descretion.')
        print(f'  That will not be covered by this wizard as the focus of the wizard is on simplicity.\n')
        print(f'  This wizard will save the configuraton for this section to the following file:')
        print(f'  - Intersight/{org}/{self.type}/{templateVars["template_type"]}.auto.tfvars')
        print(f'\n-------------------------------------------------------------------------------------------\n')

        templateVars["template_file"] = 'ethernet_adapter_templates.jinja2'
        policy_names = policy_template(self, **templateVars)

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # Ethernet Network Control Policy Module
    #========================================
    def ethernet_network_control_policies(self):
        name_prefix = self.name_prefix
        name_suffix = 'netwk_ctrl'
        org = self.org
        policy_names = []
        policy_type = 'Ethernet Network Control Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'ethernet_network_control_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  An {policy_type} will allow you to control Network Discovery with ')
            print(f'  protocols like CDP and LLDP as well as MAC Address Control Features.\n')
            print(f'  This wizard will save the configuraton for this section to the following file:')
            print(f'  - Intersight/{org}/{self.type}/{templateVars["template_type"]}.auto.tfvars')
            print(f'\n-------------------------------------------------------------------------------------------\n')
            policy_loop = False
            while policy_loop == False:

                if not name_prefix == '':
                    name = '%s_%s' % (name_prefix, name_suffix)
                else:
                    name = '%s_%s' % (org, name_suffix)

                templateVars["name"] = policy_name(name, policy_type)
                templateVars["descr"] = policy_descr(templateVars["name"], policy_type)
                templateVars["action_on_uplink_fail"] = 'linkDown'

                valid = False
                while valid == False:
                    cdp = input('Do you want to enable CDP (Cisco Discovery Protocol) for this Policy?  Enter "Y" or "N" [Y]: ')
                    if cdp == '' or cdp == 'Y':
                        templateVars["cdp_enable"] = True
                        valid = True
                    elif cdp == 'N':
                        templateVars["cdp_enable"] = False
                        valid = True
                    else:
                        print(f'\n-------------------------------------------------------------------------------------------\n')
                        print(f'  Error!! Invalid Option.  Please enter "Y" or "N".')
                        print(f'\n-------------------------------------------------------------------------------------------\n')

                valid = False
                while valid == False:
                    cdp = input('Do you want to enable LLDP (Link Level Discovery Protocol) for this Policy?  Enter "Y" or "N" [Y]: ')
                    if cdp == '' or cdp == 'Y':
                        templateVars["lldp_receive_enable"] = True
                        templateVars["lldp_transmit_enable"] = True
                        valid = True
                    elif cdp == 'N':
                        templateVars["lldp_receive_enable"] = False
                        templateVars["lldp_transmit_enable"] = False
                        valid = True
                    else:
                        print(f'\n-------------------------------------------------------------------------------------------\n')
                        print(f'  Error!! Invalid Option.  Please enter "Y" or "N".')
                        print(f'\n-------------------------------------------------------------------------------------------\n')

                templateVars["policy_file"] = 'mac_register_mode.txt'
                templateVars["var_description"] = '   MAC Registration Mode:  Default is "nativeVlanOnly".\n   Determines the MAC addresses that have to be registered with the switch.'
                templateVars["var_type"] = 'MAC Registration Mode'
                templateVars["mac_register_mode"] = variable_loop(**templateVars)

                templateVars["policy_file"] = 'mac_security_forge.txt'
                templateVars["var_description"] = '   MAC Security Forge:  Default is "allow".\n   Determines if the MAC forging is allowed or denied on an interface.'
                templateVars["var_type"] = 'MAC Security Forge'
                templateVars["mac_security_forge"] = variable_loop(**templateVars)

                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Do you want to accept the following configuration?')
                print(f'    action_on_uplink_fail = "{templateVars["action_on_uplink_fail"]}"')
                print(f'    cdp_enable            = {templateVars["cdp_enable"]}')
                print(f'    description           = "{templateVars["descr"]}"')
                print(f'    lldp_enable_receive   = {templateVars["lldp_receive_enable"]}')
                print(f'    lldp_enable_transmit  = {templateVars["lldp_transmit_enable"]}')
                print(f'    mac_register_mode     = "{templateVars["mac_register_mode"]}"')
                print(f'    mac_security_forge    = "{templateVars["mac_security_forge"]}"')
                print(f'    name                  = "{templateVars["name"]}"')
                print(f'\n-------------------------------------------------------------------------------------------\n')
                valid_confirm = False
                while valid_confirm == False:
                    confirm_policy = input('Enter "Y" or "N" [Y]: ')
                    if confirm_policy == 'Y' or confirm_policy == '':
                        confirm_policy = 'Y'

                        # Write Policies to Template File
                        templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                        write_to_template(self, **templateVars)

                        # Add Template Name to Policies Output
                        policy_names.append(templateVars["name"])

                        configure_loop, policy_loop = exit_default_no(templateVars["policy_type"])
                        valid_confirm = True

                    elif confirm_policy == 'N':
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Starting {templateVars["policy_type"]} Section over.')
                        print(f'\n------------------------------------------------------\n')
                        valid_confirm = True

                    else:
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # Ethernet Network Group Policy Module
    #========================================
    def ethernet_network_group_policies(self, vlan_policies_vlans):
        name_prefix = self.name_prefix
        name_suffix = ['Management', 'Migration', 'Storage', 'VMs']
        org = self.org
        policy_names = []
        policy_type = 'Ethernet Network Group Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'ethernet_network_group_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  An {policy_type} will define the Allowed VLANs on a Server vNIC Template.')
            print(f'  As a recommendation you will need an {policy_type} per vNIC Grouping.')
            print(f'  For Instance with a Virtual Host that may have the following vNIC Pairs:')
            print(f'     1. Management')
            print(f'     2. Migration/vMotion')
            print(f'     3. Storage')
            print(f'     4. Virtual Machines')
            print(f'  You will want to configure 1 {policy_type} per Group.')
            print(f'  The allowed vlan list can be in the format of:')
            print(f'     5 - Single VLAN')
            print(f'     1-10 - Range of VLANs')
            print(f'     1,2,3,4,5,11,12,13,14,15 - List of VLANs')
            print(f'     1-10,20-30 - Ranges and Lists of VLANs')
            print(f'  If you want to Assign a Native VLAN Make sure it is in the allowed list.\n')
            print(f'  This wizard will save the configuraton for this section to the following file:')
            print(f'  - Intersight/{org}/{self.type}/{templateVars["template_type"]}.auto.tfvars')
            print(f'\n-------------------------------------------------------------------------------------------\n')
            loop_count = 0
            policy_loop = False
            while policy_loop == False:

                name = ''
                for i, v in enumerate(name_suffix):
                    if int(loop_count) == i:
                        if not name_prefix == '':
                            name = '%s_%s' % (name_prefix, v)
                        else:
                            name = '%s_%s' % (org, v)
                if name == '':
                    name = '%s_%s' % (org, 'vlan_group')

                templateVars["name"] = policy_name(name, policy_type)
                templateVars["descr"] = policy_descr(templateVars["name"], policy_type)
                templateVars["action_on_uplink_fail"] = 'linkDown'

                valid = False
                while valid == False:
                    vlan_list = input('Enter the VLAN or List of VLANs to add to this VLAN Group: ')
                    if not vlan_list == '':
                        vlan_list_expanded = vlan_list_full(vlan_list)
                        valid_vlan = True
                        for vlan in vlan_list_expanded:
                            valid_vlan = validating_ucs.number_in_range('VLAN ID', vlan, 1, 4094)
                            if valid_vlan == False:
                                break

                        if valid_vlan == True:
                            policy_list = [
                                'vlan_policies',
                            ]
                            for policy in policy_list:
                                templateVars["policy_short"] = policy.replace('policies', 'policy')
                                templateVars["allow_opt_out"] = False
                                templateVars["policies"] = []
                                for item in vlan_policies_vlans:
                                    for k, v in item.items():
                                        templateVars["policies"].append(k)
                                if len(templateVars["policies"]) == 1:
                                    for item in vlan_policies_vlans:
                                        for k, v in item.items():
                                            domain_vlan_list = v
                                else:
                                    vlan_list_name = choose_policy(policy, **templateVars)
                                    for item in vlan_policies_vlans:
                                        for k, v in item.items():
                                            if k == vlan_list_name:
                                                domain_vlan_list = v
                                                break

                            vlans_not_in_domain_policy = []
                            for vlan in vlan_list_expanded:
                                vlan_count = 0
                                for vl in domain_vlan_list:
                                    if int(vlan) == int(vl):
                                        vlan_count = 1
                                        break
                                if vlan_count == 0:
                                    vlans_not_in_domain_policy.append(vlan)

                            if len(vlans_not_in_domain_policy) > 0:
                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                print(f'  Error with VLAN(s) assignment!!  The following VLANs are not in the ')
                                print(f'  Domain VLAN Policy {vlan_list_name}.')
                                print(f'  Missing VLANs: {vlans_not_in_domain_policy}')
                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                valid_vlan = False
                            else:
                                valid_vlan = True
                        native_count = 0
                        native_vlan = ''
                        if valid_vlan == True:
                            native_valid = False
                            while native_valid == False:
                                native_vlan = input('Do you want to Configure one of the VLANs as a Native VLAN?  [press enter to skip]:')
                                if native_vlan == '':
                                    native_valid = True
                                    valid = True
                                else:
                                    for vlan in vlan_list_expanded:
                                        if int(native_vlan) == int(vlan):
                                            native_count = 1
                                    if not native_count == 1:
                                        print(f'\n-------------------------------------------------------------------------------------------\n')
                                        print(f'  Error!! The Native VLAN was not in the Allowed List.')
                                        print(f'  Allowed List is: "{vlan_list}"')
                                        print(f'\n-------------------------------------------------------------------------------------------\n')
                                    else:
                                        native_valid = True
                                        valid = True

                        elif valid_vlan == True:
                            valid = True
                    else:
                        print(f'\n-------------------------------------------------------------------------------------------\n')
                        print(f'  The allowed vlan list can be in the format of:')
                        print(f'     5 - Single VLAN')
                        print(f'     1-10 - Range of VLANs')
                        print(f'     1,2,3,4,5,11,12,13,14,15 - List of VLANs')
                        print(f'     1-10,20-30 - Ranges and Lists of VLANs')
                        print(f'\n-------------------------------------------------------------------------------------------\n')

                templateVars["allowed_vlans"] = vlan_list
                if not native_vlan == '':
                    templateVars["native_vlan"] = native_vlan
                else:
                    templateVars["native_vlan"] = ''
                    templateVars.pop('native_vlan')

                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Do you want to accept the following configuration?')
                print(f'    allowed_vlans = "{templateVars["allowed_vlans"]}"')
                print(f'    description   = "{templateVars["descr"]}"')
                print(f'    name          = "{templateVars["name"]}"')
                if not native_vlan == '':
                    print(f'    native_vlan   = {templateVars["native_vlan"]}')
                print(f'\n-------------------------------------------------------------------------------------------\n')
                valid_confirm = False
                while valid_confirm == False:
                    confirm_policy = input('Enter "Y" or "N" [Y]: ')
                    if confirm_policy == 'Y' or confirm_policy == '':
                        confirm_policy = 'Y'

                        # Write Policies to Template File
                        templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                        write_to_template(self, **templateVars)

                        # Add Template Name to Policies Output
                        policy_names.append(templateVars["name"])

                        valid_exit = False
                        while valid_exit == False:
                            if loop_count < 3:
                                exit_answer = input(f'Would You like to Configure another {policy_type}?  Enter "Y" or "N" [Y]: ')
                            else:
                                exit_answer = input(f'Would You like to Configure another {policy_type}?  Enter "Y" or "N" [N]: ')
                            if (loop_count < 3 and exit_answer == '') or exit_answer == 'Y':
                                loop_count += 1
                                valid_exit = True
                            elif (loop_count > 2 and exit_answer == '') or exit_answer == 'N':
                                policy_loop = True
                                configure_loop = True
                                valid_exit = True
                            else:
                                print(f'\n------------------------------------------------------\n')
                                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                                print(f'\n------------------------------------------------------\n')
                        valid_confirm = True

                    elif confirm_policy == 'N':
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Starting {policy_type} Section over.')
                        print(f'\n------------------------------------------------------\n')
                        valid_confirm = True
                    else:
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # Ethernet Network Policy Module
    #========================================
    def ethernet_network_policies(self):
        name_prefix = self.name_prefix
        name_suffix = 'netwk'
        org = self.org
        policy_names = []
        policy_type = 'Ethernet Network Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'ethernet_network_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  This wizard will save the configuraton for this section to the following file:')
            print(f'  - Intersight/{org}/{self.type}/{templateVars["template_type"]}.auto.tfvars')
            print(f'\n-------------------------------------------------------------------------------------------\n')
            configure = input(f'Do You Want to Configure an {policy_type}?  Enter "Y" or "N" [Y]: ')
            if configure == 'Y' or configure == '':
                policy_loop = False
                while policy_loop == False:

                    if not name_prefix == '':
                        name = '%s_%s' % (name_prefix, name_suffix)
                    else:
                        name = '%s_%s' % (org, name_suffix)

                    templateVars["name"] = policy_name(name, policy_type)
                    templateVars["descr"] = policy_descr(templateVars["name"], policy_type)

                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    print(f'  Assignment order decides the order in which the next identifier is allocated.')
                    print(f'    1. default - (Intersight Default) Assignment order is decided by the system.')
                    print(f'    2. sequential - (Recommended) Identifiers are assigned in a sequential order.')
                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    valid = False
                    while valid == False:
                        templateVars["assignment_order"] = input('Specify the Index for the value to select [2]: ')
                        if templateVars["assignment_order"] == '' or templateVars["assignment_order"] == '2':
                            templateVars["assignment_order"] = 'sequential'
                            valid = True
                        elif templateVars["assignment_order"] == '1':
                            templateVars["assignment_order"] = 'default'
                            valid = True
                        else:
                            print(f'\n-------------------------------------------------------------------------------------------\n')
                            print(f'  Error!! Invalid Option.  Please Select a valid option from the List.')
                            print(f'\n-------------------------------------------------------------------------------------------\n')

                    # Write Policies to Template File
                    templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                    write_to_template(self, **templateVars)

                    # Add Template Name to Policies Output
                    policy_names.append(templateVars["name"])

                    exit_answer = input(f'Would You like to Configure another {policy_type}?  Enter "Y" or "N" [N]: ')
                    if exit_answer == 'N' or exit_answer == '':
                        policy_loop = True
                        configure_loop = True
            elif configure == 'N':
                configure_loop = True
            else:
                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                print(f'\n-------------------------------------------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # Ethernet QoS Policy Module
    #========================================
    def ethernet_qos_policies(self, domain_mtu):
        name_prefix = self.name_prefix
        name_suffix = ['Management', 'Migration', 'Storage', 'VMs']
        org = self.org
        policy_names = []
        policy_type = 'Ethernet QoS Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'ethernet_qos_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  An {policy_type} will configure QoS on a Server vNIC Template.')
            print(f'  As a recommendation you will need an {policy_type} per vNIC Group.')
            print(f'  For Instance with a Virtual Host that may have the following vNIC Groups:')
            print(f'     1. Management')
            print(f'     2. Migration/vMotion')
            print(f'     3. Storage')
            print(f'     4. Virtual Machines')
            print(f'  It would be a good practice to configure different QoS Priorities for Each vNIC Group.')
            print(f'  For Instance a good practice would be something like the following:')
            print(f'     Management - Silver')
            print(f'     Migration/vMotion - Bronze')
            print(f'     Storage - Platinum')
            print(f'     Virtual Machines - Gold.\n')
            print(f'  This wizard will save the configuraton for this section to the following file:')
            print(f'  - Intersight/{org}/{self.type}/{templateVars["template_type"]}.auto.tfvars')
            print(f'\n-------------------------------------------------------------------------------------------\n')
            loop_count = 0
            policy_loop = False
            while policy_loop == False:

                name = ''
                for i, v in enumerate(name_suffix):
                    if int(loop_count) == i:
                        if not name_prefix == '':
                            name = '%s_%s' % (name_prefix, v)
                        else:
                            name = '%s_%s' % (org, v)
                if name == '':
                    name = '%s_%s' % (org, 'qos')

                templateVars["name"] = policy_name(name, policy_type)
                templateVars["descr"] = policy_descr(templateVars["name"], policy_type)
                templateVars["burst"] = 1024
                templateVars["enable_trust_host_cos"] = False
                templateVars["rate_limit"] = 0

                templateVars["mtu"] = domain_mtu

                templateVars["policy_file"] = 'qos_priority.txt'
                templateVars["var_description"] = '   Priority - Default is "Best Effort".\n   The Priority Queue to Assign to this QoS Policy:\n'
                templateVars["var_type"] = 'Priority'
                templateVars["priority"] = variable_loop(**templateVars)

                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Do you want to accept the following configuration?')
                print(f'   description = "{templateVars["descr"]}"')
                print(f'   mtu         = "{templateVars["mtu"]}"')
                print(f'   name        = "{templateVars["name"]}"')
                print(f'   priority    = "{templateVars["priority"]}"')
                print(f'\n-------------------------------------------------------------------------------------------\n')
                valid_confirm = False
                while valid_confirm == False:
                    confirm_policy = input('Enter "Y" or "N" [Y]: ')
                    if confirm_policy == 'Y' or confirm_policy == '':
                        confirm_policy = 'Y'

                        # Write Policies to Template File
                        templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                        write_to_template(self, **templateVars)

                        # Add Template Name to Policies Output
                        policy_names.append(templateVars["name"])

                        valid_exit = False
                        while valid_exit == False:
                            if loop_count < 3:
                                exit_answer = input(f'Would You like to Configure another {policy_type}?  Enter "Y" or "N" [Y]: ')
                            else:
                                exit_answer = input(f'Would You like to Configure another {policy_type}?  Enter "Y" or "N" [N]: ')
                            if (loop_count < 3 and exit_answer == '') or exit_answer == 'Y':
                                loop_count += 1
                                valid_exit = True
                            elif (loop_count > 2 and exit_answer == '') or exit_answer == 'N':
                                policy_loop = True
                                configure_loop = True
                                valid_exit = True
                            else:
                                print(f'\n------------------------------------------------------\n')
                                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                                print(f'\n------------------------------------------------------\n')
                        valid_confirm = True

                    elif confirm_policy == 'N':
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Starting {policy_type} Section over.')
                        print(f'\n------------------------------------------------------\n')
                        valid_confirm = True
                    else:
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # Fibre-Channel Adapter Policy Module
    #========================================
    def fibre_channel_adapter_policies(self):
        name_prefix = self.name_prefix
        org = self.org
        policy_names = []
        policy_type = 'Fibre-Channel Adapter Policy'
        policy_x = 'Fibre-Channel Adapter'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["name_prefix"] = name_prefix
        templateVars["org"] = org
        templateVars["policy_file"] = 'fibre_channel_adapter_templates.txt'
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'fibre_channel_adapter_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  You can Skip this policy if you are not configuring Fibre-Channel.\n')
            print(f'  {policy_x} Policies:  To simplify your work, this wizard will use {policy_x}')
            print(f'  Templates that are pre-configured.  You can add custom {policy_x} policy')
            print(f'  configuration to the {templateVars["template_type"]}.auto.tfvars file at your descretion.  ')
            print(f'  That will not be covered by this wizard as the focus of the wizard is on simplicity.\n')
            print(f'  This wizard will save the configuraton for this section to the following file:')
            print(f'  - Intersight/{org}/{self.type}/{templateVars["template_type"]}.auto.tfvars')
            print(f'\n-------------------------------------------------------------------------------------------\n')
            configure = input(f'Do You Want to Configure a {policy_type}?  Enter "Y" or "N" [Y]: ')
            if configure == 'Y' or configure == '':

                templateVars["template_file"] = 'ethernet_adapter_templates.jinja2'
                policy_names = policy_template(self, **templateVars)
                configure_loop = True

            elif configure == 'N':
                configure_loop = True
            else:
                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                print(f'\n-------------------------------------------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # Fibre-Channel Network Policy Module
    #========================================
    def fibre_channel_network_policies(self, vsan_policies_vsans):
        name_prefix = self.name_prefix
        org = self.org
        policy_names = []
        policy_type = 'Fibre-Channel Network Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'fibre_channel_network_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  You can Skip this policy if you are not configuring Fibre-Channel.\n')
            print(f'  Fibre-Channel Network Policies Notes:')
            print(f'  - You will need one Policy per Fabric.  VSAN A and VSAN B.\n')
            print(f'  This wizard will save the configuraton for this section to the following file:')
            print(f'  - Intersight/{org}/{self.type}/{templateVars["template_type"]}.auto.tfvars')
            print(f'\n-------------------------------------------------------------------------------------------\n')
            configure = input(f'Do You Want to Configure a {policy_type}?  Enter "Y" or "N" [Y]: ')
            if configure == 'Y' or configure == '':
                loop_count = 0
                policy_loop = False
                while policy_loop == False:

                    name = naming_rule_fabric(loop_count, name_prefix, org)

                    templateVars["name"] = policy_name(name, policy_type)
                    templateVars["descr"] = policy_descr(templateVars["name"], policy_type)
                    templateVars["default_vlan"] = 0

                    valid = False
                    while valid == False:
                        if loop_count % 2 == 0:
                            templateVars["vsan_id"] = input('What VSAN Do you want to Assign to this Policy?  [100]: ')
                        else:
                            templateVars["vsan_id"] = input('What VSAN Do you want to Assign to this Policy?  [200]: ')
                        if templateVars["vsan_id"] == '':
                            if loop_count % 2 == 0:
                                templateVars["vsan_id"] = 100
                            else:
                                templateVars["vsan_id"] = 200
                        vsan_valid = validating_ucs.number_in_range('VSAN ID', templateVars["vsan_id"], 1, 4094)
                        if vsan_valid == True:
                            policy_list = [
                                'vsan_policies',
                            ]
                            for policy in policy_list:
                                templateVars["policy_short"] = policy.replace('policies', 'policy')
                                templateVars["allow_opt_out"] = False
                                templateVars["policies"] = []
                                for item in vsan_policies_vsans:
                                    for k, v in item.items():
                                        templateVars["policies"].append(k)
                                vsan_list_name = choose_policy(policy, **templateVars)
                                for item in vsan_policies_vsans:
                                    for key, value in item.items():
                                        if key == vsan_list_name:
                                            domain_vsan_list = []
                                            for i in value:
                                                for k, v in i.items():
                                                    if k == 'id':
                                                        domain_vsan_list.append(v)

                            vsan_count = 0
                            for vsan in domain_vsan_list:
                                if int(templateVars["vsan_id"]) == int(vsan):
                                    vsan_count = 1
                                    break
                            if vsan_count == 0:
                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                print(f'  Error with VSAN!!  The VSAN {templateVars["vsan_id"]} is not in the VSAN Policy')
                                print(f'  {vsan_list_name}.  Options are {domain_vsan_list}.')
                                print(f'\n-------------------------------------------------------------------------------------------\n')
                            else:
                                valid = True

                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    print(f'  Do you want to accept the following configuration?')
                    print(f'   description = "{templateVars["descr"]}"')
                    print(f'   name        = "{templateVars["name"]}"')
                    print(f'   vsan_id     = "{templateVars["vsan_id"]}"')
                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    valid_confirm = False
                    while valid_confirm == False:
                        confirm_policy = input('Enter "Y" or "N" [Y]: ')
                        if confirm_policy == 'Y' or confirm_policy == '':
                            confirm_policy = 'Y'

                            # Write Policies to Template File
                            templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                            write_to_template(self, **templateVars)

                            # Add Template Name to Policies Output
                            policy_names.append(templateVars["name"])

                            configure_loop, loop_count, policy_loop = exit_loop_default_yes(loop_count, policy_type)
                            valid_confirm = True

                        elif confirm_policy == 'N':
                            print(f'\n------------------------------------------------------\n')
                            print(f'  Starting {policy_type} Section over.')
                            print(f'\n------------------------------------------------------\n')
                            valid_confirm = True

                        else:
                            print(f'\n------------------------------------------------------\n')
                            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                            print(f'\n------------------------------------------------------\n')

            elif configure == 'N':
                configure_loop = True
            else:
                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                print(f'\n-------------------------------------------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # Fibre-Channel QoS Policy Module
    #========================================
    def fibre_channel_qos_policies(self):
        name_prefix = self.name_prefix
        name_suffix = 'qos'
        org = self.org
        policy_names = []
        policy_type = 'Fibre-Channel QoS Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'fibre_channel_qos_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  You can Skip this policy if you are not configuring Fibre-Channel.\n')
            print(f'  It is a good practice to apply a {policy_type} to the vHBAs.  This wizard')
            print(f'  creates the policy with all the default values, so you only need one')
            print(f'  {policy_type}.\n')
            print(f'  This wizard will save the configuraton for this section to the following file:')
            print(f'  - Intersight/{org}/{self.type}/{templateVars["template_type"]}.auto.tfvars')
            print(f'\n-------------------------------------------------------------------------------------------\n')
            configure = input(f'Do You Want to Configure a {policy_type}?  Enter "Y" or "N" [Y]: ')
            if configure == 'Y' or configure == '':
                policy_loop = False
                while policy_loop == False:

                    if not name_prefix == '':
                        name = '%s_%s' % (name_prefix, name_suffix)
                    else:
                        name = '%s_%s' % (org, name_suffix)

                    templateVars["name"] = policy_name(name, policy_type)
                    templateVars["descr"] = policy_descr(templateVars["name"], policy_type)
                    templateVars["burst"] = 1024
                    templateVars["max_data_field_size"] = 2112
                    templateVars["rate_limit"] = 0

                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    print(f'  Do you want to accept the following configuration?')
                    print(f'    burst               = "{templateVars["burst"]}"')
                    print(f'    description         = "{templateVars["descr"]}"')
                    print(f'    max_data_field_size = "{templateVars["max_data_field_size"]}"')
                    print(f'    name                = "{templateVars["name"]}"')
                    print(f'    rate_limit          = "{templateVars["rate_limit"]}"')
                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    valid_confirm = False
                    while valid_confirm == False:
                        confirm_policy = input('Enter "Y" or "N" [Y]: ')
                        if confirm_policy == 'Y' or confirm_policy == '':
                            confirm_policy = 'Y'

                            # Write Policies to Template File
                            templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                            write_to_template(self, **templateVars)

                            # Add Template Name to Policies Output
                            policy_names.append(templateVars["name"])

                            configure_loop, policy_loop = exit_default_no(templateVars["policy_type"])
                            valid_confirm = True

                        elif confirm_policy == 'N':
                            print(f'\n------------------------------------------------------\n')
                            print(f'  Starting {templateVars["policy_type"]} Section over.')
                            print(f'\n------------------------------------------------------\n')
                            valid_confirm = True

                        else:
                            print(f'\n------------------------------------------------------\n')
                            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                            print(f'\n------------------------------------------------------\n')

            elif configure == 'N':
                configure_loop = True
            else:
                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                print(f'\n-------------------------------------------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # Firmware - UCS Domain Module
    #========================================
    def firmware_ucs_domain(self):
        templateVars = {}
        templateVars["header"] = 'UCS Domain Profile Variables'
        templateVars["initial_write"] = True
        templateVars["org"] = self.org
        templateVars["policy_type"] = 'UCS Domain Profile'
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'ntp_policies'
        valid = False
        while valid == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'   UCS Version of Software to Deploy...')
            if os.path.isfile('ucs_version.txt'):
                version_file = open('ucs_version.txt', 'r')
                versions = []
                for line in version_file:
                    line = line.strip()
                    versions.append(line)
                for i, v in enumerate(versions):
                    i += 1
                    if i < 10:
                        print(f'     {i}. {v}')
                    else:
                        print(f'    {i}. {v}')
            print(f'\n-------------------------------------------------------------------------------------------\n')
            ucs_version = input('Enter the Index Number for the Version of Software to Run: ')
            for i, v in enumerate(versions):
                i += 1
                if int(ucs_version) == i:
                    ucs_domain_version = v
                    valid = True
            if valid == False:
                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Error!! Invalid Selection.  Please Select a valid Index from the List.')
                print(f'\n-------------------------------------------------------------------------------------------\n')
            version_file.close()

    #========================================
    # Flow Control Policy Module
    #========================================
    def flow_control_policies(self):
        name_prefix = self.name_prefix
        name_suffix = 'flow_ctrl'
        org = self.org
        policy_names = []
        policy_type = 'Flow Control Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'flow_control_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  The Flow Control Policy will enable Priority Flow Control on the Fabric Interconnects.')
            print(f'  We recommend the default parameters so you will only be asked for the name and')
            print(f'  description for the Policy.  You only need one of these policies for Organization')
            print(f'  {org}.\n')
            print(f'  This wizard will save the configuraton for this section to the following file:')
            print(f'  - Intersight/{org}/{self.type}/{templateVars["template_type"]}.auto.tfvars')
            print(f'\n-------------------------------------------------------------------------------------------\n')
            policy_loop = False
            while policy_loop == False:

                if not name_prefix == '':
                    name = '%s_%s' % (name_prefix, name_suffix)
                else:
                    name = '%s_%s' % (org, name_suffix)

                templateVars["name"] = policy_name(name, policy_type)
                templateVars["descr"] = policy_descr(templateVars["name"], policy_type)

                templateVars["priority"] = 'auto'
                templateVars["receive"] = 'Enabled'
                templateVars["send"] = 'Enabled'

                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Do you want to accept the following configuration?')
                print(f'    description = "{templateVars["descr"]}"')
                print(f'    name        = "{templateVars["name"]}"')
                print(f'    priority    = "{templateVars["priority"]}"')
                print(f'    receive     = "{templateVars["receive"]}"')
                print(f'    send        = "{templateVars["send"]}"')
                print(f'\n-------------------------------------------------------------------------------------------\n')
                valid_confirm = False
                while valid_confirm == False:
                    confirm_policy = input('Enter "Y" or "N" [Y]: ')
                    if confirm_policy == 'Y' or confirm_policy == '':
                        confirm_policy = 'Y'

                        # Write Policies to Template File
                        templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                        write_to_template(self, **templateVars)

                        # Add Template Name to Policies Output
                        policy_names.append(templateVars["name"])

                        configure_loop, policy_loop = exit_default_no(templateVars["policy_type"])
                        valid_confirm = True

                    elif confirm_policy == 'N':
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Starting {templateVars["policy_type"]} Section over.')
                        print(f'\n------------------------------------------------------\n')
                        valid_confirm = True

                    else:
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # IMC Access Policy Module
    #========================================
    def imc_access_policies(self, vlan_policies_vlans, policies):
        name_prefix = self.name_prefix
        name_suffix = 'imc_access'
        org = self.org
        policy_names = []
        policy_type = 'IMC Access Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'imc_access_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  You will need to configure an IMC Access Policy in order to Assign the VLAN and IPs to ')
            print(f'  the Servers for KVM Access.  At this time only inband access is supported in IMM mode.\n')
            print(f'  This wizard will save the configuraton for this section to the following file:')
            print(f'  - Intersight/{org}/{self.type}/{templateVars["template_type"]}.auto.tfvars')
            print(f'\n-------------------------------------------------------------------------------------------\n')
            loop_count = 0
            policy_loop = False
            while policy_loop == False:

                if not name_prefix == '':
                    name = '%s_%s' % (name_prefix, name_suffix)
                else:
                    name = '%s_%s' % (org, name_suffix)

                templateVars["name"] = policy_name(name, policy_type)
                templateVars["descr"] = policy_descr(templateVars["name"], policy_type)
                templateVars["default_vlan"] = 0

                policy_list = ['ip_pools']
                templateVars["allow_opt_out"] = False
                for policy in policy_list:
                    templateVars["policies"] = policies.get(policy)
                    templateVars['inband_ip_pool'] = choose_policy(policy, **templateVars)

                valid = False
                while valid == False:
                    templateVars["inband_vlan_id"] = input('What VLAN Do you want to Assign to this Policy? ')
                    valid_vlan = validating_ucs.number_in_range('VLAN ID', templateVars["inband_vlan_id"], 1, 4094)
                    if valid_vlan == True:
                        policy_list = [
                            'vlan_policies',
                        ]
                        for policy in policy_list:
                            templateVars["policy_short"] = policy.replace('policies', 'policy')
                            templateVars["allow_opt_out"] = False
                            templateVars["policies"] = []
                            for item in vlan_policies_vlans:
                                for k, v in item.items():
                                    templateVars["policies"].append(k)
                            vlan_list_name = choose_policy(policy, **templateVars)
                            for item in vlan_policies_vlans:
                                for key, value in item.items():
                                    if key == vlan_list_name:
                                        domain_vlan_list = value

                        vlan_count = 0
                        for vlan in domain_vlan_list:
                            if int(templateVars["inband_vlan_id"]) == int(vlan):
                                vlan_count = 1
                                break
                        if vlan_count == 0:
                            print(f'\n-------------------------------------------------------------------------------------------\n')
                            print(f'  Error with Inband VLAN Assignment!!  The VLAN {templateVars["inband_vlan_id"]} is not in the VLAN Policy')
                            print(f'  {vlan_list_name}.  VALID VLANs are:{domain_vlan_list}')
                            print(f'\n-------------------------------------------------------------------------------------------\n')
                        else:
                            valid = True

                valid = False
                while valid == False:
                    enable_ipv4 = input('Do you want to enable IPv4 for this Policy?  Enter "Y" or "N" [Y]: ')
                    if enable_ipv4 == 'Y' or enable_ipv4 == '':
                        templateVars["ipv4_address_configuration"] = True
                        valid = True
                    else:
                        templateVars["ipv4_address_configuration"] = False
                        valid = True

                valid = False
                while valid == False:
                    enable_ipv4 = input('Do you want to enable IPv6 for this Policy?  Enter "Y" or "N" [N]: ')
                    if enable_ipv4 == 'Y':
                        templateVars["ipv6_address_configuration"] = True
                        valid = True
                    else:
                        templateVars["ipv6_address_configuration"] = False
                        valid = True

                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Do you want to accept the following configuration?')
                print(f'   description                = "{templateVars["descr"]}"')
                print(f'   inband_ip_pool             = "{templateVars["inband_ip_pool"]}"')
                print(f'   inband_vlan_id             = {templateVars["inband_vlan_id"]}')
                print(f'   ipv4_address_configuration = {templateVars["ipv4_address_configuration"]}')
                print(f'   ipv6_address_configuration = {templateVars["ipv6_address_configuration"]}')
                print(f'\n-------------------------------------------------------------------------------------------\n')
                valid_confirm = False
                while valid_confirm == False:
                    confirm_policy = input('Enter "Y" or "N" [Y]: ')
                    if confirm_policy == 'Y' or confirm_policy == '':
                        confirm_policy = 'Y'

                        # Write Policies to Template File
                        templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                        write_to_template(self, **templateVars)

                        # Add Template Name to Policies Output
                        policy_names.append(templateVars["name"])

                        configure_loop, policy_loop = exit_default_no(templateVars["policy_type"])
                        valid_confirm = True

                    elif confirm_policy == 'N':
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Starting {templateVars["policy_type"]} Section over.')
                        print(f'\n------------------------------------------------------\n')
                        valid_confirm = True

                    else:
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # IP Pools Module
    #========================================
    def ip_pools(self):
        name_prefix = self.name_prefix
        name_suffix = 'ip_pool'
        org = self.org
        policy_names = []
        policy_type = 'IP Pool'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'ip_pools'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  At a minimum you will need one IP Pool for KVM Access to Servers.  Currently out-of-band')
            print(f'  management is not supported for KVM access.  This IP Pool will need to be associated to a ')
            print(f'  VLAN assigned to the VLAN Pool of the Domain.\n')
            print(f'  This wizard will save the configuraton for this section to the following file:')
            print(f'  - Intersight/{org}/{self.type}/{templateVars["template_type"]}.auto.tfvars')
            print(f'\n-------------------------------------------------------------------------------------------\n')
            policy_loop = False
            while policy_loop == False:

                if not name_prefix == '':
                    name = '%s_%s' % (name_prefix, name_suffix)
                else:
                    name = '%s_%s' % (org, name_suffix)

                templateVars["name"] = policy_name(name, policy_type)
                templateVars["descr"] = policy_descr(templateVars["name"], policy_type)

                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Assignment order decides the order in which the next identifier is allocated.')
                print(f'    1. default - (Intersight Default) Assignment order is decided by the system.')
                print(f'    2. sequential - (Recommended) Identifiers are assigned in a sequential order.')
                print(f'\n-------------------------------------------------------------------------------------------\n')
                valid = False
                while valid == False:
                    templateVars["assignment_order"] = input('Specify the number for the value to select.  [2]: ')
                    if templateVars["assignment_order"] == '' or templateVars["assignment_order"] == '2':
                        templateVars["assignment_order"] = 'sequential'
                        valid = True
                    elif templateVars["assignment_order"] == '1':
                        templateVars["assignment_order"] = 'default'
                        valid = True
                    else:
                        print(f'\n-------------------------------------------------------------------------------------------\n')
                        print(f'  Error!! Invalid Option.  Please Select a valid option from the List.')
                        print(f'\n-------------------------------------------------------------------------------------------\n')

                valid = False
                while valid == False:
                    config_ipv4 = input('Do you want to configure IPv4 for this Pool?  Enter "Y" or "N" [Y]: ')
                    if config_ipv4 == 'Y' or config_ipv4 == '':
                        valid = True
                    elif config_ipv4 == 'N':
                        valid = True
                    else:
                        print(f'\n-------------------------------------------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n-------------------------------------------------------------------------------------------\n')

                if config_ipv4 == 'Y' or config_ipv4 == '':
                    valid = False
                    while valid == False:
                        network_prefix = input('What is the Gateway/Mask to Assign to the Pool?  [198.18.0.1/24]: ')
                        if network_prefix == '':
                            network_prefix = '198.18.0.1/24'
                        gateway_valid = validating_ucs.ip_address('Gateway Address', network_prefix)
                        mask_valid = validating_ucs.number_in_range('Mask Length', network_prefix.split('/')[1], 1, 30)
                        if gateway_valid == True and mask_valid == True:
                            valid = True
                        else:
                            print(f'\n-------------------------------------------------------------------------------------------\n')
                            print(f'  Error!! Invalid Value.  Please Verify you have entered the gateway/prefix correctly.')
                            print(f'\n-------------------------------------------------------------------------------------------\n')

                    gateway = str(ipaddress.IPv4Interface(network_prefix).ip)
                    netmask = str(ipaddress.IPv4Interface(network_prefix).netmask)
                    network = str(ipaddress.IPv4Interface(network_prefix).network)
                    prefix = network_prefix.split('/')[1]

                    valid = False
                    while valid == False:
                        starting = input('What is the Starting IP Address to Assign to the Pool?  [198.18.0.10]: ')
                        if starting == '':
                            starting = '198.18.0.10'
                        valid_ip = validating_ucs.ip_address('Starting IP Address', starting)
                        if valid_ip == True:
                            if network == str(ipaddress.IPv4Interface('/'.join([starting, prefix])).network):
                                valid = True
                            else:
                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                print(f'  Error!! Invalid Value.  Please Verify the starting IP is in the same network')
                                print(f'  as the Gateway')
                                print(f'\n-------------------------------------------------------------------------------------------\n')

                    valid = False
                    while valid == False:
                        pool_size = input('How Many IP Addresses should be added to the Pool?  Range is 1-1000 [160]: ')
                        if pool_size == '':
                            pool_size = '160'
                        valid = validating_ucs.number_in_range('Pool Size', pool_size, 1, 1000)

                    valid = False
                    while valid == False:
                        primary_dns = input('What is your Primary DNS Server [208.67.220.220]? ')
                        if primary_dns == '':
                            primary_dns = '208.67.220.220'
                        valid = validating_ucs.ip_address('Primary DNS Server', primary_dns)

                    valid = False
                    while valid == False:
                        alternate_true = input('Do you want to Configure an Alternate DNS Server?  Enter "Y" or "N" [Y]: ')
                        if alternate_true == 'Y' or alternate_true == '':
                            secondary_dns = input('What is your Alternate DNS Server [208.67.222.222]? ')
                            if secondary_dns == '':
                                secondary_dns = '208.67.222.222'
                            valid = validating_ucs.ip_address('Alternate DNS Server', secondary_dns)
                        elif alternate_true == 'N':
                            secondary_dns = ''
                            valid = True
                        else:
                            print(f'\n-------------------------------------------------------------------------------------------\n')
                            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                            print(f'\n-------------------------------------------------------------------------------------------\n')

                    beginx = int(ipaddress.IPv4Address(starting))
                    add_dec = (beginx + int(pool_size))
                    ending = str(ipaddress.IPv4Address(add_dec))

                    templateVars["ipv4_blocks"] = [{'from':starting, 'to':ending}]
                    templateVars["ipv4_configuration"] = {'gateway':gateway, 'netmask':netmask,
                        'primary_dns':primary_dns, 'secondary_dns':secondary_dns}

                valid = False
                while valid == False:
                    config_ipv6 = input('Do you want to configure IPv6 for this Pool?  Enter "Y" or "N" [Y]: ')
                    if config_ipv6 == 'Y' or config_ipv6 == '':
                        valid = True
                    elif config_ipv6 == 'N':
                        valid = True
                    else:
                        print(f'\n-------------------------------------------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n-------------------------------------------------------------------------------------------\n')

                if config_ipv6 == 'Y' or config_ipv6 == '':
                    valid = False
                    while valid == False:
                        network_prefix = input('What is the Gateway/Mask to Assign to the Pool?  [2001:0002::1/64]: ')
                        if network_prefix == '':
                            network_prefix = '2001:0002::1/64'
                        gateway_valid = validating_ucs.ip_address('Gateway Address', network_prefix)
                        mask_valid = validating_ucs.number_in_range('Mask Length', network_prefix.split('/')[1], 48, 127)
                        if gateway_valid == True and mask_valid == True:
                            valid = True
                        else:
                            print(f'\n-------------------------------------------------------------------------------------------\n')
                            print(f'  Error!! Invalid Value.  Please Verify you have entered the gateway/prefix correctly.')
                            print(f'\n-------------------------------------------------------------------------------------------\n')

                    # broadcast = str(ipaddress.IPv4Interface(network_prefix).broadcast_address)
                    gateway = str(ipaddress.IPv6Interface(network_prefix).ip)
                    network = str(ipaddress.IPv6Interface(network_prefix).network)
                    prefix = network_prefix.split('/')[1]

                    valid = False
                    while valid == False:
                        starting = input('What is the Starting IP Address to Assign to the Pool?  [2001:0002::10]: ')
                        if starting == '':
                            starting = '2001:0002::10'
                        valid_ip = validating_ucs.ip_address('Starting IP Address', starting)
                        if valid_ip == True:
                            if network == str(ipaddress.IPv6Interface('/'.join([starting, prefix])).network):
                                valid = True
                                # print('gateway and starting ip are in the same network')
                            else:
                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                print(f'  Error!! Invalid Value.  Please Verify the starting IP is in the same network')
                                print(f'  as the Gateway')
                                print(f'\n-------------------------------------------------------------------------------------------\n')

                    valid = False
                    while valid == False:
                        pool_size = input('How Many IP Addresses should be added to the Pool?  Range is 1-1000 [160]: ')
                        if pool_size == '':
                            pool_size = '160'
                        valid = validating_ucs.number_in_range('Pool Size', pool_size, 1, 1000)

                    valid = False
                    while valid == False:
                        primary_dns = input('What is your Primary DNS Server [2620:119:35::35]? ')
                        if primary_dns == '':
                            primary_dns = '2620:119:35::35'
                        valid = validating_ucs.ip_address('Primary DNS Server', primary_dns)

                    valid = False
                    while valid == False:
                        alternate_true = input('Do you want to Configure an Alternate DNS Server? Enter "Y" or "N" [Y]: ')
                        if alternate_true == 'Y' or alternate_true == '':
                            secondary_dns = input('What is your Alternate DNS Server [2620:119:53::53]? ')
                            if secondary_dns == '':
                                secondary_dns = '2620:119:53::53'
                            valid = validating_ucs.ip_address('Alternate DNS Server', secondary_dns)
                        elif alternate_true == 'N':
                            secondary_dns = ''
                            valid = True
                        else:
                            print(f'\n-------------------------------------------------------------------------------------------\n')
                            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                            print(f'\n-------------------------------------------------------------------------------------------\n')

                    # beginx = int(ipaddress.IPv6Address(starting))
                    # add_dec = (beginx + int(pool_size))
                    # ending = str(ipaddress.IPv6Address(add_dec))

                    templateVars["ipv6_blocks"] = [{'from':starting, 'size':pool_size}]
                    templateVars["ipv6_configuration"] = {'gateway':gateway, 'prefix':prefix,
                        'primary_dns':primary_dns, 'secondary_dns':secondary_dns}

                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Do you want to accept the following configuration?')
                print(f'    assignment_order = "{templateVars["assignment_order"]}"')
                print(f'    description      = "{templateVars["descr"]}"')
                print(f'    name             = "{templateVars["name"]}"')
                if config_ipv4 == 'Y' or config_ipv4 == '':
                    print(f'    ipv4_blocks = [')
                    for item in templateVars["ipv4_blocks"]:
                        print('      {')
                        for k, v in item.items():
                            if k == 'from':
                                print(f'        from = "{v}" ')
                            elif k == 'to':
                                print(f'        to   = "{v}"')
                        print('      }')
                    print(f'    ]')
                    print('    ipv4_configuration = {')
                    print('      {')
                    for k, v in templateVars["ipv4_configuration"].items():
                        if k == 'gateway':
                            print(f'        gateway       = "{v}"')
                        elif k == 'netmask':
                            print(f'        netmask       = "{v}"')
                        elif k == 'primary_dns':
                            print(f'        primary_dns   = "{v}"')
                        elif k == 'secondary_dns':
                            print(f'        secondary_dns = "{v}"')
                    print('      }')
                    print('    }')
                if config_ipv6 == 'Y' or config_ipv6 == '':
                    print(f'    ipv6_blocks = [')
                    for item in templateVars["ipv6_blocks"]:
                        print('      {')
                        for k, v in item.items():
                            if k == 'from':
                                print(f'        from = {v}')
                            elif k == 'size':
                                print(f'        size = {v}')
                        print('      }')
                    print(f'    ]')
                    print('    ipv6_configuration = {')
                    print('      {')
                    for k, v in templateVars["ipv6_configuration"].items():
                        if k == 'gateway':
                            print(f'        gateway       = "{v}"')
                        elif k == 'prefix':
                            print(f'        prefix        = "{v}"')
                        elif k == 'primary_dns':
                            print(f'        primary_dns   = "{v}"')
                        elif k == 'secondary_dns':
                            print(f'        secondary_dns = "{v}"')
                    print('      }')
                    print('    }')
                print(f'\n-------------------------------------------------------------------------------------------\n')
                valid_confirm = False
                while valid_confirm == False:
                    confirm_policy = input('Enter "Y" or "N" [Y]: ')
                    if confirm_policy == 'Y' or confirm_policy == '':
                        confirm_policy = 'Y'

                        # Write Policies to Template File
                        templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                        write_to_template(self, **templateVars)

                        # Add Template Name to Policies Output
                        policy_names.append(templateVars["name"])

                        configure_loop, policy_loop = exit_default_no(templateVars["policy_type"])
                        valid_confirm = True

                    elif confirm_policy == 'N':
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Starting {templateVars["policy_type"]} Section over.')
                        print(f'\n------------------------------------------------------\n')
                        valid_confirm = True

                    else:
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # IPMI over LAN Policy Module
    #========================================
    def ipmi_over_lan_policies(self):
        name_prefix = self.name_prefix
        name_suffix = 'ipmi'
        org = self.org
        policy_names = []
        policy_type = 'IPMI over LAN Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'ipmi_over_lan_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  An {policy_type} will configure IPMI over LAN access on a Server Profile.  This policy')
            print(f'  allows you to determine whether IPMI commands can be sent directly to the server, using ')
            print(f'  the IP address.\n')
            print(f'  This wizard will save the configuraton for this section to the following file:')
            print(f'  - Intersight/{org}/{self.type}/{templateVars["template_type"]}.auto.tfvars')
            print(f'\n-------------------------------------------------------------------------------------------\n')
            configure = input(f'Do You Want to Configure an {policy_type}?  Enter "Y" or "N" [Y]: ')
            if configure == 'Y' or configure == '':
                policy_loop = False
                while policy_loop == False:

                    if not name_prefix == '':
                        name = '%s_%s' % (name_prefix, name_suffix)
                    else:
                        name = '%s_%s' % (org, name_suffix)

                    templateVars["name"] = policy_name(name, policy_type)
                    templateVars["descr"] = policy_descr(templateVars["name"], policy_type)
                    templateVars["enabled"] = True

                    valid = False
                    while valid == False:
                        encrypt_traffic = input('Do you want to encrypt IPMI over LAN Traffic?  Enter "Y" or "N" [Y]: ')
                        if encrypt_traffic == 'Y' or encrypt_traffic == '':
                            print(f'\n-------------------------------------------------------------------------------------------\n')
                            print(f'  The ipmi_key Must be in Hexidecimal Format and no longer than 40 characters.')
                            print(f'\n-------------------------------------------------------------------------------------------\n')
                            valid_password = False
                            while valid_password == False:
                                ipmi_key = getpass.getpass(prompt='Enter ipmi_key: ')
                                valid_password = validating_ucs.ipmi_key_check(ipmi_key)

                            templateVars["ipmi_key"] = 1
                            os.environ['TF_VAR_ipmi_key_1'] = '%s' % (ipmi_key)
                            valid = True
                        else:
                            valid = True

                    templateVars["policy_file"] = 'ipmi_privileges.txt'
                    templateVars["var_description"] = '   Privilege - The highest privilege level that can be assigned to an IPMI session on a server.'
                    templateVars["var_type"] = 'Privilege'
                    templateVars["privilege"] = variable_loop(**templateVars)

                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    print(f'  Do you want to accept the following configuration?')
                    print(f'   description = "{templateVars["descr"]}"')
                    print(f'   enabled     = {templateVars["enabled"]}')
                    if templateVars["ipmi_key"]:
                        print(f'   ipmi_key    = "Sensitive_value"')
                    print(f'   name        = "{templateVars["name"]}"')
                    print(f'   privilege   = "{templateVars["privilege"]}"')
                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    valid_confirm = False
                    while valid_confirm == False:
                        confirm_policy = input('Enter "Y" or "N" [Y]: ')
                        if confirm_policy == 'Y' or confirm_policy == '':
                            confirm_policy = 'Y'

                            # Write Policies to Template File
                            templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                            write_to_template(self, **templateVars)

                            # Add Template Name to Policies Output
                            policy_names.append(templateVars["name"])

                            configure_loop, policy_loop = exit_default_no(templateVars["policy_type"])
                            valid_confirm = True

                        elif confirm_policy == 'N':
                            print(f'\n------------------------------------------------------\n')
                            print(f'  Starting {templateVars["policy_type"]} Section over.')
                            print(f'\n------------------------------------------------------\n')
                            valid_confirm = True

                        else:
                            print(f'\n------------------------------------------------------\n')
                            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                            print(f'\n------------------------------------------------------\n')

            elif configure == 'N':
                configure_loop = True
            else:
                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                print(f'\n-------------------------------------------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # IQN Pools Module
    #========================================
    def iqn_pools(self):
        name_prefix = self.name_prefix
        name_suffix = 'iqn_pool'
        org = self.org
        policy_names = []
        policy_type = 'IQN Pool'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'iqn_pools'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            configure = input(f'Do You Want to Configure a {policy_type}.  Enter "Y" or "N" [Y]: ')
            if configure == 'Y' or configure == '':
                policy_loop = False
                while policy_loop == False:

                    if not name_prefix == '':
                        name = '%s_%s' % (name_prefix, name_suffix)
                    else:
                        name = '%s_%s' % (org, name_suffix)

                    templateVars["name"] = policy_name(name, policy_type)
                    templateVars["descr"] = policy_descr(templateVars["name"], policy_type)

                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    print(f'  Assignment order decides the order in which the next identifier is allocated.')
                    print(f'    1. default - (Intersight Default) Assignment order is decided by the system.')
                    print(f'    2. sequential - (Recommended) Identifiers are assigned in a sequential order.')
                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    valid = False
                    while valid == False:
                        templateVars["assignment_order"] = input('Specify the Index for the value to select [2]: ')
                        if templateVars["assignment_order"] == '' or templateVars["assignment_order"] == '2':
                            templateVars["assignment_order"] = 'sequential'
                            valid = True
                        elif templateVars["assignment_order"] == '1':
                            templateVars["assignment_order"] = 'default'
                            valid = True
                        else:
                            print(f'\n-------------------------------------------------------------------------------------------\n')
                            print(f'  Error!! Invalid Option.  Please Select a valid option from the List.')
                            print(f'\n-------------------------------------------------------------------------------------------\n')

                    # Write Policies to Template File
                    templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                    write_to_template(self, **templateVars)

                    # Add Template Name to Policies Output
                    policy_names.append(templateVars["name"])

                    exit_answer = input(f'Would You like to Configure another {policy_type}?  Enter "Y" or "N" [N]: ')
                    if exit_answer == 'N' or exit_answer == '':
                        policy_loop = True
                        configure_loop = True
            elif configure == 'N':
                configure_loop = True
            else:
                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                print(f'\n-------------------------------------------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # iSCSI Adapter Policy Module
    #========================================
    def iscsi_adapter_policies(self):
        name_prefix = self.name_prefix
        name_suffix = 'adapter'
        org = self.org
        policy_names = []
        policy_type = 'iSCSI Adapter Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'iscsi_adapter_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            configure = input(f'Do You Want to Configure a {policy_type}.  Enter "Y" or "N" [Y]: ')
            if configure == 'Y' or configure == '':
                policy_loop = False
                while policy_loop == False:

                    if not name_prefix == '':
                        name = '%s_%s' % (name_prefix, name_suffix)
                    else:
                        name = '%s_%s' % (org, name_suffix)

                    templateVars["name"] = policy_name(name, policy_type)
                    templateVars["descr"] = policy_descr(templateVars["name"], policy_type)

                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    print(f'  Assignment order decides the order in which the next identifier is allocated.')
                    print(f'    1. default - (Intersight Default) Assignment order is decided by the system.')
                    print(f'    2. sequential - (Recommended) Identifiers are assigned in a sequential order.')
                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    valid = False
                    while valid == False:
                        templateVars["assignment_order"] = input('Specify the Index for the value to select [2]: ')
                        if templateVars["assignment_order"] == '' or templateVars["assignment_order"] == '2':
                            templateVars["assignment_order"] = 'sequential'
                            valid = True
                        elif templateVars["assignment_order"] == '1':
                            templateVars["assignment_order"] = 'default'
                            valid = True
                        else:
                            print(f'\n-------------------------------------------------------------------------------------------\n')
                            print(f'  Error!! Invalid Option.  Please Select a valid option from the List.')
                            print(f'\n-------------------------------------------------------------------------------------------\n')

                    # Write Policies to Template File
                    templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                    write_to_template(self, **templateVars)

                    # Add Template Name to Policies Output
                    policy_names.append(templateVars["name"])

                    exit_answer = input(f'Would You like to Configure another {policy_type}?  Enter "Y" or "N" [N]: ')
                    if exit_answer == 'N' or exit_answer == '':
                        policy_loop = True
                        configure_loop = True
            elif configure == 'N':
                configure_loop = True
            else:
                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                print(f'\n-------------------------------------------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # iSCSI Boot Policy Module
    #========================================
    def iscsi_boot_policies(self):
        name_prefix = self.name_prefix
        name_suffix = 'boot'
        org = self.org
        policy_names = []
        policy_type = 'iSCSI Boot Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'iscsi_boot_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            configure = input(f'Do You Want to Configure a {policy_type}.  Enter "Y" or "N" [Y]: ')
            if configure == 'Y' or configure == '':
                policy_loop = False
                while policy_loop == False:

                    if not name_prefix == '':
                        name = '%s_%s' % (name_prefix, name_suffix)
                    else:
                        name = '%s_%s' % (org, name_suffix)

                    templateVars["name"] = policy_name(name, policy_type)
                    templateVars["descr"] = policy_descr(templateVars["name"], policy_type)

                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    print(f'  Assignment order decides the order in which the next identifier is allocated.')
                    print(f'    1. default - (Intersight Default) Assignment order is decided by the system.')
                    print(f'    2. sequential - (Recommended) Identifiers are assigned in a sequential order.')
                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    valid = False
                    while valid == False:
                        templateVars["assignment_order"] = input('Specify the Index for the value to select [2]: ')
                        if templateVars["assignment_order"] == '' or templateVars["assignment_order"] == '2':
                            templateVars["assignment_order"] = 'sequential'
                            valid = True
                        elif templateVars["assignment_order"] == '1':
                            templateVars["assignment_order"] = 'default'
                            valid = True
                        else:
                            print(f'\n-------------------------------------------------------------------------------------------\n')
                            print(f'  Error!! Invalid Option.  Please Select a valid option from the List.')
                            print(f'\n-------------------------------------------------------------------------------------------\n')

                    # Write Policies to Template File
                    templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                    write_to_template(self, **templateVars)

                    # Add Template Name to Policies Output
                    policy_names.append(templateVars["name"])

                    exit_answer = input(f'Would You like to Configure another {policy_type}?  Enter "Y" or "N" [N]: ')
                    if exit_answer == 'N' or exit_answer == '':
                        policy_loop = True
                        configure_loop = True
            elif configure == 'N':
                configure_loop = True
            else:
                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                print(f'\n-------------------------------------------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # iSCSI Static Target Policy Module
    #========================================
    def iscsi_static_target_policies(self):
        name_prefix = self.name_prefix
        name_suffix = 'target'
        org = self.org
        policy_names = []
        policy_type = 'iSCSI Static Target Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'iscsi_static_target_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            configure = input(f'Do You Want to Configure a {policy_type}?  Enter "Y" or "N" [Y]: ')
            if configure == 'Y' or configure == '':
                policy_loop = False
                while policy_loop == False:

                    if not name_prefix == '':
                        name = '%s_%s' % (name_prefix, name_suffix)
                    else:
                        name = '%s_%s' % (org, name_suffix)

                    templateVars["name"] = policy_name(name, policy_type)
                    templateVars["descr"] = policy_descr(templateVars["name"], policy_type)

                    templateVars["priority"] = 'auto'
                    templateVars["receive"] = 'Disabled'
                    templateVars["send"] = 'Disabled'

                    # Write Policies to Template File
                    templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                    write_to_template(self, **templateVars)

                    # Add Template Name to Policies Output
                    policy_names.append(templateVars["name"])

                    exit_answer = input(f'Would You like to Configure another {policy_type}?  Enter "Y" or "N" [N]: ')
                    if exit_answer == 'N' or exit_answer == '':
                        policy_loop = True
                        configure_loop = True
            elif configure == 'N':
                configure_loop = True
            else:
                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                print(f'\n-------------------------------------------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # LAN Connectivity Policy Module
    #========================================
    def lan_connectivity_policies(self):
        name_prefix = self.name_prefix
        name_suffix = 'lan'
        org = self.org
        policy_names = []
        policy_type = 'LAN Connectivity Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'lan_connectivity_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            configure = input(f'Do You Want to Configure a {policy_type}?  Enter "Y" or "N" [Y]: ')
            if configure == 'Y' or configure == '':
                policy_loop = False
                while policy_loop == False:

                    if not name_prefix == '':
                        name = '%s_%s' % (name_prefix, name_suffix)
                    else:
                        name = '%s_%s' % (org, name_suffix)

                    templateVars["name"] = policy_name(name, policy_type)
                    templateVars["descr"] = policy_descr(templateVars["name"], policy_type)

                    templateVars["priority"] = 'auto'
                    templateVars["receive"] = 'Disabled'
                    templateVars["send"] = 'Disabled'

                    # Write Policies to Template File
                    templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                    write_to_template(self, **templateVars)

                    # Add Template Name to Policies Output
                    policy_names.append(templateVars["name"])

                    exit_answer = input(f'Would You like to Configure another {policy_type}?  Enter "Y" or "N" [N]: ')
                    if exit_answer == 'N' or exit_answer == '':
                        policy_loop = True
                        configure_loop = True
            elif configure == 'N':
                configure_loop = True
            else:
                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                print(f'\n-------------------------------------------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # Link Aggregation Policy Module
    #========================================
    def link_aggregation_policies(self):
        name_prefix = self.name_prefix
        name_suffix = 'link_agg'
        org = self.org
        policy_names = []
        policy_type = 'Link Aggregation Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'link_aggregation_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  A Link Aggregation Policy will assign LACP settings to the Ethernet Port-Channels and')
            print(f'  uplinks.  We recommend the default wizard settings so you will only be asked for the ')
            print(f'  name and description for the Policy.  You only need one of these policies for ')
            print(f'  Organization {org}.\n')
            print(f'  This wizard will save the configuraton for this section to the following file:')
            print(f'  - Intersight/{org}/{self.type}/{templateVars["template_type"]}.auto.tfvars')
            print(f'\n-------------------------------------------------------------------------------------------\n')
            policy_loop = False
            while policy_loop == False:

                if not name_prefix == '':
                    name = '%s_%s' % (name_prefix, name_suffix)
                else:
                    name = '%s_%s' % (org, name_suffix)

                templateVars["name"] = policy_name(name, policy_type)
                templateVars["descr"] = policy_descr(templateVars["name"], policy_type)

                templateVars["lacp_rate"] = 'normal'
                templateVars["suspend_individual"] = False

                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Do you want to accept the following configuration?')
                print(f'    description        = "{templateVars["descr"]}"')
                print(f'    lacp_rate          = "{templateVars["lacp_rate"]}"')
                print(f'    name               = "{templateVars["name"]}"')
                print(f'    suspend_individual = {templateVars["suspend_individual"]}')
                print(f'\n-------------------------------------------------------------------------------------------\n')
                valid_confirm = False
                while valid_confirm == False:
                    confirm_policy = input('Enter "Y" or "N" [Y]: ')
                    if confirm_policy == 'Y' or confirm_policy == '':
                        confirm_policy = 'Y'

                        # Write Policies to Template File
                        templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                        write_to_template(self, **templateVars)

                        # Add Template Name to Policies Output
                        policy_names.append(templateVars["name"])

                        configure_loop, policy_loop = exit_default_no(templateVars["policy_type"])
                        valid_confirm = True

                    elif confirm_policy == 'N':
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Starting {templateVars["policy_type"]} Section over.')
                        print(f'\n------------------------------------------------------\n')
                        valid_confirm = True

                    else:
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # Link Control Policy Module
    #========================================
    def link_control_policies(self):
        name_prefix = self.name_prefix
        name_suffix = 'link_ctrl'
        org = self.org
        policy_names = []
        policy_type = 'Link Control Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'link_control_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  A Link Control Policy will configure the Unidirectional Link Detection Protocol for')
            print(f'  Ethernet Uplinks/Port-Channels.')
            print(f'  We recommend the wizards default parameters so you will only be asked for the name')
            print(f'  and description for the Policy.  You only need one of these policies for')
            print(f'  Organization {org}.\n')
            print(f'  This wizard will save the configuraton for this section to the following file:')
            print(f'  - Intersight/{org}/{self.type}/{templateVars["template_type"]}.auto.tfvars')
            print(f'\n-------------------------------------------------------------------------------------------\n')
            policy_loop = False
            while policy_loop == False:

                if not name_prefix == '':
                    name = '%s_%s' % (name_prefix, name_suffix)
                else:
                    name = '%s_%s' % (org, name_suffix)

                templateVars["name"] = policy_name(name, policy_type)
                templateVars["descr"] = policy_descr(templateVars["name"], policy_type)

                templateVars["admin_state"] = 'Enabled'
                templateVars["mode"] = 'normal'

                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Do you want to accept the following configuration?')
                print(f'    admin_state = "{templateVars["admin_state"]}"')
                print(f'    description = "{templateVars["descr"]}"')
                print(f'    mode        = "{templateVars["mode"]}"')
                print(f'    name        = "{templateVars["name"]}"')
                print(f'\n-------------------------------------------------------------------------------------------\n')
                valid_confirm = False
                while valid_confirm == False:
                    confirm_policy = input('Enter "Y" or "N" [Y]: ')
                    if confirm_policy == 'Y' or confirm_policy == '':
                        confirm_policy = 'Y'

                        # Write Policies to Template File
                        templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                        write_to_template(self, **templateVars)

                        # Add Template Name to Policies Output
                        policy_names.append(templateVars["name"])

                        configure_loop, policy_loop = exit_default_no(templateVars["policy_type"])
                        valid_confirm = True

                    elif confirm_policy == 'N':
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Starting {templateVars["policy_type"]} Section over.')
                        print(f'\n------------------------------------------------------\n')
                        valid_confirm = True

                    else:
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # MAC Pools Module
    #========================================
    def mac_pools(self):
        name_prefix = self.name_prefix
        org = self.org
        policy_names = []
        policy_type = 'MAC Pool'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'mac_pools'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  MAC Pool Convention Recommendations:')
            print(f'  - Leverage the Cisco UCS OUI of 00:25:B5 for the MAC Pool Prefix.')
            print(f'  - For MAC Pools; create a pool for each Fabric.')
            print(f'  - Pool Size can be between 1 and 1000 addresses.')
            print(f'  - Refer to "UCS Naming Conventions 0.5.ppsx" in the Repository for further guidance.\n')
            print(f'  This wizard will save the configuraton for this section to the following file:')
            print(f'  - Intersight/{org}/{self.type}/{templateVars["template_type"]}.auto.tfvars')
            print(f'\n-------------------------------------------------------------------------------------------\n')
            loop_count = 0
            policy_loop = False
            while policy_loop == False:

                name = naming_rule_fabric(loop_count, name_prefix, org)

                templateVars["name"] = policy_name(name, policy_type)
                templateVars["descr"] = policy_descr(templateVars["name"], policy_type)

                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Assignment order decides the order in which the next identifier is allocated.')
                print(f'    1. default - (Intersight Default) Assignment order is decided by the system.')
                print(f'    2. sequential - (Recommended) Identifiers are assigned in a sequential order.')
                print(f'\n-------------------------------------------------------------------------------------------\n')
                valid = False
                while valid == False:
                    templateVars["assignment_order"] = input('Specify the number for the value to select.  [2]: ')
                    if templateVars["assignment_order"] == '' or templateVars["assignment_order"] == '2':
                        templateVars["assignment_order"] = 'sequential'
                        valid = True
                    elif templateVars["assignment_order"] == '1':
                        templateVars["assignment_order"] = 'default'
                        valid = True
                    else:
                        print(f'\n-------------------------------------------------------------------------------------------\n')
                        print(f'  Error!! Invalid Option.  Please Select a valid option from the List.')
                        print(f'\n-------------------------------------------------------------------------------------------\n')

                valid = False
                while valid == False:
                    if loop_count % 2 == 0:
                        begin = input('What is the Beginning MAC Address to Assign to the Pool?  [00:25:B5:0A:00:00]: ')
                    else:
                        begin = input('What is the Beginning MAC Address to Assign to the Pool?  [00:25:B5:0B:00:00]: ')
                    if begin == '':
                        if loop_count % 2 == 0:
                            begin = '00:25:B5:0A:00:00'
                        else:
                            begin = '00:25:B5:0B:00:00'
                    valid = validating_ucs.mac_address('MAC Pool Address', begin)

                valid = False
                while valid == False:
                    pool_size = input('How Many Mac Addresses should be added to the Pool?  Range is 1-1000 [512]: ')
                    if pool_size == '':
                        pool_size = '512'
                    valid = validating_ucs.number_in_range('Pool Size', pool_size, 1, 1000)

                begin = begin.upper()
                beginx = int(begin.replace(':', ''), 16)
                add_dec = (beginx + int(pool_size))
                ending = ':'.join(['{}{}'.format(a, b)
                    for a, b
                    in zip(*[iter('{:012x}'.format(add_dec))]*2)])
                ending = ending.upper()
                templateVars["mac_blocks"] = [{'from':begin, 'to':ending}]

                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Do you want to accept the following configuration?')
                print(f'    assignment_order = "{templateVars["assignment_order"]}"')
                print(f'    description      = "{templateVars["descr"]}"')
                print(f'    name             = "{templateVars["name"]}"')
                print(f'    mac_blocks = [')
                for item in templateVars["mac_blocks"]:
                    print('      {')
                    for k, v in item.items():
                        if k == 'from':
                            print(f'        from = "{v}" ')
                        elif k == 'to':
                            print(f'        to   = "{v}"')
                    print('      }')
                print(f'    ]')
                print(f'\n-------------------------------------------------------------------------------------------\n')
                valid_confirm = False
                while valid_confirm == False:
                    confirm_policy = input('Enter "Y" or "N" [Y]: ')
                    if confirm_policy == 'Y' or confirm_policy == '':
                        confirm_policy = 'Y'

                        # Write Policies to Template File
                        templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                        write_to_template(self, **templateVars)

                        # Add Template Name to Policies Output
                        policy_names.append(templateVars["name"])

                        configure_loop, loop_count, policy_loop = exit_loop_default_yes(loop_count, policy_type)

                        valid_confirm = True

                    elif confirm_policy == 'N':
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Starting {policy_type} Section over.')
                        print(f'\n------------------------------------------------------\n')
                        valid_confirm = True

                    else:
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # Multicast Policy Module
    #========================================
    def multicast_policies(self):
        name_prefix = self.name_prefix
        name_suffix = 'multicast'
        org = self.org
        policy_names = []
        policy_type = 'Multicast Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'multicast_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  Each VLAN must have a Multicast Policy applied to it.  Optional attributes will be')
            print(f'  the IGMP Querier IPs.  IGMP Querier IPs are only needed if you have a non Routed VLAN')
            print(f'  and you need the Fabric Interconnects to act as IGMP Queriers for the network.')
            print(f'  If you configure IGMP Queriers for a Multicast Policy that Policy should only be')
            print(f'  Assigned to the VLAN for which those Queriers will service.\n')
            print(f'  This wizard will save the configuraton for this section to the following file:')
            print(f'  - Intersight/{org}/{self.type}/{templateVars["template_type"]}.auto.tfvars')
            print(f'\n-------------------------------------------------------------------------------------------\n')
            policy_loop = False
            while policy_loop == False:

                if not name_prefix == '':
                    name = '%s_%s' % (name_prefix, name_suffix)
                else:
                    name = '%s_%s' % (org, name_suffix)

                templateVars["name"] = policy_name(name, policy_type)
                templateVars["descr"] = policy_descr(templateVars["name"], policy_type)
                templateVars["igmp_snooping_state"] = 'Enabled'

                valid = False
                while valid == False:
                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    templateVars["querier_ip_address"] = input('IGMP Querier IP for Fabric Interconnect A.  [press enter to skip] ')
                    if templateVars["querier_ip_address"] == '':
                        valid = True
                    if not templateVars["querier_ip_address"] == '':
                        valid = validating_ucs.ip_address('Fabric A IGMP Querier IP', templateVars["querier_ip_address"])

                    if not templateVars["querier_ip_address"] == '':
                        templateVars["igmp_snooping_querier_state"] == 'Enabled'
                        valid = False
                        while valid == False:
                            print(f'\n-------------------------------------------------------------------------------------------\n')
                            templateVars["querier_ip_address_peer"] = input('IGMP Querier IP for Fabric Interconnect B.  [press enter to skip] ')
                            if templateVars["querier_ip_address_peer"] == '':
                                valid = True
                            if not templateVars["querier_ip_address_peer"] == '':
                                valid = validating_ucs.ip_address('Fabric B IGMP Querier IP', templateVars["querier_ip_address"])
                    else:
                        templateVars["igmp_snooping_querier_state"] = 'Disabled'
                        templateVars["querier_ip_address_peer"] = ''

                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Do you want to accept the following configuration?')
                print(f'    description                 = "{templateVars["descr"]}"')
                print(f'    igmp_snooping_state         = "{templateVars["igmp_snooping_state"]}"')
                print(f'    igmp_snooping_querier_state = "{templateVars["igmp_snooping_querier_state"]}"')
                print(f'    name                        = "{templateVars["name"]}"')
                if not templateVars["querier_ip_address_peer"] == '':
                    print(f'    querier_ip_address          = "{templateVars["querier_ip_address"]}"')
                    print(f'    querier_ip_address_peer     = "{templateVars["querier_ip_address_peer"]}"')
                print(f'\n-------------------------------------------------------------------------------------------\n')
                valid_confirm = False
                while valid_confirm == False:
                    confirm_policy = input('Enter "Y" or "N" [Y]: ')
                    if confirm_policy == 'Y' or confirm_policy == '':
                        confirm_policy = 'Y'

                        # Write Policies to Template File
                        templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                        write_to_template(self, **templateVars)

                        # Add Template Name to Policies Output
                        policy_names.append(templateVars["name"])

                        configure_loop, policy_loop = exit_default_no(templateVars["policy_type"])
                        valid_confirm = True

                    elif confirm_policy == 'N':
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Starting {templateVars["policy_type"]} Section over.')
                        print(f'\n------------------------------------------------------\n')
                        valid_confirm = True

                    else:
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # Network Connectivity Policy Module
    #========================================
    def network_connectivity_policies(self):
        name_prefix = self.name_prefix
        name_suffix = 'dns'
        org = self.org
        policy_names = []
        policy_type = 'Network Connectivity Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'network_connectivity_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  It is strongly recommended to have a Network Connectivity (DNS) Policy for the')
            print(f'  UCS Domain Profile.  Without it, DNS resolution will fail.\n')
            print(f'  This wizard will save the configuraton for this section to the following file:')
            print(f'  - Intersight/{org}/{self.type}/{templateVars["template_type"]}.auto.tfvars')
            print(f'\n-------------------------------------------------------------------------------------------\n')
            policy_loop = False
            while policy_loop == False:

                if not name_prefix == '':
                    name = '%s_%s' % (name_prefix, name_suffix)
                else:
                    name = '%s_%s' % (org, name_suffix)

                templateVars["name"] = policy_name(name, policy_type)
                templateVars["descr"] = policy_descr(templateVars["name"], policy_type)

                valid = False
                while valid == False:
                    templateVars["preferred_ipv4_dns_server"] = input('What is your Primary IPv4 DNS Server?  [208.67.220.220]: ')
                    if templateVars["preferred_ipv4_dns_server"] == '':
                        templateVars["preferred_ipv4_dns_server"] = '208.67.220.220'
                    valid = validating_ucs.ip_address('Primary IPv4 DNS Server', templateVars["preferred_ipv4_dns_server"])

                valid = False
                while valid == False:
                    alternate_true = input('Do you want to Configure an Alternate IPv4 DNS Server?  Enter "Y" or "N" [Y]: ')
                    if alternate_true == 'Y' or alternate_true == '':
                        templateVars["alternate_ipv4_dns_server"] = input('What is your Alternate IPv4 DNS Server?  [208.67.222.222]: ')
                        if templateVars["alternate_ipv4_dns_server"] == '':
                            templateVars["alternate_ipv4_dns_server"] = '208.67.222.222'
                        valid = validating_ucs.ip_address('Alternate IPv4 DNS Server', templateVars["alternate_ipv4_dns_server"])
                    elif alternate_true == 'N':
                        templateVars["alternate_ipv4_dns_server"] = ''
                        valid = True
                    else:
                        print(f'\n-------------------------------------------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n-------------------------------------------------------------------------------------------\n')

                valid = False
                while valid == False:
                    enable_ipv6 = input('Do you want to Configure IPv6 DNS?  Enter "Y" or "N" [N]: ')
                    if enable_ipv6 == 'Y':
                        templateVars["enable_ipv6"] = True
                        templateVars["preferred_ipv6_dns_server"] = input('What is your Primary IPv6 DNS Server?  [2620:119:35::35]: ')
                        if templateVars["preferred_ipv6_dns_server"] == '':
                            templateVars["preferred_ipv6_dns_server"] = '2620:119:35::35'
                        valid = validating_ucs.ip_address('Primary IPv6 DNS Server', templateVars["preferred_ipv6_dns_server"])
                    if enable_ipv6 == 'N' or enable_ipv6 == '':
                        templateVars["enable_ipv6"] = False
                        templateVars["preferred_ipv6_dns_server"] = ''
                        valid = True

                valid = False
                while valid == False:
                    if enable_ipv6 == 'Y':
                        alternate_true = input('Do you want to Configure an Alternate IPv6 DNS Server?  Enter "Y" or "N" [Y]: ')
                        if alternate_true == 'Y' or alternate_true == '':
                            templateVars["alternate_ipv6_dns_server"] = input('What is your Alternate IPv6 DNS Server?  [2620:119:53::53]: ')
                            if templateVars["alternate_ipv6_dns_server"] == '':
                                templateVars["alternate_ipv6_dns_server"] = '2620:119:53::53'
                            valid = validating_ucs.ip_address('Alternate IPv6 DNS Server', templateVars["alternate_ipv6_dns_server"])
                        elif alternate_true == 'N':
                            templateVars["alternate_ipv6_dns_server"] = ''
                            valid = True
                        else:
                            print(f'\n-------------------------------------------------------------------------------------------\n')
                            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                            print(f'\n-------------------------------------------------------------------------------------------\n')
                    else:
                        templateVars["alternate_ipv6_dns_server"] = ''
                        valid = True

                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Do you want to accept the following configuration?')
                print(f'    description = "{templateVars["descr"]}"')
                print(f'    name        = "{templateVars["name"]}"')
                if not templateVars["preferred_ipv4_dns_server"] == '':
                    print(f'    dns_servers_v4 = [')
                    print(f'      {templateVars["preferred_ipv4_dns_server"]},')
                    if not templateVars["alternate_ipv4_dns_server"] == '':
                        print(f'      {templateVars["alternate_ipv4_dns_server"]}')
                    print(f'    ]')
                if not templateVars["preferred_ipv6_dns_server"] == '':
                    print(f'    dns_servers_v6 = [')
                    print(f'      {templateVars["preferred_ipv6_dns_server"]},')
                    if not templateVars["alternate_ipv6_dns_server"] == '':
                        print(f'      {templateVars["alternate_ipv6_dns_server"]}')
                    print(f'    ]')
                print(f'\n-------------------------------------------------------------------------------------------\n')
                valid_confirm = False
                while valid_confirm == False:
                    confirm_policy = input('Enter "Y" or "N" [Y]: ')
                    if confirm_policy == 'Y' or confirm_policy == '':
                        confirm_policy = 'Y'

                        # Write Policies to Template File
                        templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                        write_to_template(self, **templateVars)

                        # Add Template Name to Policies Output
                        policy_names.append(templateVars["name"])

                        configure_loop, policy_loop = exit_default_no(templateVars["policy_type"])
                        valid_confirm = True

                    elif confirm_policy == 'N':
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Starting {templateVars["policy_type"]} Section over.')
                        print(f'\n------------------------------------------------------\n')
                        valid_confirm = True

                    else:
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # NTP Policy Module
    #========================================
    def ntp_policies(self):
        name_prefix = self.name_prefix
        name_suffix = 'ntp'
        org = self.org
        policy_names = []
        policy_type = 'NTP Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_file"] = 'timezones.txt'
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'ntp_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  It is strongly recommended to configure an NTP Policy for the UCS Domain Profile.')
            print(f'  Without an NTP Policy Events can be incorrectly timestamped and Intersight ')
            print(f'  Communication, as an example, could be interrupted with Certificate Validation\n')
            print(f'  checks, as an example.\n')
            print(f'  This wizard will save the configuraton for this section to the following file:')
            print(f'  - Intersight/{org}/{self.type}/{templateVars["template_type"]}.auto.tfvars')
            print(f'\n-------------------------------------------------------------------------------------------\n')
            policy_loop = False
            while policy_loop == False:

                if not name_prefix == '':
                    name = '%s_%s' % (name_prefix, name_suffix)
                else:
                    name = '%s_%s' % (org, name_suffix)

                templateVars["name"] = policy_name(name, policy_type)
                templateVars["descr"] = policy_descr(templateVars["name"], policy_type)

                valid = False
                while valid == False:
                    primary_ntp = input('What is your Primary NTP Server [0.north-america.pool.ntp.org]: ')
                    if primary_ntp == "":
                        primary_ntp = '0.north-america.pool.ntp.org'
                    if re.search(r'[a-zA-Z]+', primary_ntp):
                        valid = validating_ucs.dns_name('Primary NTP Server', primary_ntp)
                    else:
                        valid = validating_ucs.ip_address('Primary NTP Server', primary_ntp)

                valid = False
                while valid == False:
                    alternate_true = input('Do you want to Configure an Alternate NTP Server?  Enter "Y" or "N" [Y]: ')
                    if alternate_true == 'Y' or alternate_true == '':
                        alternate_ntp = input('What is your Alternate NTP Server? [1.north-america.pool.ntp.org]: ')
                        if alternate_ntp == '':
                            alternate_ntp = '1.north-america.pool.ntp.org'
                        if re.search(r'[a-zA-Z]+', alternate_ntp):
                            valid = validating_ucs.dns_name('Alternate NTP Server', alternate_ntp)
                        else:
                            valid = validating_ucs.ip_address('Alternate NTP Server', alternate_ntp)
                    elif alternate_true == 'N':
                        alternate_ntp = ''
                        valid = True
                    else:
                        print(f'\n-------------------------------------------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n-------------------------------------------------------------------------------------------\n')

                templateVars["enabled"] = True
                templateVars["ntp_servers"] = []
                templateVars["ntp_servers"].append(primary_ntp)
                if alternate_true == 'Y' or alternate_true == '':
                    templateVars["ntp_servers"].append(alternate_ntp)

                valid = False
                while valid == False:
                    print(f'\n---------------------------------------------------------------------------------------')
                    print(f'   Timezone Regions...')
                    policy_file = 'ucs_templates/variables/%s' % (templateVars["policy_file"])
                    if os.path.isfile(policy_file):
                        template_file = open(policy_file, 'r')
                        tz_regions = []
                        for line in template_file:
                            tz_region = line.split('/')[0]
                            if not tz_region in tz_regions:
                                tz_regions.append(tz_region)
                        for index, value in enumerate(tz_regions):
                            index += 1
                            if index < 10:
                                print(f'     {index}. {value}')
                            else:
                                print(f'    {index}. {value}')
                    print(f'---------------------------------------------------------------------------------------\n')
                    time_region = input('Please Enter the Index for the Time Region for the Domain: ')
                    for index, value in enumerate(tz_regions):
                        index += 1
                        if int(time_region) == index:
                            valid = True
                    if valid == False:
                        print(f'\n-------------------------------------------------------------------------------------------\n')
                        print(f'  Error!! Invalid Selection.  Please Select a valid Index from the List.')
                        print(f'\n-------------------------------------------------------------------------------------------\n')

                valid = False
                while valid == False:
                    print(f'\n---------------------------------------------------------------------------------------')
                    print(f'   Region Timezones...')
                    for index, value in enumerate(tz_regions):
                        index += 1
                        if int(time_region) == index:
                            tz_region = value
                            region_tzs = []
                            template_file.seek(0)
                            for line in template_file:
                                if tz_region in line:
                                    line = line.strip()
                                    region_tzs.append(line)
                            for i, v in enumerate(region_tzs):
                                i += 1
                                if i < 10:
                                    print(f'     {i}. {v}')
                                else:
                                    print(f'    {i}. {v}')
                    print(f'---------------------------------------------------------------------------------------\n')
                    timezone_index = input('Please Enter the Index for the Region Timezone to assign to the Domain: ')
                    for i, v in enumerate(region_tzs):
                        i += 1
                        if int(timezone_index) == i:
                            templateVars["timezone"] = v
                            valid = True
                    if valid == False:
                        print(f'\n-------------------------------------------------------------------------------------------\n')
                        print(f'  Error!! Invalid Selection.  Please Select a valid Index from the List.')
                        print(f'\n-------------------------------------------------------------------------------------------\n')
                    template_file.close()

                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Do you want to accept the following configuration?')
                print(f'    description = "{templateVars["descr"]}"')
                print(f'    name        = "{templateVars["name"]}"')
                print(f'    timezone    = "{templateVars["timezone"]}"')
                if len(templateVars["ntp_servers"]) > 0:
                    print(f'    ntp_servers = [')
                    for server in templateVars["ntp_servers"]:
                        print(f'      "{server}",')
                    print(f'    ]')
                print(f'\n-------------------------------------------------------------------------------------------\n')
                valid_confirm = False
                while valid_confirm == False:
                    confirm_policy = input('Enter "Y" or "N" [Y]: ')
                    if confirm_policy == 'Y' or confirm_policy == '':
                        confirm_policy = 'Y'

                        # Write Policies to Template File
                        templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                        write_to_template(self, **templateVars)

                        # Add Template Name to Policies Output
                        policy_names.append(templateVars["name"])

                        configure_loop, policy_loop = exit_default_no(templateVars["policy_type"])
                        valid_confirm = True

                    elif confirm_policy == 'N':
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Starting {templateVars["policy_type"]} Section over.')
                        print(f'\n------------------------------------------------------\n')
                        valid_confirm = True

                    else:
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # Port Policy Module
    #========================================
    def port_policies(self, policies, vsan_policies_vsans):
        name_prefix = self.name_prefix
        org = self.org
        policy_names = []
        policy_type = 'Port Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'port_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        port_count = 0
        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  A {policy_type} is used to configure the ports for a UCS Domain Profile.  This includes:')
            print(f'   - Unified Ports - Ports to convert to Fibre-Channel Mode.')
            print(f'   - Appliance Ports')
            print(f'   - Appliance Port-Channels')
            print(f'   - Ethernet Uplinks')
            print(f'   - Ethernet Uplink Port-Channels')
            print(f'   - FCoE Uplinks')
            print(f'   - FCoE Uplink Port-Channels')
            print(f'   - Fibre-Channel Uplinks')
            print(f'   - Fibre-Channel Uplink Port-Channels')
            print(f'   - Server Ports\n')
            print(f'  This wizard will save the configuraton for this section to the following file:')
            print(f'  - Intersight/{org}/{self.type}/{templateVars["template_type"]}.auto.tfvars')
            print(f'\n-------------------------------------------------------------------------------------------\n')
            policy_loop = False
            while policy_loop == False:

                print(f'   IMPORTANT NOTE: The wizard will create a Port Policy for Fabric A and Fabric B')
                print(f'                   automatically.  The Policy Name will be appended with [name]_A for ')
                print(f'                   Fabric A and [name]_B for Fabric B.  You only need one Policy per')
                print(f'                   Domain.')
                print(f'\n-------------------------------------------------------------------------------------------\n')

                if not name_prefix == '':
                    name = '%s' % (name_prefix)
                else:
                    name = '%s' % (org)

                templateVars["name"] = policy_name(name, policy_type)
                templateVars["descr"] = policy_descr(templateVars["name"], policy_type)

                templateVars["policy_file"] = 'model.txt'
                templateVars["var_description"] = '    Please Choose the model of Fabric Interconnect to configure:\n'
                templateVars["var_type"] = 'Model'
                model = variable_loop(**templateVars)
                templateVars["device_model"] = model

                fc_mode = ''
                ports_in_use = []
                fc_converted_ports = []
                valid = False
                while valid == False:
                    fc_mode = input('Do you want to convert ports to Fibre Channel Mode?  Enter "Y" or "N" [Y]: ')
                    if fc_mode == '' or fc_mode == 'Y':
                        templateVars["policy_file"] = 'unified_ports.txt'
                        templateVars["var_description"] = '    Please Select the Port Range to convert to Fibre-Channel Mode:\n'
                        templateVars["var_type"] = 'Unified Ports'
                        fc_ports = variable_loop(**templateVars)
                        x = fc_ports.split('-')
                        fc_ports = [int(x[0]),int(x[1])]
                        for i in range(int(x[0]), int(x[1]) + 1):
                            ports_in_use.append(i)
                            fc_converted_ports.append(i)
                        templateVars["port_modes"] = {'custom_mode':'FibreChannel','port_list':fc_ports,'slot_id':1}
                        valid = True
                    elif fc_mode == 'N':
                        valid = True
                    else:
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n------------------------------------------------------\n')

                port_channel_appliances = []
                port_type = 'Appliance Port-Channel'
                port_count = 1
                valid = False
                while valid == False:
                    configure_port = input(f'Do you want to configure an {port_type}?  Enter "Y" or "N" [N]: ')
                    if configure_port == 'Y':
                        configure_valid = False
                        while configure_valid == False:
                            print(f'\n------------------------------------------------------\n')
                            print(f'  The Port List can be in the format of:')
                            print(f'     5 - Single Port')
                            print(f'     5,11,12,13,14,15 - List of Ports')
                            print(f'\n------------------------------------------------------\n')
                            if model == 'UCS-FI-64108':
                                port_list = input(f'Please enter the list of ports you want to add to the {port_type}?  [95,96]: ')
                            else:
                                port_list = input(f'Please enter the list of ports you want to add to the {port_type}?  [47,48]: ')
                            if port_list == '' and model == 'UCS-FI-64108':
                                port_list = '95,96'
                            elif port_list == '':
                                port_list = '47,48'
                            port_group = []
                            if re.search(r'(^[0-9]+$)', port_list):
                                port_group.append(port_list)
                            elif re.search(r'(^[0-9]+,{1,16}[0-9]+$)', port_list):
                                x = port_list.split(',')
                                port_group = []
                                for i in x:
                                    port_group.append(i)
                            if re.search(r'(^[0-9]+$|^[0-9]+,{1,16}[0-9]+$)', port_list):
                                port_list = port_group
                                port_overlap_count = 0
                                port_overlap = []
                                for x in ports_in_use:
                                    for y in port_list:
                                        if int(x) == int(y):
                                            port_overlap_count += 1
                                            port_overlap.append(x)
                                if port_overlap_count == 0:
                                    if model == 'UCS-FI-64108':
                                        max_port = 108
                                    else:
                                        max_port = 54
                                    if fc_mode == 'Y':
                                        min_port = int(fc_ports[1])
                                    else:
                                        min_port = 1
                                    for port in port_list:
                                        valid_ports = validating_ucs.number_in_range('Port Range', port, min_port, max_port)
                                        if valid_ports == False:
                                            break
                                    if valid_ports == True:
                                        # Prompt User for the Admin Speed of the Port
                                        templateVars["policy_file"] = 'ethernet_admin_speed.txt'
                                        templateVars["var_description"] = '    Please Select the Admin Speed for the Port-Channel:\n'
                                        templateVars["var_type"] = 'Admin Speed'
                                        admin_speed = variable_loop(**templateVars)

                                        # Prompt User for the Admin Speed of the Port
                                        templateVars["policy_file"] = 'port_mode.txt'
                                        templateVars["var_description"] = '    Please Select the Port Mode:\n'
                                        templateVars["var_type"] = 'Port Mode'
                                        templateVars["mode"] = variable_loop(**templateVars)

                                        templateVars["policy_file"] = 'qos_priority.txt'
                                        templateVars["var_description"] = '   Priority:  Default is "Best Effort".\n   The Priority Queue to Assign to this Port:\n'
                                        templateVars["var_type"] = 'Priority'
                                        templateVars["priority"] = variable_loop(**templateVars)

                                        # Prompt User for the
                                        policy_list = [
                                            'ethernet_network_control_policies',
                                            'ethernet_network_group_policies',
                                        ]
                                        templateVars["allow_opt_out"] = False
                                        for policy in policy_list:
                                            policy_short = policy.replace('policies', 'policy')
                                            templateVars["policies"] = policies.get(policy)
                                            templateVars[policy_short] = choose_policy(policy, **templateVars)

                                        interfaces = []
                                        for i in port_list:
                                            interfaces.append({'port_id':i,'slot_id':1})

                                        pc_id = port_list[0]
                                        port_channel = {
                                            'admin_speed':admin_speed,
                                            'ethernet_network_control_policy':templateVars["ethernet_network_control_policy"],
                                            'ethernet_network_group_policy':templateVars["ethernet_network_group_policy"],
                                            'interfaces':interfaces,
                                            'mode':templateVars["mode"],
                                            'pc_id':pc_id,
                                            'priority':templateVars["priority"],
                                            'slot_id':1
                                        }
                                        print(f'\n-------------------------------------------------------------------------------------------\n')
                                        print(f'  Do you want to accept the following configuration?')
                                        print(f'    admin_speed                     = "{admin_speed}"')
                                        print(f'    ethernet_network_control_policy = "{templateVars["ethernet_network_control_policy"]}"')
                                        print(f'    ethernet_network_group_policy   = "{templateVars["ethernet_network_group_policy"]}"')
                                        print(f'    interfaces = [')
                                        for item in interfaces:
                                            print('      {')
                                            for k, v in item.items():
                                                print(f'        {k}          = {v}')
                                            print('      }')
                                        print(f'    ]')
                                        print(f'    mode         = "{templateVars["mode"]}"')
                                        print(f'    priority     = "{templateVars["priority"]}"')
                                        print(f'    pc_id        = {pc_id}')
                                        print(f'\n-------------------------------------------------------------------------------------------\n')
                                        valid_confirm = False
                                        while valid_confirm == False:
                                            confirm_port = input('Enter "Y" or "N" [Y]: ')
                                            if confirm_port == 'Y' or confirm_port == '':
                                                port_channel_appliances.append(port_channel)
                                                for i in port_list:
                                                    ports_in_use.append(i)

                                                valid_exit = False
                                                while valid_exit == False:
                                                    port_exit = input(f'Would You like to Configure another {port_type}?  Enter "Y" or "N" [N]: ')
                                                    if port_exit == 'Y':
                                                        port_count += 1
                                                        valid_confirm = True
                                                        valid_exit = True
                                                    elif port_exit == 'N' or port_exit == '':
                                                        configure_valid = True
                                                        valid = True
                                                        valid_confirm = True
                                                        valid_exit = True
                                                    else:
                                                        print(f'\n------------------------------------------------------\n')
                                                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                                                        print(f'\n------------------------------------------------------\n')

                                            elif confirm_port == 'N':
                                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                                print(f'  Starting {port_type} Configuration Over.')
                                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                                valid_confirm = True
                                            else:
                                                print(f'\n------------------------------------------------------\n')
                                                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                                                print(f'\n------------------------------------------------------\n')

                                else:
                                    print(f'\n-------------------------------------------------------------------------------------------\n')
                                    print(f'  Error!! The following Ports are already in use: {port_overlap}.')
                                    print(f'\n-------------------------------------------------------------------------------------------\n')

                            else:
                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                print(f'  Error!! Invalid Port Range.  A port Range should be in the format 49-50 for example.')
                                print(f'  The following port range is invalid: "{port_list}"')
                                print(f'\n-------------------------------------------------------------------------------------------\n')

                    elif configure_port == '' or configure_port == 'N':
                        valid = True
                    else:
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n------------------------------------------------------\n')

                port_channel_ethernet_uplinks = []
                port_type = 'Ethernet Uplink Port-Channel'
                port_count = 1
                valid = False
                while valid == False:
                    configure_port = input(f'Do you want to configure an {port_type}?  Enter "Y" or "N" [Y]: ')
                    if configure_port == '' or configure_port == 'Y':
                        configure_valid = False
                        while configure_valid == False:
                            print(f'\n------------------------------------------------------\n')
                            print(f'  The Port List can be in the format of:')
                            print(f'     5 - Single Port')
                            print(f'     5,11,12,13,14,15 - List of Ports')
                            print(f'\n------------------------------------------------------\n')
                            if model == 'UCS-FI-64108':
                                port_list = input(f'Please enter the list of ports you want to add to the {port_type}?  [97,98]: ')
                            else:
                                port_list = input(f'Please enter the list of ports you want to add to the {port_type}?  [49,50]: ')
                            if port_list == '' and model == 'UCS-FI-64108':
                                port_list = '97,98'
                            elif port_list == '':
                                port_list = '49,50'
                            port_group = []
                            if re.search(r'(^[0-9]+$)', port_list):
                                port_group.append(port_list)
                            elif re.search(r'(^[0-9]+,{1,16}[0-9]+$)', port_list):
                                x = port_list.split(',')
                                port_group = []
                                for i in x:
                                    port_group.append(i)
                            if re.search(r'(^[0-9]+$|^[0-9]+,{1,16}[0-9]+$)', port_list):
                                port_list = port_group
                                port_overlap_count = 0
                                port_overlap = []
                                for x in ports_in_use:
                                    for y in port_list:
                                        if int(x) == int(y):
                                            port_overlap_count += 1
                                            port_overlap.append(x)
                                if port_overlap_count == 0:
                                    if model == 'UCS-FI-64108':
                                        max_port = 108
                                    else:
                                        max_port = 54
                                    if fc_mode == 'Y':
                                        min_port = int(fc_ports[1])
                                    else:
                                        min_port = 1
                                    for port in port_list:
                                        valid_ports = validating_ucs.number_in_range('Port Range', port, min_port, max_port)
                                        if valid_ports == False:
                                            break
                                    if valid_ports == True:
                                        # Prompt User for the Admin Speed of the Port
                                        templateVars["policy_file"] = 'ethernet_admin_speed.txt'
                                        templateVars["var_description"] = '    Please Select the Admin Speed for the Port-Channel:\n'
                                        templateVars["var_type"] = 'Admin Speed'
                                        admin_speed = variable_loop(**templateVars)

                                        # Prompt User for the
                                        policy_list = [
                                            'flow_control_policies',
                                            'link_aggregation_policies',
                                            'link_control_policies',
                                        ]
                                        templateVars["allow_opt_out"] = True
                                        for policy in policy_list:
                                            policy_short = policy.replace('policies', 'policy')
                                            templateVars["policies"] = policies.get(policy)
                                            templateVars[policy_short] = choose_policy(policy, **templateVars)

                                        interfaces = []
                                        for i in port_list:
                                            interfaces.append({'port_id':i,'slot_id':1})

                                        pc_id = port_list[0]
                                        port_channel = {
                                            'admin_speed':admin_speed,
                                            'flow_control_policy':templateVars["flow_control_policy"],
                                            'interfaces':interfaces,
                                            'link_aggregation_policy':templateVars["link_aggregation_policy"],
                                            'link_control_policy':templateVars["link_control_policy"],
                                            'pc_id':pc_id,
                                            'slot_id':1
                                        }
                                        print(f'\n-------------------------------------------------------------------------------------------\n')
                                        print(f'  Do you want to accept the following configuration?')
                                        print(f'    admin_speed             = "{admin_speed}"')
                                        print(f'    flow_control_policy     = "{templateVars["flow_control_policy"]}"')
                                        print(f'    interfaces = [')
                                        for item in interfaces:
                                            print('      {')
                                            for k, v in item.items():
                                                print(f'        {k}          = {v}')
                                            print('      }')
                                        print(f'    ]')
                                        print(f'    link_aggregation_policy = "{templateVars["link_aggregation_policy"]}"')
                                        print(f'    link_control_policy     = "{templateVars["link_control_policy"]}"')
                                        print(f'    pc_id                   = {pc_id}')
                                        print(f'\n-------------------------------------------------------------------------------------------\n')
                                        valid_confirm = False
                                        while valid_confirm == False:
                                            confirm_port = input('Enter "Y" or "N" [Y]: ')
                                            if confirm_port == 'Y' or confirm_port == '':
                                                port_channel_ethernet_uplinks.append(port_channel)
                                                for i in port_list:
                                                    ports_in_use.append(i)

                                                valid_exit = False
                                                while valid_exit == False:
                                                    port_exit = input(f'Would You like to Configure another {port_type}?  Enter "Y" or "N" [N]: ')
                                                    if port_exit == 'Y':
                                                        port_count += 1
                                                        valid_confirm = True
                                                        valid_exit = True
                                                    elif port_exit == 'N' or port_exit == '':
                                                        configure_valid = True
                                                        valid = True
                                                        valid_confirm = True
                                                        valid_exit = True
                                                    else:
                                                        print(f'\n------------------------------------------------------\n')
                                                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                                                        print(f'\n------------------------------------------------------\n')

                                            elif confirm_port == 'N':
                                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                                print(f'  Starting {port_type} Configuration Over.')
                                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                                valid_confirm = True
                                            else:
                                                print(f'\n------------------------------------------------------\n')
                                                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                                                print(f'\n------------------------------------------------------\n')

                                else:
                                    print(f'\n-------------------------------------------------------------------------------------------\n')
                                    print(f'  Error!! The following Ports are already in use: {port_overlap}.')
                                    print(f'\n-------------------------------------------------------------------------------------------\n')

                            else:
                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                print(f'  Error!! Invalid Port Range.  A port Range should be in the format 49-50 for example.')
                                print(f'  The following port range is invalid: "{port_list}"')
                                print(f'\n-------------------------------------------------------------------------------------------\n')

                    elif configure_port == 'N':
                        valid = True
                    else:
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n------------------------------------------------------\n')

                fc_ports_in_use = []
                Fabric_A_fc_port_channels = []
                Fabric_B_fc_port_channels = []
                port_type = 'Fibre Channel Port-Channel'
                valid = False
                while valid == False:
                    if len(fc_converted_ports) > 0:
                        configure_port = input(f'Do you want to configure a {port_type}?  Enter "Y" or "N" [Y]: ')
                    else:
                        configure_port = 'N'
                        valid = True
                    if configure_port == '' or configure_port == 'Y':
                        configure_valid = False
                        while configure_valid == False:
                            templateVars["multi_select"] = True
                            templateVars["port_type"] = port_type
                            templateVars["var_description"] = '    Please Select a Port for the Port-Channel:\n'
                            templateVars["var_type"] = 'Unified Port'
                            port_list = vars_from_list(fc_converted_ports, **templateVars)

                            # Prompt User for the Admin Speed of the Port
                            templateVars["policy_file"] = 'fc_admin_speed.txt'
                            templateVars["var_description"] = '    Please Select the Admin Speed for the Port-Channel:\n'
                            templateVars["var_type"] = 'Admin Speed'
                            admin_speed = variable_loop(**templateVars)

                            # Prompt User for the Admin Speed of the Port
                            templateVars["policy_file"] = 'fill_pattern.txt'
                            templateVars["var_description"] = '    Please Select the Fill Pattern for the Uplink:\n'
                            templateVars["var_type"] = 'Fill Pattern'
                            fill_pattern = variable_loop(**templateVars)

                            vsans = {}
                            fabrics = ['Fabric_A', 'Fabric_B']
                            for fabric in fabrics:
                                print(f'\n------------------------------------------------------\n')
                                print(f'  Please Select the VSAN Policy for {fabric}')
                                policy_list = [
                                    'vsan_policies',
                                ]
                                for policy in policy_list:
                                    templateVars["policy_short"] = policy.replace('policies', 'policy')
                                    templateVars["allow_opt_out"] = False
                                    templateVars["policies"] = []
                                    for item in vsan_policies_vsans:
                                        for k, v in item.items():
                                            templateVars["policies"].append(k)
                                    vsan_list_name = choose_policy(policy, **templateVars)
                                    vsan_list = []
                                    for i in vsan_policies_vsans:
                                        for key, value in i.items():
                                            if key == vsan_list_name:
                                                for i in value:
                                                    for k, v in i.items():
                                                        if k == 'id':
                                                            vsan_list.append(v)
                                    templateVars["multi_select"] = False
                                    templateVars["port_type"] = port_type
                                    templateVars["var_description"] = '    Please Select a VSAN for the Port-Channel:\n'
                                    templateVars["var_type"] = 'VSAN'
                                    vsan_x = vars_from_list(vsan_list, **templateVars)
                                    for vs in vsan_x:
                                        vsan = vs
                                    vsans.update({fabric:vsan})

                            interfaces = []
                            for i in port_list:
                                interfaces.append({'port_id':i,'slot_id':1})

                            pc_id = port_list[0]
                            port_channel_a = {
                                'admin_speed':admin_speed,
                                'fill_pattern':fill_pattern,
                                'interfaces':interfaces,
                                'pc_id':pc_id,
                                'slot_id':1,
                                'vsan_id':vsans.get("Fabric_A")
                            }
                            port_channel_b = {
                                'admin_speed':admin_speed,
                                'fill_pattern':fill_pattern,
                                'interfaces':interfaces,
                                'pc_id':pc_id,
                                'slot_id':1,
                                'vsan_id':vsans.get("Fabric_B")
                            }
                            print(f'\n-------------------------------------------------------------------------------------------\n')
                            print(f'  Do you want to accept the following configuration?')
                            print(f'    admin_speed  = "{admin_speed}"')
                            print(f'    fill_pattern = "{fill_pattern}"')
                            print(f'    interfaces = [')
                            for item in interfaces:
                                print('      {')
                                for k, v in item.items():
                                    print(f'        {k}          = {v}')
                                print('      }')
                            print(f'    ]')
                            print(f'    vsan_id_fabric_a = {vsans.get("Fabric_A")}')
                            print(f'    vsan_id_fabric_b = {vsans.get("Fabric_B")}')
                            print(f'\n-------------------------------------------------------------------------------------------\n')
                            valid_confirm = False
                            while valid_confirm == False:
                                confirm_port = input('Enter "Y" or "N" [Y]: ')
                                if confirm_port == 'Y' or confirm_port == '':
                                    Fabric_A_fc_port_channels.append(port_channel_a)
                                    Fabric_B_fc_port_channels.append(port_channel_b)
                                    for i in port_list:
                                        fc_ports_in_use.append(i)

                                    valid_exit = False
                                    while valid_exit == False:
                                        port_exit = input(f'Would You like to Configure another {port_type}?  Enter "Y" or "N" [N]: ')
                                        if port_exit == 'Y':
                                            port_count += 1
                                            valid_confirm = True
                                            valid_exit = True
                                        elif port_exit == 'N' or port_exit == '':
                                            configure_valid = True
                                            valid = True
                                            valid_confirm = True
                                            valid_exit = True
                                        else:
                                            print(f'\n------------------------------------------------------\n')
                                            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                                            print(f'\n------------------------------------------------------\n')

                                elif confirm_port == 'N':
                                    print(f'\n-------------------------------------------------------------------------------------------\n')
                                    print(f'  Starting {port_type} Configuration Over.')
                                    print(f'\n-------------------------------------------------------------------------------------------\n')
                                    valid_confirm = True
                                else:
                                    print(f'\n------------------------------------------------------\n')
                                    print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                                    print(f'\n------------------------------------------------------\n')

                    elif configure_port == 'N':
                        valid = True
                    else:
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n------------------------------------------------------\n')

                port_channel_fcoe_uplinks = []
                port_type = 'FCoE Uplink Port-Channel'
                port_count = 1
                valid = False
                while valid == False:
                    configure_port = input(f'Do you want to configure an {port_type}?  Enter "Y" or "N" [N]: ')
                    if configure_port == 'Y':
                        configure_valid = False
                        while configure_valid == False:
                            print(f'\n------------------------------------------------------\n')
                            print(f'  The Port List can be in the format of:')
                            print(f'     5 - Single Port')
                            print(f'     5,11,12,13,14,15 - List of Ports')
                            print(f'\n------------------------------------------------------\n')
                            if model == 'UCS-FI-64108':
                                port_list = input(f'Please enter the list of ports you want to add to the {port_type}?  [97,98]: ')
                            else:
                                port_list = input(f'Please enter the list of ports you want to add to the {port_type}?  [49,50]: ')
                            if port_list == '' and model == 'UCS-FI-64108':
                                port_list = '97,98'
                            elif port_list == '':
                                port_list = '49,50'
                            port_group = []
                            if re.search(r'(^[0-9]+$)', port_list):
                                port_group.append(port_list)
                            elif re.search(r'(^[0-9]+,{1,16}[0-9]+$)', port_list):
                                x = port_list.split(',')
                                port_group = []
                                for i in x:
                                    port_group.append(i)
                            if re.search(r'(^[0-9]+$|^[0-9]+,{1,16}[0-9]+$)', port_list):
                                port_list = port_group
                                port_overlap_count = 0
                                port_overlap = []
                                for x in ports_in_use:
                                    for y in port_list:
                                        if int(x) == int(y):
                                            port_overlap_count += 1
                                            port_overlap.append(x)
                                if port_overlap_count == 0:
                                    if model == 'UCS-FI-64108':
                                        max_port = 108
                                    else:
                                        max_port = 54
                                    if fc_mode == 'Y':
                                        min_port = int(fc_ports[1])
                                    else:
                                        min_port = 1
                                    for port in port_list:
                                        valid_ports = validating_ucs.number_in_range('Port Range', port, min_port, max_port)
                                        if valid_ports == False:
                                            break
                                    if valid_ports == True:
                                        # Prompt User for the Admin Speed of the Port
                                        templateVars["policy_file"] = 'ethernet_admin_speed.txt'
                                        templateVars["var_description"] = '    Please Select the Admin Speed for the Port-Channel:\n'
                                        templateVars["var_type"] = 'Admin Speed'
                                        admin_speed = variable_loop(**templateVars)

                                        # Prompt User for the
                                        policy_list = [
                                            'link_aggregation_policies',
                                            'link_control_policies',
                                        ]
                                        templateVars["allow_opt_out"] = True
                                        for policy in policy_list:
                                            policy_short = policy.replace('policies', 'policy')
                                            templateVars["policies"] = policies.get(policy)
                                            templateVars[policy_short] = choose_policy(policy, **templateVars)

                                        interfaces = []
                                        for i in port_list:
                                            interfaces.append({'port_id':i,'slot_id':1})

                                        pc_id = port_list[0]
                                        port_channel = {
                                            'admin_speed':admin_speed,
                                            'interfaces':interfaces,
                                            'link_aggregation_policy':templateVars["link_aggregation_policy"],
                                            'link_control_policy':templateVars["link_control_policy"],
                                            'pc_id':pc_id,
                                            'slot_id':1
                                        }
                                        print(f'\n-------------------------------------------------------------------------------------------\n')
                                        print(f'  Do you want to accept the following configuration?')
                                        print(f'    admin_speed             = "{admin_speed}"')
                                        print(f'    interfaces = [')
                                        for item in interfaces:
                                            print('      {')
                                            for k, v in item.items():
                                                print(f'        {k}          = {v}')
                                            print('      }')
                                        print(f'    ]')
                                        print(f'    link_aggregation_policy = "{templateVars["link_aggregation_policy"]}"')
                                        print(f'    link_control_policy     = "{templateVars["link_control_policy"]}"')
                                        print(f'    pc_id                   = {pc_id}')
                                        print(f'\n-------------------------------------------------------------------------------------------\n')
                                        valid_confirm = False
                                        while valid_confirm == False:
                                            confirm_port = input('Enter "Y" or "N" [Y]: ')
                                            if confirm_port == 'Y' or confirm_port == '':
                                                port_channel_fcoe_uplinks.append(port_channel)
                                                for i in port_list:
                                                    ports_in_use.append(i)

                                                valid_exit = False
                                                while valid_exit == False:
                                                    port_exit = input(f'Would You like to Configure another {port_type}?  Enter "Y" or "N" [N]: ')
                                                    if port_exit == 'Y':
                                                        port_count += 1
                                                        valid_confirm = True
                                                        valid_exit = True
                                                    elif port_exit == 'N' or port_exit == '':
                                                        configure_valid = True
                                                        valid = True
                                                        valid_confirm = True
                                                        valid_exit = True
                                                    else:
                                                        print(f'\n------------------------------------------------------\n')
                                                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                                                        print(f'\n------------------------------------------------------\n')

                                            elif confirm_port == 'N':
                                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                                print(f'  Starting {port_type} Configuration Over.')
                                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                                valid_confirm = True
                                            else:
                                                print(f'\n------------------------------------------------------\n')
                                                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                                                print(f'\n------------------------------------------------------\n')

                                else:
                                    print(f'\n-------------------------------------------------------------------------------------------\n')
                                    print(f'  Error!! The following Ports are already in use: {port_overlap}.')
                                    print(f'\n-------------------------------------------------------------------------------------------\n')

                            else:
                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                print(f'  Error!! Invalid Port Range.  A port Range should be in the format 49-50 for example.')
                                print(f'  The following port range is invalid: "{port_list}"')
                                print(f'\n-------------------------------------------------------------------------------------------\n')

                    elif configure_port == '' or configure_port == 'N':
                        valid = True
                    else:
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n------------------------------------------------------\n')

                port_role_appliances = []
                port_type = 'Appliance Ports'
                port_count = 1
                valid = False
                while valid == False:
                    configure_port = input(f'Do you want to configure an {port_type}?  Enter "Y" or "N" [N]: ')
                    if configure_port == 'Y':
                        configure_valid = False
                        while configure_valid == False:
                            print(f'\n------------------------------------------------------\n')
                            print(f'  The Port List can be in the format of:')
                            print(f'     5 - Single Port')
                            print(f'     5-10 - Range of Ports')
                            print(f'     5,11,12,13,14,15 - List of Ports')
                            print(f'     5-10,20-30 - Ranges and Lists of Ports')
                            print(f'\n------------------------------------------------------\n')
                            if model == 'UCS-FI-64108':
                                port_list = input(f'Please enter the ports you want to add to the {port_type}?  [94]: ')
                            else:
                                port_list = input(f'Please enter the ports you want to add to the {port_type}?  [46]: ')
                            if port_list == '' and model == 'UCS-FI-64108':
                                port_list = '94'
                            elif port_list == '':
                                port_list = '46'
                            if re.search(r'(^\d+$|^\d+,{1,48}\d+$|^(\d+\-\d+|\d,){1,48}\d+$)', port_list):
                                original_port_list = port_list
                                ports_expanded = vlan_list_full(port_list)
                                port_list = ports_expanded
                                port_overlap_count = 0
                                port_overlap = []
                                for x in ports_in_use:
                                    for y in port_list:
                                        if int(x) == int(y):
                                            port_overlap_count += 1
                                            port_overlap.append(x)
                                if port_overlap_count == 0:
                                    if model == 'UCS-FI-64108':
                                        max_port = 108
                                    else:
                                        max_port = 54
                                    if fc_mode == 'Y':
                                        min_port = int(fc_ports[1])
                                    else:
                                        min_port = 1
                                    for port in port_list:
                                        valid_ports = validating_ucs.number_in_range('Port Range', port, min_port, max_port)
                                        if valid_ports == False:
                                            break
                                    if valid_ports == True:
                                        # Prompt User for the Admin Speed of the Port
                                        templateVars["policy_file"] = 'ethernet_admin_speed.txt'
                                        templateVars["var_description"] = '    Please Select the Admin Speed for the Port:\n'
                                        templateVars["var_type"] = 'Admin Speed'
                                        admin_speed = variable_loop(**templateVars)

                                        # Prompt User for the Admin Speed of the Port
                                        templateVars["policy_file"] = 'fec.txt'
                                        templateVars["var_description"] = '    Forward error correction configuration for the port:\n'\
                                            '    - Auto - (Default).  Forward error correction option Auto.\n'\
                                            '    - Cl91 - Forward error correction option cl91\n'\
                                            '    - Cl74 - Forward error correction option cl74.\n'
                                        templateVars["var_type"] = 'FEC'
                                        fec = variable_loop(**templateVars)

                                        # Prompt User for the Admin Speed of the Port
                                        templateVars["policy_file"] = 'port_mode.txt'
                                        templateVars["var_description"] = '    Please Select the Port Mode:\n'
                                        templateVars["var_type"] = 'Port Mode'
                                        templateVars["mode"] = variable_loop(**templateVars)

                                        templateVars["policy_file"] = 'qos_priority.txt'
                                        templateVars["var_description"] = '   Priority:  Default is "Best Effort".\n   The Priority Queue to Assign to this Port:\n'
                                        templateVars["var_type"] = 'Priority'
                                        templateVars["priority"] = variable_loop(**templateVars)

                                        # Prompt User for the
                                        policy_list = [
                                            'ethernet_network_control_policies',
                                            'ethernet_network_group_policies',
                                        ]
                                        templateVars["allow_opt_out"] = False
                                        for policy in policy_list:
                                            policy_short = policy.replace('policies', 'policy')
                                            templateVars["policies"] = policies.get(policy)
                                            templateVars[policy_short] = choose_policy(policy, **templateVars)

                                        port_role = {
                                            'admin_speed':admin_speed,
                                            'ethernet_network_control_policy':templateVars["ethernet_network_control_policy"],
                                            'ethernet_network_group_policy':templateVars["ethernet_network_group_policy"],
                                            'fec':fec,
                                            'mode':templateVars["mode"],
                                            'port_id':original_port_list,
                                            'priority':templateVars["priority"],
                                            'slot_id':1
                                        }
                                        print(f'\n-------------------------------------------------------------------------------------------\n')
                                        print(f'  Do you want to accept the following configuration?')
                                        print(f'    admin_speed                     = "{admin_speed}"')
                                        print(f'    ethernet_network_control_policy = "{templateVars["ethernet_network_control_policy"]}"')
                                        print(f'    ethernet_network_group_policy   = "{templateVars["ethernet_network_group_policy"]}"')
                                        print(f'    fec                             = "{fec}"')
                                        print(f'    mode                            = "{templateVars["mode"]}"')
                                        print(f'    port_list                       = "{original_port_list}"')
                                        print(f'    priority                        = "{templateVars["priority"]}"')
                                        print(f'\n-------------------------------------------------------------------------------------------\n')
                                        valid_confirm = False
                                        while valid_confirm == False:
                                            confirm_port = input('Enter "Y" or "N" [Y]: ')
                                            if confirm_port == 'Y' or confirm_port == '':
                                                port_role_appliances.append(port_role)
                                                for i in port_list:
                                                    ports_in_use.append(i)

                                                valid_exit = False
                                                while valid_exit == False:
                                                    port_exit = input(f'Would You like to Configure another {port_type}?  Enter "Y" or "N" [N]: ')
                                                    if port_exit == 'Y':
                                                        port_count += 1
                                                        valid_confirm = True
                                                        valid_exit = True
                                                    elif port_exit == 'N' or port_exit == '':
                                                        configure_valid = True
                                                        valid = True
                                                        valid_confirm = True
                                                        valid_exit = True
                                                    else:
                                                        print(f'\n------------------------------------------------------\n')
                                                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                                                        print(f'\n------------------------------------------------------\n')

                                            elif confirm_port == 'N':
                                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                                print(f'  Starting {port_type} Configuration Over.')
                                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                                valid_confirm = True
                                            else:
                                                print(f'\n------------------------------------------------------\n')
                                                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                                                print(f'\n------------------------------------------------------\n')

                                else:
                                    print(f'\n-------------------------------------------------------------------------------------------\n')
                                    print(f'  Error!! The following Ports are already in use: {port_overlap}.')
                                    print(f'\n-------------------------------------------------------------------------------------------\n')

                            else:
                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                print(f'  Error!! Invalid Port Range.  A port Range should be in the format 49-50 for example.')
                                print(f'  The following port range is invalid: "{port_list}"')
                                print(f'\n-------------------------------------------------------------------------------------------\n')

                    elif configure_port == '' or configure_port == 'N':
                        valid = True
                    else:
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n------------------------------------------------------\n')

                port_role_ethernet_uplinks = []
                port_type = 'Ethernet Uplink'
                port_count = 1
                valid = False
                while valid == False:
                    configure_port = input(f'Do you want to configure an {port_type}?  Enter "Y" or "N" [Y]: ')
                    if configure_port == '' or configure_port == 'Y':
                        configure_valid = False
                        while configure_valid == False:
                            print(f'\n------------------------------------------------------\n')
                            print(f'  The Port List can be in the format of:')
                            print(f'     5 - Single Port')
                            print(f'     5-10 - Range of Ports')
                            print(f'     5,11,12,13,14,15 - List of Ports')
                            print(f'     5-10,20-30 - Ranges and Lists of Ports')
                            print(f'\n------------------------------------------------------\n')
                            if model == 'UCS-FI-64108':
                                port_list = input(f'Please enter the list of ports you want to add to the {port_type}?  [97]: ')
                            else:
                                port_list = input(f'Please enter the list of ports you want to add to the {port_type}?  [49]: ')
                            if port_list == '' and model == 'UCS-FI-64108':
                                port_list = '97'
                            elif port_list == '':
                                port_list = '49'
                            if re.search(r'(^\d+$|^\d+,{1,48}\d+$|^(\d+\-\d+|\d,){1,48}\d+$)', port_list):
                                original_port_list = port_list
                                ports_expanded = vlan_list_full(port_list)
                                port_list = ports_expanded
                                port_overlap_count = 0
                                port_overlap = []
                                for x in ports_in_use:
                                    for y in port_list:
                                        if int(x) == int(y):
                                            port_overlap_count += 1
                                            port_overlap.append(x)
                                if port_overlap_count == 0:
                                    if model == 'UCS-FI-64108':
                                        max_port = 108
                                    else:
                                        max_port = 54
                                    if fc_mode == 'Y':
                                        min_port = int(fc_ports[1])
                                    else:
                                        min_port = 1
                                    for port in port_list:
                                        valid_ports = validating_ucs.number_in_range('Port Range', port, min_port, max_port)
                                        if valid_ports == False:
                                            break
                                    if valid_ports == True:
                                        # Prompt User for the Admin Speed of the Port
                                        templateVars["policy_file"] = 'ethernet_admin_speed.txt'
                                        templateVars["var_description"] = '    Please Select the Admin Speed for the Port:\n'
                                        templateVars["var_type"] = 'Admin Speed'
                                        admin_speed = variable_loop(**templateVars)

                                        # Prompt User for the Admin Speed of the Port
                                        templateVars["policy_file"] = 'fec.txt'
                                        templateVars["var_description"] = '    Forward error correction configuration for the port:\n'\
                                            '    - Auto - (Default).  Forward error correction option Auto.\n'\
                                            '    - Cl91 - Forward error correction option cl91\n'\
                                            '    - Cl74 - Forward error correction option cl74.\n'
                                        templateVars["var_type"] = 'FEC'
                                        fec = variable_loop(**templateVars)

                                        # Prompt User for the
                                        policy_list = [
                                            'flow_control_policies',
                                            'link_control_policies',
                                        ]
                                        templateVars["allow_opt_out"] = True
                                        for policy in policy_list:
                                            policy_short = policy.replace('policies', 'policy')
                                            templateVars["policies"] = policies.get(policy)
                                            templateVars[policy_short] = choose_policy(policy, **templateVars)

                                        port_role = {
                                            'admin_speed':admin_speed,
                                            'fec':fec,
                                            'flow_control_policy':templateVars["flow_control_policy"],
                                            'link_control_policy':templateVars["link_control_policy"],
                                            'port_id':original_port_list,
                                            'slot_id':1
                                        }
                                        print(f'\n-------------------------------------------------------------------------------------------\n')
                                        print(f'  Do you want to accept the following configuration?')
                                        print(f'    admin_speed         = "{admin_speed}"')
                                        print(f'    fec                 = "{fec}"')
                                        print(f'    flow_control_policy = "{templateVars["flow_control_policy"]}"')
                                        print(f'    link_control_policy = "{templateVars["link_control_policy"]}"')
                                        print(f'    port_list           = "{original_port_list}"')
                                        print(f'\n-------------------------------------------------------------------------------------------\n')
                                        valid_confirm = False
                                        while valid_confirm == False:
                                            confirm_port = input('Enter "Y" or "N" [Y]: ')
                                            if confirm_port == 'Y' or confirm_port == '':
                                                port_role_ethernet_uplinks.append(port_role)
                                                for i in port_list:
                                                    ports_in_use.append(i)

                                                valid_exit = False
                                                while valid_exit == False:
                                                    port_exit = input(f'Would You like to Configure another {port_type}?  Enter "Y" or "N" [N]: ')
                                                    if port_exit == 'Y':
                                                        port_count += 1
                                                        valid_confirm = True
                                                        valid_exit = True
                                                    elif port_exit == 'N' or port_exit == '':
                                                        configure_valid = True
                                                        valid = True
                                                        valid_confirm = True
                                                        valid_exit = True
                                                    else:
                                                        print(f'\n------------------------------------------------------\n')
                                                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                                                        print(f'\n------------------------------------------------------\n')

                                            elif confirm_port == 'N':
                                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                                print(f'  Starting {port_type} Configuration Over.')
                                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                                valid_confirm = True
                                            else:
                                                print(f'\n------------------------------------------------------\n')
                                                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                                                print(f'\n------------------------------------------------------\n')

                                else:
                                    print(f'\n-------------------------------------------------------------------------------------------\n')
                                    print(f'  Error!! The following Ports are already in use: {port_overlap}.')
                                    print(f'\n-------------------------------------------------------------------------------------------\n')

                            else:
                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                print(f'  Error!! Invalid Port Range.  A port Range should be in the format 49-50 for example.')
                                print(f'  The following port range is invalid: "{port_list}"')
                                print(f'\n-------------------------------------------------------------------------------------------\n')

                    elif configure_port == 'N':
                        valid = True
                    else:
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n------------------------------------------------------\n')

                Fabric_A_port_role_fc = []
                Fabric_B_port_role_fc = []
                port_type = 'Fibre-Channel Uplink'
                valid = False
                while valid == False:
                    if len(fc_converted_ports) > 0:
                        configure_port = input(f'Do you want to configure a {port_type}?  Enter "Y" or "N" [Y]: ')
                    else:
                        configure_port = 'N'
                        valid = True
                    if configure_port == '' or configure_port == 'Y':
                        configure_valid = False
                        while configure_valid == False:
                            templateVars["multi_select"] = False
                            templateVars["port_type"] = port_type
                            templateVars["var_description"] = '    Please Select a Port for the Uplink:\n'
                            templateVars["var_type"] = 'Unified Port'
                            port_list = vars_from_list(fc_converted_ports, **templateVars)

                            # Prompt User for the Admin Speed of the Port
                            templateVars["policy_file"] = 'fc_admin_speed.txt'
                            templateVars["var_description"] = '    Please Select the Admin Speed for the Uplink:\n'
                            templateVars["var_type"] = 'Admin Speed'
                            admin_speed = variable_loop(**templateVars)

                            # Prompt User for the Admin Speed of the Port
                            templateVars["policy_file"] = 'fill_pattern.txt'
                            templateVars["var_description"] = '    Please Select the Fill Pattern for the Uplink:\n'
                            templateVars["var_type"] = 'Fill Pattern'
                            fill_pattern = variable_loop(**templateVars)

                            vsans = {}
                            fabrics = ['Fabric_A', 'Fabric_B']
                            for fabric in fabrics:
                                print(f'\n------------------------------------------------------\n')
                                print(f'  Please Select the VSAN Policy for {fabric}')
                                policy_list = [
                                    'vsan_policies',
                                ]
                                for policy in policy_list:
                                    templateVars["policy_short"] = policy.replace('policies', 'policy')
                                    templateVars["allow_opt_out"] = False
                                    templateVars["policies"] = []
                                    for item in vsan_policies_vsans:
                                        for k, v in item.items():
                                            templateVars["policies"].append(k)
                                    vsan_list_name = choose_policy(policy, **templateVars)
                                    vsan_list = []
                                    for i in vsan_policies_vsans:
                                        for key, value in i.items():
                                            if key == vsan_list_name:
                                                for i in value:
                                                    for k, v in i.items():
                                                        if k == 'id':
                                                            vsan_list.append(v)
                                    templateVars["multi_select"] = False
                                    templateVars["port_type"] = port_type
                                    templateVars["var_description"] = '    Please Select a VSAN for the Uplink:\n'
                                    templateVars["var_type"] = 'VSAN'
                                    vsan_x = vars_from_list(vsan_list, **templateVars)
                                    for vs in vsan_x:
                                        vsan = vs
                                    vsans.update({fabric:vsan})

                            port_list = '%s' % (port_list[0])
                            fc_port_role_a = {
                                'admin_speed':admin_speed,
                                'fill_pattern':fill_pattern,
                                'port_id':port_list,
                                'slot_id':1,
                                'vsan_id':vsans.get("Fabric_A")
                            }
                            fc_port_role_b = {
                                'admin_speed':admin_speed,
                                'fill_pattern':fill_pattern,
                                'port_id':port_list,
                                'slot_id':1,
                                'vsan_id':vsans.get("Fabric_B")
                            }
                            print(f'\n-------------------------------------------------------------------------------------------\n')
                            print(f'  Do you want to accept the following configuration?')
                            print(f'    admin_speed      = "{admin_speed}"')
                            print(f'    fill_pattern     = "{fill_pattern}"')
                            print(f'    port_list        = "{port_list}"')
                            print(f'    vsan_id_fabric_a = {vsans.get("Fabric_A")}')
                            print(f'    vsan_id_fabric_b = {vsans.get("Fabric_B")}')
                            print(f'\n-------------------------------------------------------------------------------------------\n')
                            valid_confirm = False
                            while valid_confirm == False:
                                confirm_port = input('Enter "Y" or "N" [Y]: ')
                                if confirm_port == 'Y' or confirm_port == '':
                                    Fabric_A_port_role_fc.append(fc_port_role_a)
                                    Fabric_B_port_role_fc.append(fc_port_role_b)
                                    for i in port_list:
                                        fc_ports_in_use.append(i)

                                    valid_exit = False
                                    while valid_exit == False:
                                        port_exit = input(f'Would You like to Configure another {port_type}?  Enter "Y" or "N" [N]: ')
                                        if port_exit == 'Y':
                                            port_count += 1
                                            valid_confirm = True
                                            valid_exit = True
                                        elif port_exit == 'N' or port_exit == '':
                                            configure_valid = True
                                            valid = True
                                            valid_confirm = True
                                            valid_exit = True
                                        else:
                                            print(f'\n------------------------------------------------------\n')
                                            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                                            print(f'\n------------------------------------------------------\n')

                                elif confirm_port == 'N':
                                    print(f'\n-------------------------------------------------------------------------------------------\n')
                                    print(f'  Starting {port_type} Configuration Over.')
                                    print(f'\n-------------------------------------------------------------------------------------------\n')
                                    valid_confirm = True
                                else:
                                    print(f'\n------------------------------------------------------\n')
                                    print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                                    print(f'\n------------------------------------------------------\n')

                    elif configure_port == 'N':
                        valid = True
                    else:
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n------------------------------------------------------\n')

                port_role_fcoe_uplinks = []
                port_type = 'FCoE Uplink'
                port_count = 1
                valid = False
                while valid == False:
                    configure_port = input(f'Do you want to configure an {port_type}?  Enter "Y" or "N" [Y]: ')
                    if configure_port == '' or configure_port == 'Y':
                        configure_valid = False
                        while configure_valid == False:
                            print(f'\n------------------------------------------------------\n')
                            print(f'  The Port List can be in the format of:')
                            print(f'     5 - Single Port')
                            print(f'     5-10 - Range of Ports')
                            print(f'     5,11,12,13,14,15 - List of Ports')
                            print(f'     5-10,20-30 - Ranges and Lists of Ports')
                            print(f'\n------------------------------------------------------\n')
                            if model == 'UCS-FI-64108':
                                port_list = input(f'Please enter the list of ports you want to add to the {port_type}?  [97]: ')
                            else:
                                port_list = input(f'Please enter the list of ports you want to add to the {port_type}?  [49]: ')
                            if port_list == '' and model == 'UCS-FI-64108':
                                port_list = '97'
                            elif port_list == '':
                                port_list = '49'
                            if re.search(r'(^\d+$|^\d+,{1,48}\d+$|^(\d+\-\d+|\d,){1,48}\d+$)', port_list):
                                original_port_list = port_list
                                ports_expanded = vlan_list_full(port_list)
                                port_list = ports_expanded
                                port_overlap_count = 0
                                port_overlap = []
                                for x in ports_in_use:
                                    for y in port_list:
                                        if int(x) == int(y):
                                            port_overlap_count += 1
                                            port_overlap.append(x)
                                if port_overlap_count == 0:
                                    if model == 'UCS-FI-64108':
                                        max_port = 108
                                    else:
                                        max_port = 54
                                    if fc_mode == 'Y':
                                        min_port = int(fc_ports[1])
                                    else:
                                        min_port = 1
                                    for port in port_list:
                                        valid_ports = validating_ucs.number_in_range('Port Range', port, min_port, max_port)
                                        if valid_ports == False:
                                            break
                                    if valid_ports == True:
                                        # Prompt User for the Admin Speed of the Port
                                        templateVars["policy_file"] = 'ethernet_admin_speed.txt'
                                        templateVars["var_description"] = '    Please Select the Admin Speed for the Port:\n'
                                        templateVars["var_type"] = 'Admin Speed'
                                        admin_speed = variable_loop(**templateVars)

                                        # Prompt User for the Admin Speed of the Port
                                        templateVars["policy_file"] = 'fec.txt'
                                        templateVars["var_description"] = '    Forward error correction configuration for the port:\n'\
                                            '    - Auto - (Default).  Forward error correction option Auto.\n'\
                                            '    - Cl91 - Forward error correction option cl91\n'\
                                            '    - Cl74 - Forward error correction option cl74.\n'
                                        templateVars["var_type"] = 'FEC'
                                        fec = variable_loop(**templateVars)

                                        # Prompt User for the
                                        policy_list = [
                                            'link_control_policies'
                                        ]
                                        templateVars["allow_opt_out"] = True
                                        for policy in policy_list:
                                            policy_short = policy.replace('policies', 'policy')
                                            templateVars["policies"] = policies.get(policy)
                                            templateVars[policy_short] = choose_policy(policy, **templateVars)

                                        port_role = {
                                            'admin_speed':admin_speed,
                                            'fec':fec,
                                            'link_control_policy':templateVars["link_control_policy"],
                                            'port_id':original_port_list,
                                            'slot_id':1
                                        }
                                        print(f'\n-------------------------------------------------------------------------------------------\n')
                                        print(f'  Do you want to accept the following configuration?')
                                        print(f'    admin_speed         = "{admin_speed}"')
                                        print(f'    fec                 = "{fec}"')
                                        print(f'    link_control_policy = "{templateVars["link_control_policy"]}"')
                                        print(f'    port_list           = "{original_port_list}"')
                                        print(f'\n-------------------------------------------------------------------------------------------\n')
                                        valid_confirm = False
                                        while valid_confirm == False:
                                            confirm_port = input('Enter "Y" or "N" [Y]: ')
                                            if confirm_port == 'Y' or confirm_port == '':
                                                port_role_fcoe_uplinks.append(port_role)
                                                for i in port_list:
                                                    ports_in_use.append(i)

                                                valid_exit = False
                                                while valid_exit == False:
                                                    port_exit = input(f'Would You like to Configure another {port_type}?  Enter "Y" or "N" [N]: ')
                                                    if port_exit == 'Y':
                                                        port_count += 1
                                                        valid_confirm = True
                                                        valid_exit = True
                                                    elif port_exit == 'N' or port_exit == '':
                                                        configure_valid = True
                                                        valid = True
                                                        valid_confirm = True
                                                        valid_exit = True
                                                    else:
                                                        print(f'\n------------------------------------------------------\n')
                                                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                                                        print(f'\n------------------------------------------------------\n')

                                            elif confirm_port == 'N':
                                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                                print(f'  Starting {port_type} Configuration Over.')
                                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                                valid_confirm = True
                                            else:
                                                print(f'\n------------------------------------------------------\n')
                                                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                                                print(f'\n------------------------------------------------------\n')

                                else:
                                    print(f'\n-------------------------------------------------------------------------------------------\n')
                                    print(f'  Error!! The following Ports are already in use: {port_overlap}.')
                                    print(f'\n-------------------------------------------------------------------------------------------\n')

                            else:
                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                print(f'  Error!! Invalid Port Range.  A port Range should be in the format 49-50 for example.')
                                print(f'  The following port range is invalid: "{port_list}"')
                                print(f'\n-------------------------------------------------------------------------------------------\n')

                    elif configure_port == 'N':
                        valid = True
                    else:
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n------------------------------------------------------\n')

                port_role_servers = []
                port_type = 'Server Ports'
                port_count = 1
                valid = False
                while valid == False:
                    configure_port = input(f'Do you want to configure {port_type}?  Enter "Y" or "N" [Y]: ')
                    if configure_port == '' or configure_port == 'Y':
                        configure_valid = False
                        while configure_valid == False:
                            print(f'\n------------------------------------------------------\n')
                            print(f'  The Port List can be in the format of:')
                            print(f'     5 - Single Port')
                            print(f'     5-10 - Range of Ports')
                            print(f'     5,11,12,13,14,15 - List of Ports')
                            print(f'     5-10,20-30 - Ranges and Lists of Ports')
                            print(f'\n------------------------------------------------------\n')
                            if model == 'UCS-FI-64108':
                                port_list = input(f'Please enter the list of ports you want to add to the {port_type}?  [5-36]: ')
                            else:
                                port_list = input(f'Please enter the list of ports you want to add to the {port_type}?  [5-18]: ')
                            if port_list == '' and model == 'UCS-FI-64108':
                                port_list = '5-36'
                            elif port_list == '':
                                port_list = '5-18'
                            if re.search(r'(^\d+$|^\d+,{1,48}\d+$|^(\d+\-\d+|\d,){1,48}\d+$)', port_list):
                                original_port_list = port_list
                                ports_expanded = vlan_list_full(port_list)
                                port_list = ports_expanded
                                port_overlap_count = 0
                                port_overlap = []
                                for x in ports_in_use:
                                    for y in port_list:
                                        if int(x) == int(y):
                                            port_overlap_count += 1
                                            port_overlap.append(x)
                                if port_overlap_count == 0:
                                    if model == 'UCS-FI-64108':
                                        max_port = 108
                                    else:
                                        max_port = 54
                                    if fc_mode == 'Y':
                                        min_port = int(fc_ports[1])
                                    else:
                                        min_port = 1
                                    for port in port_list:
                                        valid_ports = validating_ucs.number_in_range('Port Range', port, min_port, max_port)
                                        if valid_ports == False:
                                            break
                                    if valid_ports == True:
                                        print(f'\n-------------------------------------------------------------------------------------------\n')
                                        print(f'  Do you want to accept the following Server Port configuration?')
                                        print(f'    port_list           = "{original_port_list}"')
                                        print(f'\n-------------------------------------------------------------------------------------------\n')
                                        valid_confirm = False
                                        while valid_confirm == False:
                                            confirm_port = input('Enter "Y" or "N" [Y]: ')
                                            if confirm_port == 'Y' or confirm_port == '':
                                                server_ports = {'port_list':original_port_list,'slot_id':1}
                                                port_role_servers.append(server_ports)
                                                for i in port_list:
                                                    ports_in_use.append(i)

                                                valid_exit = False
                                                while valid_exit == False:
                                                    port_exit = input(f'Would You like to Configure more {port_type}?  Enter "Y" or "N" [N]: ')
                                                    if port_exit == 'Y':
                                                        port_count += 1
                                                        valid_confirm = True
                                                        valid_exit = True
                                                    elif port_exit == 'N' or port_exit == '':
                                                        configure_valid = True
                                                        valid = True
                                                        valid_confirm = True
                                                        valid_exit = True
                                                    else:
                                                        print(f'\n------------------------------------------------------\n')
                                                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                                                        print(f'\n------------------------------------------------------\n')

                                            elif confirm_port == 'N':
                                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                                print(f'  Starting {port_type} Configuration Over.')
                                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                                valid_confirm = True
                                            else:
                                                print(f'\n------------------------------------------------------\n')
                                                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                                                print(f'\n------------------------------------------------------\n')

                                else:
                                    print(f'\n-------------------------------------------------------------------------------------------\n')
                                    print(f'  Error!! The following Ports are already in use: {port_overlap}.')
                                    print(f'\n-------------------------------------------------------------------------------------------\n')

                            else:
                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                print(f'  Error!! Invalid Port Range.  A port Range should be in the format 49-50 for example.')
                                print(f'  The following port range is invalid: "{port_list}"')
                                print(f'\n-------------------------------------------------------------------------------------------\n')

                    elif configure_port == 'N':
                        valid = True
                    else:
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n------------------------------------------------------\n')

                # port_role_servers = [{'custom_mode': 'FibreChannel', 'port_list': ['1', '4'], 'slot_id': 1}]
                port_channel_appliances = [{'admin_speed': 'Auto', 'ethernet_network_control_policy': 'Asgard_netwk_ctrl', 'ethernet_network_group_policy': 'Asgard_Storage', 'interfaces': [{'port_id': '95', 'slot_id': 1}, {'port_id': '96', 'slot_id': 1}], 'mode': 'trunk', 'pc_id': '95', 'priority': 'Platinum'}]
                port_channel_ethernet_uplinks = [{'admin_speed': 'Auto', 'flow_control_policy': 'asgard-ucs_flow_ctrl', 'interfaces': [{'port_id': '97', 'slot_id': 1}, {'port_id': '98', 'slot_id': 1}], 'link_aggregation_policy': 'asgard-ucs_link_agg', 'link_control_policy': 'asgard-ucs_link_ctrl', 'pc_id': '97'}]
                Fabric_A_fc_port_channels = [{'admin_speed': '32Gbps', 'fill_pattern': 'Arbff', 'interfaces': [{'port_id': 1, 'slot_id': 1}, {'port_id': 2, 'slot_id': 1}], 'pc_id': 1, 'vsan_id': 100}]
                Fabric_B_fc_port_channels = [{'admin_speed': '32Gbps', 'fill_pattern': 'Arbff', 'interfaces': [{'port_id': 1, 'slot_id': 1}, {'port_id': 2, 'slot_id': 1}], 'pc_id': 1, 'vsan_id': 200}]
                port_channel_fcoe_uplinks = [{'admin_speed': 'Auto', 'interfaces': [{'port_id': '99', 'slot_id': 1}, {'port_id': '100', 'slot_id': 1}], 'link_aggregation_policy': 'asgard-ucs_link_agg', 'link_control_policy': 'asgard-ucs_link_ctrl', 'pc_id': '99'}]
                port_role_appliances = [{'admin_speed': 'Auto', 'ethernet_network_control_policy': 'Asgard_netwk_ctrl', 'ethernet_network_group_policy': 'Asgard_Storage', 'fec': 'Auto', 'mode': 'trunk', 'port_id': '94', 'priority': 'Platinum', 'slot_id': 1}]
                port_role_ethernet_uplinks = [{'admin_speed': 'Auto', 'fec': 'Auto', 'flow_control_policy': 'asgard-ucs_flow_ctrl', 'link_control_policy': 'asgard-ucs_link_ctrl', 'port_id': '101', 'slot_id': 1}]
                Fabric_A_port_role_fc = [{'admin_speed': '32Gbps', 'fill_pattern': 'Arbff', 'port_id': 3, 'slot_id': 1, 'vsan_id': 100}]
                Fabric_B_port_role_fc = [{'admin_speed': '32Gbps', 'fill_pattern': 'Arbff', 'port_id': 3, 'slot_id': 1, 'vsan_id': 200}]
                port_role_fcoe_uplinks = [{'admin_speed': 'Auto', 'fec': 'Auto', 'link_control_policy': 'asgard-ucs_link_ctrl', 'port_id': '102', 'slot_id': 1}]
                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Do you want to accept the following configuration?')
                print(f'    description  = "{templateVars["descr"]}"')
                print(f'    device_model = "{templateVars["device_model"]}"')
                print(f'    name         = "{templateVars["name"]}"')
                if len(port_channel_appliances) > 0:
                    print(f'    port_channel_appliances = [')
                    for item in port_channel_appliances:
                        for k, v in item.items():
                            if k == 'pc_id':
                                print(f'      {v} = ''{')
                        for k, v in item.items():
                            if k == 'admin_speed':
                                print(f'        admin_speed                     = "{v}"')
                            elif k == 'ethernet_network_control_policy':
                                print(f'        ethernet_network_control_policy = "{v}"')
                            elif k == 'ethernet_network_group_policy':
                                print(f'        ethernet_network_group_policy   = "{v}"')
                            elif k == 'interfaces':
                                print(f'        interfaces = [')
                                for i in v:
                                    print('          {')
                                    for x, y in i.items():
                                        print(f'            {x}          = {y}')
                                    print('          }')
                                print(f'        ]')
                            elif k == 'mode':
                                print(f'        mode     = "{v}"')
                            elif k == 'priority':
                                print(f'        priority = "{v}"')
                        print('      }')
                    print(f'    ]')
                if len(port_channel_ethernet_uplinks) > 0:
                    print(f'    port_channel_ethernet_uplinks = [')
                    for item in port_channel_ethernet_uplinks:
                        for k, v in item.items():
                            if k == 'pc_id':
                                print(f'      {v} = ''{')
                        for k, v in item.items():
                            if k == 'admin_speed':
                                print(f'        admin_speed         = "{v}"')
                            elif k == 'flow_control_policy':
                                print(f'        flow_control_policy = "{v}"')
                            elif k == 'interfaces':
                                print(f'        interfaces = [')
                                for i in v:
                                    print('          {')
                                    for x, y in i.items():
                                        print(f'            {x}          = {y}')
                                    print('          }')
                                print(f'        ]')
                            elif k == 'link_aggregation_policy':
                                print(f'        link_aggregation_policy = "{v}"')
                            elif k == 'link_control_policy':
                                print(f'        link_control_policy     = "{v}"')
                        print('      }')
                    print(f'    ]')
                if len(Fabric_A_fc_port_channels) > 0:
                    print(f'    port_channel_fc_uplinks = [')
                    item_count = 0
                    for item in Fabric_A_fc_port_channels:
                        for k, v in item.items():
                            if k == 'pc_id':
                                print(f'      {v} = ''{')
                        for k, v in item.items():
                            if k == 'admin_speed':
                                print(f'        admin_speed  = "{v}"')
                            elif k == 'fill_pattern':
                                print(f'        fill_pattern = "{v}"')
                            elif k == 'interfaces':
                                print(f'        interfaces = [')
                                for i in v:
                                    print('          {')
                                    for x, y in i.items():
                                        print(f'            {x}          = {y}')
                                    print('          }')
                                print(f'        ]')
                            elif k == 'vsan_id':
                                print(f'        vsan_fabric_a = "{v}"')
                                print(f'        vsan_fabric_b = "{Fabric_B_fc_port_channels[item_count].get("vsan_id")}"')
                        print('      }')
                        item_count += 1
                    print(f'    ]')
                if len(port_channel_fcoe_uplinks) > 0:
                    print(f'    port_channel_fcoe_uplinks = [')
                    for item in port_channel_fcoe_uplinks:
                        for k, v in item.items():
                            if k == 'pc_id':
                                print('      {v} = {')
                        for k, v in item.items():
                            if k == 'admin_speed':
                                print(f'        admin_speed = "{v}"')
                            elif k == 'interfaces':
                                print(f'        interfaces = [')
                                for i in v:
                                    print('          {')
                                    for x, y in i.items():
                                        print(f'            {x}          = {y}')
                                    print('          }')
                                print(f'        ]')
                            elif k == 'link_aggregation_policy':
                                print(f'        link_aggregation_policy = "{v}"')
                            elif k == 'link_control_policy':
                                print(f'        link_control_policy     = "{v}"')
                        print('      }')
                    print(f'    ]')
                if len(templateVars["port_modes"]) > 0:
                    print('    port_modes = {')
                    for k, v in templateVars["port_modes"].items():
                        if k == 'custom_mode':
                            print(f'      custom_mode = "{v}"')
                        elif k == 'port_list':
                            print(f'      port_list   = "{v}"')
                        elif k == 'slot_id':
                            print(f'      slot_id     = {v}')
                    print('    }')
                item_count = 0
                if len(port_role_appliances) > 0:
                    print(f'    port_role_appliances = [')
                    for item in port_role_appliances:
                        print(f'      {item_count} = ''{')
                        item_count += 1
                        for k, v in item.items():
                            if k == 'admin_speed':
                                print(f'        admin_speed                     = "{v}"')
                            elif k == 'ethernet_network_control_policy':
                                print(f'        ethernet_network_control_policy = "{v}"')
                            elif k == 'ethernet_network_group_policy':
                                print(f'        ethernet_network_group_policy   = "{v}"')
                            elif k == 'fec':
                                print(f'        fec                             = "{v}"')
                            elif k == 'mode':
                                print(f'        mode                            = "{v}"')
                            elif k == 'port_id':
                                print(f'        port_list                       = "{v}"')
                            elif k == 'priority':
                                print(f'        priority                        = "{v}"')
                            elif k == 'slot_id':
                                print(f'        slot_id                         = 1')
                        print('      }')
                    print(f'    ]')
                item_count = 0
                if len(port_role_ethernet_uplinks) > 0:
                    print(f'    port_role_ethernet_uplinks = [')
                    for item in port_role_ethernet_uplinks:
                        print(f'      {item_count} = ''{')
                        item_count += 1
                        for k, v in item.items():
                            if k == 'admin_speed':
                                print(f'        admin_speed         = "{v}"')
                            elif k == 'fec':
                                print(f'        fec                 = "{v}"')
                            elif k == 'flow_control_policy':
                                print(f'        flow_control_policy = "{v}"')
                            elif k == 'link_control_policy':
                                print(f'        link_control_policy = "{v}"')
                            elif k == 'port_id':
                                print(f'        port_list           = "{v}"')
                            elif k == 'slot_id':
                                print(f'        slot_id             = 1')
                        print('      }')
                    print(f'    ]')
                item_count = 0
                if len(Fabric_A_port_role_fc) > 0:
                    print(f'    port_role_fc_uplinks = [')
                    for item in Fabric_A_port_role_fc:
                        print(f'      {item_count} = ''{')
                        for k, v in item.items():
                            if k == 'admin_speed':
                                print(f'        admin_speed   = "{v}"')
                            elif k == 'fill_pattern':
                                print(f'        fill_pattern  = "{v}"')
                            elif k == 'port_id':
                                print(f'        port_list     = "{v}"')
                            elif k == 'slot_id':
                                print(f'        slot_id       = 1')
                            elif k == 'vsan_id':
                                print(f'        vsan_fabric_a = "{v}"')
                                print(f'        vsan_fabric_b = "{Fabric_B_port_role_fc[item_count].get("vsan_id")}"')
                        print('      }')
                        item_count += 1
                    print(f'    ]')
                item_count = 0
                if len(port_role_fcoe_uplinks) > 0:
                    print(f'    port_role_fcoe_uplinks = [')
                    for item in port_role_fcoe_uplinks:
                        print(f'      {item_count} = ''{')
                        item_count += 1
                        for k, v in item.items():
                            if k == 'admin_speed':
                                print(f'        admin_speed         = "{v}"')
                            elif k == 'fec':
                                print(f'        fec                 = "{v}"')
                            elif k == 'link_control_policy':
                                print(f'        link_control_policy = "{v}"')
                            elif k == 'port_id':
                                print(f'        port_list           = "{v}"')
                            elif k == 'slot_id':
                                print(f'        slot_id             = 1')
                        print('      }')
                    print(f'    ]')
                if len(port_role_servers) > 0:
                    print(f'    port_role_servers = [')
                    for item in port_role_servers:
                        print(f'      {item_count} = ''{')
                        item_count += 1
                        for k, v in item.items():
                            if k == 'port_list':
                                print(f'        port_list           = "{v}"')
                            if k == 'slot_id':
                                print(f'        slot_id             = {v}')
                        print('      }')
                    print(f'    ]')
                print(f'\n-------------------------------------------------------------------------------------------\n')
                valid_confirm = False
                while valid_confirm == False:
                    confirm_policy = input('Do you want to accept the above Port Policy configuration?  Enter "Y" or "N" [Y]: ')
                    if confirm_policy == 'Y' or confirm_policy == '':
                        confirm_policy = 'Y'

                        templateVars["port_channel_appliances"] = port_channel_appliances
                        templateVars["port_channel_ethernet_uplinks"] = port_channel_ethernet_uplinks
                        templateVars["port_channel_fcoe_uplinks"] = port_channel_fcoe_uplinks
                        templateVars["port_role_appliances"] = port_role_appliances
                        templateVars["port_role_ethernet_uplinks"] = port_role_ethernet_uplinks
                        templateVars["port_role_fcoe_uplinks"] = port_role_fcoe_uplinks
                        templateVars["port_role_servers"] = port_role_servers
                        # templateVars["port_modes"] = [{'custom_mode':'FibreChannel','port_list':fc_ports,'slot_id':1}]

                        original_name = templateVars["name"]
                        templateVars["name"] = '%s_A' % (original_name)
                        templateVars["port_channel_fc_uplinks"] = Fabric_A_fc_port_channels
                        templateVars["port_role_fc_uplinks"] = Fabric_A_port_role_fc

                        # Write Policies to Template File
                        templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                        write_to_template(self, **templateVars)

                        # Add Template Name to Policies Output
                        policy_names.append(templateVars["name"])

                        templateVars["name"] = '%s_B' % (original_name)
                        templateVars["port_channel_fc_uplinks"] = Fabric_B_fc_port_channels
                        templateVars["port_role_fc_uplinks"] = Fabric_B_port_role_fc

                        # Write Policies to Template File
                        templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                        write_to_template(self, **templateVars)

                        # Add Template Name to Policies Output
                        policy_names.append(templateVars["name"])

                        configure_loop, policy_loop = exit_default_no(templateVars["policy_type"])
                        valid_confirm = True

                    elif confirm_policy == 'N':
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Starting {templateVars["policy_type"]} Section over.')
                        print(f'\n------------------------------------------------------\n')
                        valid_confirm = True

                    else:
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # Power Policy Module
    #========================================
    def power_policies(self):
        name_prefix = self.name_prefix
        org = self.org
        policy_names = []
        policy_type = 'Power Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'power_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  A {policy_type} will configure the Power Redundancy Policies for Chassis and Servers.')
            print(f'  For Servers it will configure the Power Restore State.\n')
            print(f'  This wizard will save the configuraton for this section to the following file:')
            print(f'  - Intersight/{org}/{self.type}/{templateVars["template_type"]}.auto.tfvars')
            print(f'\n-------------------------------------------------------------------------------------------\n')
            loop_count = 1
            policy_loop = False
            while policy_loop == False:

                templateVars["policy_file"] = 'system_type.txt'
                templateVars["var_description"] = '   Please Select the Type of System this Power Policy is for.'
                templateVars["var_type"] = 'System Type'
                system_type = variable_loop(**templateVars)

                print(system_type)
                if not name_prefix == '':
                    name = '%s_%s' % (name_prefix, system_type)
                else:
                    name = '%s_%s' % (org, system_type)

                templateVars["name"] = policy_name(name, policy_type)
                templateVars["descr"] = policy_descr(templateVars["name"], policy_type)

                if system_type == '9508':
                    valid = False
                    while valid == False:
                        templateVars["allocated_budget"] = input('What is the Power Budget you would like to Apply?\n'
                            'This should be a value between 2800 Watts and 16800 Watts. [5600]: ')
                        if templateVars["allocated_budget"] == '':
                            templateVars["allocated_budget"] = 5600
                        valid = validating_ucs.number_in_range('Chassis Power Budget', templateVars["allocated_budget"], 2800, 16800)
                else:
                    templateVars["allocated_budget"] = 0

                if system_type == 'Server':
                    templateVars["policy_file"] = 'power_restore.txt'
                    templateVars["var_description"] = '   Sets the Power Restore State of the Server.\n'\
                        '      - AlwaysOff - Set the Power Restore Mode to Off.\n'\
                        '      - AlwaysOn - Set the Power Restore Mode to On.\n'\
                        '      - LastState - Set the Power Restore Mode to LastState.\n'
                    templateVars["var_type"] = 'Power Restore State'
                    templateVars["power_restore_state"] = variable_loop(**templateVars)

                if system_type == '5108':
                    templateVars["policy_file"] = 'power_5108.txt'
                    templateVars["var_description"] = '    Please Select the Power Redundancy Policy to apply to the system\n'\
                        '      - Grid - Grid Mode requires two power sources. If one source fails, the surviving PSUs connected to the other source provides power to the chassis.\n'\
                        '      - NotRedundant - Power Manager turns on the minimum number of PSUs required to support chassis power requirements. No Redundant PSUs are maintained.\n'\
                        '      - N+1 - Power Manager turns on the minimum number of PSUs required to support chassis power requirements plus one additional PSU for redundancy.\n'
                elif system_type == '9508':
                    templateVars["policy_file"] = 'power_9508.txt'
                    templateVars["var_description"] = '   Please Select the Power Redundancy Policy to apply to the system\n'\
                        '      - Grid - Grid Mode requires two power sources. If one source fails, the surviving PSUs connected to the other source provides power to the chassis.\n'\
                        '      - NotRedundant - Power Manager turns on the minimum number of PSUs required to support chassis power requirements. No Redundant PSUs are maintained.\n'\
                        '      - N+1 - Power Manager turns on the minimum number of PSUs required to support chassis power requirements plus one additional PSU for redundancy.\n'\
                        '      - N+2 - Power Manager turns on the minimum number of PSUs required to support chassis power requirements plus two additional PSU for redundancy.\n'
                elif system_type == 'Server':
                    templateVars["policy_file"] = 'power_server.txt'
                    templateVars["var_description"] = '   Please Select the Power Redundancy Policy to apply to the system\n'\
                        '      - Grid - Grid Mode requires two power sources. If one source fails, the surviving PSUs connected to the other source provides power to the chassis.\n'\
                        '      - NotRedundant - Power Manager turns on the minimum number of PSUs required to support chassis power requirements. No Redundant PSUs are maintained.\n'
                templateVars["var_type"] = 'Power Redundancy Mode'
                templateVars["redundancy_mode"] = variable_loop(**templateVars)

                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Do you want to accept the following configuration?')
                if system_type == '9508':
                    print(f'   allocated_budget    = {templateVars["allocated_budget"]}')
                print(f'   description         = "{templateVars["descr"]}"')
                print(f'   name                = "{templateVars["name"]}"')
                if system_type == 'Server':
                    print(f'   power_restore_state = "{templateVars["power_restore_state"]}"')
                print(f'   redundancy_mode     = "{templateVars["redundancy_mode"]}"')
                print(f'\n-------------------------------------------------------------------------------------------\n')
                valid_confirm = False
                while valid_confirm == False:
                    confirm_policy = input('Enter "Y" or "N" [Y]: ')
                    if confirm_policy == 'Y' or confirm_policy == '':
                        confirm_policy = 'Y'

                        # Write Policies to Template File
                        templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                        write_to_template(self, **templateVars)

                        # Add Template Name to Policies Output
                        policy_names.append(templateVars["name"])

                        configure_loop, policy_loop = exit_default_yes(templateVars["policy_type"])
                        valid_confirm = True

                    elif confirm_policy == 'N':
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Starting {templateVars["policy_type"]} Section over.')
                        print(f'\n------------------------------------------------------\n')
                        valid_confirm = True

                    else:
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # SAN Connectivity Policy Module
    #========================================
    def san_connectivity_policies(self):
        name_prefix = self.name_prefix
        name_suffix = 'san'
        org = self.org
        policy_names = []
        policy_type = 'SAN Connectivity Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'san_connectivity_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            configure = input(f'Do You Want to Configure a {policy_type}?  Enter "Y" or "N" [Y]: ')
            if configure == 'Y' or configure == '':
                policy_loop = False
                while policy_loop == False:

                    if not name_prefix == '':
                        name = '%s_%s' % (name_prefix, name_suffix)
                    else:
                        name = '%s_%s' % (org, name_suffix)

                    templateVars["name"] = policy_name(name, policy_type)
                    templateVars["descr"] = policy_descr(templateVars["name"], policy_type)

                    templateVars["priority"] = 'auto'
                    templateVars["receive"] = 'Disabled'
                    templateVars["send"] = 'Disabled'

                    # Write Policies to Template File
                    templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                    write_to_template(self, **templateVars)

                    # Add Template Name to Policies Output
                    policy_names.append(templateVars["name"])

                    exit_answer = input(f'Would You like to Configure another {policy_type}?  Enter "Y" or "N" [N]: ')
                    if exit_answer == 'N' or exit_answer == '':
                        policy_loop = True
                        configure_loop = True
            elif configure == 'N':
                configure_loop = True
            else:
                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                print(f'\n-------------------------------------------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # SD Card Policy Module
    #========================================
    def sd_card_policies(self):
        name_prefix = self.name_prefix
        name_suffix = 'sdcard'
        org = self.org
        policy_names = []
        policy_type = 'SD Card Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'sd_card_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            configure = input(f'Do You Want to Configure a {policy_type}?  Enter "Y" or "N" [Y]: ')
            if configure == 'Y' or configure == '':
                policy_loop = False
                while policy_loop == False:

                    if not name_prefix == '':
                        name = '%s_%s' % (name_prefix, name_suffix)
                    else:
                        name = '%s_%s' % (org, name_suffix)

                    templateVars["name"] = policy_name(name, policy_type)
                    templateVars["descr"] = policy_descr(templateVars["name"], policy_type)

                    templateVars["priority"] = 'auto'
                    templateVars["receive"] = 'Disabled'
                    templateVars["send"] = 'Disabled'

                    # Write Policies to Template File
                    templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                    write_to_template(self, **templateVars)

                    # Add Template Name to Policies Output
                    policy_names.append(templateVars["name"])

                    exit_answer = input(f'Would You like to Configure another {policy_type}?  Enter "Y" or "N" [N]: ')
                    if exit_answer == 'N' or exit_answer == '':
                        policy_loop = True
                        configure_loop = True
            elif configure == 'N':
                configure_loop = True
            else:
                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                print(f'\n-------------------------------------------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # Serial over LAN Policy Module
    #========================================
    def serial_over_lan_policies(self):
        name_prefix = self.name_prefix
        name_suffix = 'sol'
        org = self.org
        policy_names = []
        policy_type = 'Serial over LAN Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'serial_over_lan_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  A {policy_type} will configure the Server to allow access to the Communications Port over')
            print(f'  Ethernet.  Settings include:')
            print(f'   - Baud Rate')
            print(f'   - COM Port')
            print(f'   - SSH Port\n')
            print(f'  This Policy is not required to standup a server but is a good practice for day 2 support.')
            print(f'  This wizard will save the configuraton for this section to the following file:')
            print(f'  - Intersight/{org}/{self.type}/{templateVars["template_type"]}.auto.tfvars')
            print(f'\n-------------------------------------------------------------------------------------------\n')
            configure = input(f'Do You Want to Configure a {policy_type}?  Enter "Y" or "N" [Y]: ')
            if configure == 'Y' or configure == '':
                policy_loop = False
                while policy_loop == False:

                    if not name_prefix == '':
                        name = '%s_%s' % (name_prefix, name_suffix)
                    else:
                        name = '%s_%s' % (org, name_suffix)

                    templateVars["name"] = policy_name(name, policy_type)
                    templateVars["descr"] = policy_descr(templateVars["name"], policy_type)
                    templateVars["enabled"] = True

                    templateVars["policy_file"] = 'baud_rate.txt'
                    templateVars["var_description"] = '    Please Select the Baud Rate for this Policy.\n'\
                        '    - 115200 - Recommended for best throughput\n'
                    templateVars["var_type"] = 'Baude Rate'
                    templateVars["baud_rate"] = variable_loop(**templateVars)

                    templateVars["policy_file"] = 'com_port.txt'
                    templateVars["var_description"] = '    Please Select the COM Port for this Policy.\n'
                    templateVars["var_type"] = 'COM Port'
                    templateVars["com_port"] = variable_loop(**templateVars)

                    valid = False
                    while valid == False:
                        templateVars["ssh_port"] = input('What is the SSH Port you would like to assign?\n'
                            'This should be a value between 1024-65535. [2400]: ')
                        if templateVars["ssh_port"] == '':
                            templateVars["ssh_port"] = 2400
                        valid = validating_ucs.number_in_range('SSH Port', templateVars["ssh_port"], 1024, 65535)

                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    print(f'  Do you want to accept the following configuration?')
                    print(f'   baud_rate   = "{templateVars["baud_rate"]}"')
                    print(f'   com_port    = "{templateVars["com_port"]}"')
                    print(f'   description = "{templateVars["descr"]}"')
                    print(f'   enabled     = "{templateVars["enabled"]}"')
                    print(f'   name        = "{templateVars["name"]}"')
                    print(f'   ssh_port    = "{templateVars["ssh_port"]}"')
                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    valid_confirm = False
                    while valid_confirm == False:
                        confirm_policy = input('Enter "Y" or "N" [Y]: ')
                        if confirm_policy == 'Y' or confirm_policy == '':
                            confirm_policy = 'Y'

                            # Write Policies to Template File
                            templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                            write_to_template(self, **templateVars)

                            # Add Template Name to Policies Output
                            policy_names.append(templateVars["name"])

                            configure_loop, policy_loop = exit_default_no(templateVars["policy_type"])
                            valid_confirm = True

                        elif confirm_policy == 'N':
                            print(f'\n------------------------------------------------------\n')
                            print(f'  Starting {templateVars["policy_type"]} Section over.')
                            print(f'\n------------------------------------------------------\n')
                            valid_confirm = True

                        else:
                            print(f'\n------------------------------------------------------\n')
                            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                            print(f'\n------------------------------------------------------\n')

            elif configure == 'N':
                configure_loop = True
            else:
                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                print(f'\n-------------------------------------------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # SNMP Policy Module
    #========================================
    def snmp_policies(self):
        name_prefix = self.name_prefix
        name_suffix = 'snmp'
        org = self.org
        policy_names = []
        policy_type = 'SNMP Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'snmp_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            configure = input(f'Do You Want to Configure a {policy_type}?  Enter "Y" or "N" [Y]: ')
            if configure == 'Y' or configure == '':
                policy_loop = False
                while policy_loop == False:

                    if not name_prefix == '':
                        name = '%s_%s' % (name_prefix, name_suffix)
                    else:
                        name = '%s_%s' % (org, name_suffix)

                    templateVars["name"] = policy_name(name, policy_type)
                    templateVars["descr"] = policy_descr(templateVars["name"], policy_type)

                    templateVars["priority"] = 'auto'
                    templateVars["receive"] = 'Disabled'
                    templateVars["send"] = 'Disabled'

                    # Write Policies to Template File
                    templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                    write_to_template(self, **templateVars)

                    # Add Template Name to Policies Output
                    policy_names.append(templateVars["name"])

                    exit_answer = input(f'Would You like to Configure another {policy_type}?  Enter "Y" or "N" [N]: ')
                    if exit_answer == 'N' or exit_answer == '':
                        policy_loop = True
                        configure_loop = True
            elif configure == 'N':
                configure_loop = True
            else:
                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                print(f'\n-------------------------------------------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # Storage Policy Module
    #========================================
    def storage_policies(self):
        name_prefix = self.name_prefix
        name_suffix = 'storage'
        org = self.org
        policy_names = []
        policy_type = 'Storage Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'storage_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            configure = input(f'Do You Want to Configure a {policy_type}?  Enter "Y" or "N" [Y]: ')
            if configure == 'Y' or configure == '':
                policy_loop = False
                while policy_loop == False:

                    if not name_prefix == '':
                        name = '%s_%s' % (name_prefix, name_suffix)
                    else:
                        name = '%s_%s' % (org, name_suffix)

                    templateVars["name"] = policy_name(name, policy_type)
                    templateVars["descr"] = policy_descr(templateVars["name"], policy_type)

                    templateVars["priority"] = 'auto'
                    templateVars["receive"] = 'Disabled'
                    templateVars["send"] = 'Disabled'

                    # Write Policies to Template File
                    templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                    write_to_template(self, **templateVars)

                    # Add Template Name to Policies Output
                    policy_names.append(templateVars["name"])

                    exit_answer = input(f'Would You like to Configure another {policy_type}?  Enter "Y" or "N" [N]: ')
                    if exit_answer == 'N' or exit_answer == '':
                        policy_loop = True
                        configure_loop = True
            elif configure == 'N':
                configure_loop = True
            else:
                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                print(f'\n-------------------------------------------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # Switch Control Policy Module
    #========================================
    def switch_control_policies(self):
        name_prefix = self.name_prefix
        name_suffix = 'sw_ctrl'
        org = self.org
        policy_names = []
        policy_type = 'Switch Control Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'switch_control_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  A Switch Control Policy will configure Unidirectional Link Detection Protocol and')
            print(f'  MAC Address Learning Settings for the UCS Domain Profile.')
            print(f'  We recommend the settings the wizard is setup to push.  So you will only be asked for')
            print(f'  the name and description for the Policy.  You only need one of these policies for')
            print(f'  Organization {org}.\n')
            print(f'  This wizard will save the configuraton for this section to the following file:')
            print(f'  - Intersight/{org}/{self.type}/{templateVars["template_type"]}.auto.tfvars')
            print(f'\n-------------------------------------------------------------------------------------------\n')
            policy_loop = False
            while policy_loop == False:

                if not name_prefix == '':
                    name = '%s_%s' % (name_prefix, name_suffix)
                else:
                    name = '%s_%s' % (org, name_suffix)

                templateVars["name"] = policy_name(name, policy_type)
                templateVars["descr"] = policy_descr(templateVars["name"], policy_type)

                templateVars["mac_address_table_aging"] = 'Default'
                templateVars["mac_aging_time"] = 14500
                templateVars["udld_message_interval"] = 15
                templateVars["udld_recovery_action"] = "reset"
                templateVars["vlan_port_count_optimization"] = False

                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Do you want to accept the following configuration?')
                print(f'    description                  = "{templateVars["descr"]}"')
                print(f'    mac_address_table_aging      = "{templateVars["mac_address_table_aging"]}"')
                print(f'    mac_aging_time               = {templateVars["mac_aging_time"]}')
                print(f'    name                         = "{templateVars["name"]}"')
                print(f'    udld_message_interval        = {templateVars["udld_message_interval"]}')
                print(f'    udld_recovery_action         = "{templateVars["udld_recovery_action"]}"')
                print(f'    vlan_port_count_optimization = {templateVars["vlan_port_count_optimization"]}')
                print(f'\n-------------------------------------------------------------------------------------------\n')
                valid_confirm = False
                while valid_confirm == False:
                    confirm_policy = input('Enter "Y" or "N" [Y]: ')
                    if confirm_policy == 'Y' or confirm_policy == '':
                        confirm_policy = 'Y'

                        # Write Policies to Template File
                        templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                        write_to_template(self, **templateVars)

                        # Add Template Name to Policies Output
                        policy_names.append(templateVars["name"])

                        configure_loop, policy_loop = exit_default_no(templateVars["policy_type"])
                        valid_confirm = True

                    elif confirm_policy == 'N':
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Starting {templateVars["policy_type"]} Section over.')
                        print(f'\n------------------------------------------------------\n')
                        valid_confirm = True

                    else:
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # Syslog Policy Module
    #========================================
    def syslog_policies(self):
        name_prefix = self.name_prefix
        name_suffix = 'syslog'
        org = self.org
        policy_names = []
        policy_type = 'Syslog Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'syslog_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  A {policy_type} will configure domain and servers with remote syslog servers.')
            print(f'  You can configure up to two Remote Syslog Servers.')
            print(f'  This Policy is not required to standup a server but is a good practice for day 2 support.')
            print(f'  This wizard will save the configuraton for this section to the following file:')
            print(f'  - Intersight/{org}/{self.type}/{templateVars["template_type"]}.auto.tfvars')
            print(f'\n-------------------------------------------------------------------------------------------\n')
            configure = input(f'Do You Want to Configure a {policy_type}?  Enter "Y" or "N" [Y]: ')
            if configure == 'Y' or configure == '':
                policy_loop = False
                while policy_loop == False:

                    if not name_prefix == '':
                        name = '%s_%s' % (name_prefix, name_suffix)
                    else:
                        name = '%s_%s' % (org, name_suffix)

                    templateVars["name"] = policy_name(name, policy_type)
                    templateVars["descr"] = policy_descr(templateVars["name"], policy_type)

                    templateVars["policy_file"] = 'syslog_severity.txt'
                    templateVars["var_description"] = '    Please Select the Local Minimum Severity.\n'\
                        '    - emergency\n'\
                        '    - alert\n'\
                        '    - critical (Intersight Critical)\n'\
                        '    - error (Intersight Major)\n'\
                        '    - warning (Defualt) - (Intersight Minor)\n'\
                        '    - notice (Intersight Warning)\n'\
                        '    - informational\n'\
                        '    - debug\n'
                    templateVars["var_type"] = 'Local Severity'
                    min_severity = variable_loop(**templateVars)

                    templateVars["local_logging"] = {'file':{'min_severity':min_severity}}

                    templateVars["remote_logging"] = {}
                    syslog_count = 1
                    syslog_loop = False
                    while syslog_loop == False:
                        valid = False
                        while valid == False:
                            hostname = input(f'Enter the Hostname/IP Address of the Remote Server: ')
                            if re.search(r'[a-zA-Z]+', hostname):
                                valid = validating_ucs.dns_name('Primary NTP Server', hostname)
                            else:
                                valid = validating_ucs.ip_address('Primary NTP Server', hostname)

                        templateVars["policy_file"] = 'syslog_severity.txt'
                        templateVars["var_description"] = '    Please Select the Minimum Severity to Report.\n'\
                            '    - emergency\n'\
                            '    - alert\n'\
                            '    - critical (Intersight Critical)\n'\
                            '    - error (Intersight Major)\n'\
                            '    - warning (Defualt) - (Intersight Minor)\n'\
                            '    - notice (Intersight Warning)\n'\
                            '    - informational\n'\
                            '    - debug\n'
                        templateVars["var_type"] = 'Remote Severity'
                        min_severity = variable_loop(**templateVars)

                        templateVars["policy_file"] = 'protocol.txt'
                        templateVars["var_description"] = '    Please Select the Protocol for the Remote Server.\n'
                        templateVars["var_type"] = 'Protocol'
                        protocol = variable_loop(**templateVars)

                        valid = False
                        while valid == False:
                            port = input(f'Enter the Port to Assign to this Policy.  Valid Range is 1-65535.  [514]: ')
                            if port == '':
                                port = 514
                            if re.search(r'[0-9]{1,4}', str(port)):
                                valid = validating_ucs.number_in_range('Port', port, 1, 65535)
                            else:
                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                print(f'  Invalid Entry!  Please Enter a valid Port in the range of 1-65535.')
                                print(f'\n-------------------------------------------------------------------------------------------\n')

                        remote_host = {
                            'enable':True,
                            'hostname':hostname,
                            'min_severity':min_severity,
                            'port':port,
                            'protocol':protocol
                        }
                        print(f'\n-------------------------------------------------------------------------------------------\n')
                        print(f'  Do you want to accept the following configuration?')
                        print(f'   hostname     = {hostname}')
                        print(f'   min_severity = {min_severity}')
                        print(f'   port         = {port}')
                        print(f'   protocol     = "{protocol}"')
                        print(f'\n-------------------------------------------------------------------------------------------\n')
                        valid_confirm = False
                        while valid_confirm == False:
                            confirm_host = input('Enter "Y" or "N" [Y]: ')
                            if confirm_host == 'Y' or confirm_host == '':
                                if syslog_count == 1:
                                    templateVars['remote_logging'].update({'server1':remote_host})
                                if syslog_count == 2:
                                    templateVars['remote_logging'].update({'server2':remote_host})
                                if syslog_count == 1:
                                    valid_exit = False
                                    while valid_exit == False:
                                        remote_exit = input(f'Would You like to Configure another Remote Host?  Enter "Y" or "N" [Y]: ')
                                        if remote_exit == 'Y' or remote_exit == '':
                                            syslog_count += 1
                                            valid_confirm = True
                                            valid_exit = True
                                        elif remote_exit == 'N':
                                            syslog_loop = True
                                            valid_exit = True
                                        else:
                                            print(f'\n------------------------------------------------------\n')
                                            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                                            print(f'\n------------------------------------------------------\n')

                                else:
                                    syslog_loop = True
                                    valid_confirm = True

                            elif confirm_host == 'N':
                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                print(f'  Starting Remote Host Configuration Over.')
                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                syslog_loop = True
                                valid_confirm = True
                            else:
                                print(f'\n------------------------------------------------------\n')
                                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                                print(f'\n------------------------------------------------------\n')

                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    print(f'  Do you want to accept the following configuration?')
                    print(f'    description        = "{templateVars["descr"]}"')
                    print(f'    local_min_severity = {min_severity}')
                    print(f'    name               = "{templateVars["name"]}"')
                    print(f'    remote_clients = [')
                    item_count = 1
                    print(templateVars["remote_logging"])
                    for key, value in templateVars["remote_logging"].items():
                        print('      {')
                        for k, v in value.items():
                            if k == 'enable':
                                print(f'        enabled      = {v}')
                            elif k == 'hostname':
                                print(f'        hostname     = {v}')
                            elif k == 'min_severity':
                                print(f'        min_severity = {v}')
                            elif k == 'port':
                                print(f'        port         = {v}')
                            elif k == 'protocol':
                                print(f'        protocol     = {v}')
                        print('      }')
                        item_count += 1
                    print(f'    ]')
                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    valid_confirm = False
                    while valid_confirm == False:
                        confirm_policy = input('Enter "Y" or "N" [Y]: ')
                        if confirm_policy == 'Y' or confirm_policy == '':
                            confirm_policy = 'Y'

                            # Write Policies to Template File
                            templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                            write_to_template(self, **templateVars)

                            # Add Template Name to Policies Output
                            policy_names.append(templateVars["name"])

                            configure_loop, policy_loop = exit_default_no(templateVars["policy_type"])
                            valid_confirm = True

                        elif confirm_policy == 'N':
                            print(f'\n------------------------------------------------------\n')
                            print(f'  Starting {templateVars["policy_type"]} Section over.')
                            print(f'\n------------------------------------------------------\n')
                            valid_confirm = True

                        else:
                            print(f'\n------------------------------------------------------\n')
                            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                            print(f'\n------------------------------------------------------\n')

            elif configure == 'N':
                configure_loop = True
            else:
                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                print(f'\n-------------------------------------------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # System QoS Policy Module
    #========================================
    def system_qos_policies(self):
        name_prefix = self.name_prefix
        name_suffix = 'qos'
        org = self.org
        policy_names = []
        policy_type = 'System QoS Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'system_qos_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  A System QoS Policy will configure the QoS Policies for the UCS Domain Profile')
            print(f'  These Queues are represented by the following Priorities:')
            print(f'    - Platinum')
            print(f'    - Gold')
            print(f'    - FC')
            print(f'    - Silver')
            print(f'    - Bronze')
            print(f'    - Best Effort')
            print(f'  For the System MTU we recommend to set the MTU to Jumbo frames unless you are unable.')
            print(f'  to configure jumbo frames in your network.  Any traffic that is moving large')
            print(f'  amounts of packets through the network will be improved with Jumbo MTU support.')
            print(f'  Beyond the System MTU, we recommend you utilize the default parameters of this wizard.')
            print(f'  You only need one of these policies for Organization {org}.\n')
            print(f'  This wizard will save the configuraton for this section to the following file:')
            print(f'  - Intersight/{org}/{self.type}/{templateVars["template_type"]}.auto.tfvars')
            print(f'\n-------------------------------------------------------------------------------------------\n')
            policy_loop = False
            while policy_loop == False:

                if not name_prefix == '':
                    name = '%s_%s' % (name_prefix, name_suffix)
                else:
                    name = '%s_%s' % (org, name_suffix)

                templateVars["name"] = policy_name(name, policy_type)
                templateVars["descr"] = policy_descr(templateVars["name"], policy_type)

                valid = False
                while valid == False:
                    mtu = input('Do you want to enable Jumbo MTU?  Enter "Y" or "N" [Y]: ')
                    if mtu == '' or mtu == 'Y':
                        templateVars["mtu"] = 9216
                        valid = True
                    elif mtu == 'N':
                        templateVars["mtu"] = 1500
                        valid = True
                    else:
                        print(f'\n-------------------------------------------------------------------------------------------\n')
                        print(f'  Error!! Invalid Option.  Please enter "Y" or "N".')
                        print(f'\n-------------------------------------------------------------------------------------------\n')

                domain_mtu = templateVars["mtu"]

                templateVars["Platinum"] = {
                    'bandwidth_percent':20,
                    'cos':5,
                    'mtu':templateVars["mtu"],
                    'multicast_optimize':False,
                    'packet_drop':False,
                    'priority':'Platinum',
                    'state':'Enabled',
                    'weight':10,
                }
                templateVars["Gold"] = {
                    'bandwidth_percent':19,
                    'cos':4,
                    'mtu':templateVars["mtu"],
                    'multicast_optimize':False,
                    'packet_drop':True,
                    'priority':'Gold',
                    'state':'Enabled',
                    'weight':9,
                }
                templateVars["FC"] = {
                    'bandwidth_percent':21,
                    'cos':3,
                    'mtu':2240,
                    'multicast_optimize':False,
                    'packet_drop':False,
                    'priority':'FC',
                    'state':'Enabled',
                    'weight':10,
                }
                templateVars["Silver"] = {
                    'bandwidth_percent':16,
                    'cos':2,
                    'mtu':templateVars["mtu"],
                    'multicast_optimize':False,
                    'packet_drop':True,
                    'priority':'Silver',
                    'state':'Enabled',
                    'weight':8,
                }
                templateVars["Bronze"] = {
                    'bandwidth_percent':14,
                    'cos':1,
                    'mtu':templateVars["mtu"],
                    'multicast_optimize':False,
                    'packet_drop':True,
                    'priority':'Bronze',
                    'state':'Enabled',
                    'weight':7,
                }
                templateVars["Best Effort"] = {
                    'bandwidth_percent':10,
                    'cos':255,
                    'mtu':templateVars["mtu"],
                    'multicast_optimize':False,
                    'packet_drop':True,
                    'priority':'Best Effort',
                    'state':'Enabled',
                    'weight':5,
                }

                templateVars["classes"] = []
                priorities = ['Platinum', 'Gold', 'FC', 'Silver', 'Bronze', 'Best Effort']

                for priority in priorities:
                    templateVars["classes"].append(templateVars[priority])
                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Do you want to accept the following configuration?')
                print(f'    description = "{templateVars["descr"]}"')
                print(f'    name        = "{templateVars["name"]}"')
                print('    classes = {')
                for item in templateVars["classes"]:
                    for k, v in item.items():
                        if k == 'priority':
                            print(f'      "{v}" = ''{')
                    for k, v in item.items():
                        if k == 'bandwidth_percent':
                            print(f'        bandwidth_percent  = {v}')
                        elif k == 'cos':
                            print(f'        cos                = {v}')
                        elif k == 'mtu':
                            print(f'        mtu                = {v}')
                        elif k == 'multicast_optimize':
                            print(f'        multicast_optimize = {v}')
                        elif k == 'packet_drop':
                            print(f'        packet_drop        = {v}')
                        elif k == 'state':
                            print(f'        state              = "{v}"')
                        elif k == 'weight':
                            print(f'        weight             = {v}')
                    print('      }')
                print('    }')
                print(f'\n-------------------------------------------------------------------------------------------\n')
                valid_confirm = False
                while valid_confirm == False:
                    confirm_policy = input('Enter "Y" or "N" [Y]: ')
                    if confirm_policy == 'Y' or confirm_policy == '':
                        confirm_policy = 'Y'

                        # Write Policies to Template File
                        templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                        write_to_template(self, **templateVars)

                        # Add Template Name to Policies Output
                        policy_names.append(templateVars["name"])

                        configure_loop, policy_loop = exit_default_no(templateVars["policy_type"])
                        valid_confirm = True

                    elif confirm_policy == 'N':
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Starting {templateVars["policy_type"]} Section over.')
                        print(f'\n------------------------------------------------------\n')
                        valid_confirm = True

                    else:
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names,domain_mtu

    #========================================
    # Thermal Policy Module
    #========================================
    def thermal_policies(self):
        name_prefix = self.name_prefix
        org = self.org
        policy_names = []
        policy_type = 'Thermal Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'thermal_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  A {policy_type} will configure the Cooling/FAN Policy for Chassis.  We recommend ')
            print(f'  Balanced for a 5108 and Acoustic for a 9508 Chassis, as of this writing.\n')
            print(f'  This wizard will save the configuraton for this section to the following file:')
            print(f'  - Intersight/{org}/{self.type}/{templateVars["template_type"]}.auto.tfvars')
            print(f'\n-------------------------------------------------------------------------------------------\n')
            policy_loop = False
            while policy_loop == False:

                templateVars["policy_file"] = 'chassis_type.txt'
                templateVars["var_description"] = '   Please Select the Type of Chassis this Thermal Policy is for.'
                templateVars["var_type"] = 'Chassis Type'
                chassis_type = variable_loop(**templateVars)

                if not name_prefix == '':
                    name = '%s_%s' % (name_prefix, chassis_type)
                else:
                    name = '%s_%s' % (org, chassis_type)

                templateVars["name"] = policy_name(name, policy_type)
                templateVars["descr"] = policy_descr(templateVars["name"], policy_type)

                if chassis_type == '5108':
                    templateVars["policy_file"] = 'thermal_5108.txt'
                    templateVars["var_description"] = '    Please Select the Thermal Policy to apply to the system\n'\
                        '      - Balanced - The fans run faster when needed based on the heat generated by the chassis. When possible, the fans returns to the minimum required speed.\n'\
                        '      - LowPower - The Fans run at the minimum speed required to keep the chassis cool.\n'
                else:
                    templateVars["policy_file"] = 'thermal_9508.txt'
                    templateVars["var_description"] = '   Please Select the Thermal Policy to apply to the system\n'\
                        '      - Acoustic - The fan speed is reduced to reduce noise levels in acoustic-sensitive environments.\n'\
                        '      - Balanced - The fans run faster when needed based on the heat generated by the chassis. When possible, the fans returns to the minimum required speed.\n'\
                        '      - LowPower - The Fans run at the minimum speed required to keep the chassis cool.\n'\
                        '      - HighPower - The fans are kept at higher speed to emphasizes performance over power consumption.\n'\
                        '      - MaximumPower - The fans are always kept at maximum speed. This option provides the most cooling and consumes the most power.\n'
                templateVars["var_type"] = 'Chassis Type'
                templateVars["fan_control_mode"] = variable_loop(**templateVars)

                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Do you want to accept the following configuration?')
                print(f'   description      = "{templateVars["descr"]}"')
                print(f'   name             = "{templateVars["name"]}"')
                print(f'   fan_control_mode = "{templateVars["fan_control_mode"]}"')
                print(f'\n-------------------------------------------------------------------------------------------\n')
                valid_confirm = False
                while valid_confirm == False:
                    confirm_policy = input('Enter "Y" or "N" [Y]: ')
                    if confirm_policy == 'Y' or confirm_policy == '':
                        confirm_policy = 'Y'

                        # Write Policies to Template File
                        templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                        write_to_template(self, **templateVars)

                        # Add Template Name to Policies Output
                        policy_names.append(templateVars["name"])

                        configure_loop, policy_loop = exit_default_no(templateVars["policy_type"])
                        valid_confirm = True

                    elif confirm_policy == 'N':
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Starting {templateVars["policy_type"]} Section over.')
                        print(f'\n------------------------------------------------------\n')
                        valid_confirm = True

                    else:
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # UCS Domain Profile Module
    #========================================
    def ucs_domain_profiles(self, policies):
        name_prefix = self.name_prefix
        name_suffix = 'ucs'
        org = self.org
        policy_type = 'UCS Domain Profile'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'ucs_domain_profiles'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            configure = input(f'Do You Want to Configure a {policy_type}?  Enter "Y" or "N" [Y]: ')
            if configure == 'Y' or configure == '':
                policy_loop = False
                while policy_loop == False:

                    if not name_prefix == '':
                        name = '%s' % (name_prefix)
                    else:
                        name = '%s_%s' % (org, name_suffix)

                    templateVars["name"] = policy_name(name, policy_type)
                    templateVars["descr"] = policy_descr(templateVars["name"], policy_type)

                    valid = False
                    while valid == False:
                        print(f'\n-------------------------------------------------------------------------------------------\n')
                        print(f'  1. UCS-FI-6454')
                        print(f'  2. UCS-FI-64108')
                        print(f'\n-------------------------------------------------------------------------------------------\n')
                        model = input('Select the Index Value of the model of the Fabric Interconnects: ')
                        if model == '1':
                            templateVars["device_model"] = 'UCS-FI-6454'
                            valid = True
                        elif model == '2':
                            templateVars["device_model"] = 'UCS-FI-64108'
                            valid = True
                        else:
                            print(f'\n-------------------------------------------------------------------------------------------\n')
                            print(f'  Error!! Invalid Selection.  Please Select a valid Index from the List.')
                            print(f'\n-------------------------------------------------------------------------------------------\n')

                    valid = False
                    while valid == False:
                        print(f'\n-------------------------------------------------------------------------------------------\n')
                        print(f'  Note: If you do not have the Serial Number at this time you can manually')
                        print(f'        add it to the ucs_domain_profiles/ucs_domain_profile.auto.tfvars')
                        print(f'        file later.')
                        print(f'\n-------------------------------------------------------------------------------------------\n')
                        templateVars["serial_number_fabric_a"] = input('What is the Serial Number of Fabric A [press enter to skip]? ')
                        templateVars["serial_number_fabric_b"] = input('What is the Serial Number of Fabric B [press enter to skip]? ')
                        valid = True

                    policy_list = [
                        'network_connectivity_policies',
                        'ntp_policies',
                        # 'snmp_policies',
                        'switch_control_policies',
                        # 'syslog_policies',
                        # 'system_qos_policies'
                    ]
                    templateVars["allow_opt_out"] = True
                    for policy in policy_list:
                        policy_short = policy.replace('policies', 'policy')
                        templateVars["policies"] = policies.get(policy)
                        templateVars[policy_short] = choose_policy(policy, **templateVars)

                    policy_list = [
                        # 'port_policies',
                        # 'vlan_policies',
                        # 'vsan_policies'
                    ]
                    templateVars["allow_opt_out"] = False
                    for policy in policy_list:
                        policy_short = policy.replace('policies', 'policy')
                        x = policy_short.split('_')
                        policy_description = []
                        for y in x:
                            y = y.capitalize()
                            policy_description.append(y)
                        policy_description = " ".join(policy_description)

                        templateVars[policy] = {}
                        if len(policy) > 0:
                            templateVars["policy"] = '%s Fabric A' % (policy_description)
                            templateVars[policy]["fabric_a"] = policies_list(policies.get(policy), **templateVars)
                            templateVars["policy"] = '%s Fabric B' % (policy_description)
                            templateVars[policy]["fabric_b"] = policies_list(policies.get(policy), **templateVars)
                        else:
                            templateVars[policy]["fabric_a"] = ""
                            templateVars[policy]["fabric_b"] = ""

                    # Write Policies to Template File
                    # templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                    # write_to_template(self, **templateVars)

                    exit_answer = input(f'Would You like to Configure another {policy_type}?  Enter "Y" or "N" [N]: ')
                    if exit_answer == 'N' or exit_answer == '':
                        policy_loop = True
                        configure_loop = True
            elif configure == 'N':
                configure_loop = True
            else:
                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                print(f'\n-------------------------------------------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

    #========================================
    # UUID Pools Module
    #========================================
    def uuid_pools(self):
        name_prefix = self.name_prefix
        name_suffix = 'uuid_pool'
        org = self.org
        policy_names = []
        policy_type = 'UUID Pool'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'uuid_pools'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            configure = input(f'Do You Want to Configure a {policy_type}?  Enter "Y" or "N" [Y]: ')
            if configure == 'Y' or configure == '':
                policy_loop = False
                while policy_loop == False:

                    if not name_prefix == '':
                        name = '%s_%s' % (name_prefix, name_suffix)
                    else:
                        name = '%s_%s' % (org, name_suffix)

                    templateVars["name"] = policy_name(name, policy_type)
                    templateVars["descr"] = policy_descr(templateVars["name"], policy_type)

                    templateVars["priority"] = 'auto'
                    templateVars["receive"] = 'Disabled'
                    templateVars["send"] = 'Disabled'

                    # Write Policies to Template File
                    templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                    write_to_template(self, **templateVars)

                    # Add Template Name to Policies Output
                    policy_names.append(templateVars["name"])

                    exit_answer = input(f'Would You like to Configure another {policy_type}?  Enter "Y" or "N" [N]: ')
                    if exit_answer == 'N' or exit_answer == '':
                        policy_loop = True
                        configure_loop = True
            elif configure == 'N':
                configure_loop = True
            else:
                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                print(f'\n-------------------------------------------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # Virtual KVM Policy Module
    #========================================
    def virtual_kvm_policies(self):
        name_prefix = self.name_prefix
        name_suffix = 'vkvm'
        org = self.org
        policy_names = []
        policy_type = 'Virtual KVM Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'virtual_kvm_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  A {policy_type} will configure the Server for KVM access.  Settings include:')
            print(f'   - Local Server Video - If enabled, displays KVM on any monitor attached to the server.')
            print(f'   - Video Encryption - encrypts all video information sent through KVM.')
            print(f'   - Remote Port - The port used for KVM communication. Range is 1 to 65535.\n')
            print(f'  This wizard will save the configuraton for this section to the following file:')
            print(f'  - Intersight/{org}/{self.type}/{templateVars["template_type"]}.auto.tfvars')
            print(f'\n-------------------------------------------------------------------------------------------\n')
            policy_loop = False
            while policy_loop == False:

                if not name_prefix == '':
                    name = '%s_%s' % (name_prefix, name_suffix)
                else:
                    name = '%s_%s' % (org, name_suffix)

                templateVars["name"] = policy_name(name, policy_type)
                templateVars["descr"] = policy_descr(templateVars["name"], policy_type)
                templateVars["enable_virtual_kvm"] = True
                templateVars["maximum_sessions"] = 4

                valid = False
                while valid == False:
                    local_video = input('Do you want to Display KVM on Monitors attached to the Server?  Enter "Y" or "N" [Y]: ')
                    if local_video == '' or local_video == 'Y':
                        templateVars["enable_local_server_video"] = True
                        valid = True
                    elif local_video == 'N':
                        templateVars["enable_local_server_video"] = False
                        valid = True
                    else:
                        print(f'\n-------------------------------------------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n-------------------------------------------------------------------------------------------\n')

                valid = False
                while valid == False:
                    video_encrypt = input('Do you want to Enable video Encryption?  Enter "Y" or "N" [Y]: ')
                    if video_encrypt == '' or video_encrypt == 'Y':
                        templateVars["enable_video_encryption"] = True
                        valid = True
                    elif video_encrypt == 'N':
                        templateVars["enable_video_encryption"] = False
                        valid = True
                    else:
                        print(f'\n-------------------------------------------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n-------------------------------------------------------------------------------------------\n')

                valid = False
                while valid == False:
                    templateVars["remote_port"] = input('What is the Port you would like to Assign for Remote Access?\n'
                        'This should be a value between 1024-65535. [2068]: ')
                    if templateVars["remote_port"] == '':
                        templateVars["remote_port"] = 2068
                    valid = validating_ucs.number_in_range('Remote Port', templateVars["remote_port"], 1, 65535)

                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Do you want to accept the following configuration?')
                print(f'   description               = "{templateVars["descr"]}"')
                print(f'   enable_local_server_video = {templateVars["enable_local_server_video"]}')
                print(f'   enable_video_encryption   = {templateVars["enable_video_encryption"]}')
                print(f'   enable_virtual_kvm        = {templateVars["enable_virtual_kvm"]}')
                print(f'   maximum_sessions          = {templateVars["maximum_sessions"]}')
                print(f'   name                      = "{templateVars["name"]}"')
                print(f'   remote_port               = "{templateVars["remote_port"]}"')
                print(f'\n-------------------------------------------------------------------------------------------\n')
                valid_confirm = False
                while valid_confirm == False:
                    confirm_policy = input('Enter "Y" or "N" [Y]: ')
                    if confirm_policy == 'Y' or confirm_policy == '':
                        confirm_policy = 'Y'

                        # Write Policies to Template File
                        templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                        write_to_template(self, **templateVars)

                        # Add Template Name to Policies Output
                        policy_names.append(templateVars["name"])

                        configure_loop, policy_loop = exit_default_no(templateVars["policy_type"])
                        valid_confirm = True

                    elif confirm_policy == 'N':
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Starting {templateVars["policy_type"]} Section over.')
                        print(f'\n------------------------------------------------------\n')
                        valid_confirm = True

                    else:
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # Virtual Media Policy Module
    #========================================
    def virtual_media_policies(self):
        name_prefix = self.name_prefix
        name_suffix = 'vmedia'
        org = self.org
        policy_names = []
        policy_type = 'Virtual Media Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'virtual_media_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            configure = input(f'Do You Want to Configure a {policy_type}?  Enter "Y" or "N" [Y]: ')
            if configure == 'Y' or configure == '':
                policy_loop = False
                while policy_loop == False:

                    if not name_prefix == '':
                        name = '%s_%s' % (name_prefix, name_suffix)
                    else:
                        name = '%s_%s' % (org, name_suffix)

                    templateVars["name"] = policy_name(name, policy_type)
                    templateVars["descr"] = policy_descr(templateVars["name"], policy_type)

                    templateVars["priority"] = 'auto'
                    templateVars["receive"] = 'Disabled'
                    templateVars["send"] = 'Disabled'

                    # Write Policies to Template File
                    templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                    write_to_template(self, **templateVars)

                    # Add Template Name to Policies Output
                    policy_names.append(templateVars["name"])

                    exit_answer = input(f'Would You like to Configure another {policy_type}?  Enter "Y" or "N" [N]: ')
                    if exit_answer == 'N' or exit_answer == '':
                        policy_loop = True
                        configure_loop = True
            elif configure == 'N':
                configure_loop = True
            else:
                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                print(f'\n-------------------------------------------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # VLAN Policy Module
    #========================================
    def vlan_policies(self, policies):
        vlan_policies_vlans = []
        name_prefix = self.name_prefix
        name_suffix = 'vlans'
        org = self.org
        policy_names = []
        policy_type = 'VLAN Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'vlan_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  A {policy_type} will define the VLANs Assigned to the Fabric Interconnects.')
            print(f'  The vlan list can be in the format of:')
            print(f'     5 - Single VLAN')
            print(f'     1-10 - Range of VLANs')
            print(f'     1,2,3,4,5,11,12,13,14,15 - List of VLANs')
            print(f'     1-10,20-30 - Ranges and Lists of VLANs')
            print(f'  When configuring a VLAN List or Range the name will be used as a prefix in the format of:')
            print('     {name}-vlXXXX')
            print(f'  Where XXXX would be 0001 for vlan 1, 0100 for vlan 100, and 4094 for vlan 4094.')
            print(f'  If you want to Assign a Native VLAN Make sure it is in the vlan list for this wizard.')
            print(f'  IMPORTANT NOTE: You can only have one Native VLAN for the Fabric at this time,')
            print(f'                  as Disjoint Layer 2 is not yet supported.\n')
            print(f'  This wizard will save the configuraton for this section to the following file:')
            print(f'  - Intersight/{org}/{self.type}/{templateVars["template_type"]}.auto.tfvars')
            print(f'\n-------------------------------------------------------------------------------------------\n')
            policy_loop = False
            while policy_loop == False:
                if not name_prefix == '':
                    name = '%s_%s' % (name_prefix, name_suffix)
                else:
                    name = '%s_%s' % (org, name_suffix)

                templateVars["name"] = policy_name(name, policy_type)
                templateVars["descr"] = policy_descr(templateVars["name"], policy_type)
                templateVars["auto_allow_on_uplinks"] = True

                valid = False
                while valid == False:
                    vlan_list = '%s' % (input(f'Enter the VLAN or List of VLANs to add to {templateVars["name"]}: '))
                    if not vlan_list == '':
                        vlan_list_expanded = vlan_list_full(vlan_list)
                        valid_vlan = True
                        for vlan in vlan_list_expanded:
                            valid_vlan = validating_ucs.number_in_range('VLAN ID', vlan, 1, 4094)
                            if valid_vlan == False:
                                break
                        native_count = 0
                        native_vlan = ''
                        native_name = ''
                        if valid_vlan == True:
                            valid_name = False
                            while valid_name == False:
                                if len(vlan_list_expanded) == 1:
                                    vlan_name = '%s' % (input(f'Enter the Name you want to assign to "{vlan_list}": '))
                                    valid_name = validating_ucs.name_rule('VLAN Name', vlan_name, 1, 62)
                                else:
                                    vlan_name = '%s' % (input(f'Enter the Prefix Name you want to assign to "{vlan_list}": '))
                                    valid_name = validating_ucs.name_rule('VLAN Name', vlan_name, 1, 55)
                            native_vlan = input('Do you want to configure one of the VLANs as a Native VLAN? [press enter to skip]:')
                        if not native_vlan == '' and valid_vlan == True:
                            for vlan in vlan_list_expanded:
                                if int(native_vlan) == int(vlan):
                                    native_count = 1
                            if native_count == 1:
                                valid_name = False
                                while valid_name == False:
                                    native_name = '%s' % (input(f'Enter the Name to assign to the Native VLAN {native_vlan}.  [default]: '))
                                    if native_name == '':
                                        native_name = 'default'
                                    valid_name = validating_ucs.name_rule('VLAN Name', vlan_name, 1, 62)
                                valid = True
                            else:
                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                print(f'  Error!! The Native VLAN was not in the Allowed List.')
                                print(f'\n-------------------------------------------------------------------------------------------\n')

                        elif valid_vlan == True:
                            valid = True
                    else:
                        print(f'\n-------------------------------------------------------------------------------------------\n')
                        print(f'  The allowed vlan list can be in the format of:')
                        print(f'     5 - Single VLAN')
                        print(f'     1-10 - Range of VLANs')
                        print(f'     1,2,3,4,5,11,12,13,14,15 - List of VLANs')
                        print(f'     1-10,20-30 - Ranges and Lists of VLANs')
                        print(f'\n-------------------------------------------------------------------------------------------\n')

                policy_list = [
                    'multicast_policies',
                ]
                templateVars["allow_opt_out"] = False
                for policy in policy_list:
                    policy_short = policy.replace('policies', 'policy')
                    templateVars["policies"] = policies.get(policy)
                    if len(templateVars["policies"]) == 1:
                        for v in templateVars["policies"]:
                            templateVars[policy_short] = v
                    else:
                        templateVars[policy_short] = choose_policy(policy, **templateVars)

                if not native_vlan == '' and len(vlan_list) > 1:
                    templateVars["vlans"] = [
                        {
                            'auto_allow_on_uplinks':True,
                            'id':native_vlan,
                            'multicast_policy':templateVars["multicast_policy"],
                            'name':native_name,
                            'native_vlan':True
                        },
                        {
                            'auto_allow_on_uplinks':True,
                            'id':vlan_list,
                            'multicast_policy':templateVars["multicast_policy"],
                            'name':vlan_name,
                            'native_vlan':False
                        }
                    ]
                elif not native_vlan == '' and len(vlan_list) == 1:
                    templateVars["vlans"] = [
                        {
                            'auto_allow_on_uplinks':True,
                            'id':native_vlan,
                            'multicast_policy':templateVars["multicast_policy"],
                            'name':native_name,
                            'native_vlan':True
                        }
                    ]
                else:
                    templateVars["vlans"] = [
                        {
                            'auto_allow_on_uplinks':True,
                            'id':vlan_list,
                            'multicast_policy':templateVars["multicast_policy"],
                            'name':vlan_name,
                            'native_vlan':False
                        }
                    ]

                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Do you want to accept the following configuration?')
                print(f'   description      = "{templateVars["descr"]}"')
                print(f'   multicast_policy = "{templateVars["multicast_policy"]}"')
                print(f'   name             = "{templateVars["name"]}"')
                if not native_vlan == '':
                    print(f'   native_vlan      = "{native_vlan}"')
                    print(f'   native_vlan_name = "{native_name}"')
                print(f'   vlan_list        = "{vlan_list}"')
                print(f'   vlan_name        = "{vlan_name}"')
                print(f'\n-------------------------------------------------------------------------------------------\n')
                valid_confirm = False
                while valid_confirm == False:
                    confirm_policy = input('Enter "Y" or "N" [Y]: ')
                    if confirm_policy == 'Y' or confirm_policy == '':
                        confirm_policy = 'Y'

                        # Write Policies to Template File
                        templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                        write_to_template(self, **templateVars)

                        # Add Template Name to Policies Output
                        policy_names.append(templateVars["name"])

                        # Add VLANs to VLAN Policy List
                        vlan_policies_vlans.append({templateVars['name']:vlan_list_expanded})

                        configure_loop, policy_loop = exit_default_no(templateVars["policy_type"])
                        valid_confirm = True

                    elif confirm_policy == 'N':
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Starting {templateVars["policy_type"]} Section over.')
                        print(f'\n------------------------------------------------------\n')
                        valid_confirm = True

                    else:
                        print(f'\n------------------------------------------------------\n')
                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                        print(f'\n------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names,vlan_policies_vlans

    #========================================
    # VSAN Policy Module
    #========================================
    def vsan_policies(self, vlan_policies_vlans):
        vsan_policies_vsans = []
        name_prefix = self.name_prefix
        org = self.org
        policy_names = []
        policy_type = 'VSAN Policy'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'vsan_policies'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  You can Skip this policy if you are not configuring Fibre-Channel.\n')
            print(f'  A {policy_type} will define the VSANs Assigned to the Fabric Interconnects.  You will need')
            print(f'  one VSAN Policy for Fabric A and another VSAN Policy for Fabric B.\n')
            print(f'  IMPORTANT Note: The Fabric Interconnects will encapsulate Fibre-Channel traffic locally')
            print(f'                  in a FCoE (Fibre-Channel over Ethernet) VLAN.  This VLAN Must not be')
            print(f'                  already used by the VLAN Policy.\n')
            print(f'  This wizard will save the configuraton for this section to the following file:')
            print(f'  - Intersight/{org}/{self.type}/{templateVars["template_type"]}.auto.tfvars')
            print(f'\n-------------------------------------------------------------------------------------------\n')
            configure = input(f'Do You Want to Configure a {policy_type}?  Enter "Y" or "N" [Y]: ')
            if configure == 'Y' or configure == '':
                loop_count = 0
                policy_loop = False
                while policy_loop == False:

                    name = naming_rule_fabric(loop_count, name_prefix, org)

                    templateVars["name"] = policy_name(name, policy_type)
                    templateVars["descr"] = policy_descr(templateVars["name"], policy_type)
                    templateVars["auto_allow_on_uplinks"] = True

                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    print(f'  Uplink Trunking: Default is No.')
                    print(f'     Most deployments do not enable Uplink Trunking for Fibre-Channel. ')
                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    valid = False
                    while valid == False:
                        uplink_trunking = input('Do you want to Enable Uplink Trunking for this VSAN Policy? [N]? ')
                        if uplink_trunking == 'Y':
                            templateVars["uplink_trunking"] = True
                            valid = True
                        else:
                            templateVars["uplink_trunking"] = False
                            valid = True

                    templateVars["vsans"] = []
                    vsan_count = 0
                    vsan_loop = False
                    while vsan_loop == False:
                        valid = False
                        while valid == False:
                            if loop_count % 2 == 0:
                                vsan_id = input(f'Enter the VSAN id to add to {templateVars["name"]}. [100]: ')
                            else:
                                vsan_id = input(f'Enter the VSAN id to add to {templateVars["name"]}. [200]: ')
                            if loop_count % 2 == 0 and vsan_id == '':
                                vsan_id = 100
                            elif vsan_id == '':
                                vsan_id = 200
                            if re.search(r'[0-9]{1,4}', str(vsan_id)):
                                valid = validating_ucs.number_in_range('VSAN ID', vsan_id, 1, 4094)
                            else:
                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                print(f'  Invalid Entry!  Please Enter a VSAN ID in the range of 1-4094.')
                                print(f'\n-------------------------------------------------------------------------------------------\n')

                        valid = False
                        while valid == False:
                            fcoe_id = input(f'Enter the VLAN id for the FCOE VLAN to encapsulate "{vsan_id}" over Ethernet.  [{vsan_id}]: ')
                            if fcoe_id == '':
                                fcoe_id = vsan_id
                            if re.search(r'[0-9]{1,4}', str(fcoe_id)):
                                valid_vlan = validating_ucs.number_in_range('VSAN ID', fcoe_id, 1, 4094)
                                if valid_vlan == True:
                                    policy_list = [
                                        'vlan_policies',
                                    ]
                                    for policy in policy_list:
                                        templateVars["policy_short"] = policy.replace('policies', 'policy')
                                        templateVars["allow_opt_out"] = False
                                        templateVars["policies"] = []
                                        for item in vlan_policies_vlans:
                                            for k, v in item.items():
                                                templateVars["policies"].append(k)
                                        if len(templateVars["policies"]) == 1:
                                            for item in vlan_policies_vlans:
                                                for k, v in item.items():
                                                    domain_vlan_list = v
                                                    vlan_list_name = k
                                        else:
                                            vlan_list_name = choose_policy(policy, **templateVars)
                                            for item in vlan_policies_vlans:
                                                for k, v in item.items():
                                                    if k == vlan_list_name:
                                                        domain_vlan_list = v
                                                        break

                                    overlap = False
                                    for vlan in domain_vlan_list:
                                        if int(vlan) == int(fcoe_id):
                                            print(f'\n-------------------------------------------------------------------------------------------\n')
                                            print(f'  Error!!  The FCoE VLAN {fcoe_id} is already assigned to the VLAN Policy')
                                            print(f'  {vlan_list_name}.  Please choose a VLAN id that is not already in use.')
                                            print(f'\n-------------------------------------------------------------------------------------------\n')
                                            overlap = True
                                            break
                                    if overlap == False:
                                        valid = True
                                else:
                                    print(f'\n-------------------------------------------------------------------------------------------\n')
                                    print(f'  Invalid Entry!  Please Enter a valid VLAN ID in the range of 1-4094.')
                                    print(f'\n-------------------------------------------------------------------------------------------\n')

                            else:
                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                print(f'  Invalid Entry!  Please Enter a valid VLAN ID in the range of 1-4094.')
                                print(f'\n-------------------------------------------------------------------------------------------\n')

                        valid = False
                        while valid == False:
                            if loop_count % 2 == 0:
                                vsan_name = input(f'What Name would you like to assign to "{vsan_id}"?  [VSAN-A]: ')
                            else:
                                vsan_name = input(f'What Name would you like to assign to "{vsan_id}"?  [VSAN-B]: ')
                            if loop_count % 2 == 0 and vsan_name == '':
                                vsan_name = 'VSAN-A'
                            elif vsan_name == '':
                                vsan_name = 'VSAN-B'
                            valid = validating_ucs.name_rule('VSAN Name', vsan_name, 1, 62)

                        vsan = {
                            'fcoe_vlan_id':fcoe_id,
                            'name':vsan_name,
                            'id':vsan_id
                        }
                        print(f'\n-------------------------------------------------------------------------------------------\n')
                        print(f'  Do you want to accept the following configuration?')
                        print(f'   fcoe_vlan_id = {fcoe_id}')
                        print(f'   vsan_id      = {vsan_id}')
                        print(f'   vsan_name    = "{vsan_name}"')
                        print(f'\n-------------------------------------------------------------------------------------------\n')
                        valid_confirm = False
                        while valid_confirm == False:
                            confirm_vsan = input('Enter "Y" or "N" [Y]: ')
                            if confirm_vsan == 'Y' or confirm_vsan == '':
                                templateVars['vsans'].append(vsan)
                                valid_exit = False
                                while valid_exit == False:
                                    vsan_exit = input(f'Would You like to Configure another VSAN?  Enter "Y" or "N" [N]: ')
                                    if vsan_exit == 'Y':
                                        vsan_count += 1
                                        valid_confirm = True
                                        valid_exit = True
                                    elif vsan_exit == 'N' or vsan_exit == '':
                                        vsan_loop = True
                                        valid_confirm = True
                                        valid_exit = True
                                    else:
                                        print(f'\n------------------------------------------------------\n')
                                        print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                                        print(f'\n------------------------------------------------------\n')

                            elif confirm_vsan == 'N':
                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                print(f'  Starting VSAN Configuration Over.')
                                print(f'\n-------------------------------------------------------------------------------------------\n')
                                valid_confirm = True
                            else:
                                print(f'\n------------------------------------------------------\n')
                                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                                print(f'\n------------------------------------------------------\n')

                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    print(f'  Do you want to accept the following configuration?')
                    print(f'    description     = "{templateVars["descr"]}"')
                    print(f'    name            = "{templateVars["name"]}"')
                    print(f'    uplink_trunking = {templateVars["uplink_trunking"]}')
                    print(f'    vsans           = [')
                    item_count = 1
                    for item in templateVars["vsans"]:
                        print(f'      {item_count} = ''{')
                        for k, v in item.items():
                            if k == 'fcoe_vlan_id':
                                print(f'        fcoe_vlan_id = {v}')
                            elif k == 'name':
                                print(f'        name         = {v}')
                            elif k == 'id':
                                print(f'        vsan_id      = {v}')
                        print('      }')
                        item_count += 1
                    print(f'    ]')
                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    valid_confirm = False
                    while valid_confirm == False:
                        confirm_policy = input('Enter "Y" or "N" [Y]: ')
                        if confirm_policy == 'Y' or confirm_policy == '':
                            confirm_policy = 'Y'

                            # Write Policies to Template File
                            templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                            write_to_template(self, **templateVars)

                            # Add Template Name to Policies Output
                            policy_names.append(templateVars["name"])

                            # Add VSANs to VSAN Policy List
                            vsan_policies_vsans.append({templateVars['name']:templateVars["vsans"]})

                            configure_loop, loop_count, policy_loop = exit_loop_default_yes(loop_count, policy_type)
                            valid_confirm = True

                        elif confirm_policy == 'N':
                            print(f'\n------------------------------------------------------\n')
                            print(f'  Starting {policy_type} Section over.')
                            print(f'\n------------------------------------------------------\n')
                            valid_confirm = True

                        else:
                            print(f'\n------------------------------------------------------\n')
                            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                            print(f'\n------------------------------------------------------\n')

            elif configure == 'N':
                configure_loop = True
            else:
                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                print(f'\n-------------------------------------------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names,vsan_policies_vsans

    #========================================
    # WWNN Pools Module
    #========================================
    def wwnn_pools(self):
        name_prefix = self.name_prefix
        name_suffix = 'wwnn_pool'
        org = self.org
        policy_names = []
        policy_type = 'WWNN Pool'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'wwnn_pools'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  WWNN Pool Convention Recommendations:')
            print(f'  - Leverage the Cisco UCS OUI of 20:00:00:25:B5 for the WWNN Pool Prefix.')
            print(f'  - Pool Size can be between 1 and 1000 addresses.')
            print(f'  - Refer to "UCS Naming Conventions 0.5.ppsx" in the Repository for further guidance.\n')
            print(f'  This wizard will save the configuraton for this section to the following file:')
            print(f'  - Intersight/{org}/{self.type}/{templateVars["template_type"]}.auto.tfvars')
            print(f'\n-------------------------------------------------------------------------------------------\n')
            configure = input(f'Do You Want to Configure a {policy_type}?  Enter "Y" or "N" [Y]: ')
            if configure == 'Y' or configure == '':
                policy_loop = False
                while policy_loop == False:

                    if not name_prefix == '':
                        name = '%s_%s' % (name_prefix, name_suffix)
                    else:
                        name = '%s_%s' % (org, name_suffix)

                    templateVars["name"] = policy_name(name, policy_type)
                    templateVars["descr"] = policy_descr(templateVars["name"], policy_type)

                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    print(f'  Assignment order decides the order in which the next identifier is allocated.')
                    print(f'    1. default - (Intersight Default) Assignment order is decided by the system.')
                    print(f'    2. sequential - (Recommended) Identifiers are assigned in a sequential order.')
                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    valid = False
                    while valid == False:
                        templateVars["assignment_order"] = input('Specify the number for the value to select.  [2]: ')
                        if templateVars["assignment_order"] == '' or templateVars["assignment_order"] == '2':
                            templateVars["assignment_order"] = 'sequential'
                            valid = True
                        elif templateVars["assignment_order"] == '1':
                            templateVars["assignment_order"] = 'default'
                            valid = True
                        else:
                            print(f'\n-------------------------------------------------------------------------------------------\n')
                            print(f'  Error!! Invalid Option.  Please Select a valid option from the List.')
                            print(f'\n-------------------------------------------------------------------------------------------\n')

                    valid = False
                    while valid == False:
                        begin = input('What is the Beginning WWNN Address to Assign to the Pool?  [20:00:00:25:B5:00:00:00]: ')
                        if begin == '':
                            begin = '20:00:00:25:B5:00:00:00'
                        valid = validating_ucs.wwxn_address('WWNN Pool Address', begin)

                    valid = False
                    while valid == False:
                        pool_size = input('How Many WWNN Addresses should be added to the Pool?  Range is 1-1000 [512]: ')
                        if pool_size == '':
                            pool_size = '512'
                        valid = validating_ucs.number_in_range('Pool Size', pool_size, 1, 1000)

                    begin = begin.upper()
                    beginx = int(begin.replace(':', ''), 16)
                    add_dec = (beginx + int(pool_size))
                    ending = ':'.join(['{}{}'.format(a, b)
                        for a, b
                        in zip(*[iter('{:012x}'.format(add_dec))]*2)])
                    ending = ending.upper()
                    templateVars["wwnn_blocks"] = [{'from':begin, 'to':ending}]

                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    print(f'  Do you want to accept the following configuration?')
                    print(f'    assignment_order = "{templateVars["assignment_order"]}"')
                    print(f'    description      = "{templateVars["descr"]}"')
                    print(f'    name             = "{templateVars["name"]}"')
                    print(f'    wwnn_blocks = [')
                    for item in templateVars["wwnn_blocks"]:
                        print('      {')
                        for k, v in item.items():
                            if k == 'from':
                                print(f'        from = "{v}" ')
                            elif k == 'to':
                                print(f'        to   = "{v}"')
                        print('      }')
                    print(f'    ]')
                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    valid_confirm = False
                    while valid_confirm == False:
                        confirm_policy = input('Enter "Y" or "N" [Y]: ')
                        if confirm_policy == 'Y' or confirm_policy == '':
                            confirm_policy = 'Y'

                            # Write Policies to Template File
                            templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                            write_to_template(self, **templateVars)

                            # Add Template Name to Policies Output
                            policy_names.append(templateVars["name"])

                            configure_loop, policy_loop = exit_default_no(templateVars["policy_type"])
                            valid_confirm = True

                        elif confirm_policy == 'N':
                            print(f'\n------------------------------------------------------\n')
                            print(f'  Starting {templateVars["policy_type"]} Section over.')
                            print(f'\n------------------------------------------------------\n')
                            valid_confirm = True

                        else:
                            print(f'\n------------------------------------------------------\n')
                            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                            print(f'\n------------------------------------------------------\n')

            elif configure == 'N':
                configure_loop = True
            else:
                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                print(f'\n-------------------------------------------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

    #========================================
    # WWPN Pools Module
    #========================================
    def wwpn_pools(self):
        name_prefix = self.name_prefix
        org = self.org
        policy_names = []
        policy_type = 'WWPN Pool'
        templateVars = {}
        templateVars["header"] = '%s Variables' % (policy_type)
        templateVars["initial_write"] = True
        templateVars["org"] = org
        templateVars["policy_type"] = policy_type
        templateVars["template_file"] = 'template_open.jinja2'
        templateVars["template_type"] = 'wwpn_pools'

        # Open the Template file
        write_to_template(self, **templateVars)
        templateVars["initial_write"] = False

        configure_loop = False
        while configure_loop == False:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  WWPN Pool Convention Recommendations:')
            print(f'  - Leverage the Cisco UCS OUI of 20:00:00:25:B5 for the WWPN Pool Prefix.')
            print(f'  - For WWPN Pools; create a pool for each Fabric.')
            print(f'  - Pool Size can be between 1 and 1000 addresses.')
            print(f'  - Refer to "UCS Naming Conventions 0.5.ppsx" in the Repository for further guidance.\n')
            print(f'  This wizard will save the configuraton for this section to the following file:')
            print(f'  - Intersight/{org}/{self.type}/{templateVars["template_type"]}.auto.tfvars')
            print(f'\n-------------------------------------------------------------------------------------------\n')
            configure = input(f'Do You Want to Configure a {policy_type}?  Enter "Y" or "N" [Y]: ')
            if configure == 'Y' or configure == '':
                loop_count = 0
                policy_loop = False
                while policy_loop == False:

                    name = naming_rule_fabric(loop_count, name_prefix, org)

                    templateVars["name"] = policy_name(name, policy_type)
                    templateVars["descr"] = policy_descr(templateVars["name"], policy_type)

                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    print(f'  Assignment order decides the order in which the next identifier is allocated.')
                    print(f'    1. default - (Intersight Default) Assignment order is decided by the system.')
                    print(f'    2. sequential - (Recommended) Identifiers are assigned in a sequential order.')
                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    valid = False
                    while valid == False:
                        templateVars["assignment_order"] = input('Specify the number for the value to select.  [2]: ')
                        if templateVars["assignment_order"] == '' or templateVars["assignment_order"] == '2':
                            templateVars["assignment_order"] = 'sequential'
                            valid = True
                        elif templateVars["assignment_order"] == '1':
                            templateVars["assignment_order"] = 'default'
                            valid = True
                        else:
                            print(f'\n-------------------------------------------------------------------------------------------\n')
                            print(f'  Error!! Invalid Option.  Please Select a valid option from the List.')
                            print(f'\n-------------------------------------------------------------------------------------------\n')

                    valid = False
                    while valid == False:
                        if loop_count % 2 == 0:
                            begin = input('What is the Beginning WWPN Address to Assign to the Pool?  [20:00:00:25:B5:0A:00:00]: ')
                        else:
                            begin = input('What is the Beginning WWPN Address to Assign to the Pool?  [20:00:00:25:B5:0B:00:00]: ')
                        if begin == '':
                            if loop_count % 2 == 0:
                                begin = '20:00:00:25:B5:0A:00:00'
                            else:
                                begin = '20:00:00:25:B5:0B:00:00'
                        valid = validating_ucs.wwxn_address('WWPN Pool Address', begin)

                    valid = False
                    while valid == False:
                        pool_size = input('How Many WWPN Addresses should be added to the Pool?  Range is 1-1000 [512]: ')
                        if pool_size == '':
                            pool_size = '512'
                        valid = validating_ucs.number_in_range('Pool Size', pool_size, 1, 1000)

                    begin = begin.upper()
                    beginx = int(begin.replace(':', ''), 16)
                    add_dec = (beginx + int(pool_size))
                    ending = ':'.join(['{}{}'.format(a, b)
                        for a, b
                        in zip(*[iter('{:012x}'.format(add_dec))]*2)])
                    ending = ending.upper()
                    templateVars["wwpn_blocks"] = [{'from':begin, 'to':ending}]

                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    print(f'  Do you want to accept the following configuration?')
                    print(f'    assignment_order = "{templateVars["assignment_order"]}"')
                    print(f'    description      = "{templateVars["descr"]}"')
                    print(f'    name             = "{templateVars["name"]}"')
                    print(f'    wwpn_blocks = [')
                    for item in templateVars["wwpn_blocks"]:
                        print('      {')
                        for k, v in item.items():
                            if k == 'from':
                                print(f'        from = "{v}" ')
                            elif k == 'to':
                                print(f'        to   = "{v}"')
                        print('      }')
                    print(f'    ]')
                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    valid_confirm = False
                    while valid_confirm == False:
                        confirm_policy = input('Enter "Y" or "N" [Y]: ')
                        if confirm_policy == 'Y' or confirm_policy == '':
                            confirm_policy = 'Y'

                            # Write Policies to Template File
                            templateVars["template_file"] = '%s.jinja2' % (templateVars["template_type"])
                            write_to_template(self, **templateVars)

                            # Add Template Name to Policies Output
                            policy_names.append(templateVars["name"])

                            configure_loop, loop_count, policy_loop = exit_loop_default_yes(loop_count, policy_type)
                            valid_confirm = True

                        elif confirm_policy == 'N':
                            print(f'\n------------------------------------------------------\n')
                            print(f'  Starting {policy_type} Section over.')
                            print(f'\n------------------------------------------------------\n')
                            valid_confirm = True

                        else:
                            print(f'\n------------------------------------------------------\n')
                            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                            print(f'\n------------------------------------------------------\n')

            elif configure == 'N':
                configure_loop = True
            else:
                print(f'\n------------------------------------------------------\n')
                print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                print(f'\n------------------------------------------------------\n')

        # Close the Template file
        templateVars["template_file"] = 'template_close.jinja2'
        write_to_template(self, **templateVars)

        return policy_names

def choose_policy(policy, **templateVars):
    if 'policies' in policy:
        policy_short = policy.replace('policies', 'policy')
    elif 'pools' in policy:
        policy_short = policy.replace('pools', 'pool')
    x = policy_short.split('_')
    policy_description = []
    for y in x:
        y = y.capitalize()
        policy_description.append(y)
    policy_description = " ".join(policy_description)
    policy_description = policy_description.replace('Ip', 'IP')
    policy_description = policy_description.replace('Ntp', 'NTP')
    policy_description = policy_description.replace('Snmp', 'SNMP')

    if len(policy) > 0:
        templateVars["policy"] = policy_description
        policy_short = policies_list(templateVars["policies"], **templateVars)
    else:
        policy_short = ""
    return policy_short

def exit_default_no(policy_type):
    valid_exit = False
    while valid_exit == False:
        exit_answer = input(f'Would You like to Configure another {policy_type}?  Enter "Y" or "N" [N]: ')
        if exit_answer == '' or exit_answer == 'N':
            policy_loop = True
            configure_loop = True
            valid_exit = True
        elif exit_answer == 'Y':
            policy_loop = False
            configure_loop = False
            valid_exit = True
        else:
            print(f'\n------------------------------------------------------\n')
            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
            print(f'\n------------------------------------------------------\n')
    return configure_loop, policy_loop

def exit_default_yes(policy_type):
    valid_exit = False
    while valid_exit == False:
        exit_answer = input(f'Would You like to Configure another {policy_type}?  Enter "Y" or "N" [Y]: ')
        if exit_answer == '' or exit_answer == 'Y':
            policy_loop = False
            configure_loop = False
            valid_exit = True
        elif exit_answer == 'N':
            policy_loop = True
            configure_loop = True
            valid_exit = True
        else:
            print(f'\n------------------------------------------------------\n')
            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
            print(f'\n------------------------------------------------------\n')
    return configure_loop, policy_loop

def exit_loop_default_yes(loop_count, policy_type):
    valid_exit = False
    while valid_exit == False:
        if loop_count % 2 == 0:
            exit_answer = input(f'Would You like to Configure another {policy_type}?  Enter "Y" or "N" [Y]: ')
        else:
            exit_answer = input(f'Would You like to Configure another {policy_type}?  Enter "Y" or "N" [N]: ')
        if (loop_count % 2 == 0 and exit_answer == '') or exit_answer == 'Y':
            policy_loop = False
            configure_loop = False
            loop_count += 1
            valid_exit = True
        elif not loop_count % 2 == 0 and exit_answer == '':
            policy_loop = True
            configure_loop = True
            valid_exit = True
        elif exit_answer == 'N':
            policy_loop = True
            configure_loop = True
            valid_exit = True
        else:
            print(f'\n------------------------------------------------------\n')
            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
            print(f'\n------------------------------------------------------\n')
    return configure_loop, loop_count, policy_loop

def naming_rule(name_prefix, name_suffix, org):
    if not name_prefix == '':
        name = '%s_%s' % (name_prefix, name_suffix)
    else:
        name = '%s_%s' % (org, name_suffix)
    return name

def naming_rule_fabric(loop_count, name_prefix, org):
    if loop_count % 2 == 0:
        if not name_prefix == '':
            name = '%s_A' % (name_prefix)
        elif not org == 'default':
            name = '%s_A' % (org)
        else:
            name = 'Fabric_A'
    else:
        if not name_prefix == '':
            name = '%s_B' % (name_prefix)
        elif not org == 'default':
            name = '%s_B' % (org)
        else:
            name = 'Fabric_B'
    return name

def policies_list(policies_list, **templateVars):
    valid = False
    while valid == False:
        print(f'\n-------------------------------------------------------------------------------------------\n')
        print(f'  {templateVars["policy"]} Options:')
        for i, v in enumerate(policies_list):
            i += 1
            if i < 10:
                print(f'     {i}. {v}')
            else:
                print(f'    {i}. {v}')
        if templateVars["allow_opt_out"] == True:
            print(f'     99. Do not assign a(n) {templateVars["policy"]}.')
        print(f'\n-------------------------------------------------------------------------------------------\n')
        policy_temp = input(f'Enter the Index for the {templateVars["policy"]} to Assign to {templateVars["name"]}: ')
        for i, v in enumerate(policies_list):
            i += 1
            if int(policy_temp) == i:
                policy = v
                valid = True
                return policy
            elif int(policy_temp) == 99:
                policy = ''
                valid = True
                return policy

        if policy_temp == '':
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  Error!! Invalid Selection.  Please Select a valid Index from the List.')
            print(f'\n-------------------------------------------------------------------------------------------\n')
        elif int(policy_temp) == 99:
            policy = ''
            valid = True
            return policy

def policy_loop_standard(self, header, initial_policy, template_type):
    # Set the org_count to 0 for the First Organization
    org_count = 0

    # Loop through the orgs discovered by the Class
    for org in self.orgs:

        # Pull in Variables from Class
        templateVars = self.templateVars
        templateVars["org"] = org

        # Define the Template Source
        templateVars["header"] = header
        templateVars["template_type"] = template_type
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

        if template_type in self.json_data["config"]["orgs"][org_count]:
            for item in self.json_data["config"]["orgs"][org_count][template_type]:
                # Reset TemplateVars to Default for each Loop
                templateVars = {}
                templateVars["org"] = org

                # Define the Template Source
                templateVars["header"] = header

                # Loop Through Json Items to Create templateVars Blocks
                for k, v in item.items():
                    templateVars[k] = v

                # if template_type == 'iscsi_boot_policies':
                #     print(templateVars)
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

def policy_descr(name, policy_type):
    valid = False
    while valid == False:
        descr = input(f'What is the Description for the {policy_type}?  [{name} {policy_type}]: ')
        if descr == '':
            descr = '%s %s' % (name, policy_type)
        valid = validating_ucs.description(f'{policy_type} Description', descr, 1, 62)
        if valid == True:
            return descr

def policy_name(namex, policy_type):
    valid = False
    while valid == False:
        name = input(f'What is the Name for the {policy_type}?  [{namex}]: ')
        if name == '':
            name = '%s' % (namex)
        valid = validating_ucs.name_rule(f'{policy_type} Name', name, 1, 62)
        if valid == True:
            return name

def policy_template(self, **templateVars):
    policy_names = []
    configure_loop = False
    while configure_loop == False:
        policy_loop = False
        while policy_loop == False:

            valid = False
            while valid == False:
                policy_file = 'ucs_templates/variables/%s' % (templateVars["policy_file"])
                if os.path.isfile(policy_file):
                    template_file = open(policy_file, 'r')
                    template_file.seek(0)
                    policy_templates = []
                    for line in template_file:
                        line = line.strip()
                        policy_templates.append(line)
                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    print(f'  {templateVars["policy_type"]} Templates:')
                    for i, v in enumerate(policy_templates):
                        i += 1
                        if i < 10:
                            print(f'     {i}. {v}')
                        else:
                            print(f'    {i}. {v}')
                    print(f'\n-------------------------------------------------------------------------------------------\n')
                policy_temp = input(f'Enter the Index Number for the {templateVars["policy_type"]} Template to Create: ')
                for i, v in enumerate(policy_templates):
                    i += 1
                    if int(policy_temp) == i:
                        templateVars["policy_template"] = v
                        valid = True
                if valid == False:
                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    print(f'  Error!! Invalid Selection.  Please Select a valid Index from the List.')
                    print(f'\n-------------------------------------------------------------------------------------------\n')
                template_file.close()

            if not templateVars["name_prefix"] == '':
                name = '%s_%s' % (templateVars["name_prefix"], templateVars["policy_template"])
            else:
                name = '%s_%s' % (templateVars["org"], templateVars["policy_template"])

            templateVars["name"] = policy_name(name, templateVars["policy_type"])
            templateVars["descr"] = policy_descr(templateVars["name"], templateVars["policy_type"])

            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  Do you want to accept the following configuration?')
            if templateVars["template_type"] == 'bios_policies':
                print(f'   bios_template = "{templateVars["policy_template"]}"')
                print(f'   description   = "{templateVars["descr"]}"')
                print(f'   name          = "{templateVars["name"]}"')
            else:
                print(f'   adapter_template = "{templateVars["policy_template"]}"')
                print(f'   description      = "{templateVars["descr"]}"')
                print(f'   name             = "{templateVars["name"]}"')
            print(f'\n-------------------------------------------------------------------------------------------\n')
            valid_confirm = False
            while valid_confirm == False:
                confirm_policy = input('Enter "Y" or "N" [Y]: ')
                if confirm_policy == 'Y' or confirm_policy == '':
                    confirm_policy = 'Y'

                    # Write Policies to Template File
                    write_to_template(self, **templateVars)

                    # Add Template Name to Policies Output
                    policy_names.append(templateVars["name"])

                    configure_loop, policy_loop = exit_default_yes(templateVars["policy_type"])
                    valid_confirm = True

                elif confirm_policy == 'N':
                    print(f'\n------------------------------------------------------\n')
                    print(f'  Starting {templateVars["policy_type"]} Section over.')
                    print(f'\n------------------------------------------------------\n')
                    valid_confirm = True

                else:
                    print(f'\n------------------------------------------------------\n')
                    print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                    print(f'\n------------------------------------------------------\n')

    return policy_names

def vars_from_list(var_options, **templateVars):
    selection = []
    selection_count = 0
    valid = False
    while valid == False:
        print(f'\n---------------------------------------------------------------------------------------')
        print(f'{templateVars["var_description"]}')
        for index, value in enumerate(var_options):
            index += 1
            if index < 10:
                print(f'     {index}. {value}')
            else:
                print(f'    {index}. {value}')
        print(f'---------------------------------------------------------------------------------------\n')
        exit_answer = False
        while exit_answer == False:
            var_selection = input(f'Please Enter the Option Number to Select for {templateVars["var_type"]}: ')
            if not var_selection == '':
                if re.search(r'[0-9]+', str(var_selection)):
                    xcount = 1
                    for index, value in enumerate(var_options):
                        index += 1
                        if int(var_selection) == index:
                            selection.append(value)
                            xcount = 0
                    if xcount == 0:
                        if selection_count % 2 == 0 and templateVars["multi_select"] == True:
                            answer_finished = input(f'Would you like to add another port to the {templateVars["port_type"]}?  Enter "Y" or "N" [Y]: ')
                        elif templateVars["multi_select"] == True:
                            answer_finished = input(f'Would you like to add another port to the {templateVars["port_type"]}?  Enter "Y" or "N" [N]: ')
                        elif templateVars["multi_select"] == False:
                            answer_finished = 'N'
                        if (selection_count % 2 == 0 and answer_finished == '') or answer_finished == 'Y':
                            exit_answer = True
                            selection_count += 1
                        elif answer_finished == '' or answer_finished == 'N':
                            exit_answer = True
                            valid = True
                        elif templateVars["multi_select"] == False:
                            exit_answer = True
                            valid = True
                        else:
                            print(f'\n------------------------------------------------------\n')
                            print(f'  Error!! Invalid Value.  Please enter "Y" or "N".')
                            print(f'\n------------------------------------------------------\n')
                    else:
                        print(f'\n-------------------------------------------------------------------------------------------\n')
                        print(f'  Error!! Invalid Selection.  Please select a valid option from the List.')
                        print(f'\n-------------------------------------------------------------------------------------------\n')

                else:
                    print(f'\n-------------------------------------------------------------------------------------------\n')
                    print(f'  Error!! Invalid Selection.  Please Select a valid Option from the List.')
                    print(f'\n-------------------------------------------------------------------------------------------\n')
            else:
                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Error!! Invalid Selection.  Please Select a valid Option from the List.')
                print(f'\n-------------------------------------------------------------------------------------------\n')
    return selection

def process_method(wr_method, dest_dir, dest_file, template, **templateVars):
    dest_dir = './Intersight/%s/%s' % (templateVars["org"], dest_dir)
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

def variable_loop(**templateVars):
    valid = False
    while valid == False:
        print(f'\n---------------------------------------------------------------------------------------')
        print(f'{templateVars["var_description"]}')
        policy_file = 'ucs_templates/variables/%s' % (templateVars["policy_file"])
        if os.path.isfile(policy_file):
            variable_file = open(policy_file, 'r')
            varsx = []
            for line in variable_file:
                varsx.append(line.strip())
            for index, value in enumerate(varsx):
                index += 1
                if index < 10:
                    print(f'     {index}. {value}')
                else:
                    print(f'    {index}. {value}')
        print(f'---------------------------------------------------------------------------------------\n')
        var_selection = input(f'Please Enter the Option Number to Select for {templateVars["var_type"]}: ')
        if not var_selection == '':
            if re.search(r'[0-9]+', str(var_selection)):
                for index, value in enumerate(varsx):
                    index += 1
                    if int(var_selection) == index:
                        selection = value
                        valid = True
            else:
                print(f'\n-------------------------------------------------------------------------------------------\n')
                print(f'  Error!! Invalid Selection.  Please Select a valid Option from the List.')
                print(f'\n-------------------------------------------------------------------------------------------\n')
        else:
            print(f'\n-------------------------------------------------------------------------------------------\n')
            print(f'  Error!! Invalid Selection.  Please Select a valid Option from the List.')
            print(f'\n-------------------------------------------------------------------------------------------\n')
    return selection

def vlan_list_full(vlan_list):
    full_vlan_list = []
    if re.search(r',', str(vlan_list)):
        vlist = vlan_list.split(',')
        for v in vlist:
            if re.fullmatch('^\\d{1,4}\\-\\d{1,4}$', v):
                a,b = v.split('-')
                a = int(a)
                b = int(b)
                vrange = range(a,b+1)
                for vl in vrange:
                    full_vlan_list.append(vl)
            elif re.fullmatch('^\\d{1,4}$', v):
                full_vlan_list.append(v)
    elif re.search('\\-', str(vlan_list)):
        a,b = vlan_list.split('-')
        a = int(a)
        b = int(b)
        vrange = range(a,b+1)
        for v in vrange:
            full_vlan_list.append(v)
    else:
        full_vlan_list.append(vlan_list)
    return full_vlan_list

def write_to_template(self, **templateVars):
    # Define the Template Source
    template = self.templateEnv.get_template(templateVars["template_file"])

    # Process the template
    dest_dir = '%s' % (self.type)
    dest_file = '%s.auto.tfvars' % (templateVars["template_type"])
    if templateVars["initial_write"] == True:
        write_method = 'w'
    else:
        write_method = 'a'
    process_method(write_method, dest_dir, dest_file, template, **templateVars)
