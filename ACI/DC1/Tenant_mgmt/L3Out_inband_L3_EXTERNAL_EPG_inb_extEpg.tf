/*
API Information:
 - Class: "l3extInstP"
 - Distinguised Name: "/uni/tn-mgmt/out-inband_L3/instP-inb_extEpg"
GUI Location:
 - Tenants > mgmt > Networking > L3Outs > inband_L3 > External EPGs > inb_extEpg
*/
resource "aci_external_network_instance_profile" "Tenant_mgmt_L3Out_inband_L3_External_EPG_inb_extEpg" {
    depends_on                                  = [
        aci_tenant.Tenant_mgmt,
        aci_l3_outside.Tenant_mgmt_L3Out_inband_L3
    ]
    l3_outside_dn                               = aci_l3_outside.Tenant_mgmt_L3Out_inband_L3.id
    description                                 = "Inband L3Out"
    flood_on_encap                              = "disabled"
    match_t                                     = "AtleastOne"
    name                                        = "inb_extEpg"
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
 - Distinguised Name: "/uni/tn-mgmt/out-inband_L3/instP-inb_extEpg/extsubnet-[0.0.0.0/0]"
GUI Location:
 - Tenants > mgmt > Networking > L3Outs > inband_L3 > External EPGs > inb_extEpg
*/
resource "aci_l3_ext_subnet" "Tenant_mgmt_L3Out_inband_L3_External_EPG_inb_extEpg_Subnet_0-0-0-0_0" {
    depends_on                              = [
        aci_tenant.Tenant_mgmt,
        aci_l3_outside.Tenant_mgmt_L3Out_inband_L3,
        aci_external_network_instance_profile.Tenant_mgmt_L3Out_inband_L3_External_EPG_inb_extEpg
    ]
    external_network_instance_profile_dn    = aci_external_network_instance_profile.Tenant_mgmt_L3Out_inband_L3_External_EPG_inb_extEpg.id
    description                             = "Inband L3Out"
    ip                                      = "0.0.0.0/0"
    scope                                   = ["import-security"]
}

