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
resource "aci_spine_port_policy_group" "port_pg_default" {
    depends_on                                  = [
        aci_attachable_access_entity_profile.aep_l3out_aep,
        aci_cdp_interface_policy.cdp_cdpEnabled,
        aci_fabric_if_pol.link_level_inherit_Auto,
    ]
    name                                        = "default"
    name_alias                                  = "None"
    relation_infra_rs_att_ent_p                 = aci_attachable_access_entity_profile.aep_l3out_aep.id
    # class: infraAttEntityP
    # DN: "uni/infra/attentp-l3out_aep"
    relation_infra_rs_cdp_if_pol                = aci_cdp_interface_policy.cdp_cdpEnabled.id
    # class: cdpIfPol
    # DN: "uni/infra/cdpIfP-cdpEnabled"
    relation_infra_rs_h_if_pol                  = aci_fabric_if_pol.link_level_inherit_Auto.id
    # class: fabricHIfPol
    # DN: "uni/infra/hintfpol-inherit_Auto"
}

