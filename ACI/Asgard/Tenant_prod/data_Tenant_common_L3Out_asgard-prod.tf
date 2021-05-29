/*
API Information:
 - Class: "l3extOut"
 - Distinguished Name: "/uni/tn-common/out-asgard-prod"
GUI Location:
Tenants > common > Networking > L3Outs > asgard-prod
*/
data "aci_l3_outside" "Tenant_common_L3Out_asgard-prod" {
  depends_on  = [
    data.aci_tenant.Tenant_common
  ]
  tenant_dn   = data.aci_tenant.Tenant_common.id
  name        = "asgard-prod"
}

