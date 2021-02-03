/*
API Information:
 - Class: "fvnsVlanInstP"
 - Distinguished Name: "uni/infra/vlanns-[Inband]-static"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[Inband]
*/
data "aci_vlan_pool" "Inband" {
	name        = "Inband"
}

