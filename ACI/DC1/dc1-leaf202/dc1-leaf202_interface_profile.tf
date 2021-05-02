#------------------------------------------
# Create a Leaf Interface Profile
#------------------------------------------

/*
API Information:
 - Class: "infraAccPortP"
 - Distinguished Name: "uni/infra/accportprof-dc1-leaf202"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202
*/
resource "aci_leaf_interface_profile" "Interface_Profile_dc1-leaf202" {
    # annotation  = 
    name        = dc1-leaf202
    # name_alias  = 
}


#------------------------------------------
# Create Leaf Interface Selectors
#------------------------------------------

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: "uni/infra/accportprof-dc1-leaf202/hports-Eth1-01-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-01
*/
resource "aci_access_port_selector" "Interface_Profile_dc1-leaf202_Selector_Eth1-01" {
    depends_on                      = [
        aci_leaf_interface_profile.Interface_Profile_dc1-leaf202,
    ]
    leaf_interface_profile_dn       = aci_leaf_interface_profile.Interface_Profile_dc1-leaf202.id
    name                            = "Eth1-01"
    access_port_selector_type       = "range"
    relation_infra_rs_acc_base_grp  = "uni/infra/funcprof/accbundle-trunkPort"
}

#------------------------------------------
# Create Leaf Interface Selector Blocks
#------------------------------------------

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-01-typ-range/portblk-Eth1-01"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-01
*/
resource "aci_access_port_block" "Interface_Profile_dc1-leaf202_Selector_Eth1-01_PortBlock" {
    depends_on              = [
        aci_leaf_interface_profile.Interface_Profile_dc1-leaf202,
        aci_access_port_selector.Interface_Profile_dc1-leaf202_Selector_Eth1-01
    ]
    access_port_selector_dn = aci_access_port_selector.Interface_Profile_dc1-leaf202_Selector_Eth1-01.id
    name                    = "Eth1-01"
    from_card               = "1"
    from_port               = "1"
    to_card                 = "1"
    to_port                 = "1"
}

#------------------------------------------
# Create Leaf Interface Selectors
#------------------------------------------

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: "uni/infra/accportprof-dc1-leaf202/hports-Eth1-02-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-02
*/
resource "aci_access_port_selector" "Interface_Profile_dc1-leaf202_Selector_Eth1-02" {
    depends_on                      = [
        aci_leaf_interface_profile.Interface_Profile_dc1-leaf202,
    ]
    leaf_interface_profile_dn       = aci_leaf_interface_profile.Interface_Profile_dc1-leaf202.id
    name                            = "Eth1-02"
    access_port_selector_type       = "range"
    relation_infra_rs_acc_base_grp  = "uni/infra/funcprof/accbundle-trunkPort"
}

#------------------------------------------
# Create Leaf Interface Selector Blocks
#------------------------------------------

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-02-typ-range/portblk-Eth1-02"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-02
*/
resource "aci_access_port_block" "Interface_Profile_dc1-leaf202_Selector_Eth1-02_PortBlock" {
    depends_on              = [
        aci_leaf_interface_profile.Interface_Profile_dc1-leaf202,
        aci_access_port_selector.Interface_Profile_dc1-leaf202_Selector_Eth1-02
    ]
    access_port_selector_dn = aci_access_port_selector.Interface_Profile_dc1-leaf202_Selector_Eth1-02.id
    name                    = "Eth1-02"
    from_card               = "1"
    from_port               = "2"
    to_card                 = "1"
    to_port                 = "2"
}

#------------------------------------------
# Create Leaf Interface Selectors
#------------------------------------------

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: "uni/infra/accportprof-dc1-leaf202/hports-Eth1-03-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-03
*/
resource "aci_access_port_selector" "Interface_Profile_dc1-leaf202_Selector_Eth1-03" {
    depends_on                      = [
        aci_leaf_interface_profile.Interface_Profile_dc1-leaf202,
    ]
    leaf_interface_profile_dn       = aci_leaf_interface_profile.Interface_Profile_dc1-leaf202.id
    description                     = "143c-lab-gw1-Te0/0/4"
    name                            = "Eth1-03"
    access_port_selector_type       = "range"
    relation_infra_rs_acc_base_grp  = "uni/infra/funcprof/accbundle-accessPort"
}

#------------------------------------------
# Create Leaf Interface Selector Blocks
#------------------------------------------

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-03-typ-range/portblk-Eth1-03"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-03
*/
resource "aci_access_port_block" "Interface_Profile_dc1-leaf202_Selector_Eth1-03_PortBlock" {
    depends_on              = [
        aci_leaf_interface_profile.Interface_Profile_dc1-leaf202,
        aci_access_port_selector.Interface_Profile_dc1-leaf202_Selector_Eth1-03
    ]
    access_port_selector_dn = aci_access_port_selector.Interface_Profile_dc1-leaf202_Selector_Eth1-03.id
    description             = "143c-lab-gw1-Te0/0/4"
    name                    = "Eth1-03"
    from_card               = "1"
    from_port               = "3"
    to_card                 = "1"
    to_port                 = "3"
}

#------------------------------------------
# Create Leaf Interface Selectors
#------------------------------------------

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: "uni/infra/accportprof-dc1-leaf202/hports-Eth1-04-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-04
*/
resource "aci_access_port_selector" "Interface_Profile_dc1-leaf202_Selector_Eth1-04" {
    depends_on                      = [
        aci_leaf_interface_profile.Interface_Profile_dc1-leaf202,
    ]
    leaf_interface_profile_dn       = aci_leaf_interface_profile.Interface_Profile_dc1-leaf202.id
    description                     = "143c-lab-gw1-Te0/0/5"
    name                            = "Eth1-04"
    access_port_selector_type       = "range"
    relation_infra_rs_acc_base_grp  = "uni/infra/funcprof/accbundle-accessPort"
}

#------------------------------------------
# Create Leaf Interface Selector Blocks
#------------------------------------------

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-04-typ-range/portblk-Eth1-04"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-04
*/
resource "aci_access_port_block" "Interface_Profile_dc1-leaf202_Selector_Eth1-04_PortBlock" {
    depends_on              = [
        aci_leaf_interface_profile.Interface_Profile_dc1-leaf202,
        aci_access_port_selector.Interface_Profile_dc1-leaf202_Selector_Eth1-04
    ]
    access_port_selector_dn = aci_access_port_selector.Interface_Profile_dc1-leaf202_Selector_Eth1-04.id
    description             = "143c-lab-gw1-Te0/0/5"
    name                    = "Eth1-04"
    from_card               = "1"
    from_port               = "4"
    to_card                 = "1"
    to_port                 = "4"
}

#------------------------------------------
# Create Leaf Interface Selectors
#------------------------------------------

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: "uni/infra/accportprof-dc1-leaf202/hports-Eth1-05-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-05
*/
resource "aci_access_port_selector" "Interface_Profile_dc1-leaf202_Selector_Eth1-05" {
    depends_on                      = [
        aci_leaf_interface_profile.Interface_Profile_dc1-leaf202,
    ]
    leaf_interface_profile_dn       = aci_leaf_interface_profile.Interface_Profile_dc1-leaf202.id
    name                            = "Eth1-05"
    access_port_selector_type       = "range"
    relation_infra_rs_acc_base_grp  = "uni/infra/funcprof/accbundle-accessPort"
}

#------------------------------------------
# Create Leaf Interface Selector Blocks
#------------------------------------------

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-05-typ-range/portblk-Eth1-05"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-05
*/
resource "aci_access_port_block" "Interface_Profile_dc1-leaf202_Selector_Eth1-05_PortBlock" {
    depends_on              = [
        aci_leaf_interface_profile.Interface_Profile_dc1-leaf202,
        aci_access_port_selector.Interface_Profile_dc1-leaf202_Selector_Eth1-05
    ]
    access_port_selector_dn = aci_access_port_selector.Interface_Profile_dc1-leaf202_Selector_Eth1-05.id
    name                    = "Eth1-05"
    from_card               = "1"
    from_port               = "5"
    to_card                 = "1"
    to_port                 = "5"
}

#------------------------------------------
# Create Leaf Interface Selectors
#------------------------------------------

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: "uni/infra/accportprof-dc1-leaf202/hports-Eth1-06-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-06
*/
resource "aci_access_port_selector" "Interface_Profile_dc1-leaf202_Selector_Eth1-06" {
    depends_on                      = [
        aci_leaf_interface_profile.Interface_Profile_dc1-leaf202,
    ]
    leaf_interface_profile_dn       = aci_leaf_interface_profile.Interface_Profile_dc1-leaf202.id
    name                            = "Eth1-06"
    access_port_selector_type       = "range"
    relation_infra_rs_acc_base_grp  = "uni/infra/funcprof/accbundle-accessPort"
}

#------------------------------------------
# Create Leaf Interface Selector Blocks
#------------------------------------------

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-06-typ-range/portblk-Eth1-06"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-06
*/
resource "aci_access_port_block" "Interface_Profile_dc1-leaf202_Selector_Eth1-06_PortBlock" {
    depends_on              = [
        aci_leaf_interface_profile.Interface_Profile_dc1-leaf202,
        aci_access_port_selector.Interface_Profile_dc1-leaf202_Selector_Eth1-06
    ]
    access_port_selector_dn = aci_access_port_selector.Interface_Profile_dc1-leaf202_Selector_Eth1-06.id
    name                    = "Eth1-06"
    from_card               = "1"
    from_port               = "6"
    to_card                 = "1"
    to_port                 = "6"
}

#------------------------------------------
# Create Leaf Interface Selectors
#------------------------------------------

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: "uni/infra/accportprof-dc1-leaf202/hports-Eth1-07-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-07
*/
resource "aci_access_port_selector" "Interface_Profile_dc1-leaf202_Selector_Eth1-07" {
    depends_on                      = [
        aci_leaf_interface_profile.Interface_Profile_dc1-leaf202,
    ]
    leaf_interface_profile_dn       = aci_leaf_interface_profile.Interface_Profile_dc1-leaf202.id
    name                            = "Eth1-07"
    access_port_selector_type       = "range"
    relation_infra_rs_acc_base_grp  = "uni/infra/funcprof/accbundle-accessPort"
}

#------------------------------------------
# Create Leaf Interface Selector Blocks
#------------------------------------------

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-07-typ-range/portblk-Eth1-07"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-07
*/
resource "aci_access_port_block" "Interface_Profile_dc1-leaf202_Selector_Eth1-07_PortBlock" {
    depends_on              = [
        aci_leaf_interface_profile.Interface_Profile_dc1-leaf202,
        aci_access_port_selector.Interface_Profile_dc1-leaf202_Selector_Eth1-07
    ]
    access_port_selector_dn = aci_access_port_selector.Interface_Profile_dc1-leaf202_Selector_Eth1-07.id
    name                    = "Eth1-07"
    from_card               = "1"
    from_port               = "7"
    to_card                 = "1"
    to_port                 = "7"
}

#------------------------------------------
# Create Leaf Interface Selectors
#------------------------------------------

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: "uni/infra/accportprof-dc1-leaf202/hports-Eth1-08-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-08
*/
resource "aci_access_port_selector" "Interface_Profile_dc1-leaf202_Selector_Eth1-08" {
    depends_on                      = [
        aci_leaf_interface_profile.Interface_Profile_dc1-leaf202,
    ]
    leaf_interface_profile_dn       = aci_leaf_interface_profile.Interface_Profile_dc1-leaf202.id
    name                            = "Eth1-08"
    access_port_selector_type       = "range"
    relation_infra_rs_acc_base_grp  = "uni/infra/funcprof/accbundle-trunkPort"
}

#------------------------------------------
# Create Leaf Interface Selector Blocks
#------------------------------------------

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-08-typ-range/portblk-Eth1-08"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-08
*/
resource "aci_access_port_block" "Interface_Profile_dc1-leaf202_Selector_Eth1-08_PortBlock" {
    depends_on              = [
        aci_leaf_interface_profile.Interface_Profile_dc1-leaf202,
        aci_access_port_selector.Interface_Profile_dc1-leaf202_Selector_Eth1-08
    ]
    access_port_selector_dn = aci_access_port_selector.Interface_Profile_dc1-leaf202_Selector_Eth1-08.id
    name                    = "Eth1-08"
    from_card               = "1"
    from_port               = "8"
    to_card                 = "1"
    to_port                 = "8"
}

#------------------------------------------
# Create Leaf Interface Selectors
#------------------------------------------

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: "uni/infra/accportprof-dc1-leaf202/hports-Eth1-09-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-09
*/
resource "aci_access_port_selector" "Interface_Profile_dc1-leaf202_Selector_Eth1-09" {
    depends_on                      = [
        aci_leaf_interface_profile.Interface_Profile_dc1-leaf202,
    ]
    leaf_interface_profile_dn       = aci_leaf_interface_profile.Interface_Profile_dc1-leaf202.id
    name                            = "Eth1-09"
    access_port_selector_type       = "range"
    relation_infra_rs_acc_base_grp  = "uni/infra/funcprof/accbundle-trunkPort"
}

#------------------------------------------
# Create Leaf Interface Selector Blocks
#------------------------------------------

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-09-typ-range/portblk-Eth1-09"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-09
*/
resource "aci_access_port_block" "Interface_Profile_dc1-leaf202_Selector_Eth1-09_PortBlock" {
    depends_on              = [
        aci_leaf_interface_profile.Interface_Profile_dc1-leaf202,
        aci_access_port_selector.Interface_Profile_dc1-leaf202_Selector_Eth1-09
    ]
    access_port_selector_dn = aci_access_port_selector.Interface_Profile_dc1-leaf202_Selector_Eth1-09.id
    name                    = "Eth1-09"
    from_card               = "1"
    from_port               = "9"
    to_card                 = "1"
    to_port                 = "9"
}

#------------------------------------------
# Create Leaf Interface Selectors
#------------------------------------------

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: "uni/infra/accportprof-dc1-leaf202/hports-Eth1-10-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-10
*/
resource "aci_access_port_selector" "Interface_Profile_dc1-leaf202_Selector_Eth1-10" {
    depends_on                      = [
        aci_leaf_interface_profile.Interface_Profile_dc1-leaf202,
    ]
    leaf_interface_profile_dn       = aci_leaf_interface_profile.Interface_Profile_dc1-leaf202.id
    name                            = "Eth1-10"
    access_port_selector_type       = "range"
    relation_infra_rs_acc_base_grp  = "uni/infra/funcprof/accbundle-trunkPort"
}

#------------------------------------------
# Create Leaf Interface Selector Blocks
#------------------------------------------

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-10-typ-range/portblk-Eth1-10"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-10
*/
resource "aci_access_port_block" "Interface_Profile_dc1-leaf202_Selector_Eth1-10_PortBlock" {
    depends_on              = [
        aci_leaf_interface_profile.Interface_Profile_dc1-leaf202,
        aci_access_port_selector.Interface_Profile_dc1-leaf202_Selector_Eth1-10
    ]
    access_port_selector_dn = aci_access_port_selector.Interface_Profile_dc1-leaf202_Selector_Eth1-10.id
    name                    = "Eth1-10"
    from_card               = "1"
    from_port               = "10"
    to_card                 = "1"
    to_port                 = "10"
}

#------------------------------------------
# Create Leaf Interface Selectors
#------------------------------------------

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: "uni/infra/accportprof-dc1-leaf202/hports-Eth1-11-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-11
*/
resource "aci_access_port_selector" "Interface_Profile_dc1-leaf202_Selector_Eth1-11" {
    depends_on                      = [
        aci_leaf_interface_profile.Interface_Profile_dc1-leaf202,
    ]
    leaf_interface_profile_dn       = aci_leaf_interface_profile.Interface_Profile_dc1-leaf202.id
    name                            = "Eth1-11"
    access_port_selector_type       = "range"
    relation_infra_rs_acc_base_grp  = "uni/infra/funcprof/accbundle-trunkPort"
}

#------------------------------------------
# Create Leaf Interface Selector Blocks
#------------------------------------------

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-11-typ-range/portblk-Eth1-11"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-11
*/
resource "aci_access_port_block" "Interface_Profile_dc1-leaf202_Selector_Eth1-11_PortBlock" {
    depends_on              = [
        aci_leaf_interface_profile.Interface_Profile_dc1-leaf202,
        aci_access_port_selector.Interface_Profile_dc1-leaf202_Selector_Eth1-11
    ]
    access_port_selector_dn = aci_access_port_selector.Interface_Profile_dc1-leaf202_Selector_Eth1-11.id
    name                    = "Eth1-11"
    from_card               = "1"
    from_port               = "11"
    to_card                 = "1"
    to_port                 = "11"
}

#------------------------------------------
# Create Leaf Interface Selectors
#------------------------------------------

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: "uni/infra/accportprof-dc1-leaf202/hports-Eth1-12-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-12
*/
resource "aci_access_port_selector" "Interface_Profile_dc1-leaf202_Selector_Eth1-12" {
    depends_on                      = [
        aci_leaf_interface_profile.Interface_Profile_dc1-leaf202,
    ]
    leaf_interface_profile_dn       = aci_leaf_interface_profile.Interface_Profile_dc1-leaf202.id
    name                            = "Eth1-12"
    access_port_selector_type       = "range"
    relation_infra_rs_acc_base_grp  = "uni/infra/funcprof/accbundle-trunkPort"
}

#------------------------------------------
# Create Leaf Interface Selector Blocks
#------------------------------------------

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-12-typ-range/portblk-Eth1-12"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-12
*/
resource "aci_access_port_block" "Interface_Profile_dc1-leaf202_Selector_Eth1-12_PortBlock" {
    depends_on              = [
        aci_leaf_interface_profile.Interface_Profile_dc1-leaf202,
        aci_access_port_selector.Interface_Profile_dc1-leaf202_Selector_Eth1-12
    ]
    access_port_selector_dn = aci_access_port_selector.Interface_Profile_dc1-leaf202_Selector_Eth1-12.id
    name                    = "Eth1-12"
    from_card               = "1"
    from_port               = "12"
    to_card                 = "1"
    to_port                 = "12"
}

#------------------------------------------
# Create Leaf Interface Selectors
#------------------------------------------

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: "uni/infra/accportprof-dc1-leaf202/hports-Eth1-13-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-13
*/
resource "aci_access_port_selector" "Interface_Profile_dc1-leaf202_Selector_Eth1-13" {
    depends_on                      = [
        aci_leaf_interface_profile.Interface_Profile_dc1-leaf202,
    ]
    leaf_interface_profile_dn       = aci_leaf_interface_profile.Interface_Profile_dc1-leaf202.id
    name                            = "Eth1-13"
    access_port_selector_type       = "range"
    relation_infra_rs_acc_base_grp  = "uni/infra/funcprof/accbundle-trunkPort"
}

#------------------------------------------
# Create Leaf Interface Selector Blocks
#------------------------------------------

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-13-typ-range/portblk-Eth1-13"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-13
*/
resource "aci_access_port_block" "Interface_Profile_dc1-leaf202_Selector_Eth1-13_PortBlock" {
    depends_on              = [
        aci_leaf_interface_profile.Interface_Profile_dc1-leaf202,
        aci_access_port_selector.Interface_Profile_dc1-leaf202_Selector_Eth1-13
    ]
    access_port_selector_dn = aci_access_port_selector.Interface_Profile_dc1-leaf202_Selector_Eth1-13.id
    name                    = "Eth1-13"
    from_card               = "1"
    from_port               = "13"
    to_card                 = "1"
    to_port                 = "13"
}

#------------------------------------------
# Create Leaf Interface Selectors
#------------------------------------------

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: "uni/infra/accportprof-dc1-leaf202/hports-Eth1-14-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-14
*/
resource "aci_access_port_selector" "Interface_Profile_dc1-leaf202_Selector_Eth1-14" {
    depends_on                      = [
        aci_leaf_interface_profile.Interface_Profile_dc1-leaf202,
    ]
    leaf_interface_profile_dn       = aci_leaf_interface_profile.Interface_Profile_dc1-leaf202.id
    name                            = "Eth1-14"
    access_port_selector_type       = "range"
    relation_infra_rs_acc_base_grp  = "uni/infra/funcprof/accbundle-trunkPort"
}

#------------------------------------------
# Create Leaf Interface Selector Blocks
#------------------------------------------

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-dc1-leaf202/hports-Eth1-14-typ-range/portblk-Eth1-14"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf202:Eth1-14
*/
resource "aci_access_port_block" "Interface_Profile_dc1-leaf202_Selector_Eth1-14_PortBlock" {
    depends_on              = [
        aci_leaf_interface_profile.Interface_Profile_dc1-leaf202,
        aci_access_port_selector.Interface_Profile_dc1-leaf202_Selector_Eth1-14
    ]
    access_port_selector_dn = aci_access_port_selector.Interface_Profile_dc1-leaf202_Selector_Eth1-14.id
    name                    = "Eth1-14"
    from_card               = "1"
    from_port               = "14"
    to_card                 = "1"
    to_port                 = "14"
}

