/*
API Information:
 - Class: "fvAEPg"
 - Distinguished Name: /uni/tn-prod/ap-sap_app/epg-sap_app
GUI Location:
Tenants > prod > Application Profiles > sap_app > Application EPGs > sap_app
*/
resource "aci_application_epg" "sap_app_sap_app" {
    depends_on                      = [aci_tenant.prod,aci_application_profile.prod_sap_app]
    application_profile_dn          = aci_application_profile.prod_sap_app.id
    name                            = "sap_app"
    flood_on_encap                  = "disabled"
    has_mcast_source                = "no"
    is_attr_based_epg               = "no"
    match_t                         = "AtleastOne"
    pc_enf_pref                     = "unenforced"
    pref_gr_memb                    = "include"
    prio                            = "unspecified"
    shutdown                        = "no"
    relation_fv_rs_bd               = aci_bridge_domain.prod_sap_app.id
    relation_fv_rs_aepg_mon_pol     = "uni/tn-common/monepg-default"
}

