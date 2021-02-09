/*
API Information:
 - Class: "fvnsVlanInstP"
 - Distinguished Name: "uni/infra/vlanns-[msite]-static"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[msite]
*/
resource "aci_vlan_pool" "msite" {
	name        = "msite"
	alloc_mode  = "static"
}

