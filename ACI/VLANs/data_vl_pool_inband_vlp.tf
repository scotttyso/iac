/*
Create VLAN Pool inband_vlp Data File
Fabric > Access Policies > Pools > VLAN:[inband_vlp]
*/
data "aci_vlan_pool" "inband_vlp" {
	name        = "inband_vlp"
}

