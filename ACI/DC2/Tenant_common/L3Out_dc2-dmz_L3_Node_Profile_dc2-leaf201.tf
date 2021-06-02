#------------------------------------------------
# Create a Logical Node Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extLNodeP"
 - Distinguished Name: "/uni/tn-common/out-dc2-dmz_L3/lnodep-dc2-leaf201"
GUI Location:
Tenants > common > Networking > L3Outs > dc2-dmz_L3 > Logical Node Profile > dc2-leaf201
*/
resource "aci_logical_node_profile" "Tenant_common_L3Out_dc2-dmz_L3_Node_Profile_dc2-leaf201" {
    depends_on      = [
        aci_tenant.Tenant_common,
        aci_l3_outside.Tenant_common_L3Out_dc2-dmz_L3
    ]
    l3_outside_dn   = aci_l3_outside.Tenant_common_L3Out_dc2-dmz_L3.id
    description     = "dc2-leaf201 to Core"
    name            = "dc2-leaf201"
    target_dscp     = "unspecified"
}

#------------------------------------------------
# Assign a Node to a Logical Node Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extRsNodeL3OutAtt"
 - Distinguished Name: "/uni/tn-common/out-dc2-dmz_L3/lnodep-dc2-leaf201/rsnodeL3OutAtt-[topology/pod-1/node-201]"
GUI Location:
Tenants > common > Networking > L3Outs > dc2-dmz_L3 > Logical Node Profile > dc2-leaf201: Nodes > 201
*/
resource "aci_logical_node_to_fabric_node" "Tenant_common_L3Out_dc2-dmz_L3_Node_Profile_dc2-leaf201_201" {
    depends_on              = [
        aci_tenant.Tenant_common,
        aci_l3_outside.Tenant_common_L3Out_dc2-dmz_L3,
        aci_logical_node_profile.Tenant_common_L3Out_dc2-dmz_L3_Node_Profile_dc2-leaf201
    ]
    logical_node_profile_dn = aci_logical_node_profile.Tenant_common_L3Out_dc2-dmz_L3_Node_Profile_dc2-leaf201.id
    tdn                     = "topology/pod-1/node-201"
    rtr_id                  = "198.19.253.201"
    rtr_id_loop_back        = "yes"
}

#------------------------------------------------
# Create Logical Interface Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extLIfP"
 - Distinguished Name: "/uni/tn-common/out-dc2-dmz_L3/lnodep-"
GUI Location:
 - Tenants > common > Networking > L3Outs > dc2-dmz_L3 > Logical Node Profile > dc2-leaf201 > Logical Interface Profiles Eth1-48
*/
resource "aci_logical_interface_profile" "Tenant_common_L3Out_dc2-dmz_L3_Node_Profile_dc2-leaf201_Interface_Profile_Eth1-48" {
    depends_on                                      = [
        aci_tenant.Tenant_common,
        aci_l3_outside.Tenant_common_L3Out_dc2-dmz_L3,
        aci_logical_node_profile.Tenant_common_L3Out_dc2-dmz_L3_Node_Profile_dc2-leaf201
    ]
    logical_node_profile_dn                         = aci_logical_node_profile.Tenant_common_L3Out_dc2-dmz_L3_Node_Profile_dc2-leaf201.id
    description                                     = "dc2-leaf201-Eth1-48 to Core"
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
 - Distinguished Name: "uni/tn-common/out-dc2-dmz_L3/lnodep-dc2-leaf201/lifp-Eth1-48/rspathL3OutAtt-[topology/pod-1/paths-201/pathep-[eth1/48]]"
GUI Location:
 - Tenants > common > Networking > L3Outs > dc2-dmz_L3 > Logical Node Profile > dc2-leaf201 > Logical Interface Profiles Eth1-48: Routed Interfaces
 - Assign all the default Policies to this Policy Group
*/
resource "aci_l3out_path_attachment" "Tenant_common_L3Out_dc2-dmz_L3_Node_Profile_dc2-leaf201_Interface_Profile_Eth1-48_path_attachment" {
    depends_on                      = [
        aci_tenant.Tenant_common,
        aci_logical_node_profile.Tenant_common_L3Out_dc2-dmz_L3_Node_Profile_dc2-leaf201,
        aci_logical_interface_profile.Tenant_common_L3Out_dc2-dmz_L3_Node_Profile_dc2-leaf201_Interface_Profile_Eth1-48
    ]
    logical_interface_profile_dn    = aci_logical_interface_profile.Tenant_common_L3Out_dc2-dmz_L3_Node_Profile_dc2-leaf201_Interface_Profile_Eth1-48.id
    target_dn                       = "topology/pod-1/paths-201/pathep-[eth1/48]"
    if_inst_t                       = "l3-port"
    addr                            = "198.19.0.16/31"
    annotation                      = ""
    ipv6_dad                        = "enabled"
    mtu                             = "inherit"
    target_dscp                     = "unspecified"
}

