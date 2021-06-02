/*
API Information:
 - Class: "l3extOut"
 - Distinguished Name: "/uni/tn-common/out-asgard-dmz"
GUI Location:
Tenants > common > Networking > L3Outs > asgard-dmz
*/
data "aci_l3_outside" "Tenant_common_L3Out_asgard-dmz" {
  depends_on  = [
    data.aci_tenant.Tenant_common
  ]
  tenant_dn   = data.aci_tenant.Tenant_common.id
  name        = "asgard-dmz"
}

