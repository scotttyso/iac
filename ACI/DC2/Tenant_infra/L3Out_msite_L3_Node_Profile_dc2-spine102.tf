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
resource "aci_logical_node_profile" "Tenant_infra_L3Out_msite_L3_Node_Profile_dc2-spine102" {
    depends_on      = [
        aci_tenant.Tenant_infra,
        aci_l3_outside.Tenant_infra_L3Out_msite_L3
    ]
    l3_outside_dn   = aci_l3_outside.Tenant_infra_L3Out_msite_L3.id
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
 - Distinguished Name: "/uni/tn-infra/out-msite_L3/lnodep-dc2-spine102/rsnodeL3OutAtt-[topology/pod-1/node-102]"
GUI Location:
Tenants > infra > Networking > L3Outs > msite_L3 > Logical Node Profile > dc2-spine102: Nodes > 102
*/
resource "aci_logical_node_to_fabric_node" "Tenant_infra_L3Out_msite_L3_Node_Profile_dc2-spine102_102" {
    depends_on              = [
        aci_tenant.Tenant_infra,
        aci_l3_outside.Tenant_infra_L3Out_msite_L3,
        aci_logical_node_profile.Tenant_infra_L3Out_msite_L3_Node_Profile_dc2-spine102
    ]
    logical_node_profile_dn = aci_logical_node_profile.Tenant_infra_L3Out_msite_L3_Node_Profile_dc2-spine102.id
    tdn                     = "topology/pod-1/node-102"
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
resource "aci_logical_interface_profile" "Tenant_infra_L3Out_msite_L3_Node_Profile_dc2-spine102_Interface_Profile_Eth1-01_4" {
    depends_on                                      = [
        aci_tenant.Tenant_infra,
        aci_l3_outside.Tenant_infra_L3Out_msite_L3,
        aci_logical_node_profile.Tenant_infra_L3Out_msite_L3_Node_Profile_dc2-spine102
    ]
    logical_node_profile_dn                         = aci_logical_node_profile.Tenant_infra_L3Out_msite_L3_Node_Profile_dc2-spine102.id
    description                                     = "dc2-spine102-Eth1-01.4 to InterSite"
    name                                            = "Eth1-01_4"
    prio                                            = ""
    tag                                             = "yellow-green"
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
resource "aci_l3out_ospf_interface_profile" "Tenant_infra_L3Out_msite_L3_Node_Profile_dc2-spine102_Interface_Profile_Eth1-01_4_OSPF_Profile" {
    depends_on                      = [
        aci_tenant.Tenant_infra,
        aci_l3_outside.Tenant_infra_L3Out_msite_L3,
        aci_logical_interface_profile.Tenant_infra_L3Out_msite_L3_Node_Profile_dc2-spine102_Interface_Profile_Eth1-01_4,
        data.aci_ospf_interface_policy.Tenant_common_Policy_OSPF_Interface_point-to-point,
    ]
    logical_interface_profile_dn    = aci_logical_interface_profile.Tenant_infra_L3Out_msite_L3_Node_Profile_dc2-spine102_Interface_Profile_Eth1-01_4.id
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
 - Distinguished Name: "/uni/tn-infra/out-msite_L3/lnodep-"
GUI Location:
 - Tenants > infra > Networking > L3Outs > msite_L3 > Logical Node Profile > dc2-spine102 > Logical Interface Profiles Eth1-02_4
*/
resource "aci_logical_interface_profile" "Tenant_infra_L3Out_msite_L3_Node_Profile_dc2-spine102_Interface_Profile_Eth1-02_4" {
    depends_on                                      = [
        aci_tenant.Tenant_infra,
        aci_l3_outside.Tenant_infra_L3Out_msite_L3,
        aci_logical_node_profile.Tenant_infra_L3Out_msite_L3_Node_Profile_dc2-spine102
    ]
    logical_node_profile_dn                         = aci_logical_node_profile.Tenant_infra_L3Out_msite_L3_Node_Profile_dc2-spine102.id
    description                                     = "dc2-spine102-Eth1-02.4 to InterSite"
    name                                            = "Eth1-02_4"
    prio                                            = ""
    tag                                             = "yellow-green"
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
resource "aci_l3out_ospf_interface_profile" "Tenant_infra_L3Out_msite_L3_Node_Profile_dc2-spine102_Interface_Profile_Eth1-02_4_OSPF_Profile" {
    depends_on                      = [
        aci_tenant.Tenant_infra,
        aci_l3_outside.Tenant_infra_L3Out_msite_L3,
        aci_logical_interface_profile.Tenant_infra_L3Out_msite_L3_Node_Profile_dc2-spine102_Interface_Profile_Eth1-02_4,
        data.aci_ospf_interface_policy.Tenant_common_Policy_OSPF_Interface_point-to-point,
    ]
    logical_interface_profile_dn    = aci_logical_interface_profile.Tenant_infra_L3Out_msite_L3_Node_Profile_dc2-spine102_Interface_Profile_Eth1-02_4.id
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
 - Distinguished Name: "uni/tn-infra/out-msite_L3/lnodep-dc2-spine102/lifp-Eth1-01_4/rspathL3OutAtt-[topology/pod-1/paths-102/pathep-[eth1/1]]"
GUI Location:
 - Tenants > infra > Networking > L3Outs > msite_L3 > Logical Node Profile > dc2-spine102 > Logical Interface Profiles Eth1-01_4: Routed Sub-Interfaces

 - Assign all the default Policies to this Policy Group
*/
resource "aci_l3out_path_attachment" "Tenant_infra_L3Out_msite_L3_Node_Profile_dc2-spine102_Interface_Profile_Eth1-01_4_path_attachment" {
    depends_on                      = [
        aci_tenant.Tenant_infra,
        aci_logical_node_profile.Tenant_infra_L3Out_msite_L3_Node_Profile_dc2-spine102,
        aci_logical_interface_profile.Tenant_infra_L3Out_msite_L3_Node_Profile_dc2-spine102_Interface_Profile_Eth1-01_4
    ]
    logical_interface_profile_dn    = aci_logical_interface_profile.Tenant_infra_L3Out_msite_L3_Node_Profile_dc2-spine102_Interface_Profile_Eth1-01_4.id
    target_dn                       = "topology/pod-1/paths-102/pathep-[eth1/1]"
    if_inst_t                       = "sub-interface"
    addr                            = "198.19.0.4/31"
    annotation                      = ""
    encap                           = "vlan-4"
    mode                            = "regular"
    encap_scope                     = "local"
    ipv6_dad                        = "enabled"
    mtu                             = "inherit"
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
resource "aci_l3out_path_attachment" "Tenant_infra_L3Out_msite_L3_Node_Profile_dc2-spine102_Interface_Profile_Eth1-02_4_path_attachment" {
    depends_on                      = [
        aci_tenant.Tenant_infra,
        aci_logical_node_profile.Tenant_infra_L3Out_msite_L3_Node_Profile_dc2-spine102,
        aci_logical_interface_profile.Tenant_infra_L3Out_msite_L3_Node_Profile_dc2-spine102_Interface_Profile_Eth1-02_4
    ]
    logical_interface_profile_dn    = aci_logical_interface_profile.Tenant_infra_L3Out_msite_L3_Node_Profile_dc2-spine102_Interface_Profile_Eth1-02_4.id
    target_dn                       = "topology/pod-1/paths-102/pathep-[eth1/2]"
    if_inst_t                       = "sub-interface"
    addr                            = "198.19.0.6/31"
    annotation                      = ""
    encap                           = "vlan-4"
    mode                            = "regular"
    encap_scope                     = "local"
    ipv6_dad                        = "enabled"
    mtu                             = "inherit"
    target_dscp                     = "unspecified"
}

