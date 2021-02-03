/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[L3Out]-static/from-[vlan-901]-to-[vlan-901]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[L3Out] > Encap Blocks
*/
resource "aci_ranges" "L3Out_901" {
	depends_on 		= [aci_vlan_pool.L3Out]
	vlan_pool_dn	= "uni/infra/vlanns-[L3Out]-static"
	from			= "vlan-901"
	to				= "vlan-901"
}

