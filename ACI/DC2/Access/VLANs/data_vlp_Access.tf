/*
API Information:
 - Class: "fvnsVlanInstP"
 - Distinguished Name: "uni/infra/vlanns-[Access]-static"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[Access]
*/
data "aci_vlan_pool" "Access" {
	name        = "Access"
}

