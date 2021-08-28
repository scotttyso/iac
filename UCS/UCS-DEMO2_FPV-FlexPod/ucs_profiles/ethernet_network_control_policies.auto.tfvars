#______________________________________________
#
# Ethernet (vNIC) Network Control Policies
#______________________________________________

ethernet_network_control_policies = {
  "Enable-CDP-LLDP" = {
    action_on_uplink_fail = "linkDown"
    cdp_enable            = true
    description           = ""
    lldp_enable_receive   = true
    lldp_enable_transmit  = true
    mac_register_mode     = "nativeVlanOnly"
    mac_security_forge    = "allow"
    tags                  = [
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
  "default" = {
    action_on_uplink_fail = "linkDown"
    cdp_enable            = false
    description           = ""
    lldp_enable_receive   = false
    lldp_enable_transmit  = false
    mac_register_mode     = "nativeVlanOnly"
    mac_security_forge    = "allow"
    tags                  = [
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