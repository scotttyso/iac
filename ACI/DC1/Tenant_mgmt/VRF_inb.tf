/*
API Information:
 - Class: "fvCtx"
 - Distinguished Name: "uni/tn-mgmt/ctx-inb"
GUI Location:
 - Tenants > mgmt > Networking > VRFs > inb
*/
resource "aci_vrf" "Tenant_mgmt_VRF_inb" {
    depends_on                              = [
        aci_tenant.Tenant_mgmt
    ]
    tenant_dn                               = aci_tenant.Tenant_mgmt.id
    bd_enforced_enable                      = "no"
    description                             = "Built-In inb VRF"
    ip_data_plane_learning                  = "enabled"
    knw_mcast_act                           = "permit"
    name                                    = "inb"
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
 - Distinguished Name: "uni/tn-mgmt/ctx-inb/snmpctx"
GUI Location:
 - Tenants > mgmt > Networking > VRFs > inb > Create SNMP Context
*/
resource "aci_rest" "Tenant_mgmt_VRF_inb_snmp_ctx" {
    depends_on  = [
        aci_tenant.Tenant_mgmt,
        aci_vrf.Tenant_mgmt_VRF_inb
    ]
    path        = "/api/node/mo/uni/tn-mgmt/ctx-inb/snmpctx.json"
    class_name  = "snmpCtxP"
    payload     = <<EOF
{
    "snmpCtxP": {
        "attributes": {
            "dn": "uni/tn-mgmt/ctx-inb/snmpctx",
            "name": "inb",
            "rn": "snmpctx"
        },
        "children": []
    }
}
    EOF
}

