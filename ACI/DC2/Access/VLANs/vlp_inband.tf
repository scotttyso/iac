/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[inband]-static/from-[vlan-912]-to-[vlan-912]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[inband] > Encap Blocks
*/
resource "aci_ranges" "inband_912" {
	depends_on 		= [data.aci_vlan_pool.inband]
	vlan_pool_dn	= "uni/infra/vlanns-[inband]-static"
	from			= "vlan-912"
	to				= "vlan-912"
}

