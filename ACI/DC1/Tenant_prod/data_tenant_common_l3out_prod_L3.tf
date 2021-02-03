/*
API Information:
 - Class: "l3extOut"
 - Distinguished Name: "/uni/tn-common/out-prod_L3"
GUI Location:
Tenants > common > Networking > L3Outs > prod_L3
*/
data "aci_l3_outside" "common_prod_L3" {
  tenant_dn  = data.aci_tenant.common.id
  name       = "prod_L3"
}

