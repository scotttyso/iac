/*
Create VLAN Pool msite_vlp Data File
Fabric > Access Policies > Pools > VLAN:[msite_vlp]
*/
data "aci_vlan_pool" "msite_vlp" {
	name        = "msite_vlp"
}

