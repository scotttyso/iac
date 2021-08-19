#______________________________________________
#
# Flow Control Policies
#______________________________________________

policies_flow_control = {
  "default" = {
    description          = ""
    flow_control_mode    = "auto"
    flow_control_receive = "off"
    flow_control_send    = "off"
    organization         = "default"
    tags                 = []
  }
}

#______________________________________________
#
# Link Aggregation Policies
#______________________________________________

policies_link_aggregation = {
  "default" = {
    description        = ""
    lacp_rate          = "normal"
    organization       = "default"
    suspend_individual = false
    tags               = []
  }
}

#______________________________________________
#
# LAN Port Channel Policies
#______________________________________________

policies_port_channel_lan = {

  "Fabric_A" = {
    lan_pc_breakoutswport     = 0
    lan_pc_ports              = [1, 4]
    lan_pc_slot_id            = 1
    lan_pc_speed              = ""
    policies_flow_control     = "default"
    policies_link_aggregation = "default"
    policies_link_control     = "default"
    # policies_link_control     = ""
    tags                      = []
    ucs_domain_profile        = ""
  }

  "Fabric_B" = {
    lan_pc_breakoutswport     = 0
    lan_pc_ports              = [1, 4]
    lan_pc_slot_id            = 1
    lan_pc_speed              = ""
    policies_flow_control     = "default"
    policies_link_aggregation = "default"
    policies_link_control     = "default"
    # policies_link_control     = ""
    tags                      = []
    ucs_domain_profile        = ""
  }

}

#______________________________________________
#
# Link Control Policies
#______________________________________________

policies_link_control = {
  "default" = {
    description      = ""
    organization     = "default"
    tags             = []
    udld_admin_state = "disabled"
    udld_mode        = "normal"
  }
}


policies_multicast = {
  "default" = {
    description    = ""
    organization   = "default"
    querier_ip     = ""
    querier_state  = "disabled"
    snooping_state = "enabled"
    tags           = []
    udld_admin_state = ""
    udld_mode        = ""
  }
 }

policies_network_connectivity = {
  "default_dns" = {
    description = ""
    dns_server_v4 = [
      "172.20.1.244",
      "172.20.1.252",
    ]
    dns_server_v6 = []
    organization  = "default"
    tags          = []
    update_domain = ""
  }
}

#______________________________________________
#
# NTP Policies
#______________________________________________

policies_ntp = {
  "default_ntp_sw" = {
    description  = ""
    enabled      = true
    ntp_servers  = [
      "ntp.ent.med.umich.edu",
    ]
    organization = "default"
    tags         = []
    timezone     = "America/Detroit"
  }
}

#______________________________________________
#
# Switch Control Policies
#______________________________________________

policies_switch_control = {
  "default_swctrl" = {
    description           = ""
    mac_aging_option      = "Default"
    mac_aging_time        = 14500
    organization          = "default"
    tags                  = []
    udld_message_interval = 15
    udld_recovery_action  = "reset"
    vlan_optimization     = false
  }
}

