#------------------------------------------------
# Create a Logical Node Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extLNodeP"
 - Distinguished Name: "/uni/tn-common/out-dc2-dmz_L3/lnodep-dc2-leaf202"
GUI Location:
Tenants > common > Networking > L3Outs > dc2-dmz_L3 > Logical Node Profile > dc2-leaf202
*/
resource "aci_logical_node_profile" "common_l3out_dc2-dmz_L3_nodep_dc2-leaf202" {
    depends_on      = [
        aci_tenant.common,
        aci_l3_outside.common_l3out_dc2-dmz_L3
    ]
    l3_outside_dn   = aci_l3_outside.common_l3out_dc2-dmz_L3.id
    description     = "dc2-leaf202 to Core"
    name            = "dc2-leaf202"
    target_dscp     = "unspecified"
}

#------------------------------------------------
# Assign a Node to a Logical Node Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extRsNodeL3OutAtt"
 - Distinguished Name: "/uni/tn-common/out-dc2-dmz_L3/lnodep-/rsnodeL3OutAtt-[topology/pod-1/node-202]"
GUI Location:
Tenants > common > Networking > L3Outs > dc2-dmz_L3 > Logical Node Profile > : Nodes > 202
*/
resource "aci_logical_node_to_fabric_node" "common_l3out_dc2-dmz_L3_nodep__202" {
    depends_on              = [
        aci_tenant.common,
        aci_l3_outside.common_l3out_dc2-dmz_L3,
        aci_logical_node_profile.common_l3out_dc2-dmz_L3_nodep_
    ]
    logical_node_profile_dn = aci_logical_node_profile.common_l3out_dc2-dmz_L3_nodep_.id
    tDn                     = "topology/pod-1/node-202"
    rtr_id                  = "198.19.253.202"
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
 - Tenants > common > Networking > L3Outs > dc2-dmz_L3 > Logical Node Profile > dc2-leaf202 > Logical Interface Profiles Eth1-48
*/
resource "aci_logical_interface_profile" "common_l3out_dc2-dmz_L3_nodep_dc2-leaf202_node_intfp_Eth1-48" {
    depends_on                                      = [
        aci_tenant.common,
        aci_l3_outside.common_l3out_dc2-dmz_L3,
        aci_logical_node_profile.common__l3out_dc2-dmz_L3_nodep_dc2-leaf202
    ]
    logical_node_profile_dn                         = aci_logical_node_profile.common__l3out_dc2-dmz_L3_nodep_dc2-leaf202.id
    description                                     = "dc2-leaf202-Eth1-48 to Core"
    name                                            = "Eth1-48"
    prio                                            = ""
    tag                                             = "yellow-green"
    relation_l3ext_rs_path_l3_out_att               = []
}

