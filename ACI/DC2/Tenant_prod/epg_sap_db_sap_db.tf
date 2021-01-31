/*
API Information:
 - Class: "fvAEPg"
 - Distinguished Name: /uni/tn-prod/ap-sap_db/epg-sap_db
GUI Location:
Tenants > prod > Application Profiles > sap_db > Application EPGs > sap_db
*/
resource "aci_application_epg" "sap_db_sap_db" {
	depends_on						= [aci_application_profile.sap_db]
	application_profile_dn			= aci_application_profile.sap_db.id
	name							= "sap_db"
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

/*
API Information:
 - Class: "fvRsDomAtt"
 - Distinguished Name: /uni/tn-prod/ap-sap_db/epg-sap_db/rsdomAtt-[uni/phys-access_phys]
GUI Location:
Tenants > prod > Application Profiles > sap_db > Application EPGs > sap_db > Domains (VMs and Bare-Metals)
*/
resource "aci_rest" "sap_db_sap_db_phys-access_phys" {
	depends_on		= [aci_application_epg.sap_db_sap_db]
	path		= "/api/node/mo/uni/tn-prod/ap-sap_db/epg-sap_db.json"
	class_name	= "fvRsDomAtt"
	payload		= <<EOF
{
    "fvRsDomAtt": {
        "attributes": {
            "tDn": "uni/phys-access_phys"
        },
        "children": []
    }
}
	EOF
}

