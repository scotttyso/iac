/*
API Information:
 - Class: "fvBD"
 - Distinguised Name: "/uni/tn-prod/BD-v2102"
GUI Location:
 - Tenants > prod > Networking > Bridge Domains > v2102
*/
resource "aci_bridge_domain" "Tenant_prod_Bridge_Domain_v2102" {
    depends_on                                  = [
        aci_tenant.Tenant_prod,
        data.aci_tenant.Tenant_common,
        data.aci_vrf.Tenant_common_VRF_prod,
        data.aci_l3_outside.Tenant_common_L3Out_wakanda-prod,
    ]
    tenant_dn                                   = aci_tenant.Tenant_prod.id
    description                                 = "Wakanda vMotion"
    name                                        = "v2102"
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
    relation_fv_rs_bd_to_out                    = [data.aci_l3_outside.Tenant_common_L3Out_wakanda-prod.id]
    relation_fv_rs_bd_to_ep_ret                 = "uni/tn-common/epRPol-default"
    relation_fv_rs_mldsn                        = "uni/tn-common/mldsnoopPol-default"
    relation_fv_rs_bd_to_nd_p                   = "uni/tn-common/ndifpol-default"
    relation_fv_rs_bd_to_fhs                    = "uni/tn-common/bdpol-default"
    relation_fv_rs_igmpsn                       = "uni/tn-common/snPol-default"
}

/*
API Information:
 - Class: "fvSubnet"
 - Distinguished Name: "/uni/tn-prod/BD-v2102/subnet-[10.96.102.1/24]"
GUI Location:
 - Tenants > prod > Networking > Bridge Domains > v2102 > Subnets
*/
resource "aci_subnet" "Tenant_prod_Bridge_Domain_v2102_Subnet_10-96-102-0_24" {
    depends_on                          = [
        aci_tenant.Tenant_prod,
        aci_bridge_domain.Tenant_prod_Bridge_Domain_v2102
    ]
    parent_dn                           = aci_bridge_domain.Tenant_prod_Bridge_Domain_v2102.id
    ctrl                                = ["nd"]
    description                         = "Wakanda vMotion"
    ip                                  = "10.96.102.1/24"
    preferred                           = "no"
    scope                               = ["public"]
    virtual                             = "no"
}

