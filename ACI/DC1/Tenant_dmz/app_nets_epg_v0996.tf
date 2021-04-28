/*
API Information:
 - Class: "fvAEPg"
 - Distinguished Name: /uni/tn-dmz/ap-nets/epg-v0996
GUI Location:
Tenants > dmz > Application Profiles > nets > Application EPGs > v0996
*/
resource "aci_application_epg" "nets_v0996" {
    depends_on                      = [
        aci_tenant.dmz,
        aci_application_profile.dmz_nets
    ]
    application_profile_dn          = aci_application_profile.dmz_nets.id
    name                            = "v0996"
    flood_on_encap                  = "disabled"
    has_mcast_source                = "no"
    is_attr_based_epg               = "no"
    match_t                         = "AtleastOne"
    pc_enf_pref                     = "unenforced"
    pref_gr_memb                    = "exclude"
    prio                            = "unspecified"
    shutdown                        = "no"
    relation_fv_rs_bd               = aci_bridge_domain.dmz_v0996.id
    relation_fv_rs_aepg_mon_pol     = "uni/tn-common/monepg-default"
}

