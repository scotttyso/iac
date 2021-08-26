


#______________________________________________
#
# Flow Control Policies
#______________________________________________

flow_control_policies = {
  "UCS-DEMO" = {
    description  = ""
    priority     = "auto"
    receive      = "Disabled"
    send         = "Disabled"
    organization = "UCS-DEMO"
    tags         = [
      {
        key   = "easyucs_origin",
        value = "convert"
      },
      {
        key   = "easyucs_version",
        value = "0.9.8"
      },
    ]
  }
}


#______________________________________________
#
# Link Aggregation Policies
#______________________________________________

link_aggregation_policies = {
  "UCS-DEMO" = {
    description        = ""
    lacp_rate          = "normal"
    organization       = "UCS-DEMO"
    suspend_individual = False
    Tags               = [
      {
        key   = "easyucs_origin",
        value = "convert"
      },
      {
        key   = "easyucs_version",
        value = "0.9.8"
      },
    ]
  }
}


#______________________________________________
#
# Link Control Policies
#______________________________________________

link_control_policies = {
  "UCS-DEMO" = {
    admin_state  = "Disabled"
    description  = ""
    mode         = "normal"
    organization = "UCS-DEMO"
    Tags         = [
      {
        key   = "easyucs_origin",
        value = "convert"
      },
      {
        key   = "easyucs_version",
        value = "0.9.8"
      },
    ]
  }
}


#______________________________________________
#
# Multicast Policies
#______________________________________________

multicast_policies = {
  "UCS-DEMO" = {
    description             = ""
    organization            = "UCS-DEMO"
    querier_ip_address      = ""
    querier_ip_address_peer = ""
    querier_state           = "Disabled"
    snooping_state          = "Enabled"
    tags                    = [
      {
        key   = "easyucs_origin",
        value = "convert"
      },
      {
        key   = "easyucs_version",
        value = "0.9.8"
      },
    ]
  }
}


#______________________________________________
#
# Switch Control Policies
#______________________________________________

switch_control_policies = {  "UCS-DEMO" = {
    description                  = ""
    mac_address_table_aging      = "Default"
    mac_aging_time               = 14500
    organization                 = "UCS-DEMO"
    udld_message_interval        = 15
    udld_recovery_action         = "reset"
    vlan_port_count_optimization = true
    tags         = [
      {
        key   = "easyucs_origin",
        value = "convert"
      },
      {
        key   = "easyucs_version",
        value = "0.9.8"
      },
    ]
  }
}