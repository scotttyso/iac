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

