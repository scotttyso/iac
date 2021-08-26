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

#______________________________________________
#
# System QoS Policies
#______________________________________________

policies_system_qos = {
  "default_systemqos" = {
    best_effort_admin_state        = "Enabled"
    best_effort_bandwidth          = 50
    best_effort_mtu                = 1500
    best_effort_multicast_optimize = false
    best_effort_weight             = 5
    bronze_admin_state             = "Disabled"
    bronze_bandwidth               = 0
    bronze_cos                     = 1
    bronze_mtu                     = 1500
    bronze_multicast_optimize      = false
    bronze_packet_drop             = true
    bronze_weight                  = 7
    description                    = ""
    fc_bandwidth                   = 50
    fc_weight                      = 5
    gold_admin_state               = "Disabled"
    gold_bandwidth                 = 0
    gold_cos                       = 4
    gold_mtu                       = 1500
    gold_multicast_optimize        = false
    gold_packet_drop               = true
    gold_weight                    = 9
    organization                   = "default"
    platinum_admin_state           = "Disabled"
    platinum_bandwidth             = 0
    platinum_cos                   = 5
    platinum_mtu                   = 1500
    platinum_multicast_optimize    = false
    platinum_packet_drop           = false
    platinum_weight                = 10
    silver_admin_state             = "Disabled"
    silver_bandwidth               = 0
    silver_cos                     = 2
    silver_mtu                     = 1500
    silver_multicast_optimize      = false
    silver_packet_drop             = true
    silver_weight                  = 8
    tags                           = []
  }
}

