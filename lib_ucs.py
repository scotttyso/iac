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
    def bios(self, json_data):
        # Define the Template Source
        template_file = "bios_open.jinja2"
        template = self.templateEnv.get_template(template_file)

        # Variables
        templateVars = self.templateVars

        # Process the template
        dest_dir = 'profiles_servers'
        dest_file = '%s.auto.tfvars' % templateVars['org']
        wr_method = 'w'
        process_method(wr_method, dest_dir, dest_file, template, **templateVars)


        # Define the Template Source
        template_file = "bios.jinja2"
        template = self.templateEnv.get_template(template_file)

        for i in json_data['config']['orgs'][0]['bios_policies']:
            templateVars['bios'] = {}
            jfile = 'bios_map.json'
            jopen = open(jfile, 'r')
            jdata = json.load(jopen)
            for k, v in i.items():
                if k == 'name':
                    print(f'\n-------------------------------------------------\r')
                    print(f'Converting BIOS Policy {v}')
                    print(f'-------------------------------------------------\r')
            for k, v in i.items():
                if not v == 'platform-default':
                    imm_setting = jdata['bios_map'][0][k]
                    if imm_setting == "MISSING":
                        print(f'The Following UCSM BIOS Setting is Currently Not Supported in IMM:\r - {k}')
                    else:
                        templateVars['bios'].update({imm_setting: v})

            # Process the template
            dest_dir = 'profiles_servers'
            dest_file = '%s.auto.tfvars' % templateVars['org']
            wr_method = 'a'
            # print(json.dumps(templateVars['bios'], indent=4))
            templateVars['bios'] = [templateVars['bios']]
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

    def boot_order(self, json_data):
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

    def device_connector(self, json_data):
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
        # Set the org_count to 0 for the First Organization
        org_count = 0

        # Loop through the orgs discovered by the Class
        for org in self.orgs:

            # Pull in Variables from Class
            templateVars = self.templateVars
            templateVars['org'] = org

            # Define the Template Source
            templateVars['header'] = 'Flow Control'
            templateVars['variable_block'] = 'flow_control_policies'
            template_file = "template_open.jinja2"
            template = self.templateEnv.get_template(template_file)

            # Process the template
            dest_dir = 'profiles_%s' % (self.type)
            dest_file = '%s.auto.tfvars' % (org)
            process_method('w', dest_dir, dest_file, template, **templateVars)

            # Define the Template Source
            template_file = "flow_control_policies.jinja2"
            template = self.templateEnv.get_template(template_file)

            if 'flow_control_policies' in self.json_data['config']['orgs'][org_count]:
                for item in self.json_data['config']['orgs'][org_count]['flow_control_policies']:
                    for k, v in item.items():
                        templateVars[k] = v

                    # Process the template
                    dest_dir = 'profiles_%s' % (self.type)
                    dest_file = '%s.auto.tfvars' % org
                    process_method('a', dest_dir, dest_file, template, **templateVars)

            # Define the Template Source
            template_file = "template_close.jinja2"
            template = self.templateEnv.get_template(template_file)

            # Process the template
            dest_dir = 'profiles_%s' % (self.type)
            dest_file = '%s.auto.tfvars' % (org)
            process_method('a', dest_dir, dest_file, template, **templateVars)

            # Increment the org_count for the next Organization Loop
            org_count += 1

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
        # Set the org_count to 0 for the First Organization
        org_count = 0

        # Loop through the orgs discovered by the Class
        for org in self.orgs:

            # Pull in Variables from Class
            templateVars = self.templateVars
            templateVars['org'] = org

            # Define the Template Source
            templateVars['header'] = 'Link Aggregation'
            templateVars['variable_block'] = 'link_aggregation_policies'
            template_file = "template_open.jinja2"
            template = self.templateEnv.get_template(template_file)

            # Process the template
            dest_dir = 'profiles_%s' % (self.type)
            dest_file = '%s.auto.tfvars' % (org)
            process_method('a', dest_dir, dest_file, template, **templateVars)

            # Define the Template Source
            template_file = "link_aggregation_policies.jinja2"
            template = self.templateEnv.get_template(template_file)

            if 'link_aggregation_policies' in self.json_data['config']['orgs'][org_count]:
                for item in self.json_data['config']['orgs'][org_count]['link_aggregation_policies']:
                    for k, v in item.items():
                        templateVars[k] = v

                    # Process the template
                    dest_dir = 'profiles_%s' % (self.type)
                    dest_file = '%s.auto.tfvars' % org
                    process_method('a', dest_dir, dest_file, template, **templateVars)

            # Define the Template Source
            template_file = "template_close.jinja2"
            template = self.templateEnv.get_template(template_file)

            # Process the template
            dest_dir = 'profiles_%s' % (self.type)
            dest_file = '%s.auto.tfvars' % (org)
            process_method('a', dest_dir, dest_file, template, **templateVars)

            # Increment the org_count for the next Organization Loop
            org_count += 1

    def link_control_policies(self):
        # Set the org_count to 0 for the First Organization
        org_count = 0

        # Loop through the orgs discovered by the Class
        for org in self.orgs:

            # Pull in Variables from Class
            templateVars = self.templateVars
            templateVars['org'] = org

            # Define the Template Source
            templateVars['header'] = 'Link Control'
            templateVars['variable_block'] = 'link_control_policies'
            template_file = "template_open.jinja2"
            template = self.templateEnv.get_template(template_file)

            # Process the template
            dest_dir = 'profiles_%s' % (self.type)
            dest_file = '%s.auto.tfvars' % (org)
            process_method('a', dest_dir, dest_file, template, **templateVars)

            # Define the Template Source
            template_file = "link_control_policies.jinja2"
            template = self.templateEnv.get_template(template_file)

            if 'link_control_policies' in self.json_data['config']['orgs'][org_count]:
                for item in self.json_data['config']['orgs'][org_count]['link_control_policies']:
                    for k, v in item.items():
                        templateVars[k] = v

                    # Process the template
                    dest_dir = 'profiles_%s' % (self.type)
                    dest_file = '%s.auto.tfvars' % org
                    process_method('a', dest_dir, dest_file, template, **templateVars)

            # Define the Template Source
            template_file = "template_close.jinja2"
            template = self.templateEnv.get_template(template_file)

            # Process the template
            dest_dir = 'profiles_%s' % (self.type)
            dest_file = '%s.auto.tfvars' % (org)
            process_method('a', dest_dir, dest_file, template, **templateVars)

            # Increment the org_count for the next Organization Loop
            org_count += 1

    def multicast_policies(self):
        # Set the org_count to 0 for the First Organization
        org_count = 0

        # Loop through the orgs discovered by the Class
        for org in self.orgs:

            # Pull in Variables from Class
            templateVars = self.templateVars
            templateVars['org'] = org

            # Define the Template Source
            templateVars['header'] = 'Multicast'
            templateVars['variable_block'] = 'multicast_policies'
            template_file = "template_open.jinja2"
            template = self.templateEnv.get_template(template_file)

            # Process the template
            dest_dir = 'profiles_%s' % (self.type)
            dest_file = '%s.auto.tfvars' % (org)
            process_method('a', dest_dir, dest_file, template, **templateVars)

            # Define the Template Source
            template_file = "multicast_policies.jinja2"
            template = self.templateEnv.get_template(template_file)

            if 'multicast_policies' in self.json_data['config']['orgs'][org_count]:
                for item in self.json_data['config']['orgs'][org_count]['multicast_policies']:
                    for k, v in item.items():
                        templateVars[k] = v

                    # Process the template
                    dest_dir = 'profiles_%s' % (self.type)
                    dest_file = '%s.auto.tfvars' % org
                    process_method('a', dest_dir, dest_file, template, **templateVars)

            # Define the Template Source
            template_file = "template_close.jinja2"
            template = self.templateEnv.get_template(template_file)

            # Process the template
            dest_dir = 'profiles_%s' % (self.type)
            dest_file = '%s.auto.tfvars' % (org)
            process_method('a', dest_dir, dest_file, template, **templateVars)

            # Increment the org_count for the next Organization Loop
            org_count += 1

    def network_connectivity(self, json_data):
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

    def ntp(self, json_data):
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
        # Set the org_count to 0 for the First Organization
        org_count = 0

        # Loop through the orgs discovered by the Class
        for org in self.orgs:

            # Pull in Variables from Class
            templateVars = self.templateVars
            templateVars['org'] = org

            # Define the Template Source
            templateVars['header'] = 'Switch Control'
            templateVars['variable_block'] = 'switch_control_policies'
            template_file = "template_open.jinja2"
            template = self.templateEnv.get_template(template_file)

            # Process the template
            dest_dir = 'profiles_%s' % (self.type)
            dest_file = '%s.auto.tfvars' % (org)
            process_method('a', dest_dir, dest_file, template, **templateVars)

            # Define the Template Source
            template_file = "switch_control_policies.jinja2"
            template = self.templateEnv.get_template(template_file)

            if 'switch_control_policies' in self.json_data['config']['orgs'][org_count]:
                for item in self.json_data['config']['orgs'][org_count]['switch_control_policies']:
                    for k, v in item.items():
                        templateVars[k] = v

                    # Process the template
                    dest_dir = 'profiles_%s' % (self.type)
                    dest_file = '%s.auto.tfvars' % org
                    process_method('a', dest_dir, dest_file, template, **templateVars)

            # Define the Template Source
            template_file = "template_close.jinja2"
            template = self.templateEnv.get_template(template_file)

            # Process the template
            dest_dir = 'profiles_%s' % (self.type)
            dest_file = '%s.auto.tfvars' % (org)
            process_method('a', dest_dir, dest_file, template, **templateVars)

            # Increment the org_count for the next Organization Loop
            org_count += 1

    def system_qos(self, json_data):
        # Define the Template Source
        template_file = "system_qos.jinja2"
        template = self.templateEnv.get_template(template_file)

        # Variables
        templateVars = self.templateVars
        priorities = ['best-effort', 'bronze', 'fc', 'gold', 'platinum', 'silver']
        for v in json_data['config']['qos_system_class']:
            for p in priorities:
                if v['priority'] == p:
                    if p == 'best-effort':
                        p = 'best_effort'
                    xcos = '%s_cos' % (p)
                    xmulticast = '%s_multicast_optimize' % (p)
                    xmtu = '%s_mtu' % (p)
                    xpacket = '%s_packet_drop' % (p)
                    xstate = '%s_admin_state' % (p)
                    xweight = '%s_weight' % (p)
                    templateVars[xcos] = v['cos']
                    templateVars[xweight] = v['weight']
                    if v['mtu'] == 'normal':
                        templateVars[xmtu] = 1500
                    else:
                        templateVars[xmtu] = v['mtu']
                    # print(f'\r\n\r\n p is {p}')
                    if not (v.get('multicast_optimized') is None):
                        if v['multicast_optimized'] == 'yes':
                            templateVars[xmulticast] = 'true'
                        else:
                            templateVars[xmulticast] = 'false'
                    if v['packet_drop'] == 'enabled':
                        templateVars[xpacket] = 'true'
                    else:
                        templateVars[xpacket] = 'false'
                    if v['state'] == 'enabled':
                        templateVars[xstate] = 'Enabled'
                    else:
                        templateVars[xstate] = 'Disabled'

        total_weight = 0
        total_weight += int(templateVars['fc_weight'])

        priorities = ['best_effort', 'bronze', 'gold', 'platinum', 'silver']

        for p in priorities:
            xstate = '%s_admin_state' % (p)
            xweight = '%s_weight' % (p)
            if templateVars[xstate] == 'Enabled':
                total_weight += int(templateVars[xweight])

        x = ((int(templateVars['fc_weight']) / total_weight) * 100)
        templateVars['fc_bandwidth'] = str(x).split('.')[0]

        for p in priorities:
            xbandwidth = '%s_bandwidth' % (p)
            xstate = '%s_admin_state' % (p)
            xweight = '%s_weight' % (p)
            if templateVars[xstate] == 'Enabled':
                x = ((int(templateVars[xweight]) / total_weight) * 100)
                templateVars[xbandwidth] = str(x).split('.')[0]
            else:
                templateVars[xbandwidth] = 0

        # Process the template
        dest_dir = 'profiles_domains'
        dest_file = '%s.auto.tfvars' % templateVars['org']
        wr_method = 'a'
        process_method(wr_method, dest_dir, dest_file, template, **templateVars)

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

