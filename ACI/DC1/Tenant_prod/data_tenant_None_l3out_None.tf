/*
API Information:
 - Class: "l3extOut"
 - Distinguished Name: "/uni/tn-None/out-None"
GUI Location:
Tenants > None > Networking > L3Outs > None
*/
data "aci_l3_outside" "None_None" {
  depends_on  = [
    data.aci_tenant.None
  ]
  tenant_dn   = data.aci_tenant.None.id
  name        = "None"
}

