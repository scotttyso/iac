#______________________________________________
#
# Fibre-Channel Network Policy Variables
#______________________________________________

fibre_channel_network_policies = {
  "Fabric_A" = {
    default_vlan_id = 0
    description     = "Fabric_A Fibre-Channel Network Policy"
    organization    = "default"
    vsan_id         = 100
    tags            = []
  }
  "Fabric_B" = {
    default_vlan_id = 0
    description     = "Fabric_B Fibre-Channel Network Policy"
    organization    = "default"
    vsan_id         = 200
    tags            = []
  }
}