#------------------------------------------------
# Create a Logical Node Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extLNodeP"
 - Distinguished Name: "/uni/tn-infra/out-msite_L3/lnodep-dc1-spine101"
GUI Location:
Tenants > infra > Networking > L3Outs > msite_L3 > Logical Node Profile > dc1-spine101
*/
resource "aci_logical_node_profile" "infra_l3out_msite_L3_nodep_dc1-spine101" {
    depends_on      = [
        aci_tenant.infra,
        aci_l3_outside.infra_l3out_msite_L3
    ]
    l3_outside_dn   = aci_l3_outside.infra_l3out_msite_L3.id
    description     = "DC1 spine101 MultiSite Connectivity"
    name            = "dc1-spine101"
    target_dscp     = "unspecified"
}

#------------------------------------------------
# Assign a Node to a Logical Node Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extRsNodeL3OutAtt"
 - Distinguished Name: "/uni/tn-infra/out-msite_L3/lnodep-/rsnodeL3OutAtt-[topology/pod-1/node-101]"
GUI Location:
Tenants > infra > Networking > L3Outs > msite_L3 > Logical Node Profile > : Nodes > 101
*/
resource "aci_logical_node_to_fabric_node" "infra_l3out_msite_L3_nodep__101" {
    depends_on              = [
        aci_tenant.infra,
        aci_l3_outside.infra_l3out_msite_L3,
        aci_logical_node_profile.infra_l3out_msite_L3_nodep_
    ]
    logical_node_profile_dn = aci_logical_node_profile.infra_l3out_msite_L3_nodep_.id
    tDn                     = "topology/pod-1/node-101"
    rtr_id                  = "198.18.251.101"
    rtr_id_loop_back        = "yes"
}

