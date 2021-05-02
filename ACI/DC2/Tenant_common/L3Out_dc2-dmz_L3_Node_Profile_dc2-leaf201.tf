#------------------------------------------------
# Create a Logical Node Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extLNodeP"
 - Distinguished Name: "/uni/tn-common/out-dc2-dmz_L3/lnodep-dc2-leaf201"
GUI Location:
Tenants > common > Networking > L3Outs > dc2-dmz_L3 > Logical Node Profile > dc2-leaf201
*/
resource "aci_logical_node_profile" "common_l3out_dc2-dmz_L3_nodep_dc2-leaf201" {
    depends_on      = [
        aci_tenant.common,
        aci_l3_outside.common_l3out_dc2-dmz_L3
    ]
    l3_outside_dn   = aci_l3_outside.common_l3out_dc2-dmz_L3.id
    description     = "dc2-leaf201 to Core"
    name            = "dc2-leaf201"
    target_dscp     = "unspecified"
}

#------------------------------------------------
# Assign a Node to a Logical Node Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extRsNodeL3OutAtt"
 - Distinguished Name: "/uni/tn-common/out-dc2-dmz_L3/lnodep-/rsnodeL3OutAtt-[topology/pod-1/node-201]"
GUI Location:
Tenants > common > Networking > L3Outs > dc2-dmz_L3 > Logical Node Profile > : Nodes > 201
*/
resource "aci_logical_node_to_fabric_node" "common_l3out_dc2-dmz_L3_nodep__201" {
    depends_on              = [
        aci_tenant.common,
        aci_l3_outside.common_l3out_dc2-dmz_L3,
        aci_logical_node_profile.common_l3out_dc2-dmz_L3_nodep_
    ]
    logical_node_profile_dn = aci_logical_node_profile.common_l3out_dc2-dmz_L3_nodep_.id
    tDn                     = "topology/pod-1/node-201"
    rtr_id                  = "198.19.253.201"
    rtr_id_loop_back        = "yes"
}

#------------------------------------------------
# Create Logical Interface Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extLIfP"
 - Distinguished Name: "/uni/tn-common/out-dc2-dmz_L3/lnodep-"
GUI Location:
 - Tenants > common > Networking > L3Outs > dc2-dmz_L3 > Logical Node Profile > dc2-leaf201 > Logical Interface Profiles Eth1-48
*/
resource "aci_logical_interface_profile" "common_l3out_dc2-dmz_L3_nodep_dc2-leaf201_node_intfp_Eth1-48" {
    depends_on                                      = [
        aci_tenant.common,
        aci_l3_outside.common_l3out_dc2-dmz_L3,
        aci_logical_node_profile.common_l3out_dc2-dmz_L3_nodep_dc2-leaf201
    ]
    logical_node_profile_dn                         = aci_logical_node_profile.common_l3out_dc2-dmz_L3_nodep_dc2-leaf201.id
    description                                     = "dc2-leaf201-Eth1-48 to Core"
    name                                            = "Eth1-48"
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
 - Distinguished Name: "uni/tn-common/out-dc2-dmz_L3/lnodep-dc2-leaf201/lifp-Eth1-48/rspathL3OutAtt-[topology/pod-1/paths-201/pathep-[eth1/48]]"
GUI Location:
 - Tenants > common > Networking > L3Outs > dc2-dmz_L3 > Logical Node Profile > dc2-leaf201 > Logical Interface Profiles Eth1-48: Routed Interfaces
 - Assign all the default Policies to this Policy Group
*/
resource "aci_l3out_path_attachment" "common_l3out_dc2-dmz_L3_nodep_dc2-leaf201_node_intfp_Eth1-48_path_attachment" {
    depends_on                      = [
        aci_tenant.common,
        aci_logical_node_profile.common_l3out_dc2-dmz_L3_nodep_dc2-leaf201,
        aci_logical_interface_profile.common_l3out_dc2-dmz_L3_nodep_dc2-leaf201_node_intfp_Eth1-48
    ]
    logical_interface_profile_dn    = aci_logical_interface_profile.common_l3out_dc2-dmz_L3_nodep_dc2-leaf201_node_intfp_Eth1-48.id
    target_dn                       = "topology/pod-1/paths-201/pathep-[eth1/48]"
    if_inst_t                       = "l3-port"
    addr                            = "198.19.0.16/31"
    annotation                      = ""
    ipv6_dad                        = "enabled"
    mtu                             = "9000"
    target_dscp                     = "unspecified"
}
