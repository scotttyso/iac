#------------------------------------------------
# Create a Logical Node Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extLNodeP"
 - Distinguished Name: "/uni/tn-infra/out-intersite/lnodep-node-101-profile"
GUI Location:
Tenants > infra > Networking > L3Outs > intersite > Logical Node Profile > node-101-profile
*/
resource "aci_logical_node_profile" "Tenant_infra_L3Out_intersite_Node_Profile_node-101-profile" {
    depends_on      = [
        aci_tenant.Tenant_infra,
        aci_l3_outside.Tenant_infra_L3Out_intersite
    ]
    l3_outside_dn   = aci_l3_outside.Tenant_infra_L3Out_intersite.id
    description     = "Multi-Site Connectivity"
    name            = "node-101-profile"
    target_dscp     = "unspecified"
}

#------------------------------------------------
# Assign a Node to a Logical Node Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extRsNodeL3OutAtt"
 - Distinguished Name: "/uni/tn-infra/out-intersite/lnodep-node-101-profile/rsnodeL3OutAtt-[topology/pod-1/node-101]"
GUI Location:
Tenants > infra > Networking > L3Outs > intersite > Logical Node Profile > node-101-profile: Nodes > 101
*/
resource "aci_logical_node_to_fabric_node" "Tenant_infra_L3Out_intersite_Node_Profile_node-101-profile_101" {
    depends_on              = [
        aci_tenant.Tenant_infra,
        aci_l3_outside.Tenant_infra_L3Out_intersite,
        aci_logical_node_profile.Tenant_infra_L3Out_intersite_Node_Profile_node-101-profile
    ]
    logical_node_profile_dn = aci_logical_node_profile.Tenant_infra_L3Out_intersite_Node_Profile_node-101-profile.id
    tdn                     = "topology/pod-1/node-101"
    rtr_id                  = "10.96.4.101"
    rtr_id_loop_back        = "no"
}

#------------------------------------------------
# Create Logical Interface Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extLIfP"
 - Distinguished Name: "/uni/tn-infra/out-intersite/lnodep-"
GUI Location:
 - Tenants > infra > Networking > L3Outs > intersite > Logical Node Profile > node-101-profile > Logical Interface Profiles interface-101-1-29-profile
*/
resource "aci_logical_interface_profile" "Tenant_infra_L3Out_intersite_Node_Profile_node-101-profile_Interface_Profile_interface-101-1-29-profile" {
    depends_on                                      = [
        aci_tenant.Tenant_infra,
        aci_l3_outside.Tenant_infra_L3Out_intersite,
        aci_logical_node_profile.Tenant_infra_L3Out_intersite_Node_Profile_node-101-profile
    ]
    logical_node_profile_dn                         = aci_logical_node_profile.Tenant_infra_L3Out_intersite_Node_Profile_node-101-profile.id
    description                                     = "wakanda-spine101-Eth1-29.4 to Multi-Site Core"
    name                                            = "interface-101-1-29-profile"
    prio                                            = ""
    tag                                             = "yellow-green"
}

#------------------------------------------------
# Assign a OSPF Routing Policy to the L3Out
#------------------------------------------------

/*
API Information:
 - Class: "ospfIfP"
 - Distinguished Name: "/uni/tn-infra/out-intersite/nodep-node-101-profile/lifp-interface-101-1-29-profile/ospfIfP"
GUI Location:
 - Tenants > infra > Networking > L3Outs > intersite > Logical Node Profile node-101-profile > Logical Interface Profile > interface-101-1-29-profile > OSPF Interface Profile
*/
resource "aci_l3out_ospf_interface_profile" "Tenant_infra_L3Out_intersite_Node_Profile_node-101-profile_Interface_Profile_interface-101-1-29-profile_OSPF_Profile" {
    depends_on                      = [
        aci_tenant.Tenant_infra,
        aci_l3_outside.Tenant_infra_L3Out_intersite,
        aci_logical_interface_profile.Tenant_infra_L3Out_intersite_Node_Profile_node-101-profile_Interface_Profile_interface-101-1-29-profile,
        data.aci_ospf_interface_policy.Tenant_common_Policy_OSPF_Interface_point-to-point,
    ]
    logical_interface_profile_dn    = aci_logical_interface_profile.Tenant_infra_L3Out_intersite_Node_Profile_node-101-profile_Interface_Profile_interface-101-1-29-profile.id
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
 - Distinguished Name: "/uni/tn-infra/out-intersite/lnodep-"
GUI Location:
 - Tenants > infra > Networking > L3Outs > intersite > Logical Node Profile > node-101-profile > Logical Interface Profiles interface-101-1-30-profile
*/
resource "aci_logical_interface_profile" "Tenant_infra_L3Out_intersite_Node_Profile_node-101-profile_Interface_Profile_interface-101-1-30-profile" {
    depends_on                                      = [
        aci_tenant.Tenant_infra,
        aci_l3_outside.Tenant_infra_L3Out_intersite,
        aci_logical_node_profile.Tenant_infra_L3Out_intersite_Node_Profile_node-101-profile
    ]
    logical_node_profile_dn                         = aci_logical_node_profile.Tenant_infra_L3Out_intersite_Node_Profile_node-101-profile.id
    description                                     = "wakanda-spine101-Eth1-30.4 to Multi-Site Core"
    name                                            = "interface-101-1-30-profile"
    prio                                            = ""
    tag                                             = "yellow-green"
}

#------------------------------------------------
# Assign a OSPF Routing Policy to the L3Out
#------------------------------------------------

/*
API Information:
 - Class: "ospfIfP"
 - Distinguished Name: "/uni/tn-infra/out-intersite/nodep-node-101-profile/lifp-interface-101-1-30-profile/ospfIfP"
GUI Location:
 - Tenants > infra > Networking > L3Outs > intersite > Logical Node Profile node-101-profile > Logical Interface Profile > interface-101-1-30-profile > OSPF Interface Profile
*/
resource "aci_l3out_ospf_interface_profile" "Tenant_infra_L3Out_intersite_Node_Profile_node-101-profile_Interface_Profile_interface-101-1-30-profile_OSPF_Profile" {
    depends_on                      = [
        aci_tenant.Tenant_infra,
        aci_l3_outside.Tenant_infra_L3Out_intersite,
        aci_logical_interface_profile.Tenant_infra_L3Out_intersite_Node_Profile_node-101-profile_Interface_Profile_interface-101-1-30-profile,
        data.aci_ospf_interface_policy.Tenant_common_Policy_OSPF_Interface_point-to-point,
    ]
    logical_interface_profile_dn    = aci_logical_interface_profile.Tenant_infra_L3Out_intersite_Node_Profile_node-101-profile_Interface_Profile_interface-101-1-30-profile.id
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
 - Distinguished Name: "uni/tn-infra/out-intersite/lnodep-node-101-profile/lifp-interface-101-1-29-profile/rspathL3OutAtt-[topology/pod-1/paths-101/pathep-[eth1/29]]"
GUI Location:
 - Tenants > infra > Networking > L3Outs > intersite > Logical Node Profile > node-101-profile > Logical Interface Profiles interface-101-1-29-profile: Routed Sub-Interfaces

 - Assign all the default Policies to this Policy Group
*/
resource "aci_l3out_path_attachment" "Tenant_infra_L3Out_intersite_Node_Profile_node-101-profile_Interface_Profile_interface-101-1-29-profile_path_attachment" {
    depends_on                      = [
        aci_tenant.Tenant_infra,
        aci_logical_node_profile.Tenant_infra_L3Out_intersite_Node_Profile_node-101-profile,
        aci_logical_interface_profile.Tenant_infra_L3Out_intersite_Node_Profile_node-101-profile_Interface_Profile_interface-101-1-29-profile
    ]
    logical_interface_profile_dn    = aci_logical_interface_profile.Tenant_infra_L3Out_intersite_Node_Profile_node-101-profile_Interface_Profile_interface-101-1-29-profile.id
    target_dn                       = "topology/pod-1/paths-101/pathep-[eth1/29]"
    if_inst_t                       = "sub-interface"
    addr                            = "10.96.4.0/31"
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
 - Distinguished Name: "uni/tn-infra/out-intersite/lnodep-node-101-profile/lifp-interface-101-1-30-profile/rspathL3OutAtt-[topology/pod-1/paths-101/pathep-[eth1/30]]"
GUI Location:
 - Tenants > infra > Networking > L3Outs > intersite > Logical Node Profile > node-101-profile > Logical Interface Profiles interface-101-1-30-profile: Routed Sub-Interfaces

 - Assign all the default Policies to this Policy Group
*/
resource "aci_l3out_path_attachment" "Tenant_infra_L3Out_intersite_Node_Profile_node-101-profile_Interface_Profile_interface-101-1-30-profile_path_attachment" {
    depends_on                      = [
        aci_tenant.Tenant_infra,
        aci_logical_node_profile.Tenant_infra_L3Out_intersite_Node_Profile_node-101-profile,
        aci_logical_interface_profile.Tenant_infra_L3Out_intersite_Node_Profile_node-101-profile_Interface_Profile_interface-101-1-30-profile
    ]
    logical_interface_profile_dn    = aci_logical_interface_profile.Tenant_infra_L3Out_intersite_Node_Profile_node-101-profile_Interface_Profile_interface-101-1-30-profile.id
    target_dn                       = "topology/pod-1/paths-101/pathep-[eth1/30]"
    if_inst_t                       = "sub-interface"
    addr                            = "10.96.4.2/31"
    annotation                      = ""
    encap                           = "vlan-4"
    mode                            = "regular"
    encap_scope                     = "local"
    ipv6_dad                        = "enabled"
    mtu                             = "9150"
    target_dscp                     = "unspecified"
}

