/*
API Information:
 - Class: "infraSpineP"
 - Distinguished Name: "uni/infra/spprof-{Name}"
GUI Location:
 - Fabric > Access Policies > Switches > Spine Switches > Profiles > {Name}
*/
resource "aci_spine_profile" "spine_profile" {
    # description                     = each.value["description"]
    name                            = each.value["name"]
    name_alias                      = each.value["name_alias"]
    relation_infra_rs_sp_acc_port_p = [each.value["spine_interface_profile"]]
}

/*
API Information:
 - Class: "infraSpineS"
 - Distinguished Name: "uni/infra/spprof-{name}/spines-{name}-typ-{switch_association_type}"
GUI Location:
 - Fabric > Access Policies > Switches > Spine Switches > Profiles > {name}: Spine Selectors [{name}]
*/
resource "aci_spine_switch_association" "spine_switch_association" {
    spine_profile_dn                        = each.value["spine_profile_dn"]
    description                             = each.value["description"]
    name                                    = each.value["name"]
    name_alias                              = each.value["name_alias"]
    relation_infra_rs_spine_acc_node_p_grp  = "uni/infra/funcprof/spaccnodepgrp-default"
    # relation_infra_rs_spine_acc_node_p_grp  = each.value["spine_policy_group"]
    spine_switch_association_type           = each.value["switch_association_type"] # Options are (ALL|ALL_IN_POD|range)
}

resource "aci_rest" "spine_node_block" {
  for_each   = local.spine_switch_association
  path       = "/api/node/mo/${each.value["spine_profile_dn"]}/spines-${each.value["name"]}-typ-${each.value["switch_association_type"]}.json"
  class_name = "infraNodeBlk"
  payload    = <<EOF
{
  "infraNodeBlk": {
    "attributes": {
      "dn": "${each.value["spine_profile_dn"]}/spines-${each.value["name"]}-typ-${each.value["switch_association_type"]}/nodeblk-${each.value["name"]}",
      "from_": "${each.value["node_block_from"]}",
      "to_": "${each.value["node_block_to"]}",
      "name": "${each.value["name"]}",
    },
    "children": []
  }
}
  EOF
}
