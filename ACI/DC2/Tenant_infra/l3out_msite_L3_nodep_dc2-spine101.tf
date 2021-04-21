/*
API Information:
 - Class: "l3extLNodeP"
 - Distinguished Name: "/uni/tn-infra/out-msite_L3/lnodep-dc2-spine101"
GUI Location:
Tenants > infra > Networking > L3Outs > msite_L3 > Logical Node Profile > dc2-spine101
*/
resource "aci_logical_node_profile" "infra_msite_L3_dc2-spine101" {
    depends_on      = [aci_tenant.infra,aci_l3_outside.infra_msite_L3]
    l3_outside_dn   = aci_l3_outside.infra_msite_L3.id
    description     = "DC2 spine101 MultiSite Connectivity"
    name            = "dc2-spine101"
    target_dscp     = "unspecified"
}

/*
API Information:
 - Class: "l3extRsNodeL3OutAtt"
 - Distinguished Name: "/uni/tn-infra/out-msite_L3/lnodep-/rsnodeL3OutAtt-[topology/pod-1/node-101]"
GUI Location:
Tenants > infra > Networking > L3Outs > msite_L3 > Logical Node Profile > 
*/
resource "aci_logical_node_to_fabric_node" "infra_msite_L3__101" {
    depends_on              = [aci_logical_node_profile.infra_msite_L3_]
    logical_node_profile_dn = aci_logical_node_profile.infra_msite_L3_.id
    tDn                     = "topology/pod-1/node-101"
    rtr_id                  = "198.19.251.101"
    rtr_id_loop_back        = "yes"
}

