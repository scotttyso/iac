#------------------------------------------
# Create Access Port Policy Groups
#------------------------------------------

/*
API Information:
 - Class: "infraAccPortGrp"
 - Distinguished Name: "uni/infra/funcprof/accportgrp-trunkPort"
GUI Location:
 - Fabric > Interfaces > Leaf Interfaces > Policy Groups > Leaf Access Port > trunkPort
*/
resource "aci_leaf_access_port_policy_group" "Policy_Group_Access_trunkPort" {
    depends_on                                  = [
        aci_attachable_access_entity_profile.AEP_trunk_aep,
        aci_cdp_interface_policy.CDP_cdpEnabled,
        aci_l2_interface_policy.L2_Interface_default,
        aci_fabric_if_pol.Link_Level_inherit_Auto,
        aci_lldp_interface_policy.LLDP_lldpEnabled,
        aci_miscabling_protocol_interface_policy.MCP_mcpEnabled,
        aci_port_security_policy.Port_Security_default,
    #    aci_spanning_tree_interface_policy.STP_bpduFG
    ]
    name                                        = "trunkPort"
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
    relation_infra_rs_l2_port_auth_pol          = "uni/infra/portauthpol-default"
    # class: l2PortAuthPol
    # DN: "uni/infra/portauthpol-uni/infra/portauthpol-default"
    relation_infra_rs_l2_port_security_pol      = aci_port_security_policy.Port_Security_default.id
    # class: l2PortSecurityPol
    # DN: "uni/infra/portsecurityP-default"
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
    # **There is no default Policy**
    # relation_infra_rs_poe_if_pol                = ["uni/infra/poeIfP-default"]
    # class: poeIfPol
    # DN: "uni/infra/poeIfP-"
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
    # relation_infra_rs_stp_if_pol                = aci_spanning_tree_interface_policy.STP_bpduFG.id
    # class: stpIfPol
    # DN: "uni/infra/ifPol-bpduFG"
}

