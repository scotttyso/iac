/*
API Information:
 - Class: "fvnsVlanInstP"
 - Distinguished Name: "uni/infra/vlanns-[Inband]-static"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[Inband]
*/
resource "aci_vlan_pool" "Inband" {
	name        = "Inband"
	alloc_mode  = "static"
}

