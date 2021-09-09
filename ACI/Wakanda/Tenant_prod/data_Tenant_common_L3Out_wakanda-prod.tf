/*
API Information:
 - Class: "l3extOut"
 - Distinguished Name: "/uni/tn-common/out-wakanda-prod"
GUI Location:
Tenants > common > Networking > L3Outs > wakanda-prod
*/
data "aci_l3_outside" "Tenant_common_L3Out_wakanda-prod" {
  depends_on  = [
    data.aci_tenant.Tenant_common
  ]
  tenant_dn   = data.aci_tenant.Tenant_common.id
  name        = "wakanda-prod"
}

