/*
API Information:
 - Class: "fvAEPg"
 - Distinguished Name: /uni/tn-prod/ap-nets/epg-v0811
GUI Location:
Tenants > prod > Application Profiles > nets > Application EPGs > v0811
*/
resource "aci_application_epg" "nets_v0811" {
    depends_on                        = [aci_tenant.prod,aci_application_profile.prod_nets]
    application_profile_dn            = aci_application_profile.prod_nets.id
    name                            = "v0811"
    description                        = "Stretched_vl811"
    flood_on_encap                    = "disabled"
    has_mcast_source                = "no"
    is_attr_based_epg                = "no"
    match_t                            = "AtleastOne"
    pc_enf_pref                        = "enforced"
    pref_gr_memb                    = "include"
    prio                            = "level3"
    shutdown                        = "no"
    relation_fv_rs_bd                = aci_bridge_domain.prod_v0811.id
    relation_fv_rs_aepg_mon_pol        = "uni/tn-common/monepg-default"
}

/*
API Information:
 - Class: "fvRsDomAtt"
 - Distinguished Name: /uni/tn-prod/ap-nets/epg-v0811/rsdomAtt-[uni/phys-access_phys]
GUI Location:
Tenants > prod > Application Profiles > nets > Application EPGs > v0811 > Domains (VMs and Bare-Metals)
*/
resource "aci_rest" "nets_v0811_phys-access_phys" {
    depends_on        = [aci_application_epg.nets_v0811]
    path        = "/api/node/mo/uni/tn-prod/ap-nets/epg-v0811.json"
    class_name    = "fvRsDomAtt"
    payload        = <<EOF
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

