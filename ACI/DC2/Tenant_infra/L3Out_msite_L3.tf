#------------------------------------------------
# Create L3Out
#------------------------------------------------

/*
API Information:
 - Class: "l3extOut"
 - Distinguished Name: "/uni/tn-infra/out-msite_L3"
GUI Location:
 - Tenants > infra > Networking > L3Outs > msite_L3
*/
resource "aci_l3_outside" "Tenant_infra_L3Out_msite_L3" {
    depends_on                                          = [
        data.aci_l3_domain_profile.L3_Domain_l3out,
        aci_tenant.Tenant_infra,
        aci_vrf.Tenant_overlay-1_VRF_overlay-1
    ]
    tenant_dn                                           = aci_tenant.Tenant_infra.id
    description                                         = "Multi-Site L3Out"
    name                                                = "msite_L3"
    enforce_rtctrl                                      = "export"
    target_dscp                                         = "unspecified"
    relation_l3ext_rs_ectx                              = aci_vrf.Tenant_overlay-1_VRF_overlay-1.id
    relation_l3ext_rs_l3_dom_att                        = data.aci_l3_domain_profile.L3_Domain_l3out.id
}

#------------------------------------------------
# Assign a OSPF Routing Policy to the L3Out
#------------------------------------------------

/*
API Information:
 - Class: "ospfExtP"
 - Distinguished Name: "/uni/tn-infra/out-msite_L3/ospfExtP"
GUI Location:
 - Tenants > infra > Networking > L3Outs > msite_L3: OSPF
*/
resource "aci_l3out_ospf_external_policy" "infra_l3out_msite_L3_OSPF_Policy" {
    depends_on      = [
        aci_tenant.infra,
        aci_l3_outside.infra_l3out_msite_L3
    ]
    l3_outside_dn   = aci_l3_outside.infra_l3out_msite_L3.id
    area_cost  = "1"
    area_ctrl = ""
    area_id  = "0.0.0.0"
    area_type = "regular"
    # multipod_internal = "no"
}

