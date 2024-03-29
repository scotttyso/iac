/*
API Information:
 - Class: "fvCtx"
 - Distinguished Name: "uni/tn-common/ctx-dmz"
GUI Location:
 - Tenants > common > Networking > VRFs > dmz
*/
data "aci_vrf" "Tenant_common_VRF_dmz" {
    depends_on  = [
        data.aci_tenant.Tenant_common
    ]
    tenant_dn   = data.aci_tenant.Tenant_common.id
    name        = "dmz"
}

