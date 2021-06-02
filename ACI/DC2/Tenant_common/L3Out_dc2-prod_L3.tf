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
resource "aci_l3_outside" "Tenant_common_L3Out_dc2-prod_L3" {
    depends_on                                          = [
        data.aci_l3_domain_profile.L3_Domain_l3out,
        aci_tenant.Tenant_common,
        aci_vrf.Tenant_common_VRF_prod
    ]
    tenant_dn                                           = aci_tenant.Tenant_common.id
    description                                         = "DC2 Production L3Out"
    name                                                = "dc2-prod_L3"
    enforce_rtctrl                                      = "export"
    target_dscp                                         = "unspecified"
    relation_l3ext_rs_ectx                              = aci_vrf.Tenant_common_VRF_prod.id
    relation_l3ext_rs_l3_dom_att                        = data.aci_l3_domain_profile.L3_Domain_l3out.id
}

#------------------------------------------------
# Enable BGP on the L3Out
#------------------------------------------------

/*
API Information:
 - Class: "bgpExtP"
 - Distinguished Name: "uni/tn-common/out-dc2-prod_L3/bgpExtP"
GUI Location:
 - Tenants > common > Networking > L3Outs > dc2-prod_L3 > Enable BGP (Checkbox)
*/
resource "aci_rest" "common_l3out_dc2-prod_L3_bgpExtP" {
    depends_on  = [
        aci_tenant.Tenant_common,
        aci_l3_outside.Tenant_common_L3Out_dc2-prod_L3,
    ]
    path        = "/api/node/mo/uni/tn-common/out-dc2-prod_L3/bgpExtP.json"
    class_name  = "bgpExtP"
    payload     = <<EOF
{
	"bgpExtP": {
		"attributes": {
			"dn": "uni/tn-common/out-dc2-prod_L3/bgpExtP",
			"status": "created"
		},
		"children": []
	}
}
    EOF
}

