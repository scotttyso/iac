/*
API Information:
 - Class: "infraSpineP"
 - Distinguished Name: "uni/infra/spprof-dc2-spine101"
GUI Location:
 - Fabric > Access Policies > Switches > Spine Switches > Profiles > dc2-spine101
*/
resource "aci_spine_profile" "Spine_Profile_dc2-spine101" {
    depends_on                      = [
        aci_spine_interface_profile.Interface_Profile_dc2-spine101
    ]
    name                            = "dc2-spine101"
    relation_infra_rs_sp_acc_port_p = [
        aci_spine_interface_profile.Interface_Profile_dc2-spine101.id
    ]
}

/*
API Information:
 - Class: "infraSpineS"
 - Distinguished Name: "uni/infra/spprof-dc2-spine101/spines-dc2-spine101-typ-{switch_association_type}"
GUI Location:
 - Fabric > Access Policies > Switches > Spine Switches > Profiles > dc2-spine101: Spine Selectors [dc2-spine101]
*/
resource "aci_spine_switch_association" "Association_dc2-spine101" {
    depends_on                              = [
        aci_spine_profile.Spine_Profile_dc2-spine101,
    ]
    spine_profile_dn                        = aci_spine_profile.Spine_Profile_dc2-spine101.id
    name                                    = "dc2-spine101"
    relation_infra_rs_spine_acc_node_p_grp  = "uni/infra/funcprof/spaccnodepgrp-default"
    spine_switch_association_type           = "range"
}

resource "aci_rest" "Spine_Node_Block_blk101-101" {
    depends_on                              = [
        aci_spine_profile.Spine_Profile_dc2-spine101,
        aci_spine_switch_association.Association_dc2-spine101
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

