#------------------------------------------------
# Create a Logical Node Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extLNodeP"
 - Distinguished Name: "/uni/tn-common/out-dc1-prod_L3/lnodep-dc1-leaf201-202"
GUI Location:
Tenants > common > Networking > L3Outs > dc1-prod_L3 > Logical Node Profile > dc1-leaf201-202
*/
resource "aci_logical_node_profile" "common_l3out_dc1-prod_L3_nodep_dc1-leaf201-202" {
    depends_on      = [
        aci_tenant.common,
        aci_l3_outside.common_l3out_dc1-prod_L3
    ]
    l3_outside_dn   = aci_l3_outside.common_l3out_dc1-prod_L3.id
    description     = "DC1 Border Leafs to Core"
    name            = "dc1-leaf201-202"
    target_dscp     = "unspecified"
}

#------------------------------------------------
# Assign a Node to a Logical Node Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extRsNodeL3OutAtt"
 - Distinguished Name: "/uni/tn-common/out-dc1-prod_L3/lnodep-/rsnodeL3OutAtt-[topology/pod-1/node-201]"
GUI Location:
Tenants > common > Networking > L3Outs > dc1-prod_L3 > Logical Node Profile > : Nodes > 201
*/
resource "aci_logical_node_to_fabric_node" "common_l3out_dc1-prod_L3_nodep__201" {
    depends_on              = [
        aci_tenant.common,
        aci_l3_outside.common_l3out_dc1-prod_L3,
        aci_logical_node_profile.common_l3out_dc1-prod_L3_nodep_
    ]
    logical_node_profile_dn = aci_logical_node_profile.common_l3out_dc1-prod_L3_nodep_.id
    tDn                     = "topology/pod-1/node-201"
    rtr_id                  = "198.18.252.201"
    rtr_id_loop_back        = "yes"
}

#------------------------------------------------
# Assign a Node to a Logical Node Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extRsNodeL3OutAtt"
 - Distinguished Name: "/uni/tn-common/out-dc1-prod_L3/lnodep-/rsnodeL3OutAtt-[topology/pod-1/node-202]"
GUI Location:
Tenants > common > Networking > L3Outs > dc1-prod_L3 > Logical Node Profile > : Nodes > 202
*/
resource "aci_logical_node_to_fabric_node" "common_l3out_dc1-prod_L3_nodep__202" {
    depends_on              = [
        aci_tenant.common,
        aci_l3_outside.common_l3out_dc1-prod_L3,
        aci_logical_node_profile.common_l3out_dc1-prod_L3_nodep_
    ]
    logical_node_profile_dn = aci_logical_node_profile.common_l3out_dc1-prod_L3_nodep_.id
    tDn                     = "topology/pod-1/node-202"
    rtr_id                  = "198.18.253.1"
    rtr_id_loop_back        = "yes"
}

#------------------------------------------------
# Create Logical Interface Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extLIfP"
 - Distinguished Name: "/uni/tn-common/out-dc1-prod_L3/lnodep-"
GUI Location:
 - Tenants > common > Networking > L3Outs > dc1-prod_L3 > Logical Node Profile > dc1-leaf201-202 > Logical Interface Profiles Vlan911
*/
resource "aci_logical_interface_profile" "common_l3out_dc1-prod_L3_nodep_dc1-leaf201-202_node_intfp_Vlan911" {
    depends_on                                      = [
        aci_tenant.common,
        aci_l3_outside.common_l3out_dc1-prod_L3,
        aci_logical_node_profile.common_l3out_dc1-prod_L3_nodep_dc1-leaf201-202
    ]
    logical_node_profile_dn                         = aci_logical_node_profile.common_l3out_dc1-prod_L3_nodep_dc1-leaf201-202.id
    description                                     = "DC1 leaf101-102-vlan911 to Core"
    name                                            = "Vlan911"
    prio                                            = ""
    tag                                             = "yellow-green"
    relation_l3ext_rs_path_l3_out_att               = []
}

#-------------------------------------------------------------
# Attach a Node Interface Path to a Logical Interface Profile
#-------------------------------------------------------------

/*
API Information:
 - Class: "l3extRsPathL3OutAtt"
 - Distinguished Name: "uni/tn-common/out-dc1-prod_L3/lnodep-dc1-leaf201-202/lifp-Vlan911/rspathL3OutAtt-[topology/pod-1/protpaths-201-201/pathep-[dc1-leaf201-202_vpc1]]"
GUI Location:
 - Tenants > common > Networking > L3Outs > dc1-prod_L3 > Logical Node Profile > dc1-leaf201-202 > Logical Interface Profiles Vlan911: SVI
 - Assign all the default Policies to this Policy Group
*/
resource "aci_l3out_path_attachment" "common_l3out_dc1-prod_L3_nodep_dc1-leaf201-202_node_intfp_Vlan911_path_attachment" {
    depends_on                      = [
        aci_tenant.common,
        aci_logical_node_profile.common_l3out_dc1-prod_L3_nodep_dc1-leaf201-202,
        aci_logical_interface_profile.common_l3out_dc1-prod_L3_nodep_dc1-leaf201-202_node_intfp_Vlan911
    ]
    logical_interface_profile_dn    = aci_logical_interface_profile.common_l3out_dc1-prod_L3_nodep_dc1-leaf201-202_node_intfp_Vlan911.id
    target_dn                       = "topology/pod-1/protpaths-201-201/pathep-[dc1-leaf201-202_vpc1]"
    if_inst_t                       = "ext-svi"
    addr                            = "None"
    annotation                      = ""
    autostate                       = "disabled"
    encap                           = "vlan-911"
    mode                            = "regular"
    encap_scope                     = "local"
    ipv6_dad                        = "enabled"
    mtu                             = "9000"
    target_dscp                     = "unspecified"
}

#-------------------------------------------------------------
# Attach a Node Interface Path to a Logical Interface Profile
#-------------------------------------------------------------

/*
API Information:
 - Class: "l3extRsPathL3OutAtt"
 - Distinguished Name: " uni/tn-common/out-dc1-prod_L3/lnodep-dc1-leaf201-202/lifp-Vlan911/rspathL3OutAtt-[topology/pod-1/protpaths-201-201//pathep-[dc1-leaf201-202_vpc1]]/mem-A"
GUI Location:
 - Tenants > common > Networking > L3Outs > dc1-prod_L3 > Logical Node Profile > dc1-leaf201-202 > Logical Interface Profiles Vlan911: SVI
*/
resource "aci_rest" "common_l3out_dc1-prod_L3_nodep_dc1-leaf201-202_node_intfp_Vlan911_vpc_side_A" {
    depends_on                      = [
        aci_tenant.common,
        aci_logical_node_profile.common_l3out_dc1-prod_L3_nodep_dc1-leaf201-202,
        aci_logical_interface_profile.common_l3out_dc1-prod_L3_nodep_dc1-leaf201-202_node_intfp_Vlan911
    ]
    path        = "/api/node/mo/uni/tn-common/out-dc1-prod_L3/lnodep-dc1-leaf201-202/lifp-Vlan911/rspathL3OutAtt-[topology/pod-1/protpaths-201-201/pathep-[dc1-leaf201-202_vpc1]]/mem-A.json"
    class_name  = "l3extMember"
    payload     = <<EOF
{
    "l3extMember": {
        "attributes": {
            "addr": "198.18.0.9/29",
            "ipv6Dad": "enabled",
            "side": "A",
        }
    }
}
    EOF
}

#-------------------------------------------------------------
# Attach a Node Interface Path to a Logical Interface Profile
#-------------------------------------------------------------

/*
API Information:
 - Class: "l3extRsPathL3OutAtt"
 - Distinguished Name: " uni/tn-common/out-dc1-prod_L3/lnodep-dc1-leaf201-202/lifp-Vlan911/rspathL3OutAtt-[topology/pod-1/protpaths-201-201//pathep-[dc1-leaf201-202_vpc1]]/mem-B"
GUI Location:
 - Tenants > common > Networking > L3Outs > dc1-prod_L3 > Logical Node Profile > dc1-leaf201-202 > Logical Interface Profiles Vlan911: SVI
*/
resource "aci_rest" "common_l3out_dc1-prod_L3_nodep_dc1-leaf201-202_node_intfp_Vlan911_vpc_side_B" {
    depends_on                      = [
        aci_tenant.common,
        aci_logical_node_profile.common_l3out_dc1-prod_L3_nodep_dc1-leaf201-202,
        aci_logical_interface_profile.common_l3out_dc1-prod_L3_nodep_dc1-leaf201-202_node_intfp_Vlan911
    ]
    path        = "/api/node/mo/uni/tn-common/out-dc1-prod_L3/lnodep-dc1-leaf201-202/lifp-Vlan911/rspathL3OutAtt-[topology/pod-1/protpaths-201-201/pathep-[dc1-leaf201-202_vpc1]]/mem-B.json"
    class_name  = "l3extMember"
    payload     = <<EOF
{
    "l3extMember": {
        "attributes": {
            "addr": "198.18.0.10/29",
            "ipv6Dad": "enabled",
            "side": "B",
        }
    }
}
    EOF
}

#------------------------------------------------
# Create a BGP Peer Connectivity Profile
#------------------------------------------------

/*
API Information:
 - Class: "bgpPeerP"
 - Distinguished Name: "uni/tn-common/out-dc1-prod_L3/lnodep-dc1-leaf201-202/lifp-Vlan911/rspathL3OutAtt-[topology/pod-1/protpaths-201-201/pathep-[dc1-leaf201-202_vpc1]]/peerP-[]"
GUI Location:
 - Tenants > common > Networking > L3Outs > dc1-prod_L3 > Logical Node Profile dc1-leaf201-202 > Logical Interface Profile > Vlan911 > OSPF Interface Profile
*/
resource "aci_bgp_peer_connectivity_profile" "common_l3out_dc1-prod_L3_nodep_dc1-leaf201-202_bgp-peer_" {
    depends_on                      = [
        aci_tenant.common,
        aci_l3_outside.common_l3out_dc1-prod_L3,
        aci_logical_node_profile.common_l3out_dc1-prod_L3_nodep_dc1-leaf201-202,
        aci_logical_interface_profile.common_l3out_dc1-prod_L3_nodep_dc1-leaf201-202_node_intfp_Vlan911,
        aci_bgp_peer_prefix.default
    ]
    logical_node_profile_dn         = aci_logical_node_profile.common_l3out_dc1-prod_L3_nodep_dc1-leaf201-202.id
    addr                            = "198.18.0.11"
    addr_t_ctrl                     = "af-ucast"
    allowed_self_as_cnt             = "3"
    as_number                       = "65501"
    ctrl                            = "send-com,send-ext-com"
    description                     = "DC1 Peer 1"
    password                        = var.BGP_Password1
    peer_ctrl                       = "bfd"
    private_a_sctrl                 = ""
    ttl                             = "1"
    weight                          = "0"
    local_asn                       = "None"
    local_asn_propagate             = "none"
    relation_bgp_rs_peer_pfx_pol    = aci_bgp_peer_prefix.default.id
}

#------------------------------------------------
# Create a BGP Peer Connectivity Profile
#------------------------------------------------

/*
API Information:
 - Class: "bgpPeerP"
 - Distinguished Name: "uni/tn-common/out-dc1-prod_L3/lnodep-dc1-leaf201-202/lifp-Vlan911/rspathL3OutAtt-[topology/pod-1/protpaths-201-201/pathep-[dc1-leaf201-202_vpc1]]/peerP-[]"
GUI Location:
 - Tenants > common > Networking > L3Outs > dc1-prod_L3 > Logical Node Profile dc1-leaf201-202 > Logical Interface Profile > Vlan911 > OSPF Interface Profile
*/
resource "aci_bgp_peer_connectivity_profile" "common_l3out_dc1-prod_L3_nodep_dc1-leaf201-202_bgp-peer_" {
    depends_on                      = [
        aci_tenant.common,
        aci_l3_outside.common_l3out_dc1-prod_L3,
        aci_logical_node_profile.common_l3out_dc1-prod_L3_nodep_dc1-leaf201-202,
        aci_logical_interface_profile.common_l3out_dc1-prod_L3_nodep_dc1-leaf201-202_node_intfp_Vlan911,
        aci_bgp_peer_prefix.default
    ]
    logical_node_profile_dn         = aci_logical_node_profile.common_l3out_dc1-prod_L3_nodep_dc1-leaf201-202.id
    addr                            = "198.18.0.12"
    addr_t_ctrl                     = "af-ucast"
    allowed_self_as_cnt             = "3"
    as_number                       = "65501"
    ctrl                            = "send-com,send-ext-com"
    description                     = "DC1 Peer 2"
    password                        = var.BGP_Password1
    peer_ctrl                       = "bfd"
    private_a_sctrl                 = ""
    ttl                             = "1"
    weight                          = "0"
    local_asn                       = "None"
    local_asn_propagate             = "none"
    relation_bgp_rs_peer_pfx_pol    = aci_bgp_peer_prefix.default.id
}

