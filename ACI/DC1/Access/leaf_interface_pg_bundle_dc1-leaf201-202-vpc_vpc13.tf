#------------------------------------------------
# Create Bundle (port-channel|vpc) Policy Groups
#------------------------------------------------

/*
API Information:
 - Class: "infraAccBndlGrp"
 - Distinguished Name: "uni/infra/funcprof/accbundle-dc1-leaf201-202-vpc_vpc13"
GUI Location:
 - Fabric > Interfaces > Leaf Interfaces > Policy Groups > [PC or VPC] Interface > dc1-leaf201-202-vpc_vpc13
*/
resource "aci_leaf_access_bundle_policy_group" "dc1-leaf201-202-vpc_vpc13" {
    depends_on                                  = [
        aci_attachable_access_entity_profile.trunk_aep,
        aci_cdp_interface_policy.cdpEnable,
        aci_l2_interface_policy.default,
        aci_fabric_if_pol.inherit_Auto,
        aci_lldp_interface_policy.lldpEnable,
        aci_miscabling_protocol_interface_policy.mcpEnabled,
        aci_port_security_policy.default,
        aci_rest.stp_bpduFG
    ]
    lag_t                                       = "node"
    name                                        = "dc1-leaf201-202-vpc_vpc13"
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
    relation_infra_rs_h_if_pol                  = aci_fabric_if_pol.inherit_Auto.id
    # class: fabricHIfPol
    # DN: "uni/infra/hintfpol-inherit_Auto"
    relation_infra_rs_l2_if_pol                 = aci_l2_interface_policy.default.id
    # class: l2IfPol
    # DN: "uni/infra/l2IfP-default"
    relation_infra_rs_l2_port_security_pol      = aci_port_security_policy.default.id
    # class: l2PortSecurityPol
    # DN: "uni/infra/portsecurityP-default"
    relation_infra_rs_lacp_pol                  = aci_lacp_policy.lacpActive.id
    # class: lacpLagPol
    # DN: "uni/infra/lacplagp-{Name}"
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

