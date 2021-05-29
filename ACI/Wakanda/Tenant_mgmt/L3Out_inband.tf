#------------------------------------------------
# Create L3Out
#------------------------------------------------

/*
API Information:
 - Class: "l3extOut"
 - Distinguished Name: "/uni/tn-mgmt/out-inband"
GUI Location:
 - Tenants > mgmt > Networking > L3Outs > inband
*/
resource "aci_l3_outside" "Tenant_mgmt_L3Out_inband" {
    depends_on                                          = [
        data.aci_l3_domain_profile.L3_Domain_l3out,
        aci_tenant.Tenant_mgmt,
        aci_vrf.Tenant_mgmt_VRF_inb
    ]
    tenant_dn                                           = aci_tenant.Tenant_mgmt.id
    description                                         = "Inband L3Out"
    name                                                = "inband"
    enforce_rtctrl                                      = ["export"]
    target_dscp                                         = "unspecified"
    relation_l3ext_rs_ectx                              = aci_vrf.Tenant_mgmt_VRF_inb.id
    relation_l3ext_rs_l3_dom_att                        = data.aci_l3_domain_profile.L3_Domain_l3out.id
}

#------------------------------------------------
# Enable BGP on the L3Out
#------------------------------------------------

/*
API Information:
 - Class: "bgpExtP"
 - Distinguished Name: "uni/tn-mgmt/out-inband/bgpExtP"
GUI Location:
 - Tenants > mgmt > Networking > L3Outs > inband > Enable BGP (Checkbox)
*/
resource "aci_l3out_bgp_external_policy" "mgmt_l3out_inband_bgpExtP" {
    depends_on  = [
        aci_tenant.Tenant_mgmt,
        aci_l3_outside.Tenant_mgmt_L3Out_inband,
    ]
    l3_outside_dn   = aci_l3_outside.Tenant_mgmt_L3Out_inband.id
}

