/*
API Information:
 - Class: "fvAEPg"
 - Distinguished Name: /uni/tn-route_leak/ap-nets/epg-epg1
GUI Location:
Tenants > route_leak > Application Profiles > nets > Application EPGs > epg1
*/
resource "aci_application_epg" "Tenant_route_leak_App_Profile_nets_EPG_epg1" {
    depends_on                      = [
        aci_tenant.Tenant_route_leak,
        aci_application_profile.Tenant_route_leak_App_Profile_nets,
        aci_bridge_domain.Tenant_route_leak_Bridge_Domain_v2251,
    ]
    application_profile_dn          = aci_application_profile.Tenant_route_leak_App_Profile_nets.id
    name                            = "epg1"
    flood_on_encap                  = "disabled"
    has_mcast_source                = "no"
    is_attr_based_epg               = "no"
    match_t                         = "AtleastOne"
    pc_enf_pref                     = "unenforced"
    pref_gr_memb                    = "include"
    prio                            = "unspecified"
    shutdown                        = "no"
    relation_fv_rs_bd               = aci_bridge_domain.Tenant_route_leak_Bridge_Domain_v2251.id
    relation_fv_rs_aepg_mon_pol     = "uni/tn-common/monepg-default"
}

/*
API Information:
 - Class: "fvRsDomAtt"
 - Distinguished Name: /uni/tn-route_leak/ap-nets/epg-epg1/rsdomAtt-[uni/phys-access]
GUI Location:
Tenants > route_leak > Application Profiles > nets > Application EPGs > epg1 > Domains (VMs and Bare-Metals)
*/
resource "aci_rest" "Tenant_route_leak_App_Profile_nets_EPG_epg1_phys-access" {
    depends_on  = [
        aci_application_epg.Tenant_route_leak_App_Profile_nets_EPG_epg1
    ]
    path        = "/api/node/mo/uni/tn-route_leak/ap-nets/epg-epg1.json"
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

#------------------------------------------------------
# Create Attachable Access Entity Generic Encap Policy
#------------------------------------------------------

/*
API Information:
 - Class: "infraAttEntityP"
 - Distinguished Name: "uni/infra/attentp-trunk_aep"
GUI Location:
 - Fabric > Access Policies > Policies > Global > Attachable Access Entity Profiles : trunk_aep
*/
resource "aci_epgs_using_function" "Tenant_route_leak_App_Profile_nets_EPG_epg1_to_AEP_trunk_aep" {
  depends_on        = [
    data.aci_access_generic.AEP_trunk_aep,
    aci_application_epg.Tenant_route_leak_App_Profile_nets_EPG_epg1
  ]
  access_generic_dn = data.aci_access_generic.AEP_trunk_aep.id
  tdn               = aci_application_epg.Tenant_route_leak_App_Profile_nets_EPG_epg1.id
  encap             = "vlan-2251"
  instr_imedcy      = "immediate"
  mode              = "regular"
}

