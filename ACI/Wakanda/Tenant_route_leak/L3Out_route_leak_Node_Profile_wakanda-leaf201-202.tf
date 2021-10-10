#------------------------------------------------
# Create a Logical Node Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extLNodeP"
 - Distinguished Name: "/uni/tn-route_leak/out-route_leak/lnodep-wakanda-leaf201-202"
GUI Location:
Tenants > route_leak > Networking > L3Outs > route_leak > Logical Node Profile > wakanda-leaf201-202
*/
resource "aci_logical_node_profile" "Tenant_route_leak_L3Out_route_leak_Node_Profile_wakanda-leaf201-202" {
    depends_on      = [
        aci_tenant.Tenant_route_leak,
        aci_l3_outside.Tenant_route_leak_L3Out_route_leak
    ]
    l3_outside_dn   = aci_l3_outside.Tenant_route_leak_L3Out_route_leak.id
    description     = "Wakanda route_leak LNP"
    name            = "wakanda-leaf201-202"
    target_dscp     = "unspecified"
}

#------------------------------------------------
# Assign a Node to a Logical Node Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extRsNodeL3OutAtt"
 - Distinguished Name: "/uni/tn-route_leak/out-route_leak/lnodep-wakanda-leaf201-202/rsnodeL3OutAtt-[topology/pod-1/node-201]"
GUI Location:
Tenants > route_leak > Networking > L3Outs > route_leak > Logical Node Profile > wakanda-leaf201-202: Nodes > 201
*/
resource "aci_logical_node_to_fabric_node" "Tenant_route_leak_L3Out_route_leak_Node_Profile_wakanda-leaf201-202_201" {
    depends_on              = [
        aci_tenant.Tenant_route_leak,
        aci_l3_outside.Tenant_route_leak_L3Out_route_leak,
        aci_logical_node_profile.Tenant_route_leak_L3Out_route_leak_Node_Profile_wakanda-leaf201-202
    ]
    logical_node_profile_dn = aci_logical_node_profile.Tenant_route_leak_L3Out_route_leak_Node_Profile_wakanda-leaf201-202.id
    tdn                     = "topology/pod-1/node-201"
    rtr_id                  = "10.96.5.201"
    rtr_id_loop_back        = "yes"
}

#------------------------------------------------
# Assign a Node to a Logical Node Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extRsNodeL3OutAtt"
 - Distinguished Name: "/uni/tn-route_leak/out-route_leak/lnodep-wakanda-leaf201-202/rsnodeL3OutAtt-[topology/pod-1/node-202]"
GUI Location:
Tenants > route_leak > Networking > L3Outs > route_leak > Logical Node Profile > wakanda-leaf201-202: Nodes > 202
*/
resource "aci_logical_node_to_fabric_node" "Tenant_route_leak_L3Out_route_leak_Node_Profile_wakanda-leaf201-202_202" {
    depends_on              = [
        aci_tenant.Tenant_route_leak,
        aci_l3_outside.Tenant_route_leak_L3Out_route_leak,
        aci_logical_node_profile.Tenant_route_leak_L3Out_route_leak_Node_Profile_wakanda-leaf201-202
    ]
    logical_node_profile_dn = aci_logical_node_profile.Tenant_route_leak_L3Out_route_leak_Node_Profile_wakanda-leaf201-202.id
    tdn                     = "topology/pod-1/node-202"
    rtr_id                  = "10.96.5.202"
    rtr_id_loop_back        = "yes"
}

#------------------------------------------------
# Create Logical Interface Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extLIfP"
 - Distinguished Name: "/uni/tn-route_leak/out-route_leak/lnodep-"
GUI Location:
 - Tenants > route_leak > Networking > L3Outs > route_leak > Logical Node Profile > wakanda-leaf201-202 > Logical Interface Profiles Vlan2005
*/
resource "aci_logical_interface_profile" "Tenant_route_leak_L3Out_route_leak_Node_Profile_wakanda-leaf201-202_Interface_Profile_Vlan2005" {
    depends_on                                      = [
        aci_tenant.Tenant_route_leak,
        aci_l3_outside.Tenant_route_leak_L3Out_route_leak,
        aci_logical_node_profile.Tenant_route_leak_L3Out_route_leak_Node_Profile_wakanda-leaf201-202
    ]
    logical_node_profile_dn                         = aci_logical_node_profile.Tenant_route_leak_L3Out_route_leak_Node_Profile_wakanda-leaf201-202.id
    description                                     = "route_leak Vlan2005"
    name                                            = "Vlan2005"
    prio                                            = ""
    tag                                             = "yellow-green"
}

#-------------------------------------------------------------
# Attach a Node Interface Path to a Logical Interface Profile
#-------------------------------------------------------------

/*
API Information:
 - Class: "l3extRsPathL3OutAtt"
 - Distinguished Name: "uni/tn-route_leak/out-route_leak/lnodep-wakanda-leaf201-202/lifp-Vlan2005/rspathL3OutAtt-[topology/pod-1/protpaths-201-202/pathep-[wakanda-leaf201-202_vpc49]]"
GUI Location:
 - Tenants > route_leak > Networking > L3Outs > route_leak > Logical Node Profile > wakanda-leaf201-202 > Logical Interface Profiles Vlan2005: SVI
 - Assign all the default Policies to this Policy Group
*/
resource "aci_l3out_path_attachment" "Tenant_route_leak_L3Out_route_leak_Node_Profile_wakanda-leaf201-202_Interface_Profile_Vlan2005_path_attachment" {
    depends_on                      = [
        aci_tenant.Tenant_route_leak,
        aci_logical_node_profile.Tenant_route_leak_L3Out_route_leak_Node_Profile_wakanda-leaf201-202,
        aci_logical_interface_profile.Tenant_route_leak_L3Out_route_leak_Node_Profile_wakanda-leaf201-202_Interface_Profile_Vlan2005
    ]
    logical_interface_profile_dn    = aci_logical_interface_profile.Tenant_route_leak_L3Out_route_leak_Node_Profile_wakanda-leaf201-202_Interface_Profile_Vlan2005.id
    target_dn                       = "topology/pod-1/protpaths-201-202/pathep-[wakanda-leaf201-202_vpc49]"
    if_inst_t                       = "ext-svi"
    annotation                      = ""
    autostate                       = "disabled"
    encap                           = "vlan-2005"
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
 - Distinguished Name: " uni/tn-route_leak/out-route_leak/lnodep-wakanda-leaf201-202/lifp-Vlan2005/rspathL3OutAtt-[topology/pod-1/protpaths-201-202//pathep-[wakanda-leaf201-202_vpc49]]/mem-A"
GUI Location:
 - Tenants > route_leak > Networking > L3Outs > route_leak > Logical Node Profile > wakanda-leaf201-202 > Logical Interface Profiles Vlan2005: SVI
*/

resource "aci_l3out_vpc_member" "Tenant_route_leak_L3Out_route_leak_Node_Profile_wakanda-leaf201-202_Interface_Profile_Vlan2005_vpc_side_A" {
    depends_on      = [
        aci_tenant.Tenant_route_leak,
        aci_logical_node_profile.Tenant_route_leak_L3Out_route_leak_Node_Profile_wakanda-leaf201-202,
        aci_logical_interface_profile.Tenant_route_leak_L3Out_route_leak_Node_Profile_wakanda-leaf201-202_Interface_Profile_Vlan2005,
        aci_l3out_path_attachment.Tenant_route_leak_L3Out_route_leak_Node_Profile_wakanda-leaf201-202_Interface_Profile_Vlan2005_path_attachment
    ]
    addr            = "10.96.5.1/29"
    description     = "wakanda-leaf201-202-v2005 to 143-core01-02-vpc"
    ipv6_dad        = "enabled"
    leaf_port_dn    = aci_l3out_path_attachment.Tenant_route_leak_L3Out_route_leak_Node_Profile_wakanda-leaf201-202_Interface_Profile_Vlan2005_path_attachment.id
    side            = "A"
}

#-------------------------------------------------------------
# Attach a Node Interface Path to a Logical Interface Profile
#-------------------------------------------------------------

/*
API Information:
 - Class: "l3extRsPathL3OutAtt"
 - Distinguished Name: " uni/tn-route_leak/out-route_leak/lnodep-wakanda-leaf201-202/lifp-Vlan2005/rspathL3OutAtt-[topology/pod-1/protpaths-201-202//pathep-[wakanda-leaf201-202_vpc49]]/mem-B"
GUI Location:
 - Tenants > route_leak > Networking > L3Outs > route_leak > Logical Node Profile > wakanda-leaf201-202 > Logical Interface Profiles Vlan2005: SVI
*/

resource "aci_l3out_vpc_member" "Tenant_route_leak_L3Out_route_leak_Node_Profile_wakanda-leaf201-202_Interface_Profile_Vlan2005_vpc_side_B" {
    depends_on      = [
        aci_tenant.Tenant_route_leak,
        aci_logical_node_profile.Tenant_route_leak_L3Out_route_leak_Node_Profile_wakanda-leaf201-202,
        aci_logical_interface_profile.Tenant_route_leak_L3Out_route_leak_Node_Profile_wakanda-leaf201-202_Interface_Profile_Vlan2005,
        aci_l3out_path_attachment.Tenant_route_leak_L3Out_route_leak_Node_Profile_wakanda-leaf201-202_Interface_Profile_Vlan2005_path_attachment
    ]
    addr            = "10.96.5.2/29"
    description     = "wakanda-leaf201-202-v2005 to 143-core01-02-vpc"
    ipv6_dad        = "enabled"
    leaf_port_dn    = aci_l3out_path_attachment.Tenant_route_leak_L3Out_route_leak_Node_Profile_wakanda-leaf201-202_Interface_Profile_Vlan2005_path_attachment.id
    side            = "B"
}

#------------------------------------------------
# Create a BGP Peer Connectivity Profile
#------------------------------------------------

/*
API Information:
 - Class: "bgpPeerP"
 - Distinguished Name: "uni/tn-route_leak/out-route_leak/lnodep-wakanda-leaf201-202/lifp-Vlan2005/rspathL3OutAtt-[topology/pod-1/protpaths-201-202/pathep-[wakanda-leaf201-202_vpc49]]/peerP-[]"
GUI Location:
 - Tenants > route_leak > Networking > L3Outs > route_leak > Logical Node Profile wakanda-leaf201-202 > Logical Interface Profile > Vlan2005 > OSPF Interface Profile
*/
resource "aci_rest" "route_leak_l3out_route_leak_nodep_wakanda-leaf201-202_bgp-peer_10-96-5-3" {
    depends_on  = [
        aci_tenant.Tenant_route_leak,
        aci_l3_outside.Tenant_route_leak_L3Out_route_leak,
        aci_logical_node_profile.Tenant_route_leak_L3Out_route_leak_Node_Profile_wakanda-leaf201-202,
        aci_logical_interface_profile.Tenant_route_leak_L3Out_route_leak_Node_Profile_wakanda-leaf201-202_Interface_Profile_Vlan2005,
        data.aci_tenant.Tenant_common,
        data.aci_bgp_peer_prefix.Tenant_common_Policy_BGP_Prefix_default
    ]
    path        = "/api/node/mo/uni/tn-route_leak/out-route_leak/lnodep-wakanda-leaf201-202/lifp-Vlan2005/rspathL3OutAtt-[topology/pod-1/protpaths-201-202/pathep-[wakanda-leaf201-202_vpc49]]/peerP-[10.96.5.3].json"
    class_name  = "fabricPodPGrp"
    payload     = <<EOF
{
	"bgpPeerP": {
		"attributes": {
			"dn": "uni/tn-route_leak/out-route_leak/lnodep-wakanda-leaf201-202/lifp-Vlan2005/rspathL3OutAtt-[topology/pod-1/protpaths-201-202/pathep-[wakanda-leaf201-202_vpc49]]/peerP-[10.96.5.3]",
			"addr": "10.96.5.3",
			"addrTCtrl": "af-ucast",
			"adminSt": "enabled",
			"allowedSelfAsCnt": "3",
			"ctrl": "send-com,send-ext-com",
            "descr": "143b-core01",
			"peerCtrl": "bfd",
			"privateASctrl": "",
			"ttl": "1",
			"weight": "0"
		},
		"children": [
			{
				"bgpAsP": {
					"attributes": {
						"dn": "uni/tn-route_leak/out-route_leak/lnodep-wakanda-leaf201-202/lifp-Vlan2005/rspathL3OutAtt-[topology/pod-1/protpaths-201-202/pathep-[wakanda-leaf201-202_vpc49]]/peerP-[10.96.5.3]/as",
						"asn": "64701"
					},
					"children": []
				}
            },
			{
				"bgpRsPeerPfxPol": {
					"attributes": {
						"dn": "uni/tn-route_leak/out-route_leak/lnodep-wakanda-leaf201-202/lifp-Vlan2005/rspathL3OutAtt-[topology/pod-1/protpaths-201-202/pathep-[wakanda-leaf201-202_vpc49]]/peerP-[10.96.5.3]/rspeerPfxPol",
						"tnBgpPeerPfxPolName": "default"
					},
					"children": []
				}
			}
		]
	}
}
    EOF
}

#------------------------------------------------
# Create a BGP Peer Connectivity Profile
#------------------------------------------------

/*
API Information:
 - Class: "bgpPeerP"
 - Distinguished Name: "uni/tn-route_leak/out-route_leak/lnodep-wakanda-leaf201-202/lifp-Vlan2005/rspathL3OutAtt-[topology/pod-1/protpaths-201-202/pathep-[wakanda-leaf201-202_vpc49]]/peerP-[]"
GUI Location:
 - Tenants > route_leak > Networking > L3Outs > route_leak > Logical Node Profile wakanda-leaf201-202 > Logical Interface Profile > Vlan2005 > OSPF Interface Profile
*/
resource "aci_rest" "route_leak_l3out_route_leak_nodep_wakanda-leaf201-202_bgp-peer_10-96-5-4" {
    depends_on  = [
        aci_tenant.Tenant_route_leak,
        aci_l3_outside.Tenant_route_leak_L3Out_route_leak,
        aci_logical_node_profile.Tenant_route_leak_L3Out_route_leak_Node_Profile_wakanda-leaf201-202,
        aci_logical_interface_profile.Tenant_route_leak_L3Out_route_leak_Node_Profile_wakanda-leaf201-202_Interface_Profile_Vlan2005,
        data.aci_tenant.Tenant_common,
        data.aci_bgp_peer_prefix.Tenant_common_Policy_BGP_Prefix_default
    ]
    path        = "/api/node/mo/uni/tn-route_leak/out-route_leak/lnodep-wakanda-leaf201-202/lifp-Vlan2005/rspathL3OutAtt-[topology/pod-1/protpaths-201-202/pathep-[wakanda-leaf201-202_vpc49]]/peerP-[10.96.5.4].json"
    class_name  = "fabricPodPGrp"
    payload     = <<EOF
{
	"bgpPeerP": {
		"attributes": {
			"dn": "uni/tn-route_leak/out-route_leak/lnodep-wakanda-leaf201-202/lifp-Vlan2005/rspathL3OutAtt-[topology/pod-1/protpaths-201-202/pathep-[wakanda-leaf201-202_vpc49]]/peerP-[10.96.5.4]",
			"addr": "10.96.5.4",
			"addrTCtrl": "af-ucast",
			"adminSt": "enabled",
			"allowedSelfAsCnt": "3",
			"ctrl": "send-com,send-ext-com",
            "descr": "143c-core02",
			"peerCtrl": "bfd",
			"privateASctrl": "",
			"ttl": "1",
			"weight": "0"
		},
		"children": [
			{
				"bgpAsP": {
					"attributes": {
						"dn": "uni/tn-route_leak/out-route_leak/lnodep-wakanda-leaf201-202/lifp-Vlan2005/rspathL3OutAtt-[topology/pod-1/protpaths-201-202/pathep-[wakanda-leaf201-202_vpc49]]/peerP-[10.96.5.4]/as",
						"asn": "64701"
					},
					"children": []
				}
            },
			{
				"bgpRsPeerPfxPol": {
					"attributes": {
						"dn": "uni/tn-route_leak/out-route_leak/lnodep-wakanda-leaf201-202/lifp-Vlan2005/rspathL3OutAtt-[topology/pod-1/protpaths-201-202/pathep-[wakanda-leaf201-202_vpc49]]/peerP-[10.96.5.4]/rspeerPfxPol",
						"tnBgpPeerPfxPolName": "default"
					},
					"children": []
				}
			}
		]
	}
}
    EOF
}
