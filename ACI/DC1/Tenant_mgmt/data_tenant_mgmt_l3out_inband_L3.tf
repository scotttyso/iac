/*
API Information:
 - Class: "l3extOut"
 - Distinguished Name: "/uni/tn-mgmt/out-inband_L3"
GUI Location:
Tenants > mgmt > Networking > L3Outs > inband_L3
*/
data "aci_l3_outside" "mgmt_inband_L3" {
  tenant_dn  = data.aci_tenant.mgmt.id
  name       = "inband_L3"
}

