/*
API Information:
 - Class: "fvAEPg"
 - Distinguished Name: /uni/tn-dmz/ap-nets/epg-v0056
GUI Location:
Tenants > dmz > Application Profiles > nets > Application EPGs > v0056
*/
resource "aci_application_epg" "nets_v0056" {
	depends_on						= [aci_tenant.dmz,aci_application_profile.dmz_nets]
	application_profile_dn			= aci_application_profile.dmz_nets.id
	name							= "v0056"
	description						= "intersite-peering"
	flood_on_encap					= "disabled"
	has_mcast_source				= "no"
	is_attr_based_epg				= "no"
	match_t							= "AtleastOne"
	pc_enf_pref						= "enforced"
	pref_gr_memb					= "exclude"
	prio							= "level3"
	shutdown						= "no"
	relation_fv_rs_bd				= aci_bridge_domain.dmz_v0056.id
	relation_fv_rs_aepg_mon_pol		= "uni/tn-common/monepg-default"
}

/*
API Information:
 - Class: "fvRsDomAtt"
 - Distinguished Name: /uni/tn-dmz/ap-nets/epg-v0056/rsdomAtt-[uni/phys-access_phys]
GUI Location:
Tenants > dmz > Application Profiles > nets > Application EPGs > v0056 > Domains (VMs and Bare-Metals)
*/
resource "aci_rest" "nets_v0056_phys-access_phys" {
	depends_on		= [aci_application_epg.nets_v0056]
	path		= "/api/node/mo/uni/tn-dmz/ap-nets/epg-v0056.json"
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

