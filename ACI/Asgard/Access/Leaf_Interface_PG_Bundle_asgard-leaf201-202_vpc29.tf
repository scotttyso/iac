#------------------------------------------------
# Create Bundle (port-channel|vpc) Policy Groups
#------------------------------------------------

/*
API Information:
 - Class: "infraAccBndlGrp"
 - Distinguished Name: "uni/infra/funcprof/accbundle-asgard-leaf201-202_vpc29"
GUI Location:
 - Fabric > Interfaces > Leaf Interfaces > Policy Groups > [PC or VPC] Interface > asgard-leaf201-202_vpc29
*/
resource "aci_leaf_access_bundle_policy_group" "Policy_Group_Bundle_asgard-leaf201-202_vpc29" {
    depends_on                                  = [
        aci_attachable_access_entity_profile.AEP_trunk_aep,
        aci_cdp_interface_policy.CDP_cdpEnabled,
        aci_l2_interface_policy.L2_Interface_default,
        aci_lacp_policy.LACP_lacpActive,
        aci_fabric_if_pol.Link_Level_inherit_Auto,
        aci_lldp_interface_policy.LLDP_lldpEnabled,
        aci_miscabling_protocol_interface_policy.MCP_mcpEnabled,
        aci_port_security_policy.Port_Security_default,
        aci_rest.STP_bpduFG
        # aci_spanning_tree_interface_policy.STP_bpduFG
    ]
    description                                 = "asgard-ucs-a-E1/98"
    lag_t                                       = "node"
    name                                        = "asgard-leaf201-202_vpc29"
    name_alias                                  = "None"
    relation_infra_rs_att_ent_p                 = aci_attachable_access_entity_profile.AEP_trunk_aep.id
    # class: infraAttEntityP
    # DN: "uni/infra/attentp-trunk_aep"
    relation_infra_rs_cdp_if_pol                = aci_cdp_interface_policy.CDP_cdpEnabled.id
    # class: cdpIfPol
    # DN: "uni/infra/cdpIfP-cdpEnabled"
    relation_infra_rs_copp_if_pol               = "uni/infra/coppifpol-default"
    # class: coppIfPol
    # DN: "uni/infra/coppifpol-uni/infra/coppifpol-default"
    relation_infra_rs_h_if_pol                  = aci_fabric_if_pol.Link_Level_inherit_Auto.id
    # class: fabricHIfPol
    # DN: "uni/infra/hintfpol-inherit_Auto"
    relation_infra_rs_l2_if_pol                 = aci_l2_interface_policy.L2_Interface_default.id
    # class: l2IfPol
    # DN: "uni/infra/l2IfP-default"
    relation_infra_rs_l2_port_security_pol      = aci_port_security_policy.Port_Security_default.id
    # class: l2PortSecurityPol
    # DN: "uni/infra/portsecurityP-default"
    relation_infra_rs_lacp_pol                  = aci_lacp_policy.LACP_lacpActive.id
    # class: lacpLagPol
    # DN: "uni/infra/lacplagp-{Name}"
    relation_infra_rs_lldp_if_pol               = aci_lldp_interface_policy.LLDP_lldpEnabled.id
    # class: lldpIfPol
    # DN: "uni/infra/lldpIfP-lldpEnabled"
    relation_infra_rs_macsec_if_pol             = "uni/infra/macsecifp-default"
    # class: macsecIfPol
    # DN: "uni/infra/macsecifp-uni/infra/macsecifp-default"
    relation_infra_rs_mcp_if_pol                = aci_miscabling_protocol_interface_policy.MCP_mcpEnabled.id
    # class: mcpIfPol
    # DN: "uni/infra/mcpIfP-mcpEnabled"
    relation_infra_rs_mon_if_infra_pol          = "uni/fabric/monfab-default"
    # class: monFabricPol
    # DN: "uni/fabric/monfab-"
    relation_infra_rs_qos_egress_dpp_if_pol     = "uni/infra/qosdpppol-default"
    # class: qosDppPol
    # DN: "uni/infra/qosdpppol-uni/infra/qosdpppol-default"
    relation_infra_rs_qos_ingress_dpp_if_pol    = "uni/infra/qosdpppol-default"
    # class: qosDppPol
    # DN: "uni/infra/qosdpppol-uni/infra/qosdpppol-default"
    relation_infra_rs_qos_pfc_if_pol            = "uni/infra/pfc-default"
    # class: qosPfcIfPol
    # DN: "uni/infra/pfc-uni/infra/pfc-default"
    relation_infra_rs_qos_sd_if_pol             = "uni/infra/qossdpol-default"
    # class: qosSdIfPol
    # DN: "uni/infra/qossdpol-uni/infra/qossdpol-default"
    relation_infra_rs_stormctrl_if_pol          = "uni/infra/stormctrlifp-default"
    # class: stormctrlIfPol
    # DN: "uni/infra/stormctrlifp-uni/infra/stormctrlifp-default"
    relation_infra_rs_stp_if_pol                = aci_rest.STP_bpduFG.id
    # relation_infra_rs_stp_if_pol                = aci_spanning_tree_interface_policy.STP_bpduFG.id
    # class: stpIfPol
    # DN: "uni/infra/ifPol-bpduFG"
}

