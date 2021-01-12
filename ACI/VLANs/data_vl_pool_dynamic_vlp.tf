/*
Create VLAN Pool dynamic_vlp Data File
Fabric > Access Policies > Pools > VLAN:[dynamic_vlp]
*/
data "aci_vlan_pool" "dynamic_vlp" {
	name        = "dynamic_vlp"
}

