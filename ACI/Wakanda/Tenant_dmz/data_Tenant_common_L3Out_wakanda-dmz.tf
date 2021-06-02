/*
API Information:
 - Class: "l3extOut"
 - Distinguished Name: "/uni/tn-common/out-wakanda-dmz"
GUI Location:
Tenants > common > Networking > L3Outs > wakanda-dmz
*/
data "aci_l3_outside" "Tenant_common_L3Out_wakanda-dmz" {
  depends_on  = [
    data.aci_tenant.Tenant_common
  ]
  tenant_dn   = data.aci_tenant.Tenant_common.id
  name        = "wakanda-dmz"
}

