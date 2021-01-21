/*
Create VLAN Pool msite_vlp
Fabric > Access Policies > Pools > VLAN:[msite_vlp]
*/
resource "aci_ranges" "msite_vlp_4" {
	depends_on 		= [aci_vlan_pool.msite_vlp]
	vlan_pool_dn	= "uni/infra/vlanns-[msite_vlp]-static"
	from			= "vlan-4"
	to				= "vlan-4"
}

