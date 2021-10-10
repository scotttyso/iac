#------------------------------------------------
# Create L3Out
#------------------------------------------------

/*
API Information:
 - Class: "l3extOut"
 - Distinguished Name: "/uni/tn-route_leak/out-route_leak"
GUI Location:
 - Tenants > route_leak > Networking > L3Outs > route_leak
*/
resource "aci_l3_outside" "Tenant_route_leak_L3Out_route_leak" {
    depends_on                                          = [
        data.aci_l3_domain_profile.L3_Domain_l3out,
        aci_tenant.Tenant_route_leak,
        aci_vrf.Tenant_route_leak_VRF_route_leak
    ]
    tenant_dn                                           = aci_tenant.Tenant_route_leak.id
    description                                         = "Test Route Leak Tenant"
    name                                                = "route_leak"
    enforce_rtctrl                                      = ["export"]
    target_dscp                                         = "unspecified"
    relation_l3ext_rs_ectx                              = aci_vrf.Tenant_route_leak_VRF_route_leak.id
    relation_l3ext_rs_l3_dom_att                        = data.aci_l3_domain_profile.L3_Domain_l3out.id
}

#------------------------------------------------
# Enable BGP on the L3Out
#------------------------------------------------

/*
API Information:
 - Class: "bgpExtP"
 - Distinguished Name: "uni/tn-route_leak/out-route_leak/bgpExtP"
GUI Location:
 - Tenants > route_leak > Networking > L3Outs > route_leak > Enable BGP (Checkbox)
*/
resource "aci_l3out_bgp_external_policy" "route_leak_l3out_route_leak_bgpExtP" {
    depends_on  = [
        aci_tenant.Tenant_route_leak,
        aci_l3_outside.Tenant_route_leak_L3Out_route_leak,
    ]
    l3_outside_dn   = aci_l3_outside.Tenant_route_leak_L3Out_route_leak.id
}

