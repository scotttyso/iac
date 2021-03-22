/*
API Information:
 - Class: "l3extOut"
 - Distinguished L3_Out: "/uni/tn-mgmt/out-inband_L3"
GUI Location:
Tenants > mgmt > Networking > L3Outs > inband_L3
*/
resource "aci_l3_outside" "mgmt_inband_L3" {
    depends_on                                             = [data.aci_tenant.mgmt,aci_vrf.inb]
    tenant_dn                                              = data.aci_tenant.mgmt.id
    description                                            = "Inband L3Out"
    name                                                   = "inband_L3"
    enforce_rtctrl                                        = "export"
    target_dscp                                            = "unspecified"
    relation_l3ext_rs_ectx                              = aci_vrf.inb.id
    relation_l3ext_rs_l3_dom_att                        = data.aci_l3_domain_profile.L3Out.id
}

