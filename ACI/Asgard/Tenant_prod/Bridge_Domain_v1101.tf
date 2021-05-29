/*
API Information:
 - Class: "fvBD"
 - Distinguised Name: "/uni/tn-prod/BD-v1101"
GUI Location:
 - Tenants > prod > Networking > Bridge Domains > v1101
*/
resource "aci_bridge_domain" "Tenant_prod_Bridge_Domain_v1101" {
    depends_on                                  = [
        aci_tenant.Tenant_prod,
        data.aci_tenant.Tenant_common,
        data.aci_vrf.Tenant_common_VRF_prod,
        data.aci_l3_outside.Tenant_common_L3Out_asgard-prod,
    ]
    tenant_dn                                   = aci_tenant.Tenant_prod.id
    description                                 = "Site Local Vlan1101"
    name                                        = "v1101"
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
    relation_fv_rs_ctx                          = data.aci_vrf.Tenant_common_VRF_prod.id
    relation_fv_rs_abd_pol_mon_pol              = "uni/tn-common/monepg-default"
    relation_fv_rs_bd_to_out                    = [data.aci_l3_outside.Tenant_common_L3Out_asgard-prod.id]
    relation_fv_rs_bd_to_ep_ret                 = "uni/tn-common/epRPol-default"
    relation_fv_rs_mldsn                        = "uni/tn-common/mldsnoopPol-default"
    relation_fv_rs_bd_to_nd_p                   = "uni/tn-common/ndifpol-default"
    relation_fv_rs_bd_to_fhs                    = "uni/tn-common/bdpol-default"
    relation_fv_rs_igmpsn                       = "uni/tn-common/snPol-default"
}

/*
API Information:
 - Class: "fvSubnet"
 - Distinguished Name: "/uni/tn-prod/BD-v1101/subnet-[10.92.101.1/24]"
GUI Location:
 - Tenants > prod > Networking > Bridge Domains > v1101 > Subnets
*/
resource "aci_subnet" "Tenant_prod_Bridge_Domain_v1101_Subnet_10-92-101-0_24" {
    depends_on                          = [
        aci_tenant.Tenant_prod,
        aci_bridge_domain.Tenant_prod_Bridge_Domain_v1101
    ]
    parent_dn                           = aci_bridge_domain.Tenant_prod_Bridge_Domain_v1101.id
    ctrl                                = ["nd"]
    description                         = "Site Local Vlan1101"
    ip                                  = "10.92.101.1/24"
    preferred                           = "no"
    scope                               = ["public"]
    virtual                             = "no"
}

