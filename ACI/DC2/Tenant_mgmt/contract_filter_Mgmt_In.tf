#------------------------------------------
# Create Contract Filter
#------------------------------------------

/*
API Information:
 - Class: "vzFilter"
 - Distinguished Name: "uni/tn-mgmt/fltMgmt_In"
GUI Location:
 - Tenants > mgmt > Contracts > Filters: Mgmt_In
*/
resource "aci_filter" "mgmt_filter_Mgmt_In" {
    depends_on                      = [aci_tenant.mgmt]
    tenant_dn                       = aci_tenant.mgmt.id
    annotation                      = "None"
    description                     = "Mgmt Inbound Traffic"
    name                            = "Mgmt_In"
    name_alias                      = "None"
    relation_vz_rs_filt_graph_att   = ""
    relation_vz_rs_fwd_r_flt_p_att  = ""
    relation_vz_rs_rev_r_flt_p_att  = ""
}

resource "aci_filter_entry" "mgmt_filter_Mgmt_In_https" {
    depends_on      = [aci_filter.mgmt_filter_Mgmt_In]
    filter_dn       = aci_filter.mgmt_filter_Mgmt_In.id
    description     = "Allow HTTPS"
    name            = "https"
    ether_t         = "ip"
    prot            = "tcp"
    arp_opc         = "unspecified"
    icmpv4_t        = "unspecified"
    icmpv6_t        = "unspecified"
    match_dscp      = "unspecified"
    apply_to_frag   = "no"
    s_from_port     = "unspecified"
    s_to_port       = "unspecified"
    d_from_port     = "https"
    d_to_port       = "https"
    stateful        = "yes"
    tcp_rules       = "unspecified"
}

resource "aci_filter_entry" "mgmt_filter_Mgmt_In_icmp" {
    depends_on      = [aci_filter.mgmt_filter_Mgmt_In]
    filter_dn       = aci_filter.mgmt_filter_Mgmt_In.id
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

resource "aci_filter_entry" "mgmt_filter_Mgmt_In_snmp" {
    depends_on      = [aci_filter.mgmt_filter_Mgmt_In]
    filter_dn       = aci_filter.mgmt_filter_Mgmt_In.id
    description     = "Allow SNMP"
    name            = "snmp"
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

resource "aci_filter_entry" "mgmt_filter_Mgmt_In_ssh" {
    depends_on      = [aci_filter.mgmt_filter_Mgmt_In]
    filter_dn       = aci_filter.mgmt_filter_Mgmt_In.id
    description     = "Allow SSH"
    name            = "ssh"
    ether_t         = "ip"
    prot            = "tcp"
    arp_opc         = "unspecified"
    icmpv4_t        = "unspecified"
    icmpv6_t        = "unspecified"
    match_dscp      = "unspecified"
    apply_to_frag   = "no"
    s_from_port     = "unspecified"
    s_to_port       = "unspecified"
    d_from_port     = "22"
    d_to_port       = "22"
    stateful        = "yes"
    tcp_rules       = "unspecified"
}

