/*
 This File will include Policies Related to Fabric > Access Policies
*/

/*
Create VLAN Pool access_vlp
Fabric > Access Policies > Pools > VLAN:[access_vlp]
*/
resource "aci_vlan_pool" "access_vlp" {
	name        = "access_vlp"
	alloc_mode  = "static"
}

/*
Create VLAN Pool dynamic_vlp
Fabric > Access Policies > Pools > VLAN:[dynamic_vlp]
*/
resource "aci_vlan_pool" "dynamic_vlp" {
	name        = "dynamic_vlp"
	alloc_mode  = "dynamic"
}

/*
Create VLAN Pool inband_vlp
Fabric > Access Policies > Pools > VLAN:[inband_vlp]
*/
resource "aci_vlan_pool" "inband_vlp" {
	name        = "inband_vlp"
	alloc_mode  = "static"
}

/*
Create VLAN Pool l3out_vlp
Fabric > Access Policies > Pools > VLAN:[l3out_vlp]
*/
resource "aci_vlan_pool" "l3out_vlp" {
	name        = "l3out_vlp"
	alloc_mode  = "static"
}

/*
Create VLAN Pool msite_vlp
Fabric > Access Policies > Pools > VLAN:[msite_vlp]
*/
resource "aci_vlan_pool" "msite_vlp" {
	name        = "msite_vlp"
	alloc_mode  = "static"
}

resource "aci_leaf_access_port_policy_group" "pg_access_test_apg" {
	description 				       = "Access Test Policy Group"
	name 						       = "access_test_apg"
	relation_infra_rs_att_ent_p	       = "uni/infra/attentp-access_aep"
	relation_infra_rs_cdp_if_pol       = "uni/infra/cdpIfP-cdp_Enabled"
	relation_infra_rs_h_if_pol	       = "uni/infra/hintfpol-inherit_Auto"
	relation_infra_rs_lldp_if_pol      = "uni/infra/lldpIfP-lldp_Enabled"
	relation_infra_rs_mcp_if_pol       = "uni/infra/mcpIfP-mcp_Enabled"\n')
	relation_infra_rs_mon_if_infra_pol = "uni/infra/moninfra-default"\n')
	relation_infra_rs_stp_if_pol       = "uni/infra/ifPol-BPDU_no_ft_or_gd"
}

resource "aci_leaf_access_bundle_policy_group" "pg_r143b_fp01_pcg" {
	description 				       = "r143b-fp01_vpc"
	name 						       = "r143b_fp01_pcg"
	lag_t 						       = "link"
	relation_infra_rs_att_ent_p	       = "uni/infra/attentp-access_aep"
	relation_infra_rs_cdp_if_pol       = "uni/infra/cdpIfP-cdp_Enabled"
	relation_infra_rs_h_if_pol	       = "uni/infra/hintfpol-inherit_Auto"
    relation_infra_rs_lacp_pol         = "uni/infra/lacplagp-lacp_Active"
	relation_infra_rs_lldp_if_pol      = "uni/infra/lldpIfP-lldp_Enabled"
	relation_infra_rs_mcp_if_pol       = "uni/infra/mcpIfP-mcp_Enabled"\n')
	relation_infra_rs_mon_if_infra_pol = "uni/infra/moninfra-default"\n')
	relation_infra_rs_stp_if_pol       = "uni/infra/ifPol-BPDU_ft_and_gd"
}

resource "aci_leaf_access_bundle_policy_group" "pg_r143b_fp01_vpc" {
	description 				       = "r143b-fp01_vpc"
	name 						       = "r143b_fp01_vpc"
	lag_t 						       = "node"
	relation_infra_rs_att_ent_p	       = "uni/infra/attentp-access_aep"
	relation_infra_rs_cdp_if_pol       = "uni/infra/cdpIfP-cdp_Enabled"
	relation_infra_rs_h_if_pol	       = "uni/infra/hintfpol-inherit_Auto"
    relation_infra_rs_lacp_pol         = "uni/infra/lacplagp-lacp_Active"
	relation_infra_rs_lldp_if_pol      = "uni/infra/lldpIfP-lldp_Enabled"
	relation_infra_rs_mcp_if_pol       = "uni/infra/mcpIfP-mcp_Enabled"\n')
	relation_infra_rs_mon_if_infra_pol = "uni/infra/moninfra-default"\n')
	relation_infra_rs_stp_if_pol       = "uni/infra/ifPol-BPDU_ft_and_gd"
}

resource "aci_leaf_access_bundle_policy_group" "pg_r143c-netapp01-ct0_vpc" {
	description 				       = "r143c-netapp01-ct0_vpc"
	name 						       = "r143c-netapp01-ct0_vpc"
	lag_t 						       = "node"
	relation_infra_rs_att_ent_p	       = "uni/infra/attentp-access_aep"
	relation_infra_rs_cdp_if_pol       = "uni/infra/cdpIfP-cdp_Enabled"
	relation_infra_rs_h_if_pol	       = "uni/infra/hintfpol-inherit_Auto"
    relation_infra_rs_lacp_pol         = "uni/infra/lacplagp-lacp_Active"
	relation_infra_rs_lldp_if_pol      = "uni/infra/lldpIfP-lldp_Enabled"
	relation_infra_rs_mcp_if_pol       = "uni/infra/mcpIfP-mcp_Enabled"\n')
	relation_infra_rs_mon_if_infra_pol = "uni/infra/moninfra-default"\n')
	relation_infra_rs_stp_if_pol       = "uni/infra/ifPol-BPDU_ft_and_gd"
}

resource "aci_leaf_access_bundle_policy_group" "pg_r143c-netapp01-ct1_vpc" {
	description 				       = "r143c-netapp01-ct1_vpc"
	name 						       = "r143c-netapp01-ct1_vpc"
	lag_t 						       = "node"
	relation_infra_rs_att_ent_p	       = "uni/infra/attentp-access_aep"
	relation_infra_rs_cdp_if_pol       = "uni/infra/cdpIfP-cdp_Enabled"
	relation_infra_rs_h_if_pol	       = "uni/infra/hintfpol-inherit_Auto"
    relation_infra_rs_lacp_pol         = "uni/infra/lacplagp-lacp_Active"
	relation_infra_rs_lldp_if_pol      = "uni/infra/lldpIfP-lldp_Enabled"
	relation_infra_rs_mcp_if_pol       = "uni/infra/mcpIfP-mcp_Enabled"\n')
	relation_infra_rs_mon_if_infra_pol = "uni/infra/moninfra-default"\n')
	relation_infra_rs_stp_if_pol       = "uni/infra/ifPol-BPDU_ft_and_gd"
}

resource "aci_leaf_access_bundle_policy_group" "pg_r143b-ucs-b_vpc" {
	description 				       = "asgard-ucs-a-Eth1/97"
	name 						       = "r143b-ucs-b_vpc"
	lag_t 						       = "node"
	relation_infra_rs_att_ent_p	       = "uni/infra/attentp-access_aep"
	relation_infra_rs_cdp_if_pol       = "uni/infra/cdpIfP-cdp_Enabled"
	relation_infra_rs_h_if_pol	       = "uni/infra/hintfpol-inherit_Auto"
    relation_infra_rs_lacp_pol         = "uni/infra/lacplagp-lacp_Active"
	relation_infra_rs_lldp_if_pol      = "uni/infra/lldpIfP-lldp_Enabled"
	relation_infra_rs_mcp_if_pol       = "uni/infra/mcpIfP-mcp_Enabled"\n')
	relation_infra_rs_mon_if_infra_pol = "uni/infra/moninfra-default"\n')
	relation_infra_rs_stp_if_pol       = "uni/infra/ifPol-BPDU_ft_and_gd"
}

resource "aci_leaf_access_bundle_policy_group" "pg_r143b-ucs-b_vpc" {
	description 				       = "asgard-ucs-b-Eth1/97"
	name 						       = "r143b-ucs-b_vpc"
	lag_t 						       = "node"
	relation_infra_rs_att_ent_p	       = "uni/infra/attentp-access_aep"
	relation_infra_rs_cdp_if_pol       = "uni/infra/cdpIfP-cdp_Enabled"
	relation_infra_rs_h_if_pol	       = "uni/infra/hintfpol-inherit_Auto"
    relation_infra_rs_lacp_pol         = "uni/infra/lacplagp-lacp_Active"
	relation_infra_rs_lldp_if_pol      = "uni/infra/lldpIfP-lldp_Enabled"
	relation_infra_rs_mcp_if_pol       = "uni/infra/mcpIfP-mcp_Enabled"\n')
	relation_infra_rs_mon_if_infra_pol = "uni/infra/moninfra-default"\n')
	relation_infra_rs_stp_if_pol       = "uni/infra/ifPol-BPDU_ft_and_gd"
}

resource "aci_leaf_access_bundle_policy_group" "pg_asgard-leaf101-102_vpc" {
	description 				       = "asgard-leaf101-102_vpc"
	name 						       = "asgard-leaf101-102_vpc"
	lag_t 						       = "node"
	relation_infra_rs_att_ent_p	       = "uni/infra/attentp-access_aep"
	relation_infra_rs_cdp_if_pol       = "uni/infra/cdpIfP-cdp_Enabled"
	relation_infra_rs_h_if_pol	       = "uni/infra/hintfpol-inherit_Auto"
    relation_infra_rs_lacp_pol         = "uni/infra/lacplagp-lacp_Active"
	relation_infra_rs_lldp_if_pol      = "uni/infra/lldpIfP-lldp_Enabled"
	relation_infra_rs_mcp_if_pol       = "uni/infra/mcpIfP-mcp_Enabled"\n')
	relation_infra_rs_mon_if_infra_pol = "uni/infra/moninfra-default"\n')
	relation_infra_rs_stp_if_pol       = "uni/infra/ifPol-BPDU_ft"
}

resource "aci_leaf_access_bundle_policy_group" "pg_wakanda-leaf101-102_vpc" {
	description 				       = "wakanda-leaf101-102_vpc"
	name 						       = "wakanda-leaf101-102_vpc"
	lag_t 						       = "node"
	relation_infra_rs_att_ent_p	       = "uni/infra/attentp-access_aep"
	relation_infra_rs_cdp_if_pol       = "uni/infra/cdpIfP-cdp_Enabled"
	relation_infra_rs_h_if_pol	       = "uni/infra/hintfpol-inherit_Auto"
    relation_infra_rs_lacp_pol         = "uni/infra/lacplagp-lacp_Active"
	relation_infra_rs_lldp_if_pol      = "uni/infra/lldpIfP-lldp_Enabled"
	relation_infra_rs_mcp_if_pol       = "uni/infra/mcpIfP-mcp_Enabled"\n')
	relation_infra_rs_mon_if_infra_pol = "uni/infra/moninfra-default"\n')
	relation_infra_rs_stp_if_pol       = "uni/infra/ifPol-BPDU_ft"
}

resource "aci_leaf_access_bundle_policy_group" "pg_r143-oob_vpc" {
	description 				       = "r143-oob_vpc"
	name 						       = "r143-oob_vpc"
	lag_t 						       = "node"
	relation_infra_rs_att_ent_p	       = "uni/infra/attentp-access_aep"
	relation_infra_rs_cdp_if_pol       = "uni/infra/cdpIfP-cdp_Enabled"
	relation_infra_rs_h_if_pol	       = "uni/infra/hintfpol-inherit_Auto"
    relation_infra_rs_lacp_pol         = "uni/infra/lacplagp-lacp_Active"
	relation_infra_rs_lldp_if_pol      = "uni/infra/lldpIfP-lldp_Enabled"
	relation_infra_rs_mcp_if_pol       = "uni/infra/mcpIfP-mcp_Enabled"\n')
	relation_infra_rs_mon_if_infra_pol = "uni/infra/moninfra-default"\n')
	relation_infra_rs_stp_if_pol       = "uni/infra/ifPol-BPDU_ft"
}

resource "aci_leaf_access_bundle_policy_group" "pg_r143-dist_vpc" {
	description 				       = "r143-dist_vpc"
	name 						       = "r143-dist_vpc"
	lag_t 						       = "node"
	relation_infra_rs_att_ent_p	       = "uni/infra/attentp-access_aep"
	relation_infra_rs_cdp_if_pol       = "uni/infra/cdpIfP-cdp_Enabled"
	relation_infra_rs_h_if_pol	       = "uni/infra/hintfpol-inherit_Auto"
    relation_infra_rs_lacp_pol         = "uni/infra/lacplagp-lacp_Active"
	relation_infra_rs_lldp_if_pol      = "uni/infra/lldpIfP-lldp_Enabled"
	relation_infra_rs_mcp_if_pol       = "uni/infra/mcpIfP-mcp_Enabled"\n')
	relation_infra_rs_mon_if_infra_pol = "uni/infra/moninfra-default"\n')
	relation_infra_rs_stp_if_pol       = "uni/infra/ifPol-BPDU_ft"
}

