/*
API Information:
 - Class: "fvAEPg"
 - Distinguished Name: /uni/tn-prod/ap-nets/epg-v0064
GUI Location:
Tenants > prod > Application Profiles > nets > Application EPGs > v0064
*/
resource "aci_application_epg" "nets_v0064" {
	depends_on						= [aci_tenant.prod,aci_application_profile.prod_nets]
	application_profile_dn			= aci_application_profile.prod_nets.id
	name							= "v0064"
	description						= "OOBMgmt"
	flood_on_encap					= "disabled"
	has_mcast_source				= "no"
	is_attr_based_epg				= "no"
	match_t							= "AtleastOne"
	pc_enf_pref						= "enforced"
	pref_gr_memb					= "include"
	prio							= "level3"
	shutdown						= "no"
	relation_fv_rs_bd				= aci_bridge_domain.prod_v0064.id
	relation_fv_rs_aepg_mon_pol		= "uni/tn-common/monepg-default"
}

/*
API Information:
 - Class: "fvRsDomAtt"
 - Distinguished Name: /uni/tn-prod/ap-nets/epg-v0064/rsdomAtt-[uni/phys-access_phys]
GUI Location:
Tenants > prod > Application Profiles > nets > Application EPGs > v0064 > Domains (VMs and Bare-Metals)
*/
resource "aci_rest" "nets_v0064_phys-access_phys" {
	depends_on		= [aci_application_epg.nets_v0064]
	path		= "/api/node/mo/uni/tn-prod/ap-nets/epg-v0064.json"
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

