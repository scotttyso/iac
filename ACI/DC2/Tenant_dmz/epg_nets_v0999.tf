/*
API Information:
 - Class: "fvAEPg"
 - Distinguished Name: /uni/tn-dmz/ap-nets/epg-v0999
GUI Location:
Tenants > dmz > Application Profiles > nets > Application EPGs > v0999
*/
resource "aci_application_epg" "nets_v0999" {
	depends_on						= [aci_tenant.dmz,aci_application_profile.dmz_nets]
	application_profile_dn			= aci_application_profile.dmz_nets.id
	name							= "v0999"
	description						= "dirtyDMZ"
	flood_on_encap					= "disabled"
	fwd_ctrl						= "none"
	has_mcast_source				= "no"
	is_attr_based_epg				= "no"
	match_t							= "AtleastOne"
	pc_enf_pref						= "enforced"
	pref_gr_memb					= "exclude"
	prio							= "level3"
	shutdown						= "no"
	relation_fv_rs_bd				= aci_bridge_domain.dmz_v0999.id
	relation_fv_rs_aepg_mon_pol		= "uni/tn-common/monepg-default"
}

/*
API Information:
 - Class: "fvRsDomAtt"
 - Distinguished Name: /uni/tn-dmz/ap-nets/epg-v0999/rsdomAtt-[uni/phys-Access_phys]
GUI Location:
Tenants > dmz > Application Profiles > nets > Application EPGs > v0999 > Domains (VMs and Bare-Metals)
*/
resource "aci_rest" "nets_v0999_phys-Access_phys" {
	depends_on		= [aci_application_epg.nets_v0999]
	path		= "/api/node/mo/uni/tn-dmz/ap-nets/epg-v0999.json"
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

