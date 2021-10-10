/*
API Information:
 - Class: "l3extInstP"
 - Distinguised Name: "/uni/tn-route_leak/out-route_leak/instP-route_leak"
GUI Location:
 - Tenants > route_leak > Networking > L3Outs > route_leak > External EPGs > route_leak
*/
resource "aci_external_network_instance_profile" "Tenant_route_leak_L3Out_route_leak_External_EPG_route_leak" {
    depends_on                                  = [
        aci_tenant.Tenant_route_leak,
        aci_l3_outside.Tenant_route_leak_L3Out_route_leak
    ]
    l3_outside_dn                               = aci_l3_outside.Tenant_route_leak_L3Out_route_leak.id
    description                                 = "Wakanda Route Leak"
    flood_on_encap                              = "disabled"
    match_t                                     = "AtleastOne"
    name                                        = "route_leak"
    pref_gr_memb                                = "include"
    prio                                        = "unspecified"
    target_dscp                                 = "unspecified"
}

#------------------------------------------------
# Assign a Subnet to an External EPG
#------------------------------------------------

/*
API Information:
 - Class: "l3extSubnet"
 - Distinguised Name: "/uni/tn-route_leak/out-route_leak/instP-route_leak/extsubnet-[0.0.0.0/1]"
GUI Location:
 - Tenants > route_leak > Networking > L3Outs > route_leak > External EPGs > route_leak
*/
resource "aci_l3_ext_subnet" "Tenant_route_leak_L3Out_route_leak_External_EPG_route_leak_Subnet_0-0-0-0_1" {
    depends_on                              = [
        aci_tenant.Tenant_route_leak,
        aci_l3_outside.Tenant_route_leak_L3Out_route_leak,
        aci_external_network_instance_profile.Tenant_route_leak_L3Out_route_leak_External_EPG_route_leak
    ]
    external_network_instance_profile_dn    = aci_external_network_instance_profile.Tenant_route_leak_L3Out_route_leak_External_EPG_route_leak.id
    description                             = "Wakanda Route Leak"
    ip                                      = "0.0.0.0/1"
    scope                                   = ["import-security"]
}

#------------------------------------------------
# Assign a Subnet to an External EPG
#------------------------------------------------

/*
API Information:
 - Class: "l3extSubnet"
 - Distinguised Name: "/uni/tn-route_leak/out-route_leak/instP-route_leak/extsubnet-[128.0.0.0/1]"
GUI Location:
 - Tenants > route_leak > Networking > L3Outs > route_leak > External EPGs > route_leak
*/
resource "aci_l3_ext_subnet" "Tenant_route_leak_L3Out_route_leak_External_EPG_route_leak_Subnet_128-0-0-0_1" {
    depends_on                              = [
        aci_tenant.Tenant_route_leak,
        aci_l3_outside.Tenant_route_leak_L3Out_route_leak,
        aci_external_network_instance_profile.Tenant_route_leak_L3Out_route_leak_External_EPG_route_leak
    ]
    external_network_instance_profile_dn    = aci_external_network_instance_profile.Tenant_route_leak_L3Out_route_leak_External_EPG_route_leak.id
    description                             = "Wakanda Route Leak"
    ip                                      = "128.0.0.0/1"
    scope                                   = ["import-security"]
}

