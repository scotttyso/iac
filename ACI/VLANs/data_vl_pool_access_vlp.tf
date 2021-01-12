/*
Create VLAN Pool access_vlp Data File
Fabric > Access Policies > Pools > VLAN:[access_vlp]
*/
data "aci_vlan_pool" "access_vlp" {
	name        = "access_vlp"
}

