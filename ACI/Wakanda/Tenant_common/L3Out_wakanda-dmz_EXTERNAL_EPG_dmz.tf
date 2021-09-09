/*
API Information:
 - Class: "l3extInstP"
 - Distinguised Name: "/uni/tn-common/out-wakanda-dmz/instP-dmz"
GUI Location:
 - Tenants > common > Networking > L3Outs > wakanda-dmz > External EPGs > dmz
*/
resource "aci_external_network_instance_profile" "Tenant_common_L3Out_wakanda-dmz_External_EPG_dmz" {
    depends_on                                  = [
        aci_tenant.Tenant_common,
        aci_l3_outside.Tenant_common_L3Out_wakanda-dmz
    ]
    l3_outside_dn                               = aci_l3_outside.Tenant_common_L3Out_wakanda-dmz.id
    description                                 = "Wakanda DMZ"
    flood_on_encap                              = "disabled"
    match_t                                     = "AtleastOne"
    name                                        = "dmz"
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
 - Distinguised Name: "/uni/tn-common/out-wakanda-dmz/instP-dmz/extsubnet-[0.0.0.0/1]"
GUI Location:
 - Tenants > common > Networking > L3Outs > wakanda-dmz > External EPGs > dmz
*/
resource "aci_l3_ext_subnet" "Tenant_common_L3Out_wakanda-dmz_External_EPG_dmz_Subnet_0-0-0-0_1" {
    depends_on                              = [
        aci_tenant.Tenant_common,
        aci_l3_outside.Tenant_common_L3Out_wakanda-dmz,
        aci_external_network_instance_profile.Tenant_common_L3Out_wakanda-dmz_External_EPG_dmz
    ]
    external_network_instance_profile_dn    = aci_external_network_instance_profile.Tenant_common_L3Out_wakanda-dmz_External_EPG_dmz.id
    description                             = "Wakanda DMZ"
    ip                                      = "0.0.0.0/1"
    scope                                   = ["import-security"]
}

#------------------------------------------------
# Assign a Subnet to an External EPG
#------------------------------------------------

/*
API Information:
 - Class: "l3extSubnet"
 - Distinguised Name: "/uni/tn-common/out-wakanda-dmz/instP-dmz/extsubnet-[128.0.0.0/1]"
GUI Location:
 - Tenants > common > Networking > L3Outs > wakanda-dmz > External EPGs > dmz
*/
resource "aci_l3_ext_subnet" "Tenant_common_L3Out_wakanda-dmz_External_EPG_dmz_Subnet_128-0-0-0_1" {
    depends_on                              = [
        aci_tenant.Tenant_common,
        aci_l3_outside.Tenant_common_L3Out_wakanda-dmz,
        aci_external_network_instance_profile.Tenant_common_L3Out_wakanda-dmz_External_EPG_dmz
    ]
    external_network_instance_profile_dn    = aci_external_network_instance_profile.Tenant_common_L3Out_wakanda-dmz_External_EPG_dmz.id
    description                             = "Wakanda DMZ"
    ip                                      = "128.0.0.0/1"
    scope                                   = ["import-security"]
}

