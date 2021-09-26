#______________________________________________
#
# VSAN Policy Variables
#______________________________________________

vsan_policies = {
  "Fabric_A" = {
    description     = "Fabric_A VSAN Policy"
    organization    = "default"
    uplink_trunking = false
    tags            = []
    vsans = {
      1 = {
        fcoe_vlan_id   = 100
        name           = "VSAN-A"
        vsan_id        = 100
      },
    }
  }
  "Fabric_B" = {
    description     = "Fabric_B VSAN Policy"
    organization    = "default"
    uplink_trunking = false
    tags            = []
    vsans = {
      1 = {
        fcoe_vlan_id   = 200
        name           = "VSAN-B"
        vsan_id        = 200
      },
    }
  }
}