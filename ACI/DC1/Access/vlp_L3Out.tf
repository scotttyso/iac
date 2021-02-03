/*
API Information:
 - Class: "fvnsVlanInstP"
 - Distinguished Name: "uni/infra/vlanns-[L3Out]-static"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[L3Out]
*/
resource "aci_vlan_pool" "L3Out" {
	name        = "L3Out"
	alloc_mode  = "static"
}

