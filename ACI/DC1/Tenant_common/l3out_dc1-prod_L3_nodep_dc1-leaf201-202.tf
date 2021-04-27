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
        aci_logical_node_profile.common__l3out_dc1-prod_L3_nodep_dc1-leaf201-202
    ]
    logical_node_profile_dn                         = aci_logical_node_profile.common__l3out_dc1-prod_L3_nodep_dc1-leaf201-202.id
    description                                     = "DC1 leaf101-102-vlan911 to Core"
    name                                            = "Vlan911"
    prio                                            = ""
    tag                                             = "yellow-green"
    relation_l3ext_rs_path_l3_out_att               = []
}

