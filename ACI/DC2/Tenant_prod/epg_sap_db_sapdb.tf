/*
API Information:
 - Class: "fvAEPg"
 - Distinguished Name: /uni/tn-prod/ap-sap_db/epg-sapdb
GUI Location:
Tenants > prod > Application Profiles > sap_db > Application EPGs > sapdb
*/
resource "aci_application_epg" "sap_db_sapdb" {
	depends_on						= [aci_application_profile.sap_db]
	application_profile_dn			= aci_application_profile.sap_db.id
	name							= "sapdb"
	description						= "SAP HANA - Database Services"
	flood_on_encap					= "disabled"
	fwd_ctrl						= "none"
	has_mcast_source				= "no"
	is_attr_based_epg				= "no"
	match_t							= "AtleastOne"
	pc_enf_pref						= "disabled"
	pref_gr_memb					= "exclude"
	prio							= "level3"
	shutdown						= "no"
	relation_fv_rs_bd				= aci_bridge_domain.sap_db.id
	relation_fv_rs_aepg_mon_pol		= "uni/tn-common/monepg-default"
}

