#______________________________________________
#
# Fibre Channel (vHBA) Network Policies
#______________________________________________

fibre_channel_network_policies = {
  "TUTU_SCP_vhba" = {
    default_vlan_id = 4048
    description     = ""
    organization    = "UCS-DEMO2_FPV-FlexPod"
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