/*
API Information:
 - Class: "l3extOut"
 - Distinguished L3_Out: "/uni/tn-common/out-dc1-dmz_L3"
GUI Location:
Tenants > common > Networking > L3Outs > dc1-dmz_L3
*/
resource "aci_l3_outside" "common_dc1-dmz_L3" {
    depends_on                                             = [data.aci_tenant.common,aci_vrf.dmz]
    tenant_dn                                              = data.aci_tenant.common.id
    description                                            = "DC1 DMZ L3Out"
    name                                                   = "dc1-dmz_L3"
    enforce_rtctrl                                        = "export"
    target_dscp                                            = "unspecified"
    relation_l3ext_rs_ectx                              = aci_vrf.dmz.id
    relation_l3ext_rs_l3_dom_att                        = data.aci_l3_domain_profile.L3Out.id
}

