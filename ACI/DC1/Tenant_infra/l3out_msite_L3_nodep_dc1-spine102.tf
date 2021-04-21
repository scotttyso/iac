/*
API Information:
 - Class: "l3extLNodeP"
 - Distinguished Name: "/uni/tn-infra/out-msite_L3/lnodep-dc1-spine102"
GUI Location:
Tenants > infra > Networking > L3Outs > msite_L3 > Logical Node Profile > dc1-spine102
*/
resource "aci_logical_node_profile" "infra_msite_L3_dc1-spine102" {
    depends_on      = [aci_tenant.infra,aci_l3_outside.infra_msite_L3]
    l3_outside_dn   = aci_l3_outside.infra_msite_L3.id
    description     = "DC1 spine102 MultiSite Connectivity"
    name            = "dc1-spine102"
    target_dscp     = "unspecified"
}

/*
API Information:
 - Class: "l3extRsNodeL3OutAtt"
 - Distinguished Name: "/uni/tn-infra/out-msite_L3/lnodep-/rsnodeL3OutAtt-[topology/pod-1/node-102]"
GUI Location:
Tenants > infra > Networking > L3Outs > msite_L3 > Logical Node Profile > 
*/
resource "aci_logical_node_to_fabric_node" "infra_msite_L3__102" {
    depends_on              = [aci_logical_node_profile.infra_msite_L3_]
    logical_node_profile_dn = aci_logical_node_profile.infra_msite_L3_.id
    tDn                     = "topology/pod-1/node-102"
    rtr_id                  = "198.18.251.102"
    rtr_id_loop_back        = "yes"
}

