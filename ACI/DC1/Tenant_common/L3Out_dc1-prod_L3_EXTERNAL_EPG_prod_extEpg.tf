/*
API Information:
 - Class: "l3extInstP"
 - Distinguised Name: "/uni/tn-common/out-dc1-prod_L3/instP-prod_extEpg"
GUI Location:
 - Tenants > common > Networking > L3Outs > dc1-prod_L3 > External EPGs > prod_extEpg
*/
resource "aci_external_network_instance_profile" "Tenant_common_L3Out_dc1-prod_L3_External_EPG_prod_extEpg" {
    depends_on                                  = [
        aci_tenant.Tenant_common,
        aci_l3_outside.Tenant_common_L3Out_dc1-prod_L3
    ]
    l3_outside_dn                               = aci_l3_outside.Tenant_common_L3Out_dc1-prod_L3.id
    description                                 = "DC1 Production L3Out"
    flood_on_encap                              = "disabled"
    match_t                                     = "AtleastOne"
    name                                        = "prod_extEpg"
    pref_gr_memb                                = "exclude"
    prio                                        = "unspecified"
    target_dscp                                 = "unspecified"
}

#------------------------------------------------
# Assign a Subnet to an External EPG
#------------------------------------------------

/*
API Information:
 - Class: "l3extSubnet"
 - Distinguised Name: "/uni/tn-common/out-dc1-prod_L3/instP-prod_extEpg/extsubnet-[0.0.0.0/1]"
GUI Location:
 - Tenants > common > Networking > L3Outs > dc1-prod_L3 > External EPGs > prod_extEpg
*/
resource "aci_l3_ext_subnet" "Tenant_common_L3Out_dc1-prod_L3_External_EPG_prod_extEpg_Subnet_0-0-0-0_1" {
    depends_on                              = [
        aci_tenant.Tenant_common,
        aci_l3_outside.Tenant_common_L3Out_dc1-prod_L3,
        aci_external_network_instance_profile.Tenant_common_L3Out_dc1-prod_L3_External_EPG_prod_extEpg
    ]
    external_network_instance_profile_dn    = aci_external_network_instance_profile.Tenant_common_L3Out_dc1-prod_L3_External_EPG_prod_extEpg.id
    description                             = "DC1 Production L3Out"
    ip                                      = "0.0.0.0/1"
    scope                                   = ["import-security"]
}

#------------------------------------------------
# Assign a Subnet to an External EPG
#------------------------------------------------

/*
API Information:
 - Class: "l3extSubnet"
 - Distinguised Name: "/uni/tn-common/out-dc1-prod_L3/instP-prod_extEpg/extsubnet-[128.0.0.0/1]"
GUI Location:
 - Tenants > common > Networking > L3Outs > dc1-prod_L3 > External EPGs > prod_extEpg
*/
resource "aci_l3_ext_subnet" "Tenant_common_L3Out_dc1-prod_L3_External_EPG_prod_extEpg_Subnet_128-0-0-0_1" {
    depends_on                              = [
        aci_tenant.Tenant_common,
        aci_l3_outside.Tenant_common_L3Out_dc1-prod_L3,
        aci_external_network_instance_profile.Tenant_common_L3Out_dc1-prod_L3_External_EPG_prod_extEpg
    ]
    external_network_instance_profile_dn    = aci_external_network_instance_profile.Tenant_common_L3Out_dc1-prod_L3_External_EPG_prod_extEpg.id
    description                             = "DC1 Production L3Out"
    ip                                      = "128.0.0.0/1"
    scope                                   = ["import-security"]
}

