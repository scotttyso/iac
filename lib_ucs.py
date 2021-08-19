#!/usr/bin/env python3
# import json
import jinja2
import os
import pkg_resources
# from jinja2 import Template
# from pathlib import Path

ucs_template_path = pkg_resources.resource_filename('lib_ucs', 'ucs_conversion/')

class config_conversion(object):
    def __init__(self, name, org, type):
        self.templateLoader = jinja2.FileSystemLoader(
            searchpath=(ucs_template_path + '%s/') % (type))
        self.templateEnv = jinja2.Environment(loader=self.templateLoader)
        self.templateVars = {}
        self.templateVars['name'] = name
        self.templateVars['org'] = org
    # Config Templates
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
        wr_method = 'w'
        process_method(wr_method, dest_dir, dest_file, template, **templateVars)

    def flow_control(self, json_data):
        # Define the Template Source
        template_file = "flow_control.jinja2"
        template = self.templateEnv.get_template(template_file)

        # Variables
        templateVars = self.templateVars
        templateVars['flow_control'] = json_data['config']['orgs'][0]['flow_control_policies']

        # Process the template
        dest_dir = 'profiles_domains'
        dest_file = '%s.auto.tfvars' % templateVars['org']
        wr_method = 'w'
        process_method(wr_method, dest_dir, dest_file, template, **templateVars)

    def link_aggregation(self, json_data):
        # Define the Template Source
        template_file = "link_aggregation.jinja2"
        template = self.templateEnv.get_template(template_file)

        # Variables
        templateVars = self.templateVars
        templateVars['link_aggregation'] = json_data['config']['orgs'][0]['lacp_policies']

        # Process the template
        dest_dir = 'profiles_domains'
        dest_file = '%s.auto.tfvars' % templateVars['org']
        wr_method = 'a'
        process_method(wr_method, dest_dir, dest_file, template, **templateVars)

    def link_control(self, json_data):
        # Define the Template Source
        template_file = "link_control.jinja2"
        template = self.templateEnv.get_template(template_file)

        # Variables
        templateVars = self.templateVars
        templateVars['link_control'] = json_data['config']['udld_link_policies']

        # Process the template
        dest_dir = 'profiles_domains'
        dest_file = '%s.auto.tfvars' % templateVars['org']
        wr_method = 'a'
        process_method(wr_method, dest_dir, dest_file, template, **templateVars)

    def multicast(self, json_data):
        # Define the Template Source
        template_file = "multicast.jinja2"
        template = self.templateEnv.get_template(template_file)

        # Variables
        templateVars = self.templateVars
        templateVars['multicast'] = json_data['config']['orgs'][0]['multicast_policies']
        print(templateVars['multicast'])

        # Process the template
        dest_dir = 'profiles_domains'
        dest_file = '%s.auto.tfvars' % templateVars['org']
        wr_method = 'a'
        process_method(wr_method, dest_dir, dest_file, template, **templateVars)

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
                print(f'Removing Native Vlan from vlan list.  Native vlan key is {v}.')
                templateVars['vlans'].remove(v)

        # Process the template
        dest_dir = 'profiles_domains'
        dest_file = '%s.auto.tfvars' % templateVars['org']
        wr_method = 'a'
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
    wr_file.write(payload + '\n\n')
    wr_file.close()

