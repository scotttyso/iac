/*
API Information:
 - Class: "fvAEPg"
 - Distinguished Name: /uni/tn-prod/ap-nets/epg-Panther_VM1
GUI Location:
Tenants > prod > Application Profiles > nets > Application EPGs > Panther_VM1
*/
resource "aci_application_epg" "Tenant_prod_App_Profile_nets_EPG_Panther_VM1" {
    depends_on                      = [
        aci_tenant.Tenant_prod,
        aci_application_profile.Tenant_prod_App_Profile_nets,
        aci_bridge_domain.Tenant_prod_Bridge_Domain_v2110,
    ]
    application_profile_dn          = aci_application_profile.Tenant_prod_App_Profile_nets.id
    name                            = "Panther_VM1"
    flood_on_encap                  = "disabled"
    has_mcast_source                = "no"
    is_attr_based_epg               = "no"
    match_t                         = "AtleastOne"
    pc_enf_pref                     = "unenforced"
    pref_gr_memb                    = "include"
    prio                            = "unspecified"
    shutdown                        = "no"
    relation_fv_rs_bd               = aci_bridge_domain.Tenant_prod_Bridge_Domain_v2110.id
    relation_fv_rs_aepg_mon_pol     = "uni/tn-common/monepg-default"
}

/*
API Information:
 - Class: "fvRsDomAtt"
 - Distinguished Name: /uni/tn-prod/ap-nets/epg-Panther_VM1/rsdomAtt-[uni/phys-access]
GUI Location:
Tenants > prod > Application Profiles > nets > Application EPGs > Panther_VM1 > Domains (VMs and Bare-Metals)
*/
resource "aci_rest" "Tenant_prod_App_Profile_nets_EPG_Panther_VM1_phys-access" {
    depends_on  = [
        aci_application_epg.Tenant_prod_App_Profile_nets_EPG_Panther_VM1
    ]
    path        = "/api/node/mo/uni/tn-prod/ap-nets/epg-Panther_VM1.json"
    class_name  = "fvRsDomAtt"
    payload     = <<EOF
{
    "fvRsDomAtt": {
        "attributes": {
            "tDn": "uni/phys-access"
        },
        "children": []
    }
}
    EOF
}

