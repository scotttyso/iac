/*
API Information:
 - Class: "fvCtx"
 - Distinguished Name: "uni/tn-route_leak/ctx-route_leak"
GUI Location:
 - Tenants > route_leak > Networking > VRFs > route_leak
*/
resource "aci_vrf" "Tenant_route_leak_VRF_route_leak" {
    depends_on                              = [
        aci_tenant.Tenant_route_leak
    ]
    tenant_dn                               = aci_tenant.Tenant_route_leak.id
    bd_enforced_enable                      = "no"
    description                             = "Test Route Leak Tenant"
    ip_data_plane_learning                  = "enabled"
    knw_mcast_act                           = "permit"
    name                                    = "route_leak"
    pc_enf_dir                              = "ingress"
    pc_enf_pref                             = "enforced"
    relation_fv_rs_ctx_to_ep_ret            = "uni/tn-common/epRPol-default"
    relation_fv_rs_ctx_mon_pol              = "uni/tn-common/monepg-default"
/*
*/
}

/*
GUI Location:
 - Tenants > route_leak > Networking > VRFs > route_leak: Policy >  Preferred Group
*/
resource "aci_any" "Tenant_route_leak_VRF_route_leak_Preferred_Group" {
    depends_on      = [
        aci_vrf.Tenant_route_leak_VRF_route_leak
    ]
    vrf_dn          = aci_vrf.Tenant_route_leak_VRF_route_leak.id
    description     = "Preferred Group for route_leak route_leak"
    pref_gr_memb    = "enabled"
}

/*
API Information:
 - Class: "snmpCtxP"
 - Distinguished Name: "uni/tn-route_leak/ctx-route_leak/snmpctx"
GUI Location:
 - Tenants > route_leak > Networking > VRFs > route_leak > Create SNMP Context
*/
resource "aci_rest" "Tenant_route_leak_VRF_route_leak_snmp_ctx" {
    depends_on  = [
        aci_tenant.Tenant_route_leak,
        aci_vrf.Tenant_route_leak_VRF_route_leak
    ]
    path        = "/api/node/mo/uni/tn-route_leak/ctx-route_leak/snmpctx.json"
    class_name  = "snmpCtxP"
    payload     = <<EOF
{
    "snmpCtxP": {
        "attributes": {
            "dn": "uni/tn-route_leak/ctx-route_leak/snmpctx",
            "name": "route_leak",
            "rn": "snmpctx"
        },
        "children": []
    }
}
    EOF
}

