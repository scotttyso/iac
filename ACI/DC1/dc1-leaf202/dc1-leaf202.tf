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

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-15-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-15
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-15" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-15"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-15-typ-range/portblk-Eth1-15"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-15
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-15" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-15]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-15.id
	name					= "Eth1-15"
	from_card				= "1"
	from_port				= "15"
	to_card					= "1"
	to_port					= "15"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-16-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-16
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-16" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-16"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-16-typ-range/portblk-Eth1-16"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-16
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-16" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-16]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-16.id
	name					= "Eth1-16"
	from_card				= "1"
	from_port				= "16"
	to_card					= "1"
	to_port					= "16"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-17-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-17
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-17" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-17"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-17-typ-range/portblk-Eth1-17"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-17
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-17" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-17]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-17.id
	name					= "Eth1-17"
	from_card				= "1"
	from_port				= "17"
	to_card					= "1"
	to_port					= "17"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-18-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-18
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-18" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-18"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-18-typ-range/portblk-Eth1-18"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-18
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-18" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-18]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-18.id
	name					= "Eth1-18"
	from_card				= "1"
	from_port				= "18"
	to_card					= "1"
	to_port					= "18"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-19-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-19
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-19" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-19"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-19-typ-range/portblk-Eth1-19"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-19
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-19" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-19]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-19.id
	name					= "Eth1-19"
	from_card				= "1"
	from_port				= "19"
	to_card					= "1"
	to_port					= "19"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-20-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-20
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-20" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-20"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-20-typ-range/portblk-Eth1-20"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-20
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-20" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-20]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-20.id
	name					= "Eth1-20"
	from_card				= "1"
	from_port				= "20"
	to_card					= "1"
	to_port					= "20"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-21-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-21
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-21" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-21"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-21-typ-range/portblk-Eth1-21"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-21
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-21" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-21]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-21.id
	name					= "Eth1-21"
	from_card				= "1"
	from_port				= "21"
	to_card					= "1"
	to_port					= "21"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-22-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-22
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-22" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-22"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-22-typ-range/portblk-Eth1-22"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-22
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-22" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-22]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-22.id
	name					= "Eth1-22"
	from_card				= "1"
	from_port				= "22"
	to_card					= "1"
	to_port					= "22"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-23-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-23
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-23" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-23"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-23-typ-range/portblk-Eth1-23"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-23
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-23" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-23]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-23.id
	name					= "Eth1-23"
	from_card				= "1"
	from_port				= "23"
	to_card					= "1"
	to_port					= "23"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-24-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-24
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-24" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-24"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-24-typ-range/portblk-Eth1-24"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-24
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-24" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-24]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-24.id
	name					= "Eth1-24"
	from_card				= "1"
	from_port				= "24"
	to_card					= "1"
	to_port					= "24"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-25-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-25
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-25" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-25"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-25-typ-range/portblk-Eth1-25"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-25
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-25" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-25]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-25.id
	name					= "Eth1-25"
	from_card				= "1"
	from_port				= "25"
	to_card					= "1"
	to_port					= "25"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-26-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-26
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-26" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-26"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-26-typ-range/portblk-Eth1-26"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-26
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-26" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-26]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-26.id
	name					= "Eth1-26"
	from_card				= "1"
	from_port				= "26"
	to_card					= "1"
	to_port					= "26"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-27-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-27
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-27" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-27"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-27-typ-range/portblk-Eth1-27"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-27
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-27" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-27]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-27.id
	name					= "Eth1-27"
	from_card				= "1"
	from_port				= "27"
	to_card					= "1"
	to_port					= "27"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-28-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-28
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-28" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-28"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-28-typ-range/portblk-Eth1-28"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-28
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-28" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-28]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-28.id
	name					= "Eth1-28"
	from_card				= "1"
	from_port				= "28"
	to_card					= "1"
	to_port					= "28"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-29-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-29
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-29" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-29"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-29-typ-range/portblk-Eth1-29"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-29
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-29" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-29]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-29.id
	name					= "Eth1-29"
	from_card				= "1"
	from_port				= "29"
	to_card					= "1"
	to_port					= "29"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-30-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-30
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-30" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-30"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-30-typ-range/portblk-Eth1-30"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-30
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-30" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-30]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-30.id
	name					= "Eth1-30"
	from_card				= "1"
	from_port				= "30"
	to_card					= "1"
	to_port					= "30"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-31-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-31
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-31" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-31"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-31-typ-range/portblk-Eth1-31"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-31
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-31" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-31]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-31.id
	name					= "Eth1-31"
	from_card				= "1"
	from_port				= "31"
	to_card					= "1"
	to_port					= "31"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-32-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-32
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-32" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-32"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-32-typ-range/portblk-Eth1-32"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-32
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-32" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-32]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-32.id
	name					= "Eth1-32"
	from_card				= "1"
	from_port				= "32"
	to_card					= "1"
	to_port					= "32"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-33-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-33
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-33" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-33"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-33-typ-range/portblk-Eth1-33"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-33
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-33" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-33]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-33.id
	name					= "Eth1-33"
	from_card				= "1"
	from_port				= "33"
	to_card					= "1"
	to_port					= "33"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-34-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-34
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-34" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-34"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-34-typ-range/portblk-Eth1-34"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-34
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-34" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-34]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-34.id
	name					= "Eth1-34"
	from_card				= "1"
	from_port				= "34"
	to_card					= "1"
	to_port					= "34"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-35-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-35
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-35" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-35"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-35-typ-range/portblk-Eth1-35"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-35
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-35" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-35]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-35.id
	name					= "Eth1-35"
	from_card				= "1"
	from_port				= "35"
	to_card					= "1"
	to_port					= "35"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-36-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-36
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-36" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-36"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-36-typ-range/portblk-Eth1-36"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-36
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-36" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-36]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-36.id
	name					= "Eth1-36"
	from_card				= "1"
	from_port				= "36"
	to_card					= "1"
	to_port					= "36"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-37-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-37
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-37" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-37"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-37-typ-range/portblk-Eth1-37"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-37
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-37" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-37]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-37.id
	name					= "Eth1-37"
	from_card				= "1"
	from_port				= "37"
	to_card					= "1"
	to_port					= "37"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-38-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-38
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-38" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-38"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-38-typ-range/portblk-Eth1-38"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-38
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-38" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-38]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-38.id
	name					= "Eth1-38"
	from_card				= "1"
	from_port				= "38"
	to_card					= "1"
	to_port					= "38"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-39-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-39
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-39" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-39"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-39-typ-range/portblk-Eth1-39"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-39
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-39" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-39]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-39.id
	name					= "Eth1-39"
	from_card				= "1"
	from_port				= "39"
	to_card					= "1"
	to_port					= "39"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-40-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-40
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-40" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-40"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-40-typ-range/portblk-Eth1-40"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-40
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-40" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-40]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-40.id
	name					= "Eth1-40"
	from_card				= "1"
	from_port				= "40"
	to_card					= "1"
	to_port					= "40"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-41-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-41
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-41" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-41"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-41-typ-range/portblk-Eth1-41"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-41
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-41" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-41]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-41.id
	name					= "Eth1-41"
	from_card				= "1"
	from_port				= "41"
	to_card					= "1"
	to_port					= "41"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-42-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-42
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-42" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-42"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-42-typ-range/portblk-Eth1-42"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-42
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-42" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-42]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-42.id
	name					= "Eth1-42"
	from_card				= "1"
	from_port				= "42"
	to_card					= "1"
	to_port					= "42"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-43-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-43
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-43" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-43"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-43-typ-range/portblk-Eth1-43"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-43
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-43" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-43]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-43.id
	name					= "Eth1-43"
	from_card				= "1"
	from_port				= "43"
	to_card					= "1"
	to_port					= "43"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-44-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-44
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-44" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-44"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-44-typ-range/portblk-Eth1-44"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-44
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-44" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-44]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-44.id
	name					= "Eth1-44"
	from_card				= "1"
	from_port				= "44"
	to_card					= "1"
	to_port					= "44"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-45-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-45
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-45" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-45"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-45-typ-range/portblk-Eth1-45"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-45
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-45" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-45]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-45.id
	name					= "Eth1-45"
	from_card				= "1"
	from_port				= "45"
	to_card					= "1"
	to_port					= "45"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-46-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-46
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-46" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-46"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-46-typ-range/portblk-Eth1-46"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-46
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-46" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-46]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-46.id
	name					= "Eth1-46"
	from_card				= "1"
	from_port				= "46"
	to_card					= "1"
	to_port					= "46"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-47-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-47
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-47" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-47"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-47-typ-range/portblk-Eth1-47"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-47
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-47" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-47]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-47.id
	name					= "Eth1-47"
	from_card				= "1"
	from_port				= "47"
	to_card					= "1"
	to_port					= "47"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-48-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-48
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-48" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-48"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-48-typ-range/portblk-Eth1-48"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-48
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-48" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-48]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-48.id
	name					= "Eth1-48"
	from_card				= "1"
	from_port				= "48"
	to_card					= "1"
	to_port					= "48"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-49-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-49
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-49" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-49"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-49-typ-range/portblk-Eth1-49"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-49
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-49" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-49]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-49.id
	name					= "Eth1-49"
	from_card				= "1"
	from_port				= "49"
	to_card					= "1"
	to_port					= "49"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-50-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-50
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-50" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-50"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-50-typ-range/portblk-Eth1-50"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-50
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-50" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-50]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-50.id
	name					= "Eth1-50"
	from_card				= "1"
	from_port				= "50"
	to_card					= "1"
	to_port					= "50"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-51-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-51
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-51" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-51"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-51-typ-range/portblk-Eth1-51"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-51
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-51" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-51]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-51.id
	name					= "Eth1-51"
	from_card				= "1"
	from_port				= "51"
	to_card					= "1"
	to_port					= "51"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-52-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-52
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-52" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-52"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-52-typ-range/portblk-Eth1-52"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-52
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-52" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-52]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-52.id
	name					= "Eth1-52"
	from_card				= "1"
	from_port				= "52"
	to_card					= "1"
	to_port					= "52"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-53-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-53
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-53" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-53"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-53-typ-range/portblk-Eth1-53"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-53
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-53" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-53]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-53.id
	name					= "Eth1-53"
	from_card				= "1"
	from_port				= "53"
	to_card					= "1"
	to_port					= "53"
}

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-54-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-54
*/
resource "aci_access_port_selector" "dc1-leaf202_Eth1-54" {
	depends_on						= [aci_leaf_interface_profile.dc1-leaf202.id]
	leaf_interface_profile_dn		= aci_leaf_interface_profile.dc1-leaf202.id
	name							= "Eth1-54"
	access_port_selector_type		= "range"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-54-typ-range/portblk-Eth1-54"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-54
*/
resource "aci_access_port_block" "dc1-leaf202_Eth1-54" {
	depends_on				= [aci_access_port_selector.dc1-leaf202_Eth1-54]
	access_port_selector_dn	= aci_access_port_selector.dc1-leaf202_Eth1-54.id
	name					= "Eth1-54"
	from_card				= "1"
	from_port				= "54"
	to_card					= "1"
	to_port					= "54"
}

