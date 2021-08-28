#______________________________________________
#
# Fibre Channel (vHBA) Network Policies
#______________________________________________

fibre_channel_network_policies = {
  "placement_SCP_fc0" = {
    description     = ""
    default_vlan_id = 4048
    vsan_id         = 1
    tags            = [
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
  "placement_SCP_fc1" = {
    description     = ""
    default_vlan_id = 4048
    vsan_id         = 1
    tags            = [
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