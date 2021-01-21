/*
Create VLAN Pool inband_vlp
Fabric > Access Policies > Pools > VLAN:[inband_vlp]
*/
resource "aci_ranges" "inband_vlp_100" {
	depends_on 		= [aci_vlan_pool.inband_vlp]
	vlan_pool_dn	= "uni/infra/vlanns-[inband_vlp]-static"
	from			= "vlan-100"
	to				= "vlan-100"
}

