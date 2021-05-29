#------------------------------------------------
# Create a Logical Node Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extLNodeP"
 - Distinguished Name: "/uni/tn-infra/out-msite/lnodep-asgard-spine101"
GUI Location:
Tenants > infra > Networking > L3Outs > msite > Logical Node Profile > asgard-spine101
*/
resource "aci_logical_node_profile" "Tenant_infra_L3Out_msite_Node_Profile_asgard-spine101" {
    depends_on      = [
        aci_tenant.Tenant_infra,
        aci_l3_outside.Tenant_infra_L3Out_msite
    ]
    l3_outside_dn   = aci_l3_outside.Tenant_infra_L3Out_msite.id
    description     = "Multi-Site Connectivity"
    name            = "asgard-spine101"
    target_dscp     = "unspecified"
}

#------------------------------------------------
# Assign a Node to a Logical Node Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extRsNodeL3OutAtt"
 - Distinguished Name: "/uni/tn-infra/out-msite/lnodep-asgard-spine101/rsnodeL3OutAtt-[topology/pod-1/node-101]"
GUI Location:
Tenants > infra > Networking > L3Outs > msite > Logical Node Profile > asgard-spine101: Nodes > 101
*/
resource "aci_logical_node_to_fabric_node" "Tenant_infra_L3Out_msite_Node_Profile_asgard-spine101_101" {
    depends_on              = [
        aci_tenant.Tenant_infra,
        aci_l3_outside.Tenant_infra_L3Out_msite,
        aci_logical_node_profile.Tenant_infra_L3Out_msite_Node_Profile_asgard-spine101
    ]
    logical_node_profile_dn = aci_logical_node_profile.Tenant_infra_L3Out_msite_Node_Profile_asgard-spine101.id
    tdn                     = "topology/pod-1/node-101"
    rtr_id                  = "10.92.4.101"
    rtr_id_loop_back        = "yes"
}

#------------------------------------------------
# Create Logical Interface Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extLIfP"
 - Distinguished Name: "/uni/tn-infra/out-msite/lnodep-"
GUI Location:
 - Tenants > infra > Networking > L3Outs > msite > Logical Node Profile > asgard-spine101 > Logical Interface Profiles Eth1-29_4
*/
resource "aci_logical_interface_profile" "Tenant_infra_L3Out_msite_Node_Profile_asgard-spine101_Interface_Profile_Eth1-29_4" {
    depends_on                                      = [
        aci_tenant.Tenant_infra,
        aci_l3_outside.Tenant_infra_L3Out_msite,
        aci_logical_node_profile.Tenant_infra_L3Out_msite_Node_Profile_asgard-spine101
    ]
    logical_node_profile_dn                         = aci_logical_node_profile.Tenant_infra_L3Out_msite_Node_Profile_asgard-spine101.id
    description                                     = "asgard-spine101-Eth1-29.4 to Multi-Site Core"
    name                                            = "Eth1-29_4"
    prio                                            = ""
    tag                                             = "yellow-green"
}

#------------------------------------------------
# Assign a OSPF Routing Policy to the L3Out
#------------------------------------------------

/*
API Information:
 - Class: "ospfIfP"
 - Distinguished Name: "/uni/tn-infra/out-msite/nodep-asgard-spine101/lifp-Eth1-29_4/ospfIfP"
GUI Location:
 - Tenants > infra > Networking > L3Outs > msite > Logical Node Profile asgard-spine101 > Logical Interface Profile > Eth1-29_4 > OSPF Interface Profile
*/
resource "aci_l3out_ospf_interface_profile" "Tenant_infra_L3Out_msite_Node_Profile_asgard-spine101_Interface_Profile_Eth1-29_4_OSPF_Profile" {
    depends_on                      = [
        aci_tenant.Tenant_infra,
        aci_l3_outside.Tenant_infra_L3Out_msite,
        aci_logical_interface_profile.Tenant_infra_L3Out_msite_Node_Profile_asgard-spine101_Interface_Profile_Eth1-29_4,
        data.aci_ospf_interface_policy.Tenant_common_Policy_OSPF_Interface_point-to-point,
    ]
    logical_interface_profile_dn    = aci_logical_interface_profile.Tenant_infra_L3Out_msite_Node_Profile_asgard-spine101_Interface_Profile_Eth1-29_4.id
    description                     = "OSPF Multi-Site Profile"
    auth_key                        = ""
    relation_ospf_rs_if_pol         = data.aci_ospf_interface_policy.Tenant_common_Policy_OSPF_Interface_point-to-point.id
}

#------------------------------------------------
# Create Logical Interface Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extLIfP"
 - Distinguished Name: "/uni/tn-infra/out-msite/lnodep-"
GUI Location:
 - Tenants > infra > Networking > L3Outs > msite > Logical Node Profile > asgard-spine101 > Logical Interface Profiles Eth1-30_4
*/
resource "aci_logical_interface_profile" "Tenant_infra_L3Out_msite_Node_Profile_asgard-spine101_Interface_Profile_Eth1-30_4" {
    depends_on                                      = [
        aci_tenant.Tenant_infra,
        aci_l3_outside.Tenant_infra_L3Out_msite,
        aci_logical_node_profile.Tenant_infra_L3Out_msite_Node_Profile_asgard-spine101
    ]
    logical_node_profile_dn                         = aci_logical_node_profile.Tenant_infra_L3Out_msite_Node_Profile_asgard-spine101.id
    description                                     = "asgard-spine101-Eth1-30.4 to Multi-Site Core"
    name                                            = "Eth1-30_4"
    prio                                            = ""
    tag                                             = "yellow-green"
}

#------------------------------------------------
# Assign a OSPF Routing Policy to the L3Out
#------------------------------------------------

/*
API Information:
 - Class: "ospfIfP"
 - Distinguished Name: "/uni/tn-infra/out-msite/nodep-asgard-spine101/lifp-Eth1-30_4/ospfIfP"
GUI Location:
 - Tenants > infra > Networking > L3Outs > msite > Logical Node Profile asgard-spine101 > Logical Interface Profile > Eth1-30_4 > OSPF Interface Profile
*/
resource "aci_l3out_ospf_interface_profile" "Tenant_infra_L3Out_msite_Node_Profile_asgard-spine101_Interface_Profile_Eth1-30_4_OSPF_Profile" {
    depends_on                      = [
        aci_tenant.Tenant_infra,
        aci_l3_outside.Tenant_infra_L3Out_msite,
        aci_logical_interface_profile.Tenant_infra_L3Out_msite_Node_Profile_asgard-spine101_Interface_Profile_Eth1-30_4,
        data.aci_ospf_interface_policy.Tenant_common_Policy_OSPF_Interface_point-to-point,
    ]
    logical_interface_profile_dn    = aci_logical_interface_profile.Tenant_infra_L3Out_msite_Node_Profile_asgard-spine101_Interface_Profile_Eth1-30_4.id
    description                     = "OSPF Multi-Site Profile"
    auth_key                        = ""
    relation_ospf_rs_if_pol         = data.aci_ospf_interface_policy.Tenant_common_Policy_OSPF_Interface_point-to-point.id
}

#-------------------------------------------------------------
# Attach a Node Interface Path to a Logical Interface Profile
#-------------------------------------------------------------

/*
API Information:
 - Class: "l3extRsPathL3OutAtt"
 - Distinguished Name: "uni/tn-infra/out-msite/lnodep-asgard-spine101/lifp-Eth1-29_4/rspathL3OutAtt-[topology/pod-1/paths-101/pathep-[eth1/29]]"
GUI Location:
 - Tenants > infra > Networking > L3Outs > msite > Logical Node Profile > asgard-spine101 > Logical Interface Profiles Eth1-29_4: Routed Sub-Interfaces

 - Assign all the default Policies to this Policy Group
*/
resource "aci_l3out_path_attachment" "Tenant_infra_L3Out_msite_Node_Profile_asgard-spine101_Interface_Profile_Eth1-29_4_path_attachment" {
    depends_on                      = [
        aci_tenant.Tenant_infra,
        aci_logical_node_profile.Tenant_infra_L3Out_msite_Node_Profile_asgard-spine101,
        aci_logical_interface_profile.Tenant_infra_L3Out_msite_Node_Profile_asgard-spine101_Interface_Profile_Eth1-29_4
    ]
    logical_interface_profile_dn    = aci_logical_interface_profile.Tenant_infra_L3Out_msite_Node_Profile_asgard-spine101_Interface_Profile_Eth1-29_4.id
    target_dn                       = "topology/pod-1/paths-101/pathep-[eth1/29]"
    if_inst_t                       = "sub-interface"
    addr                            = "10.92.4.0/31"
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
 - Distinguished Name: "uni/tn-infra/out-msite/lnodep-asgard-spine101/lifp-Eth1-30_4/rspathL3OutAtt-[topology/pod-1/paths-101/pathep-[eth1/30]]"
GUI Location:
 - Tenants > infra > Networking > L3Outs > msite > Logical Node Profile > asgard-spine101 > Logical Interface Profiles Eth1-30_4: Routed Sub-Interfaces

 - Assign all the default Policies to this Policy Group
*/
resource "aci_l3out_path_attachment" "Tenant_infra_L3Out_msite_Node_Profile_asgard-spine101_Interface_Profile_Eth1-30_4_path_attachment" {
    depends_on                      = [
        aci_tenant.Tenant_infra,
        aci_logical_node_profile.Tenant_infra_L3Out_msite_Node_Profile_asgard-spine101,
        aci_logical_interface_profile.Tenant_infra_L3Out_msite_Node_Profile_asgard-spine101_Interface_Profile_Eth1-30_4
    ]
    logical_interface_profile_dn    = aci_logical_interface_profile.Tenant_infra_L3Out_msite_Node_Profile_asgard-spine101_Interface_Profile_Eth1-30_4.id
    target_dn                       = "topology/pod-1/paths-101/pathep-[eth1/30]"
    if_inst_t                       = "sub-interface"
    addr                            = "10.92.4.2/31"
    annotation                      = ""
    encap                           = "vlan-4"
    mode                            = "regular"
    encap_scope                     = "local"
    ipv6_dad                        = "enabled"
    mtu                             = "9150"
    target_dscp                     = "unspecified"
}

