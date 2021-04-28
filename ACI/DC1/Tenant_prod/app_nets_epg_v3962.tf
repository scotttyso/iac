/*
API Information:
 - Class: "fvAEPg"
 - Distinguished Name: /uni/tn-prod/ap-nets/epg-v3962
GUI Location:
Tenants > prod > Application Profiles > nets > Application EPGs > v3962
*/
resource "aci_application_epg" "nets_v3962" {
    depends_on                      = [
        aci_tenant.prod,
        aci_application_profile.prod_nets
    ]
    application_profile_dn          = aci_application_profile.prod_nets.id
    name                            = "v3962"
    flood_on_encap                  = "disabled"
    has_mcast_source                = "no"
    is_attr_based_epg               = "no"
    match_t                         = "AtleastOne"
    pc_enf_pref                     = "unenforced"
    pref_gr_memb                    = "include"
    prio                            = "unspecified"
    shutdown                        = "no"
    relation_fv_rs_bd               = aci_bridge_domain.prod_v3962.id
    relation_fv_rs_aepg_mon_pol     = "uni/tn-common/monepg-default"
}

