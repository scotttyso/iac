/*
API Information:
 - Class: "l3extOut"
 - Distinguished Name: "/uni/tn-common/out-dc2-prod_L3"
GUI Location:
Tenants > common > Networking > L3Outs > dc2-prod_L3
*/
data "aci_l3_outside" "common_dc2-prod_L3" {
  tenant_dn  = data.aci_tenant.common.id
  name       = "dc2-prod_L3"
}

