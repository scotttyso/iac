/*
API Information:
 - Class: "l3extInstP"
 - Distinguised Name: "/uni/tn-infra/out-msite/instP-msite"
GUI Location:
 - Tenants > infra > Networking > L3Outs > msite > External EPGs > msite
*/
resource "aci_external_network_instance_profile" "Tenant_infra_L3Out_msite_External_EPG_msite" {
    depends_on                                  = [
        aci_tenant.Tenant_infra,
        aci_l3_outside.Tenant_infra_L3Out_msite
    ]
    l3_outside_dn                               = aci_l3_outside.Tenant_infra_L3Out_msite.id
    description                                 = "Multi-Site"
    flood_on_encap                              = "disabled"
    match_t                                     = "AtleastOne"
    name                                        = "msite"
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
 - Distinguised Name: "/uni/tn-infra/out-msite/instP-msite/extsubnet-[0.0.0.0/1]"
GUI Location:
 - Tenants > infra > Networking > L3Outs > msite > External EPGs > msite
*/
resource "aci_l3_ext_subnet" "Tenant_infra_L3Out_msite_External_EPG_msite_Subnet_0-0-0-0_1" {
    depends_on                              = [
        aci_tenant.Tenant_infra,
        aci_l3_outside.Tenant_infra_L3Out_msite,
        aci_external_network_instance_profile.Tenant_infra_L3Out_msite_External_EPG_msite
    ]
    external_network_instance_profile_dn    = aci_external_network_instance_profile.Tenant_infra_L3Out_msite_External_EPG_msite.id
    description                             = "Multi-Site"
    ip                                      = "0.0.0.0/1"
    scope                                   = ["import-security"]
}

#------------------------------------------------
# Assign a Subnet to an External EPG
#------------------------------------------------

/*
API Information:
 - Class: "l3extSubnet"
 - Distinguised Name: "/uni/tn-infra/out-msite/instP-msite/extsubnet-[128.0.0.0/1]"
GUI Location:
 - Tenants > infra > Networking > L3Outs > msite > External EPGs > msite
*/
resource "aci_l3_ext_subnet" "Tenant_infra_L3Out_msite_External_EPG_msite_Subnet_128-0-0-0_1" {
    depends_on                              = [
        aci_tenant.Tenant_infra,
        aci_l3_outside.Tenant_infra_L3Out_msite,
        aci_external_network_instance_profile.Tenant_infra_L3Out_msite_External_EPG_msite
    ]
    external_network_instance_profile_dn    = aci_external_network_instance_profile.Tenant_infra_L3Out_msite_External_EPG_msite.id
    description                             = "Multi-Site"
    ip                                      = "128.0.0.0/1"
    scope                                   = ["import-security"]
}

