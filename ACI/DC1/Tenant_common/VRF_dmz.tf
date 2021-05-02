/*
API Information:
 - Class: "fvCtx"
 - Distinguished Name: "uni/tn-common/ctx-dmz"
GUI Location:
 - Tenants > common > Networking > VRFs > dmz
*/
resource "aci_vrf" "Tenant_common_VRF_dmz" {
    depends_on                              = [
        aci_tenant.Tenant_common
    ]
    tenant_dn                               = aci_tenant.Tenant_common.id
    bd_enforced_enable                      = "no"
    description                             = "DMZ VRF"
    ip_data_plane_learning                  = "enabled"
    knw_mcast_act                           = "permit"
    name                                    = "dmz"
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
GUI Location:
 - Tenants > common > Networking > VRFs > dmz > EPG Collection for VRF: [Provided/Consumed Contracts]
*/
resource "aci_any" "Tenant_common_VRF_dmz_vzAny" {
    depends_on                      = [
        aci_vrf.Tenant_common_VRF_dmz
    ]
    vrf_dn                          = aci_vrf.Tenant_common_VRF_dmz.id
    description                     = "vzAny for common dmz"
    match_t                         = "AtleastOne"
}

/*
API Information:
 - Class: "snmpCtxP"
 - Distinguished Name: "uni/tn-common/ctx-dmz/snmpctx"
GUI Location:
 - Tenants > common > Networking > VRFs > dmz > Create SNMP Context
*/
resource "aci_rest" "Tenant_common_VRF_dmz_snmp_ctx" {
    depends_on  = [
        aci_tenant.Tenant_common,
        aci_vrf.Tenant_common_VRF_dmz
    ]
    path        = "/api/node/mo/uni/tn-common/ctx-dmz/snmpctx.json"
    class_name  = "snmpCtxP"
    payload     = <<EOF
{
    "snmpCtxP": {
        "attributes": {
            "dn": "uni/tn-common/ctx-dmz/snmpctx",
            "name": "dmz",
            "rn": "snmpctx"
        },
        "children": []
    }
}
    EOF
}

