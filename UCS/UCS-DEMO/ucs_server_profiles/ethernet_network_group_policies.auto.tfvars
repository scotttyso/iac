#______________________________________________
#
# Ethernet (vNIC) Network (VLAN) Group Policies
#______________________________________________

ethernet_network_group_policies = {
  "TEST" = {
    allowed_vlans = "100,101"
    description   = ""
    tags          = [
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
  "placement_LCP_eth0" = {
    allowed_vlans = "100"
    description   = ""
    native_vlan   = 100
    tags          = [
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
  "placement_LCP_eth1" = {
    allowed_vlans = "101"
    description   = ""
    native_vlan   = 101
    tags          = [
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
  "placement_LCP_eth2" = {
    allowed_vlans = "1"
    description   = ""
    native_vlan   = 101
    tags          = [
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