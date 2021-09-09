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
resource "aci_spine_port_policy_group" "Interface_Policy_Group_default" {
    depends_on                                  = [
        aci_attachable_access_entity_profile.AEP_l3out_aep,
        aci_cdp_interface_policy.CDP_cdpEnabled,
        aci_fabric_if_pol.Link_Level_inherit_Auto,
    ]
    name                                        = "default"
    name_alias                                  = "None"
    relation_infra_rs_att_ent_p                 = aci_attachable_access_entity_profile.AEP_l3out_aep.id
    # class: infraAttEntityP
    # DN: "uni/infra/attentp-l3out_aep"
    relation_infra_rs_cdp_if_pol                = aci_cdp_interface_policy.CDP_cdpEnabled.id
    # class: cdpIfPol
    # DN: "uni/infra/cdpIfP-cdpEnabled"
    relation_infra_rs_h_if_pol                  = aci_fabric_if_pol.Link_Level_inherit_Auto.id
    # class: fabricHIfPol
    # DN: "uni/infra/hintfpol-inherit_Auto"
}

