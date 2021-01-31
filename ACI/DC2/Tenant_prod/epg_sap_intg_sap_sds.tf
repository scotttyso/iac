/*
API Information:
 - Class: "fvAEPg"
 - Distinguished Name: /uni/tn-prod/ap-sap_intg/epg-sap_sds
GUI Location:
Tenants > prod > Application Profiles > sap_intg > Application EPGs > sap_sds
*/
resource "aci_application_epg" "sap_intg_sap_sds" {
	depends_on						= [aci_application_profile.sap_intg]
	application_profile_dn			= aci_application_profile.sap_intg.id
	name							= "sap_sds"
	description						= "SAP HANA - Smart Data Streaming (CEP)"
	flood_on_encap					= "disabled"
	fwd_ctrl						= "none"
	has_mcast_source				= "no"
	is_attr_based_epg				= "no"
	match_t							= "AtleastOne"
	pc_enf_pref						= "disabled"
	pref_gr_memb					= "exclude"
	prio							= "level3"
	shutdown						= "no"
	relation_fv_rs_bd				= aci_bridge_domain.sap_itg.id
	relation_fv_rs_aepg_mon_pol		= "uni/tn-common/monepg-default"
}

/*
API Information:
 - Class: "fvRsDomAtt"
 - Distinguished Name: /uni/tn-prod/ap-sap_intg/epg-sap_sds/rsdomAtt-[uni/phys-access_phys]
GUI Location:
Tenants > prod > Application Profiles > sap_intg > Application EPGs > sap_sds > Domains (VMs and Bare-Metals)
*/
resource "aci_rest" "sap_intg_sap_sds_phys-access_phys" {
	depends_on		= [aci_application_epg.sap_intg_sap_sds]
	path		= "/api/node/mo/uni/tn-prod/ap-sap_intg/epg-sap_sds.json"
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

