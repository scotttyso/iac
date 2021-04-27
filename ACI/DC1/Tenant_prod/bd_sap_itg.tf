/*
API Information:
 - Class: "fvBD"
 - Distinguised Name: "/uni/tn-prod/BD-sap_itg"
GUI Location:
 - Tenants > prod > Networking > Bridge Domains > sap_itg
*/
resource "aci_bridge_domain" "prod_sap_itg" {
    depends_on                                  = [
        aci_tenant.prod,
        data.aci_tenant.common,data.aci_vrf.prod,
        data.aci_l3_outside.None_None
    ]
    tenant_dn                                   = aci_tenant.prod.id
    name                                        = "sap_itg"
    arp_flood                                   = "no"
    bridge_domain_type                          = "regular"
    ep_clear                                    = "no"
    ep_move_detect_mode                         = "None"
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
    relation_fv_rs_ctx                          = data.aci_vrf.prod.id
    relation_fv_rs_abd_pol_mon_pol              = "uni/tn-common/monepg-default"
    relation_fv_rs_bd_to_out                    = data.aci_l3_outside.None_None.id
    relation_fv_rs_bd_to_ep_ret                 = "uni/tn-common/epRPol-default"
    relation_fv_rs_mldsn                        = "uni/tn-common/mldsnoopPol-default"
    relation_fv_rs_bd_to_nd_p                   = "uni/tn-common/ndifpol-default"
    relation_fv_rs_bd_to_fhs                    = "uni/tn-common/bdpol-default"
    relation_fv_rs_igmpsn                       = "uni/tn-common/snPol-default"
}

