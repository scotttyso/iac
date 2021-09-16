/*
API Information:
 - Class: "fvAEPg"
 - Distinguished Name: /uni/tn-prod/ap-nets/epg-Asgard_Migration
GUI Location:
Tenants > prod > Application Profiles > nets > Application EPGs > Asgard_Migration
*/
resource "aci_application_epg" "Tenant_prod_App_Profile_nets_EPG_Asgard_Migration" {
    depends_on                      = [
        aci_tenant.Tenant_prod,
        aci_application_profile.Tenant_prod_App_Profile_nets,
        aci_bridge_domain.Tenant_prod_Bridge_Domain_v1102,
    ]
    application_profile_dn          = aci_application_profile.Tenant_prod_App_Profile_nets.id
    name                            = "Asgard_Migration"
    flood_on_encap                  = "disabled"
    has_mcast_source                = "no"
    is_attr_based_epg               = "no"
    match_t                         = "AtleastOne"
    pc_enf_pref                     = "unenforced"
    pref_gr_memb                    = "include"
    prio                            = "unspecified"
    shutdown                        = "no"
    relation_fv_rs_bd               = aci_bridge_domain.Tenant_prod_Bridge_Domain_v1102.id
    relation_fv_rs_aepg_mon_pol     = "uni/tn-common/monepg-default"
}

/*
API Information:
 - Class: "fvRsDomAtt"
 - Distinguished Name: /uni/tn-prod/ap-nets/epg-Asgard_Migration/rsdomAtt-[uni/phys-access]
GUI Location:
Tenants > prod > Application Profiles > nets > Application EPGs > Asgard_Migration > Domains (VMs and Bare-Metals)
*/
resource "aci_rest" "Tenant_prod_App_Profile_nets_EPG_Asgard_Migration_phys-access" {
    depends_on  = [
        aci_application_epg.Tenant_prod_App_Profile_nets_EPG_Asgard_Migration
    ]
    path        = "/api/node/mo/uni/tn-prod/ap-nets/epg-Asgard_Migration.json"
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
resource "aci_epgs_using_function" "Tenant_prod_App_Profile_nets_EPG_Asgard_Migration_to_AEP_trunk_aep" {
  depends_on        = [
    data.aci_access_generic.AEP_trunk_aep,
    aci_application_epg.Tenant_prod_App_Profile_nets_EPG_Asgard_Migration
  ]
  access_generic_dn = data.aci_access_generic.AEP_trunk_aep.id
  tdn               = aci_application_epg.Tenant_prod_App_Profile_nets_EPG_Asgard_Migration.id
  encap             = "vlan-1102"
  instr_imedcy      = "immediate"
  mode              = "regular"
}

