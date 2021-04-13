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
resource "aci_leaf_access_port_policy_group" "trunkPort" {
    depends_on                                  = [
        aci_attachable_access_entity_profile.trunk_aep
        aci_cdp_interface_policy.cdpEnable
        aci_interface_fc_policy.auto_F_auto
        aci_l2_interface_policy.default
        aci_fabric_if_pol.inherit_Auto
        aci_lldp_interface_policy.lldpEnable
        aci_miscabling_protocol_interface_policy.mcpEnabled
        aci_port_security_policy.default
        aci_rest.stp_bpduFG
    ]
    name                                        = "trunkPort"
    name_alias                                  = "None"
    relation_infra_rs_att_ent_p                 = aci_attachable_access_entity_profile.trunk_aep.id
    # class: infraAttEntityP
    # DN: "uni/infra/attentp-trunk_aep"
    relation_infra_rs_cdp_if_pol                = aci_cdp_interface_policy.cdpEnable.id
    # class: cdpIfPol
    # DN: "uni/infra/cdpIfP-cdpEnable"
    relation_infra_rs_copp_if_pol               = "uni/infra/coppifpol-default"
    # class: coppIfPol
    # DN: "uni/infra/coppifpol-uni/infra/coppifpol-default"
    relation_infra_rs_fc_if_pol                 = aci_interface_fc_policy..id
    # class: fcIfPol
    # DN: "uni/infra/fcIfPol-auto_F_auto"
    relation_infra_rs_h_if_pol                  = aci_fabric_if_pol.inherit_Auto.id
    # class: fabricHIfPol
    # DN: "uni/infra/hintfpol-inherit_Auto"
    relation_infra_rs_l2_if_pol                 = aci_l2_interface_policy.default.id
    # class: l2IfPol
    # DN: "uni/infra/l2IfP-default"
    relation_infra_rs_l2_port_auth_pol          = "uni/infra/portauthpol-default"
    # class: l2PortAuthPol
    # DN: "uni/infra/portauthpol-uni/infra/portauthpol-default"
    relation_infra_rs_l2_port_security_pol      = aci_port_security_policy.default.id
    # class: l2PortSecurityPol
    # DN: "uni/infra/portsecurityP-default"
    relation_infra_rs_lldp_if_pol               = aci_lldp_interface_policy.lldpEnable.id
    # class: lldpIfPol
    # DN: "uni/infra/lldpIfP-lldpEnable"
    relation_infra_rs_macsec_if_pol             = "uni/infra/macsecifpol-default"
    # class: macsecIfPol
    # DN: "uni/infra/macsecifp-uni/infra/macsecifpol-default"
    relation_infra_rs_mcp_if_pol                = aci_miscabling_protocol_interface_policy.mcpEnabled.id
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
    relation_infra_rs_stp_if_pol                = aci_rest.stp_bpduFG.id
    # class: stpIfPol
    # DN: "uni/infra/ifPol-bpduFG"
}

