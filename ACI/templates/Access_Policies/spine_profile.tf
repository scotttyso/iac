/*
API Information:
 - Class: "infraSpineP"
 - Distinguished Name: "uni/infra/spprof-{{Name}}"
GUI Location:
 - Fabric > Access Policies > Switches > Spine Switches > Profiles > {{Name}}
*/
resource "aci_spine_profile" "Name" {
    # description                     = "description" # Description is currently Unsupported
    name                            = "{{Name}}"
    relation_infra_rs_sp_acc_port_p = ["spine_interface_profile"]
}

/*
API Information:
 - Class: "infraSpineS"
 - Distinguished Name: "uni/infra/spprof-{{Name}}/spines-{{Name}}-typ-{switch_association_type}"
GUI Location:
 - Fabric > Access Policies > Switches > Spine Switches > Profiles > {{Name}}: Spine Selectors [{{Name}}]
*/
resource "aci_spine_switch_association" "spine_switch_association" {
    spine_profile_dn                        = "spine_profile_dn"
    description                             = "description"
    name                                    = "{{Name}}"
    name_alias                              = "name_alias"
    relation_infra_rs_spine_acc_node_p_grp  = "uni/infra/funcprof/spaccnodepgrp-default"
    spine_switch_association_type           = "{{Association_Type}}" # Options are (ALL|ALL_IN_POD|range)
}

resource "aci_rest" "spine_node_block" {
    for_each    = local.spine_switch_association
    path        = "/api/node/mo/spine_profile_dn/spines-name-typ-switch_association_type.json"
    class_name  = "infraNodeBlk"
    payload     = <<EOF
{
    "infraNodeBlk": {
        "attributes": {
            "dn": ""spine_profile_dn"/spines-"name"-typ-"switch_association_type"/nodeblk-"name"",
            "from_": ""node_block_from"",
            "to_": ""node_block_to"",
            "name": ""name"",
        },
        "children": []
    }
}
  EOF
}
