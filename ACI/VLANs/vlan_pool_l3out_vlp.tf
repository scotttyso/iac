/*
Create VLAN Pool l3out_vlp
Fabric > Access Policies > Pools > VLAN:[l3out_vlp]
*/
resource "aci_ranges" "l3out_vlp_101" {
	depends_on 		= [aci_vlan_pool.l3out_vlp]
	vlan_pool_dn	= "uni/infra/vlanns-[l3out_vlp]-static"
	from			= "vlan-101"
	to				= "vlan-101"
}

