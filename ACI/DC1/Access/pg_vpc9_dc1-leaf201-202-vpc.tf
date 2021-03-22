/*
API Information:
 - Class: "infraAccBndlGrp"
 - Distinguished Name: "uni/infra/funcprof/accbundle-vpc9_dc1-leaf201-202-vpc"
GUI Location:
 - Fabric > Interfaces > Leaf Interfaces > Policy Groups > [PC or VPC] Interface > vpc9_dc1-leaf201-202-vpc
*/
resource "aci_leaf_access_bundle_policy_group" "pg_vpc9_dc1-leaf201-202-vpc" {
    depends_on                            = [aci_attachable_access_entity_profile.access_aep]
    description                        = "asgard-ucs-b-Eth1/98"
    name                                = "vpc9_dc1-leaf201-202-vpc"
    lag_t                                = "node"
    relation_infra_rs_att_ent_p           = "uni/infra/attentp-access_aep"
    relation_infra_rs_cdp_if_pol       = "uni/infra/cdpIfP-cdp_Enabled"
    relation_infra_rs_h_if_pol           = "uni/infra/hintfpol-inherit_Auto"
    relation_infra_rs_lacp_pol         = "uni/infra/lacplagp-lacp_Active"
    relation_infra_rs_lldp_if_pol      = "uni/infra/lldpIfP-lldp_Enabled"
    relation_infra_rs_mcp_if_pol       = "uni/infra/mcpIfP-mcp_Enabled"
    relation_infra_rs_mon_if_infra_pol = "uni/infra/moninfra-default"
    relation_infra_rs_stp_if_pol       = "uni/infra/ifPol-BPDU_ft_and_gd"
}

