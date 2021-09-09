#------------------------------------------------
# Create a Logical Node Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extLNodeP"
 - Distinguished Name: "/uni/tn-common/out-wakanda-dmz/lnodep-wakanda-leaf201-202"
GUI Location:
Tenants > common > Networking > L3Outs > wakanda-dmz > Logical Node Profile > wakanda-leaf201-202
*/
resource "aci_logical_node_profile" "Tenant_common_L3Out_wakanda-dmz_Node_Profile_wakanda-leaf201-202" {
    depends_on      = [
        aci_tenant.Tenant_common,
        aci_l3_outside.Tenant_common_L3Out_wakanda-dmz
    ]
    l3_outside_dn   = aci_l3_outside.Tenant_common_L3Out_wakanda-dmz.id
    description     = "Wakanda DMZ LNP"
    name            = "wakanda-leaf201-202"
    target_dscp     = "unspecified"
}

#------------------------------------------------
# Assign a Node to a Logical Node Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extRsNodeL3OutAtt"
 - Distinguished Name: "/uni/tn-common/out-wakanda-dmz/lnodep-wakanda-leaf201-202/rsnodeL3OutAtt-[topology/pod-1/node-201]"
GUI Location:
Tenants > common > Networking > L3Outs > wakanda-dmz > Logical Node Profile > wakanda-leaf201-202: Nodes > 201
*/
resource "aci_logical_node_to_fabric_node" "Tenant_common_L3Out_wakanda-dmz_Node_Profile_wakanda-leaf201-202_201" {
    depends_on              = [
        aci_tenant.Tenant_common,
        aci_l3_outside.Tenant_common_L3Out_wakanda-dmz,
        aci_logical_node_profile.Tenant_common_L3Out_wakanda-dmz_Node_Profile_wakanda-leaf201-202
    ]
    logical_node_profile_dn = aci_logical_node_profile.Tenant_common_L3Out_wakanda-dmz_Node_Profile_wakanda-leaf201-202.id
    tdn                     = "topology/pod-1/node-201"
    rtr_id                  = "10.96.2.201"
    rtr_id_loop_back        = "yes"
}

#------------------------------------------------
# Assign a Node to a Logical Node Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extRsNodeL3OutAtt"
 - Distinguished Name: "/uni/tn-common/out-wakanda-dmz/lnodep-wakanda-leaf201-202/rsnodeL3OutAtt-[topology/pod-1/node-202]"
GUI Location:
Tenants > common > Networking > L3Outs > wakanda-dmz > Logical Node Profile > wakanda-leaf201-202: Nodes > 202
*/
resource "aci_logical_node_to_fabric_node" "Tenant_common_L3Out_wakanda-dmz_Node_Profile_wakanda-leaf201-202_202" {
    depends_on              = [
        aci_tenant.Tenant_common,
        aci_l3_outside.Tenant_common_L3Out_wakanda-dmz,
        aci_logical_node_profile.Tenant_common_L3Out_wakanda-dmz_Node_Profile_wakanda-leaf201-202
    ]
    logical_node_profile_dn = aci_logical_node_profile.Tenant_common_L3Out_wakanda-dmz_Node_Profile_wakanda-leaf201-202.id
    tdn                     = "topology/pod-1/node-202"
    rtr_id                  = "10.96.2.202"
    rtr_id_loop_back        = "yes"
}

#------------------------------------------------
# Create Logical Interface Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extLIfP"
 - Distinguished Name: "/uni/tn-common/out-wakanda-dmz/lnodep-"
GUI Location:
 - Tenants > common > Networking > L3Outs > wakanda-dmz > Logical Node Profile > wakanda-leaf201-202 > Logical Interface Profiles Vlan2002
*/
resource "aci_logical_interface_profile" "Tenant_common_L3Out_wakanda-dmz_Node_Profile_wakanda-leaf201-202_Interface_Profile_Vlan2002" {
    depends_on                                      = [
        aci_tenant.Tenant_common,
        aci_l3_outside.Tenant_common_L3Out_wakanda-dmz,
        aci_logical_node_profile.Tenant_common_L3Out_wakanda-dmz_Node_Profile_wakanda-leaf201-202
    ]
    logical_node_profile_dn                         = aci_logical_node_profile.Tenant_common_L3Out_wakanda-dmz_Node_Profile_wakanda-leaf201-202.id
    description                                     = "DMZ Vlan2002"
    name                                            = "Vlan2002"
    prio                                            = ""
    tag                                             = "yellow-green"
}

#-------------------------------------------------------------
# Attach a Node Interface Path to a Logical Interface Profile
#-------------------------------------------------------------

/*
API Information:
 - Class: "l3extRsPathL3OutAtt"
 - Distinguished Name: "uni/tn-common/out-wakanda-dmz/lnodep-wakanda-leaf201-202/lifp-Vlan2002/rspathL3OutAtt-[topology/pod-1/protpaths-201-202/pathep-[wakanda-leaf201-202_vpc49]]"
GUI Location:
 - Tenants > common > Networking > L3Outs > wakanda-dmz > Logical Node Profile > wakanda-leaf201-202 > Logical Interface Profiles Vlan2002: SVI
 - Assign all the default Policies to this Policy Group
*/
resource "aci_l3out_path_attachment" "Tenant_common_L3Out_wakanda-dmz_Node_Profile_wakanda-leaf201-202_Interface_Profile_Vlan2002_path_attachment" {
    depends_on                      = [
        aci_tenant.Tenant_common,
        aci_logical_node_profile.Tenant_common_L3Out_wakanda-dmz_Node_Profile_wakanda-leaf201-202,
        aci_logical_interface_profile.Tenant_common_L3Out_wakanda-dmz_Node_Profile_wakanda-leaf201-202_Interface_Profile_Vlan2002
    ]
    logical_interface_profile_dn    = aci_logical_interface_profile.Tenant_common_L3Out_wakanda-dmz_Node_Profile_wakanda-leaf201-202_Interface_Profile_Vlan2002.id
    target_dn                       = "topology/pod-1/protpaths-201-202/pathep-[wakanda-leaf201-202_vpc49]"
    if_inst_t                       = "ext-svi"
    annotation                      = ""
    autostate                       = "disabled"
    encap                           = "vlan-2002"
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
 - Distinguished Name: " uni/tn-common/out-wakanda-dmz/lnodep-wakanda-leaf201-202/lifp-Vlan2002/rspathL3OutAtt-[topology/pod-1/protpaths-201-202//pathep-[wakanda-leaf201-202_vpc49]]/mem-A"
GUI Location:
 - Tenants > common > Networking > L3Outs > wakanda-dmz > Logical Node Profile > wakanda-leaf201-202 > Logical Interface Profiles Vlan2002: SVI
*/

resource "aci_l3out_vpc_member" "Tenant_common_L3Out_wakanda-dmz_Node_Profile_wakanda-leaf201-202_Interface_Profile_Vlan2002_vpc_side_A" {
    depends_on      = [
        aci_tenant.Tenant_common,
        aci_logical_node_profile.Tenant_common_L3Out_wakanda-dmz_Node_Profile_wakanda-leaf201-202,
        aci_logical_interface_profile.Tenant_common_L3Out_wakanda-dmz_Node_Profile_wakanda-leaf201-202_Interface_Profile_Vlan2002,
        aci_l3out_path_attachment.Tenant_common_L3Out_wakanda-dmz_Node_Profile_wakanda-leaf201-202_Interface_Profile_Vlan2002_path_attachment
    ]
    addr            = "10.96.2.1/29"
    description     = "wakanda-leaf201-202-v2002 to 143-core01-02-vpc"
    ipv6_dad        = "enabled"
    leaf_port_dn    = aci_l3out_path_attachment.Tenant_common_L3Out_wakanda-dmz_Node_Profile_wakanda-leaf201-202_Interface_Profile_Vlan2002_path_attachment.id
    side            = "A"
}

#-------------------------------------------------------------
# Attach a Node Interface Path to a Logical Interface Profile
#-------------------------------------------------------------

/*
API Information:
 - Class: "l3extRsPathL3OutAtt"
 - Distinguished Name: " uni/tn-common/out-wakanda-dmz/lnodep-wakanda-leaf201-202/lifp-Vlan2002/rspathL3OutAtt-[topology/pod-1/protpaths-201-202//pathep-[wakanda-leaf201-202_vpc49]]/mem-B"
GUI Location:
 - Tenants > common > Networking > L3Outs > wakanda-dmz > Logical Node Profile > wakanda-leaf201-202 > Logical Interface Profiles Vlan2002: SVI
*/

resource "aci_l3out_vpc_member" "Tenant_common_L3Out_wakanda-dmz_Node_Profile_wakanda-leaf201-202_Interface_Profile_Vlan2002_vpc_side_B" {
    depends_on      = [
        aci_tenant.Tenant_common,
        aci_logical_node_profile.Tenant_common_L3Out_wakanda-dmz_Node_Profile_wakanda-leaf201-202,
        aci_logical_interface_profile.Tenant_common_L3Out_wakanda-dmz_Node_Profile_wakanda-leaf201-202_Interface_Profile_Vlan2002,
        aci_l3out_path_attachment.Tenant_common_L3Out_wakanda-dmz_Node_Profile_wakanda-leaf201-202_Interface_Profile_Vlan2002_path_attachment
    ]
    addr            = "10.96.2.2/29"
    description     = "wakanda-leaf201-202-v2002 to 143-core01-02-vpc"
    ipv6_dad        = "enabled"
    leaf_port_dn    = aci_l3out_path_attachment.Tenant_common_L3Out_wakanda-dmz_Node_Profile_wakanda-leaf201-202_Interface_Profile_Vlan2002_path_attachment.id
    side            = "B"
}

#------------------------------------------------
# Create a BGP Peer Connectivity Profile
#------------------------------------------------

/*
API Information:
 - Class: "bgpPeerP"
 - Distinguished Name: "uni/tn-common/out-wakanda-dmz/lnodep-wakanda-leaf201-202/lifp-Vlan2002/rspathL3OutAtt-[topology/pod-1/protpaths-201-202/pathep-[wakanda-leaf201-202_vpc49]]/peerP-[]"
GUI Location:
 - Tenants > common > Networking > L3Outs > wakanda-dmz > Logical Node Profile wakanda-leaf201-202 > Logical Interface Profile > Vlan2002 > OSPF Interface Profile
*/
resource "aci_rest" "common_l3out_wakanda-dmz_nodep_wakanda-leaf201-202_bgp-peer_10-96-2-3" {
    depends_on  = [
        aci_tenant.Tenant_common,
        aci_l3_outside.Tenant_common_L3Out_wakanda-dmz,
        aci_logical_node_profile.Tenant_common_L3Out_wakanda-dmz_Node_Profile_wakanda-leaf201-202,
        aci_logical_interface_profile.Tenant_common_L3Out_wakanda-dmz_Node_Profile_wakanda-leaf201-202_Interface_Profile_Vlan2002,
        aci_bgp_peer_prefix.Tenant_common_Policy_BGP_Prefix_default
    ]
    path        = "/api/node/mo/uni/tn-common/out-wakanda-dmz/lnodep-wakanda-leaf201-202/lifp-Vlan2002/rspathL3OutAtt-[topology/pod-1/protpaths-201-202/pathep-[wakanda-leaf201-202_vpc49]]/peerP-[10.96.2.3].json"
    class_name  = "fabricPodPGrp"
    payload     = <<EOF
{
	"bgpPeerP": {
		"attributes": {
			"dn": "uni/tn-common/out-wakanda-dmz/lnodep-wakanda-leaf201-202/lifp-Vlan2002/rspathL3OutAtt-[topology/pod-1/protpaths-201-202/pathep-[wakanda-leaf201-202_vpc49]]/peerP-[10.96.2.3]",
			"addr": "10.96.2.3",
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
						"dn": "uni/tn-common/out-wakanda-dmz/lnodep-wakanda-leaf201-202/lifp-Vlan2002/rspathL3OutAtt-[topology/pod-1/protpaths-201-202/pathep-[wakanda-leaf201-202_vpc49]]/peerP-[10.96.2.3]/as",
						"asn": "65535"
					},
					"children": []
				}
            },
			{
				"bgpRsPeerPfxPol": {
					"attributes": {
						"dn": "uni/tn-common/out-wakanda-dmz/lnodep-wakanda-leaf201-202/lifp-Vlan2002/rspathL3OutAtt-[topology/pod-1/protpaths-201-202/pathep-[wakanda-leaf201-202_vpc49]]/peerP-[10.96.2.3]/rspeerPfxPol",
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
 - Distinguished Name: "uni/tn-common/out-wakanda-dmz/lnodep-wakanda-leaf201-202/lifp-Vlan2002/rspathL3OutAtt-[topology/pod-1/protpaths-201-202/pathep-[wakanda-leaf201-202_vpc49]]/peerP-[]"
GUI Location:
 - Tenants > common > Networking > L3Outs > wakanda-dmz > Logical Node Profile wakanda-leaf201-202 > Logical Interface Profile > Vlan2002 > OSPF Interface Profile
*/
resource "aci_rest" "common_l3out_wakanda-dmz_nodep_wakanda-leaf201-202_bgp-peer_10-96-2-4" {
    depends_on  = [
        aci_tenant.Tenant_common,
        aci_l3_outside.Tenant_common_L3Out_wakanda-dmz,
        aci_logical_node_profile.Tenant_common_L3Out_wakanda-dmz_Node_Profile_wakanda-leaf201-202,
        aci_logical_interface_profile.Tenant_common_L3Out_wakanda-dmz_Node_Profile_wakanda-leaf201-202_Interface_Profile_Vlan2002,
        aci_bgp_peer_prefix.Tenant_common_Policy_BGP_Prefix_default
    ]
    path        = "/api/node/mo/uni/tn-common/out-wakanda-dmz/lnodep-wakanda-leaf201-202/lifp-Vlan2002/rspathL3OutAtt-[topology/pod-1/protpaths-201-202/pathep-[wakanda-leaf201-202_vpc49]]/peerP-[10.96.2.4].json"
    class_name  = "fabricPodPGrp"
    payload     = <<EOF
{
	"bgpPeerP": {
		"attributes": {
			"dn": "uni/tn-common/out-wakanda-dmz/lnodep-wakanda-leaf201-202/lifp-Vlan2002/rspathL3OutAtt-[topology/pod-1/protpaths-201-202/pathep-[wakanda-leaf201-202_vpc49]]/peerP-[10.96.2.4]",
			"addr": "10.96.2.4",
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
						"dn": "uni/tn-common/out-wakanda-dmz/lnodep-wakanda-leaf201-202/lifp-Vlan2002/rspathL3OutAtt-[topology/pod-1/protpaths-201-202/pathep-[wakanda-leaf201-202_vpc49]]/peerP-[10.96.2.4]/as",
						"asn": "65535"
					},
					"children": []
				}
            },
			{
				"bgpRsPeerPfxPol": {
					"attributes": {
						"dn": "uni/tn-common/out-wakanda-dmz/lnodep-wakanda-leaf201-202/lifp-Vlan2002/rspathL3OutAtt-[topology/pod-1/protpaths-201-202/pathep-[wakanda-leaf201-202_vpc49]]/peerP-[10.96.2.4]/rspeerPfxPol",
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

