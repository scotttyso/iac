/*
API Information:
 - Class: "infraSpineP"
 - Distinguished Name: "uni/infra/spprof-dc2-spine101"
GUI Location:
 - Fabric > Access Policies > Switches > Spine Switches > Profiles > dc2-spine101
*/
resource "aci_spine_profile" "profile_dc2-spine101" {
    depends_on                      = [
        aci_spine_interface_profile.int_profile_dc2-spine101
    ]
    # annotation                      = ""
    # description                     = "None" # Description is currently Unsupported
    name                            = "dc2-spine101"
    # name_alias                      = ""
    relation_infra_rs_sp_acc_port_p = [
        aci_spine_interface_profile.int_profile_dc2-spine101.id
    ]
}

/*
API Information:
 - Class: "infraSpineS"
 - Distinguished Name: "uni/infra/spprof-dc2-spine101/spines-dc2-spine101-typ-{switch_association_type}"
GUI Location:
 - Fabric > Access Policies > Switches > Spine Switches > Profiles > dc2-spine101: Spine Selectors [dc2-spine101]
*/
resource "aci_spine_switch_association" "association_dc2-spine101" {
    depends_on                              = [
        aci_spine_profile.profile_dc2-spine101,
        aci_rest.spine_policy_group_default
    ]
    spine_profile_dn                        = aci_spine_profile.profile_dc2-spine101.id
    # description                             = "None"
    name                                    = "dc2-spine101"
    # name_alias                              = ""
    relation_infra_rs_spine_acc_node_p_grp  = aci_rest.spine_policy_group_default.id
    spine_switch_association_type           = "range" # Options are (ALL|ALL_IN_POD|range)
}

resource "aci_rest" "spine_node_block_blk101-101" {
    depends_on                              = [
        aci_spine_profile.profile_dc2-spine101,
        aci_spine_switch_association.association_dc2-spine101
    ]
    path        = "/api/node/mo/uni/infra/spprof-dc2-spine101/spines-dc2-spine101-typ-range/nodeblk-blk101-101.json"
    class_name  = "infraNodeBlk"
    payload     = <<EOF
{
    "infraNodeBlk": {
        "attributes": {
            "dn": "uni/infra/spprof-dc2-spine101/spines-dc2-spine101-typ-range/nodeblk-blk101-101",
            "from_": "101",
            "to_": "101",
            "name": "blk101-101",
        },
        "children": []
    }
}
  EOF
}

