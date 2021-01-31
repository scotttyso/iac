# Use this Resource File to Register dc1-leaf202 with node id 202 to the Fabric
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
API Information:
 - Class: "fabricNode"
 - Distinguished Name: "topology/pod-1/node-202"
GUI Location:
 - Fabric > Access Policies > Inventory > Fabric Membership:[Registered Nodes or Nodes Pending Registration]
*/
resource "aci_fabric_node_member" "dc1-leaf202" {
	serial    = "TEP-1-102"
	name      = "dc1-leaf202"
	node_id   = "202"
	node_type = "unspecified"
	role      = "leaf"
	pod_id    = "1"
}

/*
API Information:
 - Class: "maintMaintGrp"
 - Distinguished Name: "uni/fabric/maintgrp-switch_MgB"
GUI Location:
 - Admin > Firmware > Nodes:MgB
*/
resource "aci_rest" "maint_grp_dc1-leaf202" {
	path		= "/api/node/mo/uni/fabric/maintgrp-switch_MgB.json"
	class_name	= "maintMaintGrp"
	payload		= <<EOF
{
    "maintMaintGrp": {
        "attributes": {
            "dn": "uni/fabric/maintgrp-switch_MgB"
        },
        "children": [
            {
                "fabricNodeBlk": {
                    "attributes": {
                        "dn": "uni/fabric/maintgrp-switch_MgB/nodeblk-blk202-202",
                        "name": "blk202-202",
                        "from_": "202",
                        "to_": "202",
                        "rn": "nodeblk-blk202-202"
                    }
                }
            }
        ]
    }
}
	EOF
}

/*
API Information:
 - Class: "infraAccPortGrp"
 - Distinguished Name: "uni/infra/funcprof/accportgrp-dc1-leaf202"
GUI Location:
 - Fabric > Access Policies > Interfaces > Spine Interfaces > Profiles > dc1-leaf202
*/
resource "aci_spine_interface_profile" "dc1-leaf202" {
	name   = "dc1-leaf202"
}

/*
API Information:
 - Class: "infraSpineP"
 - Distinguished Name: "uni/infra/spprof-dc1-leaf202"
GUI Location:
 - Fabric > Access Policies > Switches > Spine Switches > Profiles > dc1-leaf202
*/
resource "aci_spine_profile" "dc1-leaf202" {
	name   = "dc1-leaf202"
}

/*
API Information:
 - Class: "infraSpineS"
 - Distinguished Name: "uni/infra/spprof-dc1-leaf202/spines-dc1-leaf202-typ-range"
GUI Location:
 - Fabric > Access Policies > Switches > Spine Switches > Profiles > dc1-leaf202: Spine Selectors [dc1-leaf202]
*/
resource "aci_spine_switch_association" "dc1-leaf202" {
	spine_profile_dn               = aci_spine_profile.dc1-leaf202.id
	name                           = "dc1-leaf202"
	spine_switch_association_type  = "range"
}

/*
API Information:
 - Class: "infraRsSpAccPortP"
 - Distinguished Name: "uni/infra/spaccportprof-dc1-leaf202"
GUI Location:
 - Fabric > Access Policies > Switches > Spine Switches > Profiles > dc1-leaf202: Spine Interface Selector Profiles: dc1-leaf202
*/
resource "aci_spine_port_selector" "dc1-leaf202" {
	spine_profile_dn   = aci_spine_profile.dc1-leaf202.id
	tdn                = aci_spine_interface_profile.dc1-leaf202.id
}

/*
API Information:
 - Class: "infraSpineS"
 - Distinguished Name: "uni/infra/spprof-dc1-leaf202/spines-dc1-leaf202-typ-range"
GUI Location:
 - Fabric > Access Policies > Switches > Spine Switches > Profiles > dc1-leaf202: Spine Selectors Policy Group: default
*/
resource "aci_rest" "spine_policy_group_dc1-leaf202" {
	depends_on  = [aci_spine_profile.dc1-leaf202]
	path		= "/api/node/mo/uni/infra/spprof-dc1-leaf202/spines-dc1-leaf202-typ-range.json"
	class_name	= "infraSpineS"
	payload		= <<EOF
{
    "infraSpineS": {
        "attributes": {
            "dn": "uni/infra/spprof-dc1-leaf202/spines-dc1-leaf202-typ-range"
        },
        "children": [
            {
                "infraRsSpineAccNodePGrp": {
                    "attributes": {
                        "tDn": "uni/infra/funcprof/spaccnodepgrp-default"
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
API Information:
 - Class: "mgmtRsInBStNode"
 - Distinguished Name: "uni/tn-mgmt/mgmtp-default/inb-default/rsinBStNode-[topology/pod-1/node-202]"
GUI Location:
 - Tenants > mgmt > Node Management Addresses > Static Node Management Addresses
*/
resource "aci_rest" "inb_mgmt_dc1-leaf202_198-18-11-1" {
	depends_on  = [aci_application_epg.inb_default]
	path		= "/api/node/mo/uni/tn-mgmt.json"
	class_name	= "mgmtRsInBStNode"
	payload		= <<EOF
{
    "mgmtRsInBStNode": {
        "attributes": {
            "dn": "uni/tn-mgmt/mgmtp-default/inb-default/rsinBStNode-[topology/pod-1/node-202]",
            "addr": "198.18.11.202/24",
            "gw": "198.18.11.1",
            "tDn": "topology/pod-1/node-202",
            "v6Addr": "::",
            "v6Gw": "::"
        }
    }
}
	EOF
}

/*
API Information:
 - Class: "mgmtRsOoBStNode"
 - Distinguished Name: "uni/tn-mgmt/mgmtp-default/oob-default/rsooBStNode-[topology/pod-1/node-dc1-leaf202]"
GUI Location:
 - Tenants > mgmt > Node Management Addresses > Static Node Management Addresses
*/
resource "aci_rest" "oob_mgmt_dc1-leaf202_198-18-1-1" {
	path		= "/api/node/mo/uni/tn-mgmt.json"
	class_name	= "mgmtRsOoBStNode"
	payload		= <<EOF
{
    "mgmtRsOoBStNode": {
        "attributes": {
            "dn": "uni/tn-mgmt/mgmtp-default/oob-default/rsooBStNode-[topology/pod-1/node-dc1-leaf202]",
            "addr": "198.18.1.202/24",
            "gw": "198.18.1.1",
            "tDn": "topology/pod-1/node-dc1-leaf202",
            "v6Addr": "::",
            "v6Gw": "::"
        }
    }
}
	EOF
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-01-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-01
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-01" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	description						= "r143b-fp01-Eth1/1"
	name							= "Eth1-01"
	access_port_selector_type		= "range"
	relation_infra_rs_acc_base_grp	= "uni/infra/funcprof/accbundle-pg_vpc1_dc1-leaf201-202-vpc.tf"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-01-typ-range/portblk-Eth1-01"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-01
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-01" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-01]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-01.id
	descr					= "r143b-fp01-Eth1/1"
	name					= "Eth1-01"
	from_card				= "1"
	from_port				= "1"
	to_card					= "1"
	to_port					= "1"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-02-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-02
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-02" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	description						= "r143c-fp01-Eth1/1"
	name							= "Eth1-02"
	access_port_selector_type		= "range"
	relation_infra_rs_acc_base_grp	= "uni/infra/funcprof/accbundle-pg_vpc1_dc1-leaf201-202-vpc.tf"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-02-typ-range/portblk-Eth1-02"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-02
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-02" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-02]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-02.id
	descr					= "r143c-fp01-Eth1/1"
	name					= "Eth1-02"
	from_card				= "1"
	from_port				= "2"
	to_card					= "1"
	to_port					= "2"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-03-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-03
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-03" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	description						= "143c-lab-gw1-Te0/0/4"
	name							= "Eth1-03"
	access_port_selector_type		= "range"
	relation_infra_rs_acc_base_grp	= "uni/infra/funcprof/accportgrp-auto_1500"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-03-typ-range/portblk-Eth1-03"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-03
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-03" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-03]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-03.id
	descr					= "143c-lab-gw1-Te0/0/4"
	name					= "Eth1-03"
	from_card				= "1"
	from_port				= "3"
	to_card					= "1"
	to_port					= "3"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-04-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-04
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-04" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	description						= "143c-lab-gw1-Te0/0/5"
	name							= "Eth1-04"
	access_port_selector_type		= "range"
	relation_infra_rs_acc_base_grp	= "uni/infra/funcprof/accportgrp-auto_1500"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-04-typ-range/portblk-Eth1-04"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-04
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-04" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-04]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-04.id
	descr					= "143c-lab-gw1-Te0/0/5"
	name					= "Eth1-04"
	from_card				= "1"
	from_port				= "4"
	to_card					= "1"
	to_port					= "4"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-05-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-05
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-05" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	description						= "r143c-netapp01-ct0-m0"
	name							= "Eth1-05"
	access_port_selector_type		= "range"
	relation_infra_rs_acc_base_grp	= "uni/infra/funcprof/accbundle-pg_vpc5_dc1-leaf201-202-vpc.tf"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-05-typ-range/portblk-Eth1-05"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-05
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-05" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-05]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-05.id
	descr					= "r143c-netapp01-ct0-m0"
	name					= "Eth1-05"
	from_card				= "1"
	from_port				= "5"
	to_card					= "1"
	to_port					= "5"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-06-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-06
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-06" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	description						= "r143c-netapp01-ct0-m1"
	name							= "Eth1-06"
	access_port_selector_type		= "range"
	relation_infra_rs_acc_base_grp	= "uni/infra/funcprof/accbundle-pg_vpc5_dc1-leaf201-202-vpc.tf"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-06-typ-range/portblk-Eth1-06"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-06
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-06" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-06]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-06.id
	descr					= "r143c-netapp01-ct0-m1"
	name					= "Eth1-06"
	from_card				= "1"
	from_port				= "6"
	to_card					= "1"
	to_port					= "6"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-07-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-07
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-07" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	description						= "r143c-netapp01-ct1-m0"
	name							= "Eth1-07"
	access_port_selector_type		= "range"
	relation_infra_rs_acc_base_grp	= "uni/infra/funcprof/accbundle-pg_vpc7_dc1-leaf201-202-vpc.tf"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-07-typ-range/portblk-Eth1-07"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-07
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-07" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-07]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-07.id
	descr					= "r143c-netapp01-ct1-m0"
	name					= "Eth1-07"
	from_card				= "1"
	from_port				= "7"
	to_card					= "1"
	to_port					= "7"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-08-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-08
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-08" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	description						= "r143c-netapp01-ct1-m1"
	name							= "Eth1-08"
	access_port_selector_type		= "range"
	relation_infra_rs_acc_base_grp	= "uni/infra/funcprof/accbundle-pg_vpc7_dc1-leaf201-202-vpc.tf"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-08-typ-range/portblk-Eth1-08"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-08
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-08" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-08]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-08.id
	descr					= "r143c-netapp01-ct1-m1"
	name					= "Eth1-08"
	from_card				= "1"
	from_port				= "8"
	to_card					= "1"
	to_port					= "8"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-09-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-09
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-09" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	description						= "asgard-ucs-a-Eth1/97"
	name							= "Eth1-09"
	access_port_selector_type		= "range"
	relation_infra_rs_acc_base_grp	= "uni/infra/funcprof/accbundle-pg_vpc9_dc1-leaf201-202-vpc.tf"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-09-typ-range/portblk-Eth1-09"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-09
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-09" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-09]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-09.id
	descr					= "asgard-ucs-a-Eth1/97"
	name					= "Eth1-09"
	from_card				= "1"
	from_port				= "9"
	to_card					= "1"
	to_port					= "9"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-10-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-10
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-10" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	description						= "asgard-ucs-a-Eth1/98"
	name							= "Eth1-10"
	access_port_selector_type		= "range"
	relation_infra_rs_acc_base_grp	= "uni/infra/funcprof/accbundle-pg_vpc9_dc1-leaf201-202-vpc.tf"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-10-typ-range/portblk-Eth1-10"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-10
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-10" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-10]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-10.id
	descr					= "asgard-ucs-a-Eth1/98"
	name					= "Eth1-10"
	from_card				= "1"
	from_port				= "10"
	to_card					= "1"
	to_port					= "10"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-11-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-11
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-11" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	description						= "asgard-ucs-b-Eth1/97"
	name							= "Eth1-11"
	access_port_selector_type		= "range"
	relation_infra_rs_acc_base_grp	= "uni/infra/funcprof/accbundle-pg_vpc9_dc1-leaf201-202-vpc.tf"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-11-typ-range/portblk-Eth1-11"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-11
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-11" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-11]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-11.id
	descr					= "asgard-ucs-b-Eth1/97"
	name					= "Eth1-11"
	from_card				= "1"
	from_port				= "11"
	to_card					= "1"
	to_port					= "11"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-12-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-12
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-12" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	description						= "asgard-ucs-b-Eth1/98"
	name							= "Eth1-12"
	access_port_selector_type		= "range"
	relation_infra_rs_acc_base_grp	= "uni/infra/funcprof/accbundle-pg_vpc9_dc1-leaf201-202-vpc.tf"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-12-typ-range/portblk-Eth1-12"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-12
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-12" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-12]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-12.id
	descr					= "asgard-ucs-b-Eth1/98"
	name					= "Eth1-12"
	from_card				= "1"
	from_port				= "12"
	to_card					= "1"
	to_port					= "12"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-13-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-13
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-13" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	description						= "asgard-leaf101-Eth1/49"
	name							= "Eth1-13"
	access_port_selector_type		= "range"
	relation_infra_rs_acc_base_grp	= "uni/infra/funcprof/accbundle-pg_vpc13_dc1-leaf201-202-vpc.tf"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-13-typ-range/portblk-Eth1-13"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-13
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-13" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-13]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-13.id
	descr					= "asgard-leaf101-Eth1/49"
	name					= "Eth1-13"
	from_card				= "1"
	from_port				= "13"
	to_card					= "1"
	to_port					= "13"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-14-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-14
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-14" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	description						= "asgard-leaf102-Eth1/50"
	name							= "Eth1-14"
	access_port_selector_type		= "range"
	relation_infra_rs_acc_base_grp	= "uni/infra/funcprof/accbundle-pg_vpc13_dc1-leaf201-202-vpc.tf"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-14-typ-range/portblk-Eth1-14"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-14
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-14" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-14]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-14.id
	descr					= "asgard-leaf102-Eth1/50"
	name					= "Eth1-14"
	from_card				= "1"
	from_port				= "14"
	to_card					= "1"
	to_port					= "14"
}

