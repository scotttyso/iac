/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-902]-to-[vlan-902]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "l3out_902" {
	depends_on 		= [aci_vlan_pool.l3out]
	vlan_pool_dn	= "uni/infra/vlanns-[l3out]-static"
	from			= "vlan-902"
	to				= "vlan-902"
}

