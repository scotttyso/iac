# Use this Resource File to Register leaf201 with node id 201 to the Fabric
# Requirements are:
# serial: Actual Serial Number of the switch.
# name: Hostname you want to assign.
# node_id: unique ID used to identify the switch in the APIC.
#   in the "Cisco ACI Object Naming and Numbering: Best Practice
#   The recommendation is that the Spines should be 101-199
#   and leafs should start at 200+ thru 4000.  As the number of
#   spines should always be less than the number of leafs
#   https://www.cisco.com/c/en/us/td/docs/switches/datacenter/aci/apic/sw/kb/b-Cisco-ACI-Naming-and-Numbering.html#id_107280
# node_type: uremote-leaf-wan or unspecified.
# role: spine, leaf.
# pod_id: Typically this will be 1 unless you are running multipod.

/*
Fabric > Access Policies > Inventory > Fabric Membership:[Registered Nodes or Nodes Pending Registration]
*/
resource "aci_fabric_node_member" "leaf201" {
	serial    = "TEP-1-101"
	name      = "leaf201"
	node_id   = "201"
	node_type = "unspecified"
	role      = "leaf"
	pod_id    = "1"
}

/*
Admin > Firmware > Nodes:[Firmware Maintenance Group]
*/
resource "aci_rest" "maint_grp_leaf201" {
	path		= "/api/node/mo/uni/fabric/maintgrp-switch_MgA.json"
	class_name	= "maintMaintGrp"
	payload		= <<EOF
{
    "maintMaintGrp": {
        "attributes": {
            "dn": "uni/fabric/maintgrp-switch_MgA"
        },
        "children": [
            {
                "fabricNodeBlk": {
                    "attributes": {
                        "dn": "uni/fabric/maintgrp-switch_MgA/nodeblk-blk201-201",
                        "name": "blk201-201",
                        "from_": "201",
                        "to_": "201",
                        "rn": "nodeblk-blk201-201"
                    }
                }
            }
        ]
    }
}
	EOF
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]
*/
resource "aci_leaf_interface_profile" "leaf201" {
	name   = "leaf201"
}

/*
Fabric > Access Policies > Switches > Leaf Switches > Profiles > [Leaf Switch Profile]
*/
resource "aci_leaf_profile" "leaf201" {
	name                           = "leaf201"
	relation_infra_rs_acc_port_p   = [aci_leaf_interface_profile.leaf201.id]
	leaf_selector {
		name                    = "leaf201"
		switch_association_type = "range"
		node_block {
			name  = "leaf201"
			from_ = "201"
			to_   = "201"
		}
	}
}

/*
Fabric > Access Policies > Switches > Leaf Switches > Profiles > [Leaf Switch Profile]: Leaf Selectors Policy Group: default
*/
resource "aci_rest" "leaf_policy_group_leaf201" {
	depends_on		= [aci_leaf_profile.leaf201]
	path		= "/api/node/mo/uni/infra/nprof-leaf201/leaves-leaf201-typ-range.json"
	class_name	= "infraLeafS"
	payload		= <<EOF
{
    "infraLeafS": {
        "attributes": {
            "dn": "uni/infra/nprof-leaf201/leaves-leaf201-typ-range"
        },
        "children": [
            {
                "infraRsAccNodePGrp": {
                    "attributes": {
                        "tDn": "uni/infra/funcprof/accnodepgrp-default"
                    },
                    "children": []
                }
            }
        ]
    }
}
	EOF
}

/*
Tenants > mgmt > Node Management Addresses > Static Node Management Addresses
*/
resource "aci_rest" "inb_mgmt_leaf201" {
	depends_on  = [aci_application_epg.inb_default]
	path		= "/api/node/mo/uni/tn-mgmt.json"
	class_name	= "mgmtRsInBStNode"
	payload		= <<EOF
{
    "mgmtRsInBStNode": {
        "attributes": {
            "dn": "uni/tn-mgmt/mgmtp-default/inb-default/rsinBStNode-[topology/pod-1/node-201]",
            "addr": "198.18.2.201/24",
            "gw": "198.18.2.1",
            "tDn": "topology/pod-1/node-201",
            "v6Addr": "::",
            "v6Gw": "::"
        }
    }
}
	EOF
}

/*
Tenants > mgmt > Node Management Addresses > Static Node Management Addresses
*/
resource "aci_rest" "oob_mgmt_leaf201" {
	path		= "/api/node/mo/uni/tn-mgmt.json"
	class_name	= "mgmtRsOoBStNode"
	payload		= <<EOF
{
    "mgmtRsOoBStNode": {
        "attributes": {
            "dn": "uni/tn-mgmt/mgmtp-default/oob-default/rsooBStNode-[topology/pod-1/node-leaf201]",
            "addr": "198.18.1.201/24",
            "gw": "198.18.1.1",
            "tDn": "topology/pod-1/node-leaf201",
            "v6Addr": "::",
            "v6Gw": "::"
        }
    }
}
	EOF
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-01" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-01"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-01" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-01]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-01.id
	descr					= ""
	name					= "Eth1-01"
	from_card				= "1"
	from_port				= "1"
	to_card					= "1"
	to_port					= "1"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-02" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-02"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-02" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-02]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-02.id
	descr					= ""
	name					= "Eth1-02"
	from_card				= "1"
	from_port				= "2"
	to_card					= "1"
	to_port					= "2"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-03" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-03"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-03" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-03]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-03.id
	descr					= ""
	name					= "Eth1-03"
	from_card				= "1"
	from_port				= "3"
	to_card					= "1"
	to_port					= "3"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-04" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-04"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-04" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-04]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-04.id
	descr					= ""
	name					= "Eth1-04"
	from_card				= "1"
	from_port				= "4"
	to_card					= "1"
	to_port					= "4"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-05" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-05"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-05" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-05]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-05.id
	descr					= ""
	name					= "Eth1-05"
	from_card				= "1"
	from_port				= "5"
	to_card					= "1"
	to_port					= "5"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-06" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-06"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-06" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-06]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-06.id
	descr					= ""
	name					= "Eth1-06"
	from_card				= "1"
	from_port				= "6"
	to_card					= "1"
	to_port					= "6"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-07" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-07"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-07" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-07]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-07.id
	descr					= ""
	name					= "Eth1-07"
	from_card				= "1"
	from_port				= "7"
	to_card					= "1"
	to_port					= "7"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-08" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-08"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-08" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-08]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-08.id
	descr					= ""
	name					= "Eth1-08"
	from_card				= "1"
	from_port				= "8"
	to_card					= "1"
	to_port					= "8"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-09" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-09"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-09" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-09]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-09.id
	descr					= ""
	name					= "Eth1-09"
	from_card				= "1"
	from_port				= "9"
	to_card					= "1"
	to_port					= "9"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-10" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-10"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-10" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-10]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-10.id
	descr					= ""
	name					= "Eth1-10"
	from_card				= "1"
	from_port				= "10"
	to_card					= "1"
	to_port					= "10"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-11" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-11"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-11" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-11]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-11.id
	descr					= ""
	name					= "Eth1-11"
	from_card				= "1"
	from_port				= "11"
	to_card					= "1"
	to_port					= "11"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-12" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-12"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-12" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-12]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-12.id
	descr					= ""
	name					= "Eth1-12"
	from_card				= "1"
	from_port				= "12"
	to_card					= "1"
	to_port					= "12"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-13" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-13"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-13" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-13]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-13.id
	descr					= ""
	name					= "Eth1-13"
	from_card				= "1"
	from_port				= "13"
	to_card					= "1"
	to_port					= "13"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-14" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-14"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-14" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-14]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-14.id
	descr					= ""
	name					= "Eth1-14"
	from_card				= "1"
	from_port				= "14"
	to_card					= "1"
	to_port					= "14"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-15" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-15"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-15" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-15]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-15.id
	descr					= ""
	name					= "Eth1-15"
	from_card				= "1"
	from_port				= "15"
	to_card					= "1"
	to_port					= "15"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-16" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-16"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-16" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-16]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-16.id
	descr					= ""
	name					= "Eth1-16"
	from_card				= "1"
	from_port				= "16"
	to_card					= "1"
	to_port					= "16"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-17" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-17"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-17" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-17]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-17.id
	descr					= ""
	name					= "Eth1-17"
	from_card				= "1"
	from_port				= "17"
	to_card					= "1"
	to_port					= "17"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-18" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-18"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-18" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-18]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-18.id
	descr					= ""
	name					= "Eth1-18"
	from_card				= "1"
	from_port				= "18"
	to_card					= "1"
	to_port					= "18"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-19" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-19"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-19" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-19]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-19.id
	descr					= ""
	name					= "Eth1-19"
	from_card				= "1"
	from_port				= "19"
	to_card					= "1"
	to_port					= "19"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-20" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-20"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-20" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-20]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-20.id
	descr					= ""
	name					= "Eth1-20"
	from_card				= "1"
	from_port				= "20"
	to_card					= "1"
	to_port					= "20"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-21" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-21"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-21" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-21]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-21.id
	descr					= ""
	name					= "Eth1-21"
	from_card				= "1"
	from_port				= "21"
	to_card					= "1"
	to_port					= "21"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-22" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-22"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-22" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-22]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-22.id
	descr					= ""
	name					= "Eth1-22"
	from_card				= "1"
	from_port				= "22"
	to_card					= "1"
	to_port					= "22"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-23" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-23"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-23" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-23]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-23.id
	descr					= ""
	name					= "Eth1-23"
	from_card				= "1"
	from_port				= "23"
	to_card					= "1"
	to_port					= "23"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-24" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-24"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-24" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-24]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-24.id
	descr					= ""
	name					= "Eth1-24"
	from_card				= "1"
	from_port				= "24"
	to_card					= "1"
	to_port					= "24"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-25" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-25"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-25" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-25]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-25.id
	descr					= ""
	name					= "Eth1-25"
	from_card				= "1"
	from_port				= "25"
	to_card					= "1"
	to_port					= "25"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-26" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-26"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-26" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-26]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-26.id
	descr					= ""
	name					= "Eth1-26"
	from_card				= "1"
	from_port				= "26"
	to_card					= "1"
	to_port					= "26"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-27" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-27"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-27" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-27]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-27.id
	descr					= ""
	name					= "Eth1-27"
	from_card				= "1"
	from_port				= "27"
	to_card					= "1"
	to_port					= "27"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-28" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-28"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-28" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-28]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-28.id
	descr					= ""
	name					= "Eth1-28"
	from_card				= "1"
	from_port				= "28"
	to_card					= "1"
	to_port					= "28"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-29" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-29"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-29" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-29]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-29.id
	descr					= ""
	name					= "Eth1-29"
	from_card				= "1"
	from_port				= "29"
	to_card					= "1"
	to_port					= "29"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-30" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-30"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-30" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-30]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-30.id
	descr					= ""
	name					= "Eth1-30"
	from_card				= "1"
	from_port				= "30"
	to_card					= "1"
	to_port					= "30"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-31" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-31"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-31" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-31]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-31.id
	descr					= ""
	name					= "Eth1-31"
	from_card				= "1"
	from_port				= "31"
	to_card					= "1"
	to_port					= "31"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-32" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-32"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-32" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-32]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-32.id
	descr					= ""
	name					= "Eth1-32"
	from_card				= "1"
	from_port				= "32"
	to_card					= "1"
	to_port					= "32"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-33" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-33"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-33" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-33]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-33.id
	descr					= ""
	name					= "Eth1-33"
	from_card				= "1"
	from_port				= "33"
	to_card					= "1"
	to_port					= "33"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-34" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-34"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-34" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-34]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-34.id
	descr					= ""
	name					= "Eth1-34"
	from_card				= "1"
	from_port				= "34"
	to_card					= "1"
	to_port					= "34"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-35" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-35"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-35" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-35]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-35.id
	descr					= ""
	name					= "Eth1-35"
	from_card				= "1"
	from_port				= "35"
	to_card					= "1"
	to_port					= "35"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-36" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-36"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-36" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-36]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-36.id
	descr					= ""
	name					= "Eth1-36"
	from_card				= "1"
	from_port				= "36"
	to_card					= "1"
	to_port					= "36"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-37" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-37"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-37" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-37]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-37.id
	descr					= ""
	name					= "Eth1-37"
	from_card				= "1"
	from_port				= "37"
	to_card					= "1"
	to_port					= "37"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-38" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-38"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-38" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-38]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-38.id
	descr					= ""
	name					= "Eth1-38"
	from_card				= "1"
	from_port				= "38"
	to_card					= "1"
	to_port					= "38"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-39" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-39"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-39" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-39]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-39.id
	descr					= ""
	name					= "Eth1-39"
	from_card				= "1"
	from_port				= "39"
	to_card					= "1"
	to_port					= "39"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-40" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-40"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-40" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-40]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-40.id
	descr					= ""
	name					= "Eth1-40"
	from_card				= "1"
	from_port				= "40"
	to_card					= "1"
	to_port					= "40"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-41" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-41"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-41" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-41]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-41.id
	descr					= ""
	name					= "Eth1-41"
	from_card				= "1"
	from_port				= "41"
	to_card					= "1"
	to_port					= "41"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-42" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-42"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-42" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-42]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-42.id
	descr					= ""
	name					= "Eth1-42"
	from_card				= "1"
	from_port				= "42"
	to_card					= "1"
	to_port					= "42"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-43" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-43"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-43" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-43]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-43.id
	descr					= ""
	name					= "Eth1-43"
	from_card				= "1"
	from_port				= "43"
	to_card					= "1"
	to_port					= "43"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-44" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-44"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-44" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-44]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-44.id
	descr					= ""
	name					= "Eth1-44"
	from_card				= "1"
	from_port				= "44"
	to_card					= "1"
	to_port					= "44"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-45" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-45"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-45" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-45]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-45.id
	descr					= ""
	name					= "Eth1-45"
	from_card				= "1"
	from_port				= "45"
	to_card					= "1"
	to_port					= "45"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-46" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-46"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-46" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-46]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-46.id
	descr					= ""
	name					= "Eth1-46"
	from_card				= "1"
	from_port				= "46"
	to_card					= "1"
	to_port					= "46"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-47" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-47"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-47" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-47]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-47.id
	descr					= ""
	name					= "Eth1-47"
	from_card				= "1"
	from_port				= "47"
	to_card					= "1"
	to_port					= "47"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-48" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-48"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-48" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-48]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-48.id
	descr					= ""
	name					= "Eth1-48"
	from_card				= "1"
	from_port				= "48"
	to_card					= "1"
	to_port					= "48"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-49" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-49"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-49" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-49]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-49.id
	descr					= ""
	name					= "Eth1-49"
	from_card				= "1"
	from_port				= "49"
	to_card					= "1"
	to_port					= "49"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-50" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-50"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-50" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-50]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-50.id
	descr					= ""
	name					= "Eth1-50"
	from_card				= "1"
	from_port				= "50"
	to_card					= "1"
	to_port					= "50"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-51" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-51"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-51" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-51]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-51.id
	descr					= ""
	name					= "Eth1-51"
	from_card				= "1"
	from_port				= "51"
	to_card					= "1"
	to_port					= "51"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-52" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-52"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-52" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-52]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-52.id
	descr					= ""
	name					= "Eth1-52"
	from_card				= "1"
	from_port				= "52"
	to_card					= "1"
	to_port					= "52"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-53" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-53"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-53" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-53]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-53.id
	descr					= ""
	name					= "Eth1-53"
	from_card				= "1"
	from_port				= "53"
	to_card					= "1"
	to_port					= "53"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_selector" "leaf201_Eth1-54" {
	depends_on					= [aci_leaf_interface_profile.leaf201.id]
	leaf_interface_profile_dn	= aci_leaf_interface_profile.leaf201.id
	name						= "Eth1-54"
	access_port_selector_type	= "range"
}

/*
Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > [Leaf Interface Profile]:[Leaf Interface Selector]
*/
resource "aci_access_port_block" "leaf201_Eth1-54" {
	depends_on				= [aci_access_port_selector.leaf201_Eth1-54]
	access_port_selector_dn	= aci_access_port_selector.leaf201_Eth1-54.id
	descr					= ""
	name					= "Eth1-54"
	from_card				= "1"
	from_port				= "54"
	to_card					= "1"
	to_port					= "54"
}

