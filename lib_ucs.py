#!/usr/bin/env python3

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
            dest_dir = 'profiles_%s' % (self.type)
            dest_file = '%s.auto.tfvars' % (template_type)
            process_method('w', dest_dir, dest_file, template, **templateVars)

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
                    dest_dir = 'profiles_%s' % (self.type)
                    dest_file = '%s.auto.tfvars' % (template_type)
                    process_method('a', dest_dir, dest_file, template, **templateVars)

            # Define the Template Source
            template_file = "template_close.jinja2"
            template = self.templateEnv.get_template(template_file)

            # Process the template
            dest_dir = 'profiles_%s' % (self.type)
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

    def device_connector_policies(self, json_data):
        # Define the Template Source
        template_file = "device_connector.jinja2"
        template = self.templateEnv.get_template(template_file)

        # Variables
        templateVars = self.templateVars
        templateVars['lockout'] = json_data['config']['device_connector'][0]['proxy_state']

        # Process the template
        dest_dir = 'profiles_servers'
        dest_file = '%s.auto.tfvars' % templateVars['org']
        wr_method = 'a'
        process_method(wr_method, dest_dir, dest_file, template, **templateVars)

    def flow_control_policies(self):
        header = 'Flow Control Policies'
        initial_policy = True
        template_type = 'flow_control_policies'

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

    def multicast_policies(self):
        header = 'Multicast Policies'
        initial_policy = True
        template_type = 'multicast_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def network_connectivity_policies(self, json_data):
        # Define the Template Source
        template_file = "network_connectivity.jinja2"
        template = self.templateEnv.get_template(template_file)

        # Variables
        templateVars = self.templateVars
        templateVars['dns_servers'] = json_data['config']['dns']

        # Process the template
        dest_dir = 'profiles_domains'
        dest_file = '%s.auto.tfvars' % templateVars['org']
        wr_method = 'a'
        process_method(wr_method, dest_dir, dest_file, template, **templateVars)

        dest_dir = 'profiles_servers'
        process_method(wr_method, dest_dir, dest_file, template, **templateVars)

    def ntp_policies(self, json_data):
        # Define the Template Source
        template_file = "ntp.jinja2"
        template = self.templateEnv.get_template(template_file)

        # Variables
        templateVars = self.templateVars
        templateVars['ntp_servers'] = json_data['config']['timezone_mgmt'][0]['ntp']
        templateVars['timezone'] = json_data['config']['timezone_mgmt'][0]['zone']

        # Process the template
        dest_dir = 'profiles_servers'
        dest_file = '%s.auto.tfvars' % templateVars['org']
        wr_method = 'a'
        process_method(wr_method, dest_dir, dest_file, template, **templateVars)

        templateVars['name'] = '%s_sw' % (templateVars['name'])
        dest_dir = 'profiles_domains'
        process_method(wr_method, dest_dir, dest_file, template, **templateVars)

    def switch_control_policies(self):
        header = 'Switch Control Policies'
        initial_policy = True
        template_type = 'switch_control_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

    def system_qos_policies(self):
        header = 'System QoS'
        initial_policy = True
        template_type = 'system_qos_policies'

        policy_loop_standard(self, header, initial_policy, template_type)

        # total_weight = 0
        # total_weight += int(templateVars['fc_weight'])
        #
        # priorities = ['best_effort', 'bronze', 'gold', 'platinum', 'silver']
        #
        # for p in priorities:
        #     xstate = '%s_admin_state' % (p)
        #     xweight = '%s_weight' % (p)
        #     if templateVars[xstate] == 'Enabled':
        #         total_weight += int(templateVars[xweight])
        #
        # x = ((int(templateVars['fc_weight']) / total_weight) * 100)
        # templateVars['fc_bandwidth'] = str(x).split('.')[0]
        #
        # for p in priorities:
        #     xbandwidth = '%s_bandwidth' % (p)
        #     xstate = '%s_admin_state' % (p)
        #     xweight = '%s_weight' % (p)
        #     if templateVars[xstate] == 'Enabled':
        #         x = ((int(templateVars[xweight]) / total_weight) * 100)
        #         templateVars[xbandwidth] = str(x).split('.')[0]
        #     else:
        #         templateVars[xbandwidth] = 0
        #
        # # Process the template
        # dest_dir = 'profiles_domains'
        # dest_file = '%s.auto.tfvars' % templateVars['org']
        # wr_method = 'a'
        # process_method(wr_method, dest_dir, dest_file, template, **templateVars)

    def vlans(self, json_data):
        # Define the Template Source
        template_file = "vlan_policy.jinja2"
        template = self.templateEnv.get_template(template_file)

        # Variables
        templateVars = self.templateVars
        templateVars['vlans'] = json_data['config']['vlans']
        for v in templateVars['vlans']:
            if not (v.get('native_vlan') is None):
                templateVars['native_vlan'] = v['id']
                print(f'\n=============================================================\r')
                print(f'  Removing Native Vlan from vlan list.  Native vlan key is:\r')
                print(f'  * {v}\r')
                print(f'=============================================================\r\n')
                templateVars['vlans'].remove(v)

        # Process the template
        dest_dir = 'profiles_domains_vlans'
        dest_file = '%s.auto.tfvars' % templateVars['org']
        wr_method = 'w'
        process_method(wr_method, dest_dir, dest_file, template, **templateVars)


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
        dest_dir = 'profiles_%s' % (self.type)
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
                dest_dir = 'profiles_%s' % (self.type)
                dest_file = '%s.auto.tfvars' % (template_type)
                process_method('a', dest_dir, dest_file, template, **templateVars)

        # Define the Template Source
        template_file = "template_close.jinja2"
        template = self.templateEnv.get_template(template_file)

        # Process the template
        dest_dir = 'profiles_%s' % (self.type)
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
    if not os.path.isfile(dest_file):
        create_file = 'touch %s' % (dest_file)
        os.system(create_file)
    tf_file = '%s/%s' % (dest_dir, dest_file)
    wr_file = open(tf_file, wr_method)

    # Render Payload and Write to File
    payload = template.render(templateVars)
    wr_file.write(payload)
    wr_file.close()

