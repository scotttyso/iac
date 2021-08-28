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