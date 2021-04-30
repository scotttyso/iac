#------------------------------------------------
# Create a Logical Node Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extLNodeP"
 - Distinguished Name: "/uni/tn-infra/out-msite_L3/lnodep-dc2-spine102"
GUI Location:
Tenants > infra > Networking > L3Outs > msite_L3 > Logical Node Profile > dc2-spine102
*/
resource "aci_logical_node_profile" "infra_l3out_msite_L3_nodep_dc2-spine102" {
    depends_on      = [
        aci_tenant.infra,
        aci_l3_outside.infra_l3out_msite_L3
    ]
    l3_outside_dn   = aci_l3_outside.infra_l3out_msite_L3.id
    description     = "DC2 spine102 MultiSite Connectivity"
    name            = "dc2-spine102"
    target_dscp     = "unspecified"
}

#------------------------------------------------
# Assign a Node to a Logical Node Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extRsNodeL3OutAtt"
 - Distinguished Name: "/uni/tn-infra/out-msite_L3/lnodep-/rsnodeL3OutAtt-[topology/pod-1/node-102]"
GUI Location:
Tenants > infra > Networking > L3Outs > msite_L3 > Logical Node Profile > : Nodes > 102
*/
resource "aci_logical_node_to_fabric_node" "infra_l3out_msite_L3_nodep__102" {
    depends_on              = [
        aci_tenant.infra,
        aci_l3_outside.infra_l3out_msite_L3,
        aci_logical_node_profile.infra_l3out_msite_L3_nodep_
    ]
    logical_node_profile_dn = aci_logical_node_profile.infra_l3out_msite_L3_nodep_.id
    tDn                     = "topology/pod-1/node-102"
    rtr_id                  = "198.19.251.102"
    rtr_id_loop_back        = "yes"
}

#------------------------------------------------
# Create Logical Interface Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extLIfP"
 - Distinguished Name: "/uni/tn-infra/out-msite_L3/lnodep-"
GUI Location:
 - Tenants > infra > Networking > L3Outs > msite_L3 > Logical Node Profile > dc2-spine102 > Logical Interface Profiles Eth1-01_4
*/
resource "aci_logical_interface_profile" "infra_l3out_msite_L3_nodep_dc2-spine102_node_intfp_Eth1-01_4" {
    depends_on                                      = [
        aci_tenant.infra,
        aci_l3_outside.infra_l3out_msite_L3,
        aci_logical_node_profile.infra_l3out_msite_L3_nodep_dc2-spine102
    ]
    logical_node_profile_dn                         = aci_logical_node_profile.infra_l3out_msite_L3_nodep_dc2-spine102.id
    description                                     = "dc2-spine102-Eth1-01.4 to InterSite"
    name                                            = "Eth1-01_4"
    prio                                            = ""
    tag                                             = "yellow-green"
    relation_l3ext_rs_path_l3_out_att               = []
}

#------------------------------------------------
# Assign a OSPF Routing Policy to the L3Out
#------------------------------------------------

/*
API Information:
 - Class: "ospfIfP"
 - Distinguished Name: "/uni/tn-infra/out-msite_L3/nodep-dc2-spine102/lifp-Eth1-01_4/ospfIfP"
GUI Location:
 - Tenants > infra > Networking > L3Outs > msite_L3 > Logical Node Profile dc2-spine102 > Logical Interface Profile > Eth1-01_4 > OSPF Interface Profile
*/
resource "aci_l3out_ospf_interface_profile" "infra_l3out_msite_L3_nodep_dc2-spine102_node_intfp_Eth1-01_4_OSPF_Profile" {
    depends_on                      = [
        aci_tenant.infra,
        aci_l3_outside.infra_l3out_msite_L3,
        aci_logical_interface_profile.infra_l3out_msite_L3_nodep_dc2-spine102_node_intfp_Eth1-01_4
        data.aci_ospf_interface_policy._ospf_intf_plcy_
    ]
    logical_interface_profile_dn    = aci_logical_interface_profile.infra_l3out_msite_L3_nodep_dc2-spine102_node_intfp_Eth1-01_4.id
    description                     = "OSPF Multi-Site Profile"
    auth_type                       = "none"
    relation_ospf_rs_if_pol         = data.aci_ospf_interface_policy._ospf_intf_plcy_.id
}

#------------------------------------------------
# Create Logical Interface Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extLIfP"
 - Distinguished Name: "/uni/tn-infra/out-msite_L3/lnodep-"
GUI Location:
 - Tenants > infra > Networking > L3Outs > msite_L3 > Logical Node Profile > dc2-spine102 > Logical Interface Profiles Eth1-02_4
*/
resource "aci_logical_interface_profile" "infra_l3out_msite_L3_nodep_dc2-spine102_node_intfp_Eth1-02_4" {
    depends_on                                      = [
        aci_tenant.infra,
        aci_l3_outside.infra_l3out_msite_L3,
        aci_logical_node_profile.infra_l3out_msite_L3_nodep_dc2-spine102
    ]
    logical_node_profile_dn                         = aci_logical_node_profile.infra_l3out_msite_L3_nodep_dc2-spine102.id
    description                                     = "dc2-spine102-Eth1-02.4 to InterSite"
    name                                            = "Eth1-02_4"
    prio                                            = ""
    tag                                             = "yellow-green"
    relation_l3ext_rs_path_l3_out_att               = []
}

#------------------------------------------------
# Assign a OSPF Routing Policy to the L3Out
#------------------------------------------------

/*
API Information:
 - Class: "ospfIfP"
 - Distinguished Name: "/uni/tn-infra/out-msite_L3/nodep-dc2-spine102/lifp-Eth1-02_4/ospfIfP"
GUI Location:
 - Tenants > infra > Networking > L3Outs > msite_L3 > Logical Node Profile dc2-spine102 > Logical Interface Profile > Eth1-02_4 > OSPF Interface Profile
*/
resource "aci_l3out_ospf_interface_profile" "infra_l3out_msite_L3_nodep_dc2-spine102_node_intfp_Eth1-02_4_OSPF_Profile" {
    depends_on                      = [
        aci_tenant.infra,
        aci_l3_outside.infra_l3out_msite_L3,
        aci_logical_interface_profile.infra_l3out_msite_L3_nodep_dc2-spine102_node_intfp_Eth1-02_4
        data.aci_ospf_interface_policy._ospf_intf_plcy_
    ]
    logical_interface_profile_dn    = aci_logical_interface_profile.infra_l3out_msite_L3_nodep_dc2-spine102_node_intfp_Eth1-02_4.id
    description                     = "OSPF Multi-Site Profile"
    auth_type                       = "none"
    relation_ospf_rs_if_pol         = data.aci_ospf_interface_policy._ospf_intf_plcy_.id
}

#-------------------------------------------------------------
# Attach a Node Interface Path to a Logical Interface Profile
#-------------------------------------------------------------

/*
API Information:
 - Class: "l3extRsPathL3OutAtt"
 - Distinguished Name: "uni/tn-infra/out-msite_L3/lnodep-dc2-spine102/lifp-Eth1-01_4/rspathL3OutAtt-[topology/pod-1/paths-102/pathep-[eth1/1]]"
GUI Location:
 - Tenants > infra > Networking > L3Outs > msite_L3 > Logical Node Profile > dc2-spine102 > Logical Interface Profiles Eth1-01_4: Routed Sub-Interfaces

 - Assign all the default Policies to this Policy Group
*/
resource "aci_l3out_path_attachment" "infra_l3out_msite_L3_nodep_dc2-spine102_node_intfp_Eth1-01_4_path_attachment" {
    depends_on                      = [
        aci_tenant.infra,
        aci_logical_node_profile.infra_l3out_msite_L3_nodep_dc2-spine102,
        aci_logical_interface_profile.infra_l3out_msite_L3_nodep_dc2-spine102_node_intfp_Eth1-01_4
    ]
    logical_interface_profile_dn    = aci_logical_interface_profile.infra_l3out_msite_L3_nodep_dc2-spine102_node_intfp_Eth1-01_4.id
    target_dn                       = "topology/pod-1/paths-102/pathep-[eth1/1]"
    if_inst_t                       = "sub-interface"
    addr                            = "198.19.0.4/31"
    annotation                      = ""
    encap                           = "vlan-4"
    mode                            = "regular"
    encap_scope                     = "local"
    ipv6_dad                        = "enabled"
    mtu                             = "9150"
    target_dscp                     = "unspecified"
}

#-------------------------------------------------------------
# Attach a Node Interface Path to a Logical Interface Profile
#-------------------------------------------------------------

/*
API Information:
 - Class: "l3extRsPathL3OutAtt"
 - Distinguished Name: "uni/tn-infra/out-msite_L3/lnodep-dc2-spine102/lifp-Eth1-02_4/rspathL3OutAtt-[topology/pod-1/paths-102/pathep-[eth1/2]]"
GUI Location:
 - Tenants > infra > Networking > L3Outs > msite_L3 > Logical Node Profile > dc2-spine102 > Logical Interface Profiles Eth1-02_4: Routed Sub-Interfaces

 - Assign all the default Policies to this Policy Group
*/
resource "aci_l3out_path_attachment" "infra_l3out_msite_L3_nodep_dc2-spine102_node_intfp_Eth1-02_4_path_attachment" {
    depends_on                      = [
        aci_tenant.infra,
        aci_logical_node_profile.infra_l3out_msite_L3_nodep_dc2-spine102,
        aci_logical_interface_profile.infra_l3out_msite_L3_nodep_dc2-spine102_node_intfp_Eth1-02_4
    ]
    logical_interface_profile_dn    = aci_logical_interface_profile.infra_l3out_msite_L3_nodep_dc2-spine102_node_intfp_Eth1-02_4.id
    target_dn                       = "topology/pod-1/paths-102/pathep-[eth1/2]"
    if_inst_t                       = "sub-interface"
    addr                            = "198.19.0.6/31"
    annotation                      = ""
    encap                           = "vlan-4"
    mode                            = "regular"
    encap_scope                     = "local"
    ipv6_dad                        = "enabled"
    mtu                             = "9150"
    target_dscp                     = "unspecified"
}

