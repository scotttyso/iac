/*
API Information:
 - Class: "infraAccPortGrp"
 - Distinguished Name: "uni/infra/funcprof/accportgrp-auto_1500"
GUI Location:
 - Fabric > Interfaces > Leaf Interfaces > Policy Groups > Leaf Access Port > auto_1500
*/
resource "aci_leaf_access_port_policy_group" "pg_auto_1500" {
	description 				       = "Access with Regular MTU"
	name 						       = "auto_1500"
	relation_infra_rs_att_ent_p	       = "uni/infra/attentp-access_aep"
	relation_infra_rs_cdp_if_pol       = "uni/infra/cdpIfP-cdp_Enabled"
	relation_infra_rs_h_if_pol	       = "uni/infra/hintfpol-inherit_Auto"
	relation_infra_rs_lldp_if_pol      = "uni/infra/lldpIfP-lldp_Enabled"
	relation_infra_rs_mcp_if_pol       = "uni/infra/mcpIfP-mcp_Enabled"
	relation_infra_rs_mon_if_infra_pol = "uni/infra/moninfra-default"
	relation_infra_rs_stp_if_pol       = "uni/infra/ifPol-BPDU_ft_and_gd"
}

