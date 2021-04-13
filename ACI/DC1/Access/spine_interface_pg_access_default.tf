#------------------------------------------
# Create Spine Port Policy Groups
#------------------------------------------

/*
API Information:
 - Class: "infraSpAccPortGrp"
 - Distinguished Name: "uni/infra/funcprof/spaccportgrp-default"
GUI Location:
 - Fabric > Interfaces > Spine Interfaces > Policy Groups > default
*/
resource "aci_spine_port_policy_group" "default" {
    name                                        = "default"
    name_alias                                  = "None"
    relation_infra_rs_att_ent_p                 = aci_attachable_access_entity_profile.l3out_aep.id
    # class: infraAttEntityP
    # DN: "uni/infra/attentp-l3out_aep"
    relation_infra_rs_cdp_if_pol                = aci_cdp_interface_policy.cdpEnable.id
    # class: cdpIfPol
    # DN: "uni/infra/cdpIfP-cdpEnable"
    relation_infra_rs_h_if_pol                  = aci_fabric_if_pol.inherit_Auto.id
    # class: fabricHIfPol
    # DN: "uni/infra/hintfpol-inherit_Auto"
}

