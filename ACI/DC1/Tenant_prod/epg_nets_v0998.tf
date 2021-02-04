/*
API Information:
 - Class: "fvAEPg"
 - Distinguished Name: /uni/tn-prod/ap-nets/epg-v0998
GUI Location:
Tenants > prod > Application Profiles > nets > Application EPGs > v0998
*/
resource "aci_application_epg" "nets_v0998" {
	depends_on						= [aci_tenant.prod,aci_application_profile.prod_nets]
	application_profile_dn			= aci_application_profile.prod_nets.id
	name							= "v0998"
	description						= "coreL3Peer"
	flood_on_encap					= "disabled"
	has_mcast_source				= "no"
	is_attr_based_epg				= "no"
	match_t							= "AtleastOne"
	pc_enf_pref						= "enforced"
	pref_gr_memb					= "include"
	prio							= "level3"
	shutdown						= "no"
	relation_fv_rs_bd				= aci_bridge_domain.prod_v0998.id
	relation_fv_rs_aepg_mon_pol		= "uni/tn-common/monepg-default"
}

/*
API Information:
 - Class: "fvRsDomAtt"
 - Distinguished Name: /uni/tn-prod/ap-nets/epg-v0998/rsdomAtt-[uni/phys-Access_phys]
GUI Location:
Tenants > prod > Application Profiles > nets > Application EPGs > v0998 > Domains (VMs and Bare-Metals)
*/
resource "aci_rest" "nets_v0998_phys-Access_phys" {
	depends_on		= [aci_application_epg.nets_v0998]
	path		= "/api/node/mo/uni/tn-prod/ap-nets/epg-v0998.json"
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

/*
API Information:
 - Class: "fvRsPathAtt"
 - Distinguished Name: "uni/tn-prod/ap-nets/epg-v0998/rspathAtt-[topology/pod-1/protpaths-201-202/pathep-[pg_vpc1_dc1-leaf201]"
GUI Location:
Tenants > prod > Application Profiles > nets > Application EPGs > v0998 > Static Ports > Pod-1/Node-201-202/pg_vpc1_dc1-leaf201
*/
resource "aci_epg_to_static_path" "nets_v0998_Pod-1_Nodes-201-202_pg_vpc1_dc1-leaf201" {
	depends_on           = [aci_application_epg.nets_v0998]
	application_epg_dn   = aci_application_epg.nets_v0998.id
	tdn                  = "topology/pod-1/protpaths-201-202/pathep-[pg_vpc1_dc1-leaf201]"
	encap                = "vlan-998"
	mode                 = "regular"
}

