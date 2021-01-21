/*
Create VLAN Pool access_vlp
Fabric > Access Policies > Pools > VLAN:[access_vlp]
*/
resource "aci_ranges" "access_vlp_1" {
	depends_on 		= [aci_vlan_pool.access_vlp]
	vlan_pool_dn	= "uni/infra/vlanns-[access_vlp]-static"
	from			= "vlan-1"
	to				= "vlan-1"
}

