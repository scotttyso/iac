#------------------------------------------
# Create Contract Filter
#------------------------------------------

/*
API Information:
 - Class: "vzFilter"
 - Distinguished Name: "uni/tn-mgmt/fltMgmt_Out"
GUI Location:
 - Tenants > mgmt > Contracts > Filters: Mgmt_Out
*/
resource "aci_filter" "mgmt_filter_Mgmt_Out" {
    depends_on                      = [aci_tenant.mgmt]
    tenant_dn                       = aci_tenant.mgmt.id
    annotation                      = "None"
    description                     = "Mgmt Outbound Traffic"
    name                            = "Mgmt_Out"
    name_alias                      = "None"
    relation_vz_rs_filt_graph_att   = ""
    relation_vz_rs_fwd_r_flt_p_att  = ""
    relation_vz_rs_rev_r_flt_p_att  = ""
}

resource "aci_filter_entry" "mgmt_filter_Mgmt_Out_ip" {
    depends_on      = [aci_filter.mgmt_filter_Mgmt_Out]
    filter_dn       = aci_filter.mgmt_filter_Mgmt_Out.id
    description     = "Allow All IP"
    name            = "ip"
    ether_t         = "ip"
    prot            = "unspecified"
    arp_opc         = "unspecified"
    icmpv4_t        = "unspecified"
    icmpv6_t        = "unspecified"
    match_dscp      = "unspecified"
    apply_to_frag   = "no"
    s_from_port     = "unspecified"
    s_to_port       = "unspecified"
    d_from_port     = "unspecified"
    d_to_port       = "unspecified"
    stateful        = "yes"
    tcp_rules       = "unspecified"
}

resource "aci_filter_entry" "mgmt_filter_Mgmt_Out_icmp" {
    depends_on      = [aci_filter.mgmt_filter_Mgmt_Out]
    filter_dn       = aci_filter.mgmt_filter_Mgmt_Out.id
    description     = "Allow ICMP"
    name            = "icmp"
    ether_t         = "ip"
    prot            = "udp"
    arp_opc         = "unspecified"
    icmpv4_t        = "unspecified"
    icmpv6_t        = "unspecified"
    match_dscp      = "unspecified"
    apply_to_frag   = "no"
    s_from_port     = "unspecified"
    s_to_port       = "unspecified"
    d_from_port     = "161"
    d_to_port       = "161"
    stateful        = "yes"
    tcp_rules       = "unspecified"
}

