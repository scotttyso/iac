/*
API Information:
 - Class: "fvnsVlanInstP"
 - Distinguished Name: "uni/infra/vlanns-[Dynamic]-dynamic"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[Dynamic]
*/
data "aci_vlan_pool" "Dynamic" {
	name        = "Dynamic"
}

