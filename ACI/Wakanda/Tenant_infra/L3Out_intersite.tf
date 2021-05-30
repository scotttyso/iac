#------------------------------------------------
# Create L3Out
#------------------------------------------------

/*
API Information:
 - Class: "l3extOut"
 - Distinguished Name: "/uni/tn-infra/out-intersite"
GUI Location:
 - Tenants > infra > Networking > L3Outs > intersite
*/
resource "aci_l3_outside" "Tenant_infra_L3Out_intersite" {
    depends_on                                          = [
        data.aci_l3_domain_profile.L3_Domain_l3out,
        aci_tenant.Tenant_infra,
        aci_vrf.Tenant_infra_VRF_overlay-1
    ]
    tenant_dn                                           = aci_tenant.Tenant_infra.id
    description                                         = "Multi-Site L3Out"
    name                                                = "intersite"
    enforce_rtctrl                                      = ["export"]
    target_dscp                                         = "unspecified"
    relation_l3ext_rs_ectx                              = aci_vrf.Tenant_infra_VRF_overlay-1.id
    relation_l3ext_rs_l3_dom_att                        = data.aci_l3_domain_profile.L3_Domain_l3out.id
}

#------------------------------------------------
# Enable BGP on the L3Out
#------------------------------------------------

/*
API Information:
 - Class: "bgpExtP"
 - Distinguished Name: "uni/tn-infra/out-intersite/bgpExtP"
GUI Location:
 - Tenants > infra > Networking > L3Outs > intersite > Enable BGP (Checkbox)
*/
resource "aci_l3out_bgp_external_policy" "infra_l3out_intersite_bgpExtP" {
    depends_on  = [
        aci_tenant.Tenant_infra,
        aci_l3_outside.Tenant_infra_L3Out_intersite,
    ]
    l3_outside_dn   = aci_l3_outside.Tenant_infra_L3Out_intersite.id
}

#------------------------------------------------
# Assign a OSPF Routing Policy to the L3Out
#------------------------------------------------

/*
API Information:
 - Class: "ospfExtP"
 - Distinguished Name: "/uni/tn-infra/out-intersite/ospfExtP"
GUI Location:
 - Tenants > infra > Networking > L3Outs > intersite: OSPF
*/
resource "aci_l3out_ospf_external_policy" "Tenant_infra_L3Out_intersite_OSPF_Policy" {
    depends_on      = [
        aci_tenant.Tenant_infra,
        aci_l3_outside.Tenant_infra_L3Out_intersite
    ]
    l3_outside_dn   = aci_l3_outside.Tenant_infra_L3Out_intersite.id
    area_cost  = "1"
    area_ctrl = "redistribute,summary"
    area_id  = "backbone"
    area_type = "regular"
    # multipod_internal = "no"
}

