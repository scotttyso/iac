/*
API Information:
 - Class: "fvCtx"
 - Distinguished Name: "uni/tn-common/ctx-prod"
GUI Location:
 - Tenants > common > Networking > VRFs > prod
*/
resource "aci_vrf" "Tenant_common_VRF_prod" {
    depends_on                              = [
        aci_tenant.Tenant_common
    ]
    tenant_dn                               = aci_tenant.Tenant_common.id
    bd_enforced_enable                      = "no"
    description                             = "Production VRF"
    ip_data_plane_learning                  = "enabled"
    knw_mcast_act                           = "permit"
    name                                    = "prod"
    pc_enf_dir                              = "ingress"
    pc_enf_pref                             = "enforced"
    relation_fv_rs_ctx_to_ep_ret            = "uni/tn-common/epRPol-default"
    relation_fv_rs_ctx_mon_pol              = "uni/tn-common/monepg-default"
/*
*/
}

/*
GUI Location:
 - Tenants > common > Networking > VRFs > prod: Policy >  Preferred Group
*/
resource "aci_any" "Tenant_common_VRF_prod_Preferred_Group" {
    depends_on      = [
        aci_vrf.Tenant_common_VRF_prod
    ]
    vrf_dn          = aci_vrf.Tenant_common_VRF_prod.id
    description     = "Preferred Group for common prod"
    pref_gr_memb    = "enabled"
}

/*
API Information:
 - Class: "snmpCtxP"
 - Distinguished Name: "uni/tn-common/ctx-prod/snmpctx"
GUI Location:
 - Tenants > common > Networking > VRFs > prod > Create SNMP Context
*/
resource "aci_rest" "Tenant_common_VRF_prod_snmp_ctx" {
    depends_on  = [
        aci_tenant.Tenant_common,
        aci_vrf.Tenant_common_VRF_prod
    ]
    path        = "/api/node/mo/uni/tn-common/ctx-prod/snmpctx.json"
    class_name  = "snmpCtxP"
    payload     = <<EOF
{
    "snmpCtxP": {
        "attributes": {
            "dn": "uni/tn-common/ctx-prod/snmpctx",
            "name": "prod",
            "rn": "snmpctx"
        },
        "children": []
    }
}
    EOF
}

