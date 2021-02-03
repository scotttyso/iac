/*
API Information:
 - Class: "fvAEPg"
 - Distinguished Name: /uni/tn-prod/ap-sap_intg/epg-sap_sdi
GUI Location:
Tenants > prod > Application Profiles > sap_intg > Application EPGs > sap_sdi
*/
resource "aci_application_epg" "sap_intg_sap_sdi" {
	depends_on						= [aci_tenant.prod,aci_application_profile.prod_sap_intg]
	application_profile_dn			= aci_application_profile.prod_sap_intg.id
	name							= "sap_sdi"
	description						= "SAP HANA - Smart Data Integration"
	flood_on_encap					= "disabled"
	fwd_ctrl						= "none"
	has_mcast_source				= "no"
	is_attr_based_epg				= "no"
	match_t							= "AtleastOne"
	pc_enf_pref						= "enforced"
	pref_gr_memb					= "include"
	prio							= "level3"
	shutdown						= "no"
	relation_fv_rs_bd				= aci_bridge_domain.prod_sap_itg.id
	relation_fv_rs_aepg_mon_pol		= "uni/tn-common/monepg-default"
}

/*
API Information:
 - Class: "fvRsDomAtt"
 - Distinguished Name: /uni/tn-prod/ap-sap_intg/epg-sap_sdi/rsdomAtt-[uni/phys-Access_phys]
GUI Location:
Tenants > prod > Application Profiles > sap_intg > Application EPGs > sap_sdi > Domains (VMs and Bare-Metals)
*/
resource "aci_rest" "sap_intg_sap_sdi_phys-Access_phys" {
	depends_on		= [aci_application_epg.sap_intg_sap_sdi]
	path		= "/api/node/mo/uni/tn-prod/ap-sap_intg/epg-sap_sdi.json"
	class_name	= "fvRsDomAtt"
	payload		= <<EOF
{
    "fvRsDomAtt": {
        "attributes": {
            "tDn": "uni/phys-Access_phys"
        },
        "children": []
    }
}
	EOF
}

