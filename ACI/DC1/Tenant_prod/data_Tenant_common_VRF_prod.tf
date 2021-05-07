/*
API Information:
 - Class: "fvCtx"
 - Distinguished Name: "uni/tn-common/ctx-prod"
GUI Location:
 - Tenants > common > Networking > VRFs > prod
*/
data "aci_vrf" "Tenant_common_VRF_prod" {
    depends_on  = [
        data.aci_tenant.Tenant_common
    ]
    tenant_dn   = data.aci_tenant.Tenant_common.id
    name        = "prod"
}

