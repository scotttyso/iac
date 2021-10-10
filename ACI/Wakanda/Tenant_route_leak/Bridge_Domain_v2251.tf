/*
API Information:
 - Class: "fvBD"
 - Distinguised Name: "/uni/tn-route_leak/BD-v2251"
GUI Location:
 - Tenants > route_leak > Networking > Bridge Domains > v2251
*/
resource "aci_bridge_domain" "Tenant_route_leak_Bridge_Domain_v2251" {
    depends_on                                  = [
        aci_tenant.Tenant_route_leak,
        aci_vrf.Tenant_route_leak_VRF_route_leak,
        aci_l3_outside.Tenant_route_leak_L3Out_route_leak,
    ]
    tenant_dn                                   = aci_tenant.Tenant_route_leak.id
    description                                 = "Wakanda route_leak 1"
    name                                        = "v2251"
    arp_flood                                   = "no"
    bridge_domain_type                          = "regular"
    ep_clear                                    = "no"
    host_based_routing                          = "no"
    intersite_bum_traffic_allow                 = "no"
    intersite_l2_stretch                        = "no"
    ip_learning                                 = "yes"
    ipv6_mcast_allow                            = "no"
    limit_ip_learn_to_subnets                   = "yes"
    mcast_allow                                 = "no"
    multi_dst_pkt_act                           = "bd-flood"
    optimize_wan_bandwidth                      = "no"
    unicast_route                               = "yes"
    unk_mac_ucast_act                           = "proxy"
    unk_mcast_act                               = "flood"
    relation_fv_rs_ctx                          = aci_vrf.Tenant_route_leak_VRF_route_leak.id
    relation_fv_rs_abd_pol_mon_pol              = "uni/tn-common/monepg-default"
    relation_fv_rs_bd_to_out                    = [aci_l3_outside.Tenant_route_leak_L3Out_route_leak.id]
    relation_fv_rs_bd_to_ep_ret                 = "uni/tn-common/epRPol-default"
    relation_fv_rs_mldsn                        = "uni/tn-common/mldsnoopPol-default"
    relation_fv_rs_bd_to_nd_p                   = "uni/tn-common/ndifpol-default"
    relation_fv_rs_bd_to_fhs                    = "uni/tn-common/bdpol-default"
    relation_fv_rs_igmpsn                       = "uni/tn-common/snPol-default"
}

/*
API Information:
 - Class: "fvSubnet"
 - Distinguished Name: "/uni/tn-route_leak/BD-v2251/subnet-[10.96.251.1/24]"
GUI Location:
 - Tenants > route_leak > Networking > Bridge Domains > v2251 > Subnets
*/
resource "aci_subnet" "Tenant_route_leak_Bridge_Domain_v2251_Subnet_10-96-251-0_24" {
    depends_on                          = [
        aci_tenant.Tenant_route_leak,
        aci_bridge_domain.Tenant_route_leak_Bridge_Domain_v2251
    ]
    parent_dn                           = aci_bridge_domain.Tenant_route_leak_Bridge_Domain_v2251.id
    ctrl                                = ["nd"]
    ip                                  = "10.96.251.1/24"
    preferred                           = "no"
    scope                               = ["public", "shared"]
    virtual                             = "no"
}

