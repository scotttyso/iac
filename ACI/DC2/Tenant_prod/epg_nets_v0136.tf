/*
GUI Location:
Tenants > prod > Application Profiles > nets > Application EPGs > v0136
API Information:
 - Class: "fvAEPg"
 - Distinguished Name: /uni/tn-prod/ap-nets/epg-v0136
*/
resource "aci_application_epg" "nets_v0136" {
	depends_on						= [aci_application_profile.nets]
	application_profile_dn			= aci_application_profile.nets.id
	name							= "v0136"
	flood_on_encap					= "disabled"
	fwd_ctrl						= "none"
	has_mcast_source				= "no"
	is_attr_based_epg				= "no"
	match_t							= "AtleastOne"
	pc_enf_pref						= "disabled"
	pref_gr_memb					= "exclude"
	prio							= "level3"
	shutdown						= "no"
	relation_fv_rs_bd				= aci_bridge_domain.v0136.id
	relation_fv_rs_aepg_mon_pol		= "uni/tn-common/monepg-default"
}

