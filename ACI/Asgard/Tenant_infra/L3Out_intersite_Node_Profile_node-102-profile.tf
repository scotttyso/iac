#------------------------------------------------
# Create a Logical Node Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extLNodeP"
 - Distinguished Name: "/uni/tn-infra/out-intersite/lnodep-node-102-profile"
GUI Location:
Tenants > infra > Networking > L3Outs > intersite > Logical Node Profile > node-102-profile
*/
resource "aci_logical_node_profile" "Tenant_infra_L3Out_intersite_Node_Profile_node-102-profile" {
    depends_on      = [
        aci_tenant.Tenant_infra,
        aci_l3_outside.Tenant_infra_L3Out_intersite
    ]
    l3_outside_dn   = aci_l3_outside.Tenant_infra_L3Out_intersite.id
    description     = "Multi-Site Connectivity"
    name            = "node-102-profile"
    target_dscp     = "unspecified"
}

#------------------------------------------------
# Assign a Node to a Logical Node Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extRsNodeL3OutAtt"
 - Distinguished Name: "/uni/tn-infra/out-intersite/lnodep-node-102-profile/rsnodeL3OutAtt-[topology/pod-1/node-102]"
GUI Location:
Tenants > infra > Networking > L3Outs > intersite > Logical Node Profile > node-102-profile: Nodes > 102
*/
resource "aci_logical_node_to_fabric_node" "Tenant_infra_L3Out_intersite_Node_Profile_node-102-profile_102" {
    depends_on              = [
        aci_tenant.Tenant_infra,
        aci_l3_outside.Tenant_infra_L3Out_intersite,
        aci_logical_node_profile.Tenant_infra_L3Out_intersite_Node_Profile_node-102-profile
    ]
    logical_node_profile_dn = aci_logical_node_profile.Tenant_infra_L3Out_intersite_Node_Profile_node-102-profile.id
    tdn                     = "topology/pod-1/node-102"
    rtr_id                  = "10.92.4.102"
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
 - Tenants > infra > Networking > L3Outs > intersite > Logical Node Profile > node-102-profile > Logical Interface Profiles interface-102-1-29-profile
*/
resource "aci_logical_interface_profile" "Tenant_infra_L3Out_intersite_Node_Profile_node-102-profile_Interface_Profile_interface-102-1-29-profile" {
    depends_on                                      = [
        aci_tenant.Tenant_infra,
        aci_l3_outside.Tenant_infra_L3Out_intersite,
        aci_logical_node_profile.Tenant_infra_L3Out_intersite_Node_Profile_node-102-profile
    ]
    logical_node_profile_dn                         = aci_logical_node_profile.Tenant_infra_L3Out_intersite_Node_Profile_node-102-profile.id
    description                                     = "asgard-spine102-Eth1-29.4 to Multi-Site Core"
    name                                            = "interface-102-1-29-profile"
    prio                                            = ""
    tag                                             = "yellow-green"
}

#------------------------------------------------
# Assign a OSPF Routing Policy to the L3Out
#------------------------------------------------

/*
API Information:
 - Class: "ospfIfP"
 - Distinguished Name: "/uni/tn-infra/out-intersite/nodep-node-102-profile/lifp-interface-102-1-29-profile/ospfIfP"
GUI Location:
 - Tenants > infra > Networking > L3Outs > intersite > Logical Node Profile node-102-profile > Logical Interface Profile > interface-102-1-29-profile > OSPF Interface Profile
*/
resource "aci_l3out_ospf_interface_profile" "Tenant_infra_L3Out_intersite_Node_Profile_node-102-profile_Interface_Profile_interface-102-1-29-profile_OSPF_Profile" {
    depends_on                      = [
        aci_tenant.Tenant_infra,
        aci_l3_outside.Tenant_infra_L3Out_intersite,
        aci_logical_interface_profile.Tenant_infra_L3Out_intersite_Node_Profile_node-102-profile_Interface_Profile_interface-102-1-29-profile,
        data.aci_ospf_interface_policy.Tenant_common_Policy_OSPF_Interface_point-to-point,
    ]
    logical_interface_profile_dn    = aci_logical_interface_profile.Tenant_infra_L3Out_intersite_Node_Profile_node-102-profile_Interface_Profile_interface-102-1-29-profile.id
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
 - Tenants > infra > Networking > L3Outs > intersite > Logical Node Profile > node-102-profile > Logical Interface Profiles interface-102-1-30-profile
*/
resource "aci_logical_interface_profile" "Tenant_infra_L3Out_intersite_Node_Profile_node-102-profile_Interface_Profile_interface-102-1-30-profile" {
    depends_on                                      = [
        aci_tenant.Tenant_infra,
        aci_l3_outside.Tenant_infra_L3Out_intersite,
        aci_logical_node_profile.Tenant_infra_L3Out_intersite_Node_Profile_node-102-profile
    ]
    logical_node_profile_dn                         = aci_logical_node_profile.Tenant_infra_L3Out_intersite_Node_Profile_node-102-profile.id
    description                                     = "asgard-spine102-Eth1-30.4 to Multi-Site Core"
    name                                            = "interface-102-1-30-profile"
    prio                                            = ""
    tag                                             = "yellow-green"
}

#------------------------------------------------
# Assign a OSPF Routing Policy to the L3Out
#------------------------------------------------

/*
API Information:
 - Class: "ospfIfP"
 - Distinguished Name: "/uni/tn-infra/out-intersite/nodep-node-102-profile/lifp-interface-102-1-30-profile/ospfIfP"
GUI Location:
 - Tenants > infra > Networking > L3Outs > intersite > Logical Node Profile node-102-profile > Logical Interface Profile > interface-102-1-30-profile > OSPF Interface Profile
*/
resource "aci_l3out_ospf_interface_profile" "Tenant_infra_L3Out_intersite_Node_Profile_node-102-profile_Interface_Profile_interface-102-1-30-profile_OSPF_Profile" {
    depends_on                      = [
        aci_tenant.Tenant_infra,
        aci_l3_outside.Tenant_infra_L3Out_intersite,
        aci_logical_interface_profile.Tenant_infra_L3Out_intersite_Node_Profile_node-102-profile_Interface_Profile_interface-102-1-30-profile,
        data.aci_ospf_interface_policy.Tenant_common_Policy_OSPF_Interface_point-to-point,
    ]
    logical_interface_profile_dn    = aci_logical_interface_profile.Tenant_infra_L3Out_intersite_Node_Profile_node-102-profile_Interface_Profile_interface-102-1-30-profile.id
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
 - Distinguished Name: "uni/tn-infra/out-intersite/lnodep-node-102-profile/lifp-interface-102-1-29-profile/rspathL3OutAtt-[topology/pod-1/paths-102/pathep-[eth1/29]]"
GUI Location:
 - Tenants > infra > Networking > L3Outs > intersite > Logical Node Profile > node-102-profile > Logical Interface Profiles interface-102-1-29-profile: Routed Sub-Interfaces

 - Assign all the default Policies to this Policy Group
*/
resource "aci_l3out_path_attachment" "Tenant_infra_L3Out_intersite_Node_Profile_node-102-profile_Interface_Profile_interface-102-1-29-profile_path_attachment" {
    depends_on                      = [
        aci_tenant.Tenant_infra,
        aci_logical_node_profile.Tenant_infra_L3Out_intersite_Node_Profile_node-102-profile,
        aci_logical_interface_profile.Tenant_infra_L3Out_intersite_Node_Profile_node-102-profile_Interface_Profile_interface-102-1-29-profile
    ]
    logical_interface_profile_dn    = aci_logical_interface_profile.Tenant_infra_L3Out_intersite_Node_Profile_node-102-profile_Interface_Profile_interface-102-1-29-profile.id
    target_dn                       = "topology/pod-1/paths-102/pathep-[eth1/29]"
    if_inst_t                       = "sub-interface"
    addr                            = "10.92.4.4/31"
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
 - Distinguished Name: "uni/tn-infra/out-intersite/lnodep-node-102-profile/lifp-interface-102-1-30-profile/rspathL3OutAtt-[topology/pod-1/paths-102/pathep-[eth1/30]]"
GUI Location:
 - Tenants > infra > Networking > L3Outs > intersite > Logical Node Profile > node-102-profile > Logical Interface Profiles interface-102-1-30-profile: Routed Sub-Interfaces

 - Assign all the default Policies to this Policy Group
*/
resource "aci_l3out_path_attachment" "Tenant_infra_L3Out_intersite_Node_Profile_node-102-profile_Interface_Profile_interface-102-1-30-profile_path_attachment" {
    depends_on                      = [
        aci_tenant.Tenant_infra,
        aci_logical_node_profile.Tenant_infra_L3Out_intersite_Node_Profile_node-102-profile,
        aci_logical_interface_profile.Tenant_infra_L3Out_intersite_Node_Profile_node-102-profile_Interface_Profile_interface-102-1-30-profile
    ]
    logical_interface_profile_dn    = aci_logical_interface_profile.Tenant_infra_L3Out_intersite_Node_Profile_node-102-profile_Interface_Profile_interface-102-1-30-profile.id
    target_dn                       = "topology/pod-1/paths-102/pathep-[eth1/30]"
    if_inst_t                       = "sub-interface"
    addr                            = "10.92.4.6/31"
    annotation                      = ""
    encap                           = "vlan-4"
    mode                            = "regular"
    encap_scope                     = "local"
    ipv6_dad                        = "enabled"
    mtu                             = "9150"
    target_dscp                     = "unspecified"
}

