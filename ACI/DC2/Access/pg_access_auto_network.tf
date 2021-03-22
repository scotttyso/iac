/*
API Information:
 - Class: "infraAccPortGrp"
 - Distinguished Name: "uni/infra/funcprof/accportgrp-auto_network"
GUI Location:
 - Fabric > Interfaces > Leaf Interfaces > Policy Groups > Leaf Access Port > auto_network
*/
resource "aci_leaf_access_port_policy_group" "pg_auto_network" {
    depends_on                            = [aci_attachable_access_entity_profile.access_aep]
    description                            = "Network with ft and gd disabled"
    name                                    = "auto_network"
    relation_infra_rs_att_ent_p               = "uni/infra/attentp-access_aep"
    relation_infra_rs_cdp_if_pol           = "uni/infra/cdpIfP-cdp_Enabled"
    relation_infra_rs_h_if_pol               = "uni/infra/hintfpol-inherit_Auto"
    relation_infra_rs_lldp_if_pol          = "uni/infra/lldpIfP-lldp_Enabled"
    relation_infra_rs_mcp_if_pol           = "uni/infra/mcpIfP-mcp_Enabled"
    relation_infra_rs_mon_if_infra_pol     = "uni/infra/moninfra-default"
    relation_infra_rs_stp_if_pol           = "uni/infra/ifPol-BPDU_no_ft_or_gd"
}

