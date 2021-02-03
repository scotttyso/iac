/*
API Information:
 - Class: "fvCtx"
 - Distinguished Name: "uni/tn-common/ctx-dmz"
GUI Location:
 - Tenants > common > Networking > VRFs > dmz
*/
data "aci_vrf" "dmz" {
    depends_on  = [data.aci_tenant.common]
    tenant_dn   = data.aci_tenant.common.id
    name        = "dmz"
}

