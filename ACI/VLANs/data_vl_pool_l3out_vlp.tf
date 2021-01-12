/*
Create VLAN Pool l3out_vlp Data File
Fabric > Access Policies > Pools > VLAN:[l3out_vlp]
*/
data "aci_vlan_pool" "l3out_vlp" {
	name        = "l3out_vlp"
}

