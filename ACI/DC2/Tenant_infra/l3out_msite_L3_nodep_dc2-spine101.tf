#------------------------------------------------
# Create a Logical Node Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extLNodeP"
 - Distinguished Name: "/uni/tn-infra/out-msite_L3/lnodep-dc2-spine101"
GUI Location:
Tenants > infra > Networking > L3Outs > msite_L3 > Logical Node Profile > dc2-spine101
*/
resource "aci_logical_node_profile" "infra_l3out_msite_L3_nodep_dc2-spine101" {
    depends_on      = [
        aci_tenant.infra,
        aci_l3_outside.infra_l3out_msite_L3
    ]
    l3_outside_dn   = aci_l3_outside.infra_l3out_msite_L3.id
    description     = "DC2 spine101 MultiSite Connectivity"
    name            = "dc2-spine101"
    target_dscp     = "unspecified"
}

#------------------------------------------------
# Assign a Node to a Logical Node Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extRsNodeL3OutAtt"
 - Distinguished Name: "/uni/tn-infra/out-msite_L3/lnodep-/rsnodeL3OutAtt-[topology/pod-1/node-101]"
GUI Location:
Tenants > infra > Networking > L3Outs > msite_L3 > Logical Node Profile > : Nodes > 101
*/
resource "aci_logical_node_to_fabric_node" "infra_l3out_msite_L3_nodep__101" {
    depends_on              = [
        aci_tenant.infra,
        aci_l3_outside.infra_l3out_msite_L3,
        aci_logical_node_profile.infra_l3out_msite_L3_nodep_
    ]
    logical_node_profile_dn = aci_logical_node_profile.infra_l3out_msite_L3_nodep_.id
    tDn                     = "topology/pod-1/node-101"
    rtr_id                  = "198.19.251.101"
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
 - Tenants > infra > Networking > L3Outs > msite_L3 > Logical Node Profile > dc2-spine101 > Logical Interface Profiles Eth1-01_4
*/
resource "aci_logical_interface_profile" "infra_l3out_msite_L3_nodep_dc2-spine101_node_intfp_Eth1-01_4" {
    depends_on                                      = [
        aci_tenant.infra,
        aci_l3_outside.infra_l3out_msite_L3,
        aci_logical_node_profile.infra__l3out_msite_L3_nodep_dc2-spine101
    ]
    logical_node_profile_dn                         = aci_logical_node_profile.infra__l3out_msite_L3_nodep_dc2-spine101.id
    description                                     = "dc2-spine101-Eth1-01.4 to InterSite"
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
 - Distinguished Name: "/uni/tn-infra/out-msite_L3/nodep-dc2-spine101/lifp-Eth1-01_4/ospfIfP"
GUI Location:
 - Tenants > infra > Networking > L3Outs > msite_L3 > Logical Node Profile dc2-spine101 > Logical Interface Profile > Eth1-01_4 > OSPF Interface Profile
*/
resource "aci_l3out_ospf_interface_profile" "infra_l3out_msite_L3_nodep_dc2-spine101_node_intfp_Eth1-01_4_OSPF_Profile" {
    depends_on                      = [
        aci_tenant.infra,
        aci_l3_outside.infra_l3out_msite_L3,
        aci_logical_interface_profile.infra_l3out_msite_L3_nodep_dc2-spine101_node_intfp_Eth1-01_4
        data.aci_ospf_interface_policy._ospf_intf_plcy_
    ]
    logical_interface_profile_dn    = aci_logical_interface_profile.infra_l3out_msite_L3_nodep_dc2-spine101_node_intfp_Eth1-01_4.id
    description                     = "OSPF Multi-Site Profile"
    auth_key                        = var.
    auth_key_id                     = "1"
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
 - Tenants > infra > Networking > L3Outs > msite_L3 > Logical Node Profile > dc2-spine101 > Logical Interface Profiles Eth1-02_4
*/
resource "aci_logical_interface_profile" "infra_l3out_msite_L3_nodep_dc2-spine101_node_intfp_Eth1-02_4" {
    depends_on                                      = [
        aci_tenant.infra,
        aci_l3_outside.infra_l3out_msite_L3,
        aci_logical_node_profile.infra__l3out_msite_L3_nodep_dc2-spine101
    ]
    logical_node_profile_dn                         = aci_logical_node_profile.infra__l3out_msite_L3_nodep_dc2-spine101.id
    description                                     = "dc2-spine101-Eth1-02.4 to InterSite"
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
 - Distinguished Name: "/uni/tn-infra/out-msite_L3/nodep-dc2-spine101/lifp-Eth1-02_4/ospfIfP"
GUI Location:
 - Tenants > infra > Networking > L3Outs > msite_L3 > Logical Node Profile dc2-spine101 > Logical Interface Profile > Eth1-02_4 > OSPF Interface Profile
*/
resource "aci_l3out_ospf_interface_profile" "infra_l3out_msite_L3_nodep_dc2-spine101_node_intfp_Eth1-02_4_OSPF_Profile" {
    depends_on                      = [
        aci_tenant.infra,
        aci_l3_outside.infra_l3out_msite_L3,
        aci_logical_interface_profile.infra_l3out_msite_L3_nodep_dc2-spine101_node_intfp_Eth1-02_4
        data.aci_ospf_interface_policy._ospf_intf_plcy_
    ]
    logical_interface_profile_dn    = aci_logical_interface_profile.infra_l3out_msite_L3_nodep_dc2-spine101_node_intfp_Eth1-02_4.id
    description                     = "OSPF Multi-Site Profile"
    auth_key                        = var.
    auth_key_id                     = "1"
    auth_type                       = "none"
    relation_ospf_rs_if_pol         = data.aci_ospf_interface_policy._ospf_intf_plcy_.id
}

