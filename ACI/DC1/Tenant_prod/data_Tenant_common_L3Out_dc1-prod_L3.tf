/*
API Information:
 - Class: "l3extOut"
 - Distinguished Name: "/uni/tn-common/out-dc1-prod_L3"
GUI Location:
Tenants > common > Networking > L3Outs > dc1-prod_L3
*/
data "aci_l3_outside" "Tenant_common_L3Out_dc1-prod_L3" {
  depends_on  = [
    data.aci_tenant.Tenant_common
  ]
  tenant_dn   = data.aci_tenant.Tenant_common.id
  name        = "dc1-prod_L3"
}
