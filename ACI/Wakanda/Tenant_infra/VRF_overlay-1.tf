/*
API Information:
 - Class: "fvCtx"
 - Distinguished Name: "uni/tn-infra/ctx-overlay-1"
GUI Location:
 - Tenants > infra > Networking > VRFs > overlay-1
*/
resource "aci_vrf" "Tenant_infra_VRF_overlay-1" {
    depends_on                              = [
        aci_tenant.Tenant_infra
    ]
    tenant_dn                               = aci_tenant.Tenant_infra.id
    bd_enforced_enable                      = "no"
    description                             = "Built-In infra VRF"
    ip_data_plane_learning                  = "enabled"
    knw_mcast_act                           = "permit"
    name                                    = "overlay-1"
    pc_enf_dir                              = "ingress"
    pc_enf_pref                             = "enforced"
    relation_fv_rs_ctx_to_ep_ret            = "uni/tn-common/epRPol-default"
    relation_fv_rs_ctx_mon_pol              = "uni/tn-common/monepg-default"
    relation_fv_rs_bgp_ctx_pol              = "uni/tn-common/bgpCtxP-default"
/*
    relation_fv_rs_ctx_to_bgp_ctx_af_pol    = [uni/tn-common/bgpCtxAfP-default]
    relation_fv_rs_ctx_to_eigrp_ctx_af_pol  = [uni/tn-common/eigrpCtxAfP-default]
*/
    relation_fv_rs_ospf_ctx_pol             = "uni/tn-common/ospfCtxP-default"
    relation_fv_rs_vrf_validation_pol       = "uni/tn-common/vrfvalidationpol-default"
}

/*
API Information:
 - Class: "snmpCtxP"
 - Distinguished Name: "uni/tn-infra/ctx-overlay-1/snmpctx"
GUI Location:
 - Tenants > infra > Networking > VRFs > overlay-1 > Create SNMP Context
*/
resource "aci_rest" "Tenant_infra_VRF_overlay-1_snmp_ctx" {
    depends_on  = [
        aci_tenant.Tenant_infra,
        aci_vrf.Tenant_infra_VRF_overlay-1
    ]
    path        = "/api/node/mo/uni/tn-infra/ctx-overlay-1/snmpctx.json"
    class_name  = "snmpCtxP"
    payload     = <<EOF
{
    "snmpCtxP": {
        "attributes": {
            "dn": "uni/tn-infra/ctx-overlay-1/snmpctx",
            "name": "overlay-1",
            "rn": "snmpctx"
        },
        "children": []
    }
}
    EOF
}

