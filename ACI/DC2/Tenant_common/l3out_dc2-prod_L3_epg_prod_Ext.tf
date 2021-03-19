/*
API Information:
 - Class: "l3extInstP"
 - Distinguised Name: "/uni/tn-common/out-dc2-prod_L3/instP-prod_Ext"
GUI Location:
 - Tenants > common > Networking > L3Outs > dc2-prod_L3 > External EPGs > prod_Ext
*/
resource "aci_external_network_instance_profile" "dc2-prod_L3_prod_Ext" {
	depends_on                                  = [data.aci_tenant.common,aci_l3_outside.common_dc2-prod_L3]
	l3_outside_dn                               = aci_l3_outside.common_dc2-prod_L3.id
	description                                 = "Production External EPG"
	name                                        = "prod_Ext"
	flood_on_encap                              = "disabled"
	match_t                                     = "AtleastOne"
	pref_gr_memb                                = "exclude"
	prio                                        = "level3"
	target_dscp                                 = "unspecified"
}

