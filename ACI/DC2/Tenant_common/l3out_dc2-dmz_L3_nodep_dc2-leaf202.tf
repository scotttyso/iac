/*
API Information:
 - Class: "l3extLNodeP"
 - Distinguished Name: "/uni/tn-common/out-dc2-dmz_L3/lnodep-dc2-leaf202"
GUI Location:
Tenants > common > Networking > L3Outs > dc2-dmz_L3 > Logical Node Profile > dc2-leaf202
*/
resource "aci_logical_node_profile" "common_dc2-dmz_L3_dc2-leaf202" {
    depends_on      = [aci_tenant.common,aci_l3_outside.common_dc2-dmz_L3]
    l3_outside_dn   = aci_l3_outside.common_dc2-dmz_L3.id
    description     = "dc2-leaf202 to Core"
    name            = "dc2-leaf202"
    target_dscp     = "unspecified"
}

/*
API Information:
 - Class: "l3extRsNodeL3OutAtt"
 - Distinguished Name: "/uni/tn-common/out-dc2-dmz_L3/lnodep-/rsnodeL3OutAtt-[topology/pod-1/node-202]"
GUI Location:
Tenants > common > Networking > L3Outs > dc2-dmz_L3 > Logical Node Profile > 
*/
resource "aci_logical_node_to_fabric_node" "common_dc2-dmz_L3__202" {
    depends_on              = [aci_logical_node_profile.common_dc2-dmz_L3_]
    logical_node_profile_dn = aci_logical_node_profile.common_dc2-dmz_L3_.id
    tDn                     = "topology/pod-1/node-202"
    rtr_id                  = "198.19.253.202"
    rtr_id_loop_back        = "yes"
}

