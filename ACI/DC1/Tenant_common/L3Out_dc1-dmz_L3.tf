#------------------------------------------------
# Create L3Out
#------------------------------------------------

/*
API Information:
 - Class: "l3extOut"
 - Distinguished Name: "/uni/tn-common/out-dc1-dmz_L3"
GUI Location:
 - Tenants > common > Networking > L3Outs > dc1-dmz_L3
*/
resource "aci_l3_outside" "Tenant_common_L3Out_dc1-dmz_L3" {
    depends_on                                          = [
        data.aci_l3_domain_profile.L3_Domain_l3out,
        aci_tenant.Tenant_common,
        aci_vrf.Tenant_common_VRF_dmz
    ]
    tenant_dn                                           = aci_tenant.Tenant_common.id
    description                                         = "DC1 DMZ L3Out"
    name                                                = "dc1-dmz_L3"
    enforce_rtctrl                                      = "export"
    target_dscp                                         = "unspecified"
    relation_l3ext_rs_ectx                              = aci_vrf.Tenant_common_VRF_dmz.id
    relation_l3ext_rs_l3_dom_att                        = data.aci_l3_domain_profile.L3_Domain_l3out.id
}

