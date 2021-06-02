#------------------------------------------------
# Create a Logical Node Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extLNodeP"
 - Distinguished Name: "/uni/tn-common/out-dc2-prod_L3/lnodep-dc2-leaf201-202"
GUI Location:
Tenants > common > Networking > L3Outs > dc2-prod_L3 > Logical Node Profile > dc2-leaf201-202
*/
resource "aci_logical_node_profile" "Tenant_common_L3Out_dc2-prod_L3_Node_Profile_dc2-leaf201-202" {
    depends_on      = [
        aci_tenant.Tenant_common,
        aci_l3_outside.Tenant_common_L3Out_dc2-prod_L3
    ]
    l3_outside_dn   = aci_l3_outside.Tenant_common_L3Out_dc2-prod_L3.id
    description     = "DC2 Border Leafs to Core"
    name            = "dc2-leaf201-202"
    target_dscp     = "unspecified"
}

#------------------------------------------------
# Assign a Node to a Logical Node Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extRsNodeL3OutAtt"
 - Distinguished Name: "/uni/tn-common/out-dc2-prod_L3/lnodep-dc2-leaf201-202/rsnodeL3OutAtt-[topology/pod-1/node-201]"
GUI Location:
Tenants > common > Networking > L3Outs > dc2-prod_L3 > Logical Node Profile > dc2-leaf201-202: Nodes > 201
*/
resource "aci_logical_node_to_fabric_node" "Tenant_common_L3Out_dc2-prod_L3_Node_Profile_dc2-leaf201-202_201" {
    depends_on              = [
        aci_tenant.Tenant_common,
        aci_l3_outside.Tenant_common_L3Out_dc2-prod_L3,
        aci_logical_node_profile.Tenant_common_L3Out_dc2-prod_L3_Node_Profile_dc2-leaf201-202
    ]
    logical_node_profile_dn = aci_logical_node_profile.Tenant_common_L3Out_dc2-prod_L3_Node_Profile_dc2-leaf201-202.id
    tdn                     = "topology/pod-1/node-201"
    rtr_id                  = "198.19.252.201"
    rtr_id_loop_back        = "yes"
}

#------------------------------------------------
# Assign a Node to a Logical Node Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extRsNodeL3OutAtt"
 - Distinguished Name: "/uni/tn-common/out-dc2-prod_L3/lnodep-dc2-leaf201-202/rsnodeL3OutAtt-[topology/pod-1/node-202]"
GUI Location:
Tenants > common > Networking > L3Outs > dc2-prod_L3 > Logical Node Profile > dc2-leaf201-202: Nodes > 202
*/
resource "aci_logical_node_to_fabric_node" "Tenant_common_L3Out_dc2-prod_L3_Node_Profile_dc2-leaf201-202_202" {
    depends_on              = [
        aci_tenant.Tenant_common,
        aci_l3_outside.Tenant_common_L3Out_dc2-prod_L3,
        aci_logical_node_profile.Tenant_common_L3Out_dc2-prod_L3_Node_Profile_dc2-leaf201-202
    ]
    logical_node_profile_dn = aci_logical_node_profile.Tenant_common_L3Out_dc2-prod_L3_Node_Profile_dc2-leaf201-202.id
    tdn                     = "topology/pod-1/node-202"
    rtr_id                  = "198.19.253.1"
    rtr_id_loop_back        = "yes"
}

#------------------------------------------------
# Create Logical Interface Profile
#------------------------------------------------

/*
API Information:
 - Class: "l3extLIfP"
 - Distinguished Name: "/uni/tn-common/out-dc2-prod_L3/lnodep-"
GUI Location:
 - Tenants > common > Networking > L3Outs > dc2-prod_L3 > Logical Node Profile > dc2-leaf201-202 > Logical Interface Profiles Vlan921
*/
resource "aci_logical_interface_profile" "Tenant_common_L3Out_dc2-prod_L3_Node_Profile_dc2-leaf201-202_Interface_Profile_Vlan921" {
    depends_on                                      = [
        aci_tenant.Tenant_common,
        aci_l3_outside.Tenant_common_L3Out_dc2-prod_L3,
        aci_logical_node_profile.Tenant_common_L3Out_dc2-prod_L3_Node_Profile_dc2-leaf201-202
    ]
    logical_node_profile_dn                         = aci_logical_node_profile.Tenant_common_L3Out_dc2-prod_L3_Node_Profile_dc2-leaf201-202.id
    description                                     = "DC2 leaf101-102-vlan921 to Core"
    name                                            = "Vlan921"
    prio                                            = ""
    tag                                             = "yellow-green"
}

#-------------------------------------------------------------
# Attach a Node Interface Path to a Logical Interface Profile
#-------------------------------------------------------------

/*
API Information:
 - Class: "l3extRsPathL3OutAtt"
 - Distinguished Name: "uni/tn-common/out-dc2-prod_L3/lnodep-dc2-leaf201-202/lifp-Vlan921/rspathL3OutAtt-[topology/pod-1/protpaths-202-202/pathep-[dc2-leaf201-202_vpc1]]"
GUI Location:
 - Tenants > common > Networking > L3Outs > dc2-prod_L3 > Logical Node Profile > dc2-leaf201-202 > Logical Interface Profiles Vlan921: SVI
 - Assign all the default Policies to this Policy Group
*/
resource "aci_l3out_path_attachment" "Tenant_common_L3Out_dc2-prod_L3_Node_Profile_dc2-leaf201-202_Interface_Profile_Vlan921_path_attachment" {
    depends_on                      = [
        aci_tenant.Tenant_common,
        aci_logical_node_profile.Tenant_common_L3Out_dc2-prod_L3_Node_Profile_dc2-leaf201-202,
        aci_logical_interface_profile.Tenant_common_L3Out_dc2-prod_L3_Node_Profile_dc2-leaf201-202_Interface_Profile_Vlan921
    ]
    logical_interface_profile_dn    = aci_logical_interface_profile.Tenant_common_L3Out_dc2-prod_L3_Node_Profile_dc2-leaf201-202_Interface_Profile_Vlan921.id
    target_dn                       = "topology/pod-1/protpaths-202-202/pathep-[dc2-leaf201-202_vpc1]"
    if_inst_t                       = "ext-svi"
    annotation                      = ""
    autostate                       = "disabled"
    encap                           = "vlan-921"
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
 - Distinguished Name: " uni/tn-common/out-dc2-prod_L3/lnodep-dc2-leaf201-202/lifp-Vlan921/rspathL3OutAtt-[topology/pod-1/protpaths-202-202//pathep-[dc2-leaf201-202_vpc1]]/mem-A"
GUI Location:
 - Tenants > common > Networking > L3Outs > dc2-prod_L3 > Logical Node Profile > dc2-leaf201-202 > Logical Interface Profiles Vlan921: SVI
*/
resource "aci_rest" "Tenant_common_L3Out_dc2-prod_L3_Node_Profile_dc2-leaf201-202_Interface_Profile_Vlan921_vpc_side_A" {
    depends_on                      = [
        aci_tenant.Tenant_common,
        aci_logical_node_profile.Tenant_common_L3Out_dc2-prod_L3_Node_Profile_dc2-leaf201-202,
        aci_logical_interface_profile.Tenant_common_L3Out_dc2-prod_L3_Node_Profile_dc2-leaf201-202_Interface_Profile_Vlan921
    ]
    path        = "/api/node/mo/uni/tn-common/out-dc2-prod_L3/lnodep-dc2-leaf201-202/lifp-Vlan921/rspathL3OutAtt-[topology/pod-1/protpaths-202-202/pathep-[dc2-leaf201-202_vpc1]]/mem-A.json"
    class_name  = "l3extMember"
    payload     = <<EOF
{
    "l3extMember": {
        "attributes": {
            "addr": "198.19.0.9/29",
            "ipv6Dad": "enabled",
            "side": "A",
        }
    }
}
    EOF
}

#-------------------------------------------------------------
# Attach a Node Interface Path to a Logical Interface Profile
#-------------------------------------------------------------

/*
API Information:
 - Class: "l3extRsPathL3OutAtt"
 - Distinguished Name: " uni/tn-common/out-dc2-prod_L3/lnodep-dc2-leaf201-202/lifp-Vlan921/rspathL3OutAtt-[topology/pod-1/protpaths-202-202//pathep-[dc2-leaf201-202_vpc1]]/mem-B"
GUI Location:
 - Tenants > common > Networking > L3Outs > dc2-prod_L3 > Logical Node Profile > dc2-leaf201-202 > Logical Interface Profiles Vlan921: SVI
*/
resource "aci_rest" "Tenant_common_L3Out_dc2-prod_L3_Node_Profile_dc2-leaf201-202_Interface_Profile_Vlan921_vpc_side_B" {
    depends_on                      = [
        aci_tenant.Tenant_common,
        aci_logical_node_profile.Tenant_common_L3Out_dc2-prod_L3_Node_Profile_dc2-leaf201-202,
        aci_logical_interface_profile.Tenant_common_L3Out_dc2-prod_L3_Node_Profile_dc2-leaf201-202_Interface_Profile_Vlan921
    ]
    path        = "/api/node/mo/uni/tn-common/out-dc2-prod_L3/lnodep-dc2-leaf201-202/lifp-Vlan921/rspathL3OutAtt-[topology/pod-1/protpaths-202-202/pathep-[dc2-leaf201-202_vpc1]]/mem-B.json"
    class_name  = "l3extMember"
    payload     = <<EOF
{
    "l3extMember": {
        "attributes": {
            "addr": "198.19.0.10/29",
            "ipv6Dad": "enabled",
            "side": "B",
        }
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
 - Distinguished Name: "uni/tn-common/out-dc2-prod_L3/lnodep-dc2-leaf201-202/lifp-Vlan921/rspathL3OutAtt-[topology/pod-1/protpaths-202-202/pathep-[dc2-leaf201-202_vpc1]]/peerP-[]"
GUI Location:
 - Tenants > common > Networking > L3Outs > dc2-prod_L3 > Logical Node Profile dc2-leaf201-202 > Logical Interface Profile > Vlan921 > OSPF Interface Profile
*/
resource "aci_rest" "common_l3out_dc2-prod_L3_nodep_dc2-leaf201-202_bgp-peer_198-19-0-11" {
    depends_on  = [
        aci_tenant.Tenant_common,
        aci_l3_outside.Tenant_common_L3Out_dc2-prod_L3,
        aci_logical_node_profile.Tenant_common_L3Out_dc2-prod_L3_Node_Profile_dc2-leaf201-202,
        aci_logical_interface_profile.Tenant_common_L3Out_dc2-prod_L3_Node_Profile_dc2-leaf201-202_Interface_Profile_Vlan921,
        aci_bgp_peer_prefix.Tenant_common_Policy_BGP_Prefix_default
    ]
    path        = "/api/node/mo/uni/tn-common/out-dc2-prod_L3/lnodep-dc2-leaf201-202/lifp-Vlan921/rspathL3OutAtt-[topology/pod-1/protpaths-202-202/pathep-[dc2-leaf201-202_vpc1]]/peerP-[198.19.0.11].json"
    class_name  = "fabricPodPGrp"
    payload     = <<EOF
{
	"bgpPeerP": {
		"attributes": {
			"dn": "uni/tn-common/out-dc2-prod_L3/lnodep-dc2-leaf201-202/lifp-Vlan921/rspathL3OutAtt-[topology/pod-1/protpaths-202-202/pathep-[dc2-leaf201-202_vpc1]]/peerP-[198.19.0.11]",
			"addr": "198.19.0.11",
			"addrTCtrl": "af-ucast",
			"adminSt": "enabled",
			"allowedSelfAsCnt": "3",
			"ctrl": "send-com,send-ext-com",
            "descr": "DC2 Peer 1",
			"peerCtrl": "bfd",
			"privateASctrl": "",
			"ttl": "1",
			"weight": "0"
		},
		"children": [
			{
				"bgpAsP": {
					"attributes": {
						"dn": "uni/tn-common/out-dc2-prod_L3/lnodep-dc2-leaf201-202/lifp-Vlan921/rspathL3OutAtt-[topology/pod-1/protpaths-202-202/pathep-[dc2-leaf201-202_vpc1]]/peerP-[198.19.0.11]/as",
						"asn": "65502"
					},
					"children": []
				}
            },
			{
				"bgpRsPeerPfxPol": {
					"attributes": {
						"dn": "uni/tn-common/out-dc2-prod_L3/lnodep-dc2-leaf201-202/lifp-Vlan921/rspathL3OutAtt-[topology/pod-1/protpaths-202-202/pathep-[dc2-leaf201-202_vpc1]]/peerP-[198.19.0.11]/rspeerPfxPol",
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
 - Distinguished Name: "uni/tn-common/out-dc2-prod_L3/lnodep-dc2-leaf201-202/lifp-Vlan921/rspathL3OutAtt-[topology/pod-1/protpaths-202-202/pathep-[dc2-leaf201-202_vpc1]]/peerP-[]"
GUI Location:
 - Tenants > common > Networking > L3Outs > dc2-prod_L3 > Logical Node Profile dc2-leaf201-202 > Logical Interface Profile > Vlan921 > OSPF Interface Profile
*/
resource "aci_rest" "common_l3out_dc2-prod_L3_nodep_dc2-leaf201-202_bgp-peer_198-19-0-12" {
    depends_on  = [
        aci_tenant.Tenant_common,
        aci_l3_outside.Tenant_common_L3Out_dc2-prod_L3,
        aci_logical_node_profile.Tenant_common_L3Out_dc2-prod_L3_Node_Profile_dc2-leaf201-202,
        aci_logical_interface_profile.Tenant_common_L3Out_dc2-prod_L3_Node_Profile_dc2-leaf201-202_Interface_Profile_Vlan921,
        aci_bgp_peer_prefix.Tenant_common_Policy_BGP_Prefix_default
    ]
    path        = "/api/node/mo/uni/tn-common/out-dc2-prod_L3/lnodep-dc2-leaf201-202/lifp-Vlan921/rspathL3OutAtt-[topology/pod-1/protpaths-202-202/pathep-[dc2-leaf201-202_vpc1]]/peerP-[198.19.0.12].json"
    class_name  = "fabricPodPGrp"
    payload     = <<EOF
{
	"bgpPeerP": {
		"attributes": {
			"dn": "uni/tn-common/out-dc2-prod_L3/lnodep-dc2-leaf201-202/lifp-Vlan921/rspathL3OutAtt-[topology/pod-1/protpaths-202-202/pathep-[dc2-leaf201-202_vpc1]]/peerP-[198.19.0.12]",
			"addr": "198.19.0.12",
			"addrTCtrl": "af-ucast",
			"adminSt": "enabled",
			"allowedSelfAsCnt": "3",
			"ctrl": "send-com,send-ext-com",
            "descr": "DC2 Peer 2",
			"peerCtrl": "bfd",
			"privateASctrl": "",
			"ttl": "1",
			"weight": "0"
		},
		"children": [
			{
				"bgpAsP": {
					"attributes": {
						"dn": "uni/tn-common/out-dc2-prod_L3/lnodep-dc2-leaf201-202/lifp-Vlan921/rspathL3OutAtt-[topology/pod-1/protpaths-202-202/pathep-[dc2-leaf201-202_vpc1]]/peerP-[198.19.0.12]/as",
						"asn": "65502"
					},
					"children": []
				}
            },
			{
				"bgpRsPeerPfxPol": {
					"attributes": {
						"dn": "uni/tn-common/out-dc2-prod_L3/lnodep-dc2-leaf201-202/lifp-Vlan921/rspathL3OutAtt-[topology/pod-1/protpaths-202-202/pathep-[dc2-leaf201-202_vpc1]]/peerP-[198.19.0.12]/rspeerPfxPol",
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

