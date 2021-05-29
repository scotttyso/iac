/*
API Information:
 - Class: "l3extInstP"
 - Distinguised Name: "/uni/tn-mgmt/out-inband/instP-inband"
GUI Location:
 - Tenants > mgmt > Networking > L3Outs > inband > External EPGs > inband
*/
resource "aci_external_network_instance_profile" "Tenant_mgmt_L3Out_inband_External_EPG_inband" {
    depends_on                                  = [
        aci_tenant.Tenant_mgmt,
        aci_l3_outside.Tenant_mgmt_L3Out_inband
    ]
    l3_outside_dn                               = aci_l3_outside.Tenant_mgmt_L3Out_inband.id
    description                                 = "inband"
    flood_on_encap                              = "disabled"
    match_t                                     = "AtleastOne"
    name                                        = "inband"
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
 - Distinguised Name: "/uni/tn-mgmt/out-inband/instP-inband/extsubnet-[0.0.0.0/1]"
GUI Location:
 - Tenants > mgmt > Networking > L3Outs > inband > External EPGs > inband
*/
resource "aci_l3_ext_subnet" "Tenant_mgmt_L3Out_inband_External_EPG_inband_Subnet_0-0-0-0_1" {
    depends_on                              = [
        aci_tenant.Tenant_mgmt,
        aci_l3_outside.Tenant_mgmt_L3Out_inband,
        aci_external_network_instance_profile.Tenant_mgmt_L3Out_inband_External_EPG_inband
    ]
    external_network_instance_profile_dn    = aci_external_network_instance_profile.Tenant_mgmt_L3Out_inband_External_EPG_inband.id
    description                             = "inband"
    ip                                      = "0.0.0.0/1"
    scope                                   = ["import-security"]
}

#------------------------------------------------
# Assign a Subnet to an External EPG
#------------------------------------------------

/*
API Information:
 - Class: "l3extSubnet"
 - Distinguised Name: "/uni/tn-mgmt/out-inband/instP-inband/extsubnet-[128.0.0.0/1]"
GUI Location:
 - Tenants > mgmt > Networking > L3Outs > inband > External EPGs > inband
*/
resource "aci_l3_ext_subnet" "Tenant_mgmt_L3Out_inband_External_EPG_inband_Subnet_128-0-0-0_1" {
    depends_on                              = [
        aci_tenant.Tenant_mgmt,
        aci_l3_outside.Tenant_mgmt_L3Out_inband,
        aci_external_network_instance_profile.Tenant_mgmt_L3Out_inband_External_EPG_inband
    ]
    external_network_instance_profile_dn    = aci_external_network_instance_profile.Tenant_mgmt_L3Out_inband_External_EPG_inband.id
    description                             = "inband"
    ip                                      = "128.0.0.0/1"
    scope                                   = ["import-security"]
}

