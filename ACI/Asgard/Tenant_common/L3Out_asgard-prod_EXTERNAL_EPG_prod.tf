/*
API Information:
 - Class: "l3extInstP"
 - Distinguised Name: "/uni/tn-common/out-asgard-prod/instP-prod"
GUI Location:
 - Tenants > common > Networking > L3Outs > asgard-prod > External EPGs > prod
*/
resource "aci_external_network_instance_profile" "Tenant_common_L3Out_asgard-prod_External_EPG_prod" {
    depends_on                                  = [
        aci_tenant.Tenant_common,
        aci_l3_outside.Tenant_common_L3Out_asgard-prod
    ]
    l3_outside_dn                               = aci_l3_outside.Tenant_common_L3Out_asgard-prod.id
    description                                 = "Asgard Prod"
    flood_on_encap                              = "disabled"
    match_t                                     = "AtleastOne"
    name                                        = "prod"
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
 - Distinguised Name: "/uni/tn-common/out-asgard-prod/instP-prod/extsubnet-[0.0.0.0/1]"
GUI Location:
 - Tenants > common > Networking > L3Outs > asgard-prod > External EPGs > prod
*/
resource "aci_l3_ext_subnet" "Tenant_common_L3Out_asgard-prod_External_EPG_prod_Subnet_0-0-0-0_1" {
    depends_on                              = [
        aci_tenant.Tenant_common,
        aci_l3_outside.Tenant_common_L3Out_asgard-prod,
        aci_external_network_instance_profile.Tenant_common_L3Out_asgard-prod_External_EPG_prod
    ]
    external_network_instance_profile_dn    = aci_external_network_instance_profile.Tenant_common_L3Out_asgard-prod_External_EPG_prod.id
    description                             = "Asgard Prod"
    ip                                      = "0.0.0.0/1"
    scope                                   = ["import-security"]
}

#------------------------------------------------
# Assign a Subnet to an External EPG
#------------------------------------------------

/*
API Information:
 - Class: "l3extSubnet"
 - Distinguised Name: "/uni/tn-common/out-asgard-prod/instP-prod/extsubnet-[128.0.0.0/1]"
GUI Location:
 - Tenants > common > Networking > L3Outs > asgard-prod > External EPGs > prod
*/
resource "aci_l3_ext_subnet" "Tenant_common_L3Out_asgard-prod_External_EPG_prod_Subnet_128-0-0-0_1" {
    depends_on                              = [
        aci_tenant.Tenant_common,
        aci_l3_outside.Tenant_common_L3Out_asgard-prod,
        aci_external_network_instance_profile.Tenant_common_L3Out_asgard-prod_External_EPG_prod
    ]
    external_network_instance_profile_dn    = aci_external_network_instance_profile.Tenant_common_L3Out_asgard-prod_External_EPG_prod.id
    description                             = "Asgard Prod"
    ip                                      = "128.0.0.0/1"
    scope                                   = ["import-security"]
}

