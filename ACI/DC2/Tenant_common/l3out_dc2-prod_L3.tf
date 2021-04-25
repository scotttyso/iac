#------------------------------------------------
# Create L3Out
#------------------------------------------------

/*
API Information:
 - Class: "l3extOut"
 - Distinguished Name: "/uni/tn-common/out-dc2-prod_L3"
GUI Location:
 - Tenants > common > Networking > L3Outs > dc2-prod_L3
*/
resource "aci_l3_outside" "common_l3out_dc2-prod_L3" {
    depends_on                                          = [
        data.aci_l3_domain_profile.L3Out,
        aci_tenant.common,
        aci_vrf.common_prod
    ]
    tenant_dn                                           = aci_tenant.common.id
    description                                         = "DC2 Production L3Out"
    name                                                = "dc2-prod_L3"
    enforce_rtctrl                                      = "export"
    target_dscp                                         = "unspecified"
    relation_l3ext_rs_ectx                              = aci_vrf.common_prod.id
    relation_l3ext_rs_l3_dom_att                        = data.aci_l3_domain_profile.L3Out.id
}

