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
resource "aci_filter" "Tenant_mgmt_Filter_Mgmt_In" {
    depends_on                      = [
        aci_tenant.Tenant_mgmt
    ]
    tenant_dn                       = aci_tenant.Tenant_mgmt.id
    description                     = "Management Inbound Traffic"
    name                            = "Mgmt_In"
    relation_vz_rs_filt_graph_att   = ""
    relation_vz_rs_fwd_r_flt_p_att  = ""
    relation_vz_rs_rev_r_flt_p_att  = ""
}

#------------------------------------------
# Create Contract Filter Entry
#------------------------------------------

/*
API Information:
 - Class: "vzEntry"
 - Distinguished Name: "uni/tn-mgmt/fltMgmt_In/e-icmp"
GUI Location:
 - Tenants > mgmt > Contracts > Filters: Mgmt_In > Filter Entry: icmp
*/
resource "aci_filter_entry" "Tenant_mgmt_Filter_Mgmt_In_Entry_icmp" {
    depends_on      = [
        aci_tenant.Tenant_mgmt,
        aci_filter.Tenant_mgmt_Filter_Mgmt_In
    ]
    filter_dn       = aci_filter.Tenant_mgmt_Filter_Mgmt_In.id
    description     = "Allow ICMP"
    name            = "icmp"
    ether_t         = "ip"
    prot            = "icmp"
    arp_opc         = "unspecified"
    icmpv4_t        = "unspecified"
    icmpv6_t        = "unspecified"
    match_dscp      = "unspecified"
    apply_to_frag   = "no"
    s_from_port     = "unspecified"
    s_to_port       = "unspecified"
    d_from_port     = "unspecified"
    d_to_port       = "unspecified"
    stateful        = "no"
}

#------------------------------------------
# Create Contract Filter Entry
#------------------------------------------

/*
API Information:
 - Class: "vzEntry"
 - Distinguished Name: "uni/tn-mgmt/fltMgmt_In/e-snmp"
GUI Location:
 - Tenants > mgmt > Contracts > Filters: Mgmt_In > Filter Entry: snmp
*/
resource "aci_filter_entry" "Tenant_mgmt_Filter_Mgmt_In_Entry_snmp" {
    depends_on      = [
        aci_tenant.Tenant_mgmt,
        aci_filter.Tenant_mgmt_Filter_Mgmt_In
    ]
    filter_dn       = aci_filter.Tenant_mgmt_Filter_Mgmt_In.id
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
    stateful        = "no"
}

#------------------------------------------
# Create Contract Filter Entry
#------------------------------------------

/*
API Information:
 - Class: "vzEntry"
 - Distinguished Name: "uni/tn-mgmt/fltMgmt_In/e-https"
GUI Location:
 - Tenants > mgmt > Contracts > Filters: Mgmt_In > Filter Entry: https
*/
resource "aci_filter_entry" "Tenant_mgmt_Filter_Mgmt_In_Entry_https" {
    depends_on      = [
        aci_tenant.Tenant_mgmt,
        aci_filter.Tenant_mgmt_Filter_Mgmt_In
    ]
    filter_dn       = aci_filter.Tenant_mgmt_Filter_Mgmt_In.id
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
}

#------------------------------------------
# Create Contract Filter Entry
#------------------------------------------

/*
API Information:
 - Class: "vzEntry"
 - Distinguished Name: "uni/tn-mgmt/fltMgmt_In/e-ssh"
GUI Location:
 - Tenants > mgmt > Contracts > Filters: Mgmt_In > Filter Entry: ssh
*/
resource "aci_filter_entry" "Tenant_mgmt_Filter_Mgmt_In_Entry_ssh" {
    depends_on      = [
        aci_tenant.Tenant_mgmt,
        aci_filter.Tenant_mgmt_Filter_Mgmt_In
    ]
    filter_dn       = aci_filter.Tenant_mgmt_Filter_Mgmt_In.id
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
}

#------------------------------------------
# Create Contract Filter Entry
#------------------------------------------

/*
API Information:
 - Class: "vzEntry"
 - Distinguished Name: "uni/tn-mgmt/fltMgmt_In/e-nd_2022"
GUI Location:
 - Tenants > mgmt > Contracts > Filters: Mgmt_In > Filter Entry: nd_2022
*/
resource "aci_filter_entry" "Tenant_mgmt_Filter_Mgmt_In_Entry_nd_2022" {
    depends_on      = [
        aci_tenant.Tenant_mgmt,
        aci_filter.Tenant_mgmt_Filter_Mgmt_In
    ]
    filter_dn       = aci_filter.Tenant_mgmt_Filter_Mgmt_In.id
    description     = "Nexus Dashboard 2022"
    name            = "nd_2022"
    ether_t         = "ip"
    prot            = "tcp"
    arp_opc         = "unspecified"
    icmpv4_t        = "unspecified"
    icmpv6_t        = "unspecified"
    match_dscp      = "unspecified"
    apply_to_frag   = "no"
    s_from_port     = "unspecified"
    s_to_port       = "unspecified"
    d_from_port     = "2022"
    d_to_port       = "2022"
    stateful        = "yes"
}

#------------------------------------------
# Create Contract Filter Entry
#------------------------------------------

/*
API Information:
 - Class: "vzEntry"
 - Distinguished Name: "uni/tn-mgmt/fltMgmt_In/e-nd_5640"
GUI Location:
 - Tenants > mgmt > Contracts > Filters: Mgmt_In > Filter Entry: nd_5640
*/
resource "aci_filter_entry" "Tenant_mgmt_Filter_Mgmt_In_Entry_nd_5640" {
    depends_on      = [
        aci_tenant.Tenant_mgmt,
        aci_filter.Tenant_mgmt_Filter_Mgmt_In
    ]
    filter_dn       = aci_filter.Tenant_mgmt_Filter_Mgmt_In.id
    description     = "ND 5640-5671"
    name            = "nd_5640"
    ether_t         = "ip"
    prot            = "udp"
    arp_opc         = "unspecified"
    icmpv4_t        = "unspecified"
    icmpv6_t        = "unspecified"
    match_dscp      = "unspecified"
    apply_to_frag   = "no"
    s_from_port     = "unspecified"
    s_to_port       = "unspecified"
    d_from_port     = "5640"
    d_to_port       = "5671"
    stateful        = "no"
}

#------------------------------------------
# Create Contract Filter Entry
#------------------------------------------

/*
API Information:
 - Class: "vzEntry"
 - Distinguished Name: "uni/tn-mgmt/fltMgmt_In/e-nd_5965"
GUI Location:
 - Tenants > mgmt > Contracts > Filters: Mgmt_In > Filter Entry: nd_5965
*/
resource "aci_filter_entry" "Tenant_mgmt_Filter_Mgmt_In_Entry_nd_5965" {
    depends_on      = [
        aci_tenant.Tenant_mgmt,
        aci_filter.Tenant_mgmt_Filter_Mgmt_In
    ]
    filter_dn       = aci_filter.Tenant_mgmt_Filter_Mgmt_In.id
    description     = "ND 5965"
    name            = "nd_5965"
    ether_t         = "ip"
    prot            = "udp"
    arp_opc         = "unspecified"
    icmpv4_t        = "unspecified"
    icmpv6_t        = "unspecified"
    match_dscp      = "unspecified"
    apply_to_frag   = "no"
    s_from_port     = "unspecified"
    s_to_port       = "unspecified"
    d_from_port     = "5965"
    d_to_port       = "5965"
    stateful        = "no"
}

#------------------------------------------
# Create Contract Filter Entry
#------------------------------------------

/*
API Information:
 - Class: "vzEntry"
 - Distinguished Name: "uni/tn-mgmt/fltMgmt_In/e-nd_8884"
GUI Location:
 - Tenants > mgmt > Contracts > Filters: Mgmt_In > Filter Entry: nd_8884
*/
resource "aci_filter_entry" "Tenant_mgmt_Filter_Mgmt_In_Entry_nd_8884" {
    depends_on      = [
        aci_tenant.Tenant_mgmt,
        aci_filter.Tenant_mgmt_Filter_Mgmt_In
    ]
    filter_dn       = aci_filter.Tenant_mgmt_Filter_Mgmt_In.id
    description     = "ND 8884"
    name            = "nd_8884"
    ether_t         = "ip"
    prot            = "tcp"
    arp_opc         = "unspecified"
    icmpv4_t        = "unspecified"
    icmpv6_t        = "unspecified"
    match_dscp      = "unspecified"
    apply_to_frag   = "no"
    s_from_port     = "unspecified"
    s_to_port       = "unspecified"
    d_from_port     = "8884"
    d_to_port       = "8884"
    stateful        = "yes"
}

#------------------------------------------
# Create Contract Filter Entry
#------------------------------------------

/*
API Information:
 - Class: "vzEntry"
 - Distinguished Name: "uni/tn-mgmt/fltMgmt_In/e-nd_9989"
GUI Location:
 - Tenants > mgmt > Contracts > Filters: Mgmt_In > Filter Entry: nd_9989
*/
resource "aci_filter_entry" "Tenant_mgmt_Filter_Mgmt_In_Entry_nd_9989" {
    depends_on      = [
        aci_tenant.Tenant_mgmt,
        aci_filter.Tenant_mgmt_Filter_Mgmt_In
    ]
    filter_dn       = aci_filter.Tenant_mgmt_Filter_Mgmt_In.id
    description     = "ND 9989"
    name            = "nd_9989"
    ether_t         = "ip"
    prot            = "tcp"
    arp_opc         = "unspecified"
    icmpv4_t        = "unspecified"
    icmpv6_t        = "unspecified"
    match_dscp      = "unspecified"
    apply_to_frag   = "no"
    s_from_port     = "unspecified"
    s_to_port       = "unspecified"
    d_from_port     = "9989"
    d_to_port       = "9989"
    stateful        = "yes"
}

#------------------------------------------
# Create Contract Filter Entry
#------------------------------------------

/*
API Information:
 - Class: "vzEntry"
 - Distinguished Name: "uni/tn-mgmt/fltMgmt_In/e-nd_30000"
GUI Location:
 - Tenants > mgmt > Contracts > Filters: Mgmt_In > Filter Entry: nd_30000
*/
resource "aci_filter_entry" "Tenant_mgmt_Filter_Mgmt_In_Entry_nd_30000" {
    depends_on      = [
        aci_tenant.Tenant_mgmt,
        aci_filter.Tenant_mgmt_Filter_Mgmt_In
    ]
    filter_dn       = aci_filter.Tenant_mgmt_Filter_Mgmt_In.id
    description     = "ND 30000-30001"
    name            = "nd_30000"
    ether_t         = "ip"
    prot            = "tcp"
    arp_opc         = "unspecified"
    icmpv4_t        = "unspecified"
    icmpv6_t        = "unspecified"
    match_dscp      = "unspecified"
    apply_to_frag   = "no"
    s_from_port     = "unspecified"
    s_to_port       = "unspecified"
    d_from_port     = "30000"
    d_to_port       = "30001"
    stateful        = "yes"
}

