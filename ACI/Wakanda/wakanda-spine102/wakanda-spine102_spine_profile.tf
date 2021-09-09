/*
API Information:
 - Class: "infraSpineP"
 - Distinguished Name: "uni/infra/spprof-wakanda-spine102"
GUI Location:
 - Fabric > Access Policies > Switches > Spine Switches > Profiles > wakanda-spine102
*/
resource "aci_spine_profile" "Spine_Profile_wakanda-spine102" {
    depends_on                      = [
        aci_spine_interface_profile.Interface_Profile_wakanda-spine102
    ]
    name                            = "wakanda-spine102"
    relation_infra_rs_sp_acc_port_p = [
        aci_spine_interface_profile.Interface_Profile_wakanda-spine102.id
    ]
}

/*
API Information:
 - Class: "infraSpineS"
 - Distinguished Name: "uni/infra/spprof-wakanda-spine102/spines-wakanda-spine102-typ-{switch_association_type}"
GUI Location:
 - Fabric > Access Policies > Switches > Spine Switches > Profiles > wakanda-spine102: Spine Selectors [wakanda-spine102]
*/
resource "aci_spine_switch_association" "Association_wakanda-spine102" {
    depends_on                              = [
        aci_spine_profile.Spine_Profile_wakanda-spine102,
    ]
    spine_profile_dn                        = aci_spine_profile.Spine_Profile_wakanda-spine102.id
    name                                    = "wakanda-spine102"
    relation_infra_rs_spine_acc_node_p_grp  = "uni/infra/funcprof/spaccnodepgrp-default"
    spine_switch_association_type           = "range"
}

resource "aci_rest" "Spine_Node_Block_blk102-102" {
    depends_on                              = [
        aci_spine_profile.Spine_Profile_wakanda-spine102,
        aci_spine_switch_association.Association_wakanda-spine102
    ]
    path        = "/api/node/mo/uni/infra/spprof-wakanda-spine102/spines-wakanda-spine102-typ-range/nodeblk-blk102-102.json"
    class_name  = "infraNodeBlk"
    payload     = <<EOF
{
    "infraNodeBlk": {
        "attributes": {
            "dn": "uni/infra/spprof-wakanda-spine102/spines-wakanda-spine102-typ-range/nodeblk-blk102-102",
            "from_": "102",
            "to_": "102",
            "name": "blk102-102",
        },
        "children": []
    }
}
  EOF
}

