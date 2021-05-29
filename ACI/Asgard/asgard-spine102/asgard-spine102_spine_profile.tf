/*
API Information:
 - Class: "infraSpineP"
 - Distinguished Name: "uni/infra/spprof-asgard-spine102"
GUI Location:
 - Fabric > Access Policies > Switches > Spine Switches > Profiles > asgard-spine102
*/
resource "aci_spine_profile" "Spine_Profile_asgard-spine102" {
    depends_on                      = [
        aci_spine_interface_profile.Interface_Profile_asgard-spine102
    ]
    name                            = "asgard-spine102"
    relation_infra_rs_sp_acc_port_p = [
        aci_spine_interface_profile.Interface_Profile_asgard-spine102.id
    ]
}

/*
API Information:
 - Class: "infraSpineS"
 - Distinguished Name: "uni/infra/spprof-asgard-spine102/spines-asgard-spine102-typ-{switch_association_type}"
GUI Location:
 - Fabric > Access Policies > Switches > Spine Switches > Profiles > asgard-spine102: Spine Selectors [asgard-spine102]
*/
resource "aci_spine_switch_association" "Association_asgard-spine102" {
    depends_on                              = [
        aci_spine_profile.Spine_Profile_asgard-spine102,
    ]
    spine_profile_dn                        = aci_spine_profile.Spine_Profile_asgard-spine102.id
    name                                    = "asgard-spine102"
    relation_infra_rs_spine_acc_node_p_grp  = "uni/infra/funcprof/spaccnodepgrp-default"
    spine_switch_association_type           = "range"
}

resource "aci_rest" "Spine_Node_Block_blk102-102" {
    depends_on                              = [
        aci_spine_profile.Spine_Profile_asgard-spine102,
        aci_spine_switch_association.Association_asgard-spine102
    ]
    path        = "/api/node/mo/uni/infra/spprof-asgard-spine102/spines-asgard-spine102-typ-range/nodeblk-blk102-102.json"
    class_name  = "infraNodeBlk"
    payload     = <<EOF
{
    "infraNodeBlk": {
        "attributes": {
            "dn": "uni/infra/spprof-asgard-spine102/spines-asgard-spine102-typ-range/nodeblk-blk102-102",
            "from_": "102",
            "to_": "102",
            "name": "blk102-102",
        },
        "children": []
    }
}
  EOF
}

