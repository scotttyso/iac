/*
API Information:
 - Class: "fvCtx"
 - Distinguished Name: "uni/tn-common/ctx-prod"
GUI Location:
 - Tenants > common > Networking > VRFs > prod
*/
data "aci_vrf" "prod" {
    depends_on  = [data.aci_tenant.common]
    tenant_dn   = data.aci_tenant.common.id
    name        = "prod"
}

