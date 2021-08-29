#______________________________________________
#
# Fibre Channel (vHBA) Network Policies
#______________________________________________

fibre_channel_network_policies = {
  "aaa_SCP_fc0" = {
    description     = ""
    default_vlan_id = 4048
    vsan_id         = 1
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
  "aaa_SCP_fc1" = {
    description     = ""
    default_vlan_id = 4048
    vsan_id         = 1
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
  "ESXi-OCB_SAN-A" = {
    description     = ""
    default_vlan_id = 1010
    vsan_id         = 10
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
  "ESXi-OCB_SAN-B" = {
    description     = ""
    default_vlan_id = 1020
    vsan_id         = 20
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
  "TEST-PLACEMENT_SCP_vhba0" = {
    description     = ""
    default_vlan_id = 4048
    vsan_id         = 1
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
  "TEST-PLACEMENT-TEMPLATE_SCP_vhba0" = {
    description     = ""
    default_vlan_id = 4048
    vsan_id         = 1
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