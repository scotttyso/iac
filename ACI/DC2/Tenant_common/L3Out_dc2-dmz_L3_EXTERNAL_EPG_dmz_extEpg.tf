/*
API Information:
 - Class: "l3extInstP"
 - Distinguised Name: "/uni/tn-common/out-dc2-dmz_L3/instP-dmz_extEpg"
GUI Location:
 - Tenants > common > Networking > L3Outs > dc2-dmz_L3 > External EPGs > dmz_extEpg
*/
resource "aci_external_network_instance_profile" "Tenant_common_L3Out_dc2-dmz_L3_External_EPG_dmz_extEpg" {
    depends_on                                  = [
        aci_tenant.Tenant_common,
        aci_l3_outside.Tenant_common_L3Out_dc2-dmz_L3
    ]
    l3_outside_dn                               = aci_l3_outside.Tenant_common_L3Out_dc2-dmz_L3.id
    description                                 = "DC2 DMZ L3Out"
    flood_on_encap                              = "disabled"
    match_t                                     = "AtleastOne"
    name                                        = "dmz_extEpg"
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
 - Distinguised Name: "/uni/tn-common/out-dc2-dmz_L3/instP-dmz_extEpg/extsubnet-[0.0.0.0/0]"
GUI Location:
 - Tenants > common > Networking > L3Outs > dc2-dmz_L3 > External EPGs > dmz_extEpg
*/
resource "aci_l3_ext_subnet" "Tenant_common_L3Out_dc2-dmz_L3_External_EPG_dmz_extEpg_Subnet_0-0-0-0_0" {
    depends_on                              = [
        aci_tenant.Tenant_common,
        aci_l3_outside.Tenant_common_L3Out_dc2-dmz_L3,
        aci_external_network_instance_profile.Tenant_common_L3Out_dc2-dmz_L3_External_EPG_dmz_extEpg
    ]
    external_network_instance_profile_dn    = aci_external_network_instance_profile.Tenant_common_L3Out_dc2-dmz_L3_External_EPG_dmz_extEpg.id
    description                             = "DC2 DMZ L3Out"
    ip                                      = "0.0.0.0/0"
    scope                                   = ["import-security"]
}

