/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[Inband]-static/from-[vlan-912]-to-[vlan-912]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[Inband] > Encap Blocks
*/
resource "aci_ranges" "Inband_912" {
	depends_on 		= [aci_vlan_pool.Inband]
	vlan_pool_dn	= "uni/infra/vlanns-[Inband]-static"
	from			= "vlan-912"
	to				= "vlan-912"
}

