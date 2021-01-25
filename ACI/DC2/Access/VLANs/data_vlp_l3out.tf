/*
API Information:
 - Class: "fvnsVlanInstP"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out]
*/
data "aci_vlan_pool" "l3out" {
	name        = "l3out"
}

