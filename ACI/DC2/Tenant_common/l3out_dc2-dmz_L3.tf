/*
API Information:
 - Class: "l3extOut"
 - Distinguished L3Out: "/uni/tn-common/out-dc2-dmz_L3"
GUI Location:
Tenants > common > Networking > L3Outs > dc2-dmz_L3
*/
resource "aci_l3_outside" "common_dc2-dmz_L3" {
    depends_on                                          = [data.aci_tenant.common,aci_vrf.common_dmz]
    tenant_dn                                           = data.aci_tenant.common.id
    description                                         = "DC2 DMZ L3Out"
    name                                                = "dc2-dmz_L3"
    enforce_rtctrl                                      = "export"
    target_dscp                                         = "unspecified"
    relation_l3ext_rs_ectx                              = aci_vrf.common_dmz.id
    relation_l3ext_rs_l3_dom_att                        = data.aci_l3_domain_profile.L3Out.id
}
