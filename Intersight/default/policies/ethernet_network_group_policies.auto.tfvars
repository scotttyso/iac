#______________________________________________
#
# Ethernet Network Group Policy Variables
#______________________________________________

ethernet_network_group_policies = {
  "Asgard_mgmt" = {
    allowed_vlans = "1101"
    description   = "Asgard_mgmt Ethernet Network Group Policy."
    organization  = "default"
    tags          = []
  }
  "Asgard_vms" = {
    allowed_vlans = "1101-1110"
    description   = "Asgard_vms Ethernet Network Group Policy."
    native_vlan   = 1105
    organization  = "default"
    tags          = []
  }
}