#------------------------------------------------
# Create a Logical Node Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extLNodeP"
 - Distinguished Name: "/uni/tn-common/out-dc1-dmz_L3/lnodep-dc1-leaf202"
GUI Location:
Tenants > common > Networking > L3Outs > dc1-dmz_L3 > Logical Node Profile > dc1-leaf202
*/
resource "aci_logical_node_profile" "Tenant_common_L3Out_dc1-dmz_L3_Node_Profile_dc1-leaf202" {
    depends_on      = [
        aci_tenant.Tenant_common,
        aci_l3_outside.Tenant_common_L3Out_dc1-dmz_L3
    ]
    l3_outside_dn   = aci_l3_outside.Tenant_common_L3Out_dc1-dmz_L3.id
    description     = "dc1-leaf202 to Core"
    name            = "dc1-leaf202"
    target_dscp     = "unspecified"
}

#------------------------------------------------
# Assign a Node to a Logical Node Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extRsNodeL3OutAtt"
 - Distinguished Name: "/uni/tn-common/out-dc1-dmz_L3/lnodep-dc1-leaf202/rsnodeL3OutAtt-[topology/pod-1/node-202]"
GUI Location:
Tenants > common > Networking > L3Outs > dc1-dmz_L3 > Logical Node Profile > dc1-leaf202: Nodes > 202
*/
resource "aci_logical_node_to_fabric_node" "Tenant_common_L3Out_dc1-dmz_L3_Node_Profile_dc1-leaf202_202" {
    depends_on              = [
        aci_tenant.Tenant_common,
        aci_l3_outside.Tenant_common_L3Out_dc1-dmz_L3,
        aci_logical_node_profile.Tenant_common_L3Out_dc1-dmz_L3_Node_Profile_dc1-leaf202
    ]
    logical_node_profile_dn = aci_logical_node_profile.Tenant_common_L3Out_dc1-dmz_L3_Node_Profile_dc1-leaf202.id
    tdn                     = "topology/pod-1/node-202"
    rtr_id                  = "198.18.253.202"
    rtr_id_loop_back        = "yes"
}

#------------------------------------------------
# Create Logical Interface Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extLIfP"
 - Distinguished Name: "/uni/tn-common/out-dc1-dmz_L3/lnodep-"
GUI Location:
 - Tenants > common > Networking > L3Outs > dc1-dmz_L3 > Logical Node Profile > dc1-leaf202 > Logical Interface Profiles Eth1-48
*/
resource "aci_logical_interface_profile" "Tenant_common_L3Out_dc1-dmz_L3_Node_Profile_dc1-leaf202_Interface_Profile_Eth1-48" {
    depends_on                                      = [
        aci_tenant.Tenant_common,
        aci_l3_outside.Tenant_common_L3Out_dc1-dmz_L3,
        aci_logical_node_profile.Tenant_common_L3Out_dc1-dmz_L3_Node_Profile_dc1-leaf202
    ]
    logical_node_profile_dn                         = aci_logical_node_profile.Tenant_common_L3Out_dc1-dmz_L3_Node_Profile_dc1-leaf202.id
    description                                     = "dc1-leaf202-Eth1-48 to Core"
    name                                            = "Eth1-48"
    prio                                            = ""
    tag                                             = "yellow-green"
}

#-------------------------------------------------------------
# Attach a Node Interface Path to a Logical Interface Profile
#-------------------------------------------------------------

/*
API Information:
 - Class: "l3extRsPathL3OutAtt"
 - Distinguished Name: "uni/tn-common/out-dc1-dmz_L3/lnodep-dc1-leaf202/lifp-Eth1-48/rspathL3OutAtt-[topology/pod-1/paths-202/pathep-[eth1/48]]"
GUI Location:
 - Tenants > common > Networking > L3Outs > dc1-dmz_L3 > Logical Node Profile > dc1-leaf202 > Logical Interface Profiles Eth1-48: Routed Interfaces
 - Assign all the default Policies to this Policy Group
*/
resource "aci_l3out_path_attachment" "Tenant_common_L3Out_dc1-dmz_L3_Node_Profile_dc1-leaf202_Interface_Profile_Eth1-48_path_attachment" {
    depends_on                      = [
        aci_tenant.Tenant_common,
        aci_logical_node_profile.Tenant_common_L3Out_dc1-dmz_L3_Node_Profile_dc1-leaf202,
        aci_logical_interface_profile.Tenant_common_L3Out_dc1-dmz_L3_Node_Profile_dc1-leaf202_Interface_Profile_Eth1-48
    ]
    logical_interface_profile_dn    = aci_logical_interface_profile.Tenant_common_L3Out_dc1-dmz_L3_Node_Profile_dc1-leaf202_Interface_Profile_Eth1-48.id
    target_dn                       = "topology/pod-1/paths-202/pathep-[eth1/48]"
    if_inst_t                       = "l3-port"
    addr                            = "198.18.0.18/31"
    annotation                      = ""
    ipv6_dad                        = "enabled"
    mtu                             = "inherit"
    target_dscp                     = "unspecified"
}

