/*
API Information:
 - Class: "fvAEPg"
 - Distinguished Name: /uni/tn-dmz/ap-nets/epg-v0999
GUI Location:
Tenants > dmz > Application Profiles > nets > Application EPGs > v0999
*/
resource "aci_application_epg" "Tenant_dmz_App_Profile_nets_EPG_v0999" {
    depends_on                      = [
        aci_tenant.Tenant_dmz,
        aci_application_profile.Tenant_dmz_App_Profile_nets,
        aci_bridge_domain.Tenant_dmz_Bridge_Domain_v0999,
    ]
    application_profile_dn          = aci_application_profile.Tenant_dmz_App_Profile_nets.id
    name                            = "v0999"
    flood_on_encap                  = "disabled"
    has_mcast_source                = "no"
    is_attr_based_epg               = "no"
    match_t                         = "AtleastOne"
    pc_enf_pref                     = "unenforced"
    pref_gr_memb                    = "exclude"
    prio                            = "unspecified"
    shutdown                        = "no"
    relation_fv_rs_bd               = aci_bridge_domain.Tenant_dmz_Bridge_Domain_v0999.id
    relation_fv_rs_aepg_mon_pol     = "uni/tn-common/monepg-default"
}

