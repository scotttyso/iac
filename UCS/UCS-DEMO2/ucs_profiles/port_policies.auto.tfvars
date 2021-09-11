#______________________________________________
#
# Port Policy Variables
#______________________________________________

port_policies = {
  "UCS-DEMO2-A" = {
    description  = ""
    device_model = "UCS-FI-6454"
    organization = "UCS-DEMO2"
    port_channel_appliances = {
      "36" = {
        admin_speed                     = "40Gbps"
        ethernet_network_control_policy = "ncp-appliance_appliance"
        ethernet_network_group_policy   = "UCS-DEMO2-AppliancePortChannel-A-PC36"
        interfaces = [
          {
            port_id          = 36
            slot_id          = 1
          },
        ]
        mode     = "trunk"
        priority = "Gold"
      }
    }
    port_channel_ethernet_uplinks = {
      "1" = {
        admin_speed         = "Auto"
        flow_control_policy = "UCS-DEMO2"
        link_aggregation_policy = "UCS-DEMO2"
      }
      "13" = {
        admin_speed         = "10Gbps"
        flow_control_policy = "UCS-DEMO2"
        link_aggregation_policy = "UCS-DEMO2"
      }
      "17" = {
        admin_speed         = "40Gbps"
        flow_control_policy = "UCS-DEMO2"
        link_aggregation_policy = "UCS-DEMO2"
      }
      "24" = {
        admin_speed         = "40Gbps"
        flow_control_policy = "UCS-DEMO2"
        link_aggregation_policy = "UCS-DEMO2"
      }
      "43" = {
        admin_speed         = "10Gbps"
        flow_control_policy = "UCS-DEMO2"
        link_aggregation_policy = "UCS-DEMO2"
      }
      "45" = {
        admin_speed         = "10Gbps"
        flow_control_policy = "UCS-DEMO2"
        link_aggregation_policy = "UCS-DEMO2"
      }
      "47" = {
        admin_speed         = "10Gbps"
        flow_control_policy = "UCS-DEMO2"
        link_aggregation_policy = "UCS-DEMO2"
      }
      "53" = {
        admin_speed         = "10Gbps"
        flow_control_policy = "UCS-DEMO2"
        link_aggregation_policy = "lacp_pol"
      }
      "119" = {
        admin_speed         = "40Gbps"
        flow_control_policy = "UCS-DEMO2"
        link_aggregation_policy = "UCS-DEMO2"
      }
    }
    port_channel_fc_uplinks = {}
    port_channel_fcoe_uplinks = {
      "18" = {
        link_aggregation_policy = "UCS-DEMO2"
      }
      "33" = {
        interfaces = [
          {
            breakout_port_id = 1
            port_id          = 21
            slot_id          = 1
          },
          {
            breakout_port_id = 2
            port_id          = 22
            slot_id          = 1
          },
        ]
        link_aggregation_policy = "UCS-DEMO2"
      }
    }
    tags = [
      {
        key = "easyucs_origin",
        value = "convert",
      },
      {
        key = "easyucs_version",
        value = "0.9.8",
      },
    ]
  }
  "UCS-DEMO2-B" = {
    description  = ""
    device_model = "UCS-FI-6454"
    organization = "UCS-DEMO2"
    port_channel_appliances = {}
    port_channel_ethernet_uplinks = {
      "1" = {
        admin_speed         = "Auto"
        flow_control_policy = "UCS-DEMO2"
        link_aggregation_policy = "UCS-DEMO2"
      }
      "14" = {
        admin_speed         = "10Gbps"
        flow_control_policy = "UCS-DEMO2"
        link_aggregation_policy = "UCS-DEMO2"
      }
      "18" = {
        admin_speed         = "40Gbps"
        flow_control_policy = "UCS-DEMO2"
        link_aggregation_policy = "UCS-DEMO2"
      }
      "24" = {
        admin_speed         = "40Gbps"
        flow_control_policy = "UCS-DEMO2"
        link_aggregation_policy = "UCS-DEMO2"
      }
      "53" = {
        admin_speed         = "10Gbps"
        flow_control_policy = "UCS-DEMO2"
        link_aggregation_policy = "UCS-DEMO2"
      }
      "120" = {
        admin_speed         = "40Gbps"
        flow_control_policy = "UCS-DEMO2"
        link_aggregation_policy = "UCS-DEMO2"
      }
    }
    port_channel_fc_uplinks = {}
    port_channel_fcoe_uplinks = {}
    tags = [
      {
        key = "easyucs_origin",
        value = "convert",
      },
      {
        key = "easyucs_version",
        value = "0.9.8",
      },
    ]
  }
}