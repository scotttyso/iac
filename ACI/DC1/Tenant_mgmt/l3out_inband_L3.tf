#------------------------------------------------
# Create L3Out
#------------------------------------------------

/*
API Information:
 - Class: "l3extOut"
 - Distinguished Name: "/uni/tn-mgmt/out-inband_L3"
GUI Location:
 - Tenants > mgmt > Networking > L3Outs > inband_L3
*/
resource "aci_l3_outside" "mgmt_l3out_inband_L3" {
    depends_on                                          = [
        data.aci_l3_domain_profile.L3Out,
        aci_tenant.mgmt,
        aci_vrf.mgmt_inb
    ]
    tenant_dn                                           = aci_tenant.mgmt.id
    description                                         = "Inband L3Out"
    name                                                = "inband_L3"
    enforce_rtctrl                                      = "export"
    target_dscp                                         = "unspecified"
    relation_l3ext_rs_ectx                              = aci_vrf.mgmt_inb.id
    relation_l3ext_rs_l3_dom_att                        = data.aci_l3_domain_profile.L3Out.id
}

