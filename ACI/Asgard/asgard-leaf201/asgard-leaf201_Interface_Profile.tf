#------------------------------------------
# Create a Leaf Interface Profile
#------------------------------------------

/*
API Information:
 - Class: "infraAccPortP"
 - Distinguished Name: "uni/infra/accportprof-asgard-leaf201"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > asgard-leaf201
*/
resource "aci_leaf_interface_profile" "Interface_Profile_asgard-leaf201" {
    name        = "asgard-leaf201"
}


#------------------------------------------
# Create Leaf Interface Selectors
#------------------------------------------

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: "uni/infra/accportprof-asgard-leaf201/hports-Eth1-25-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > asgard-leaf201:Eth1-25
*/
resource "aci_access_port_selector" "Interface_Profile_asgard-leaf201_Selector_Eth1-25" {
    depends_on                      = [
        aci_leaf_interface_profile.Interface_Profile_asgard-leaf201,
    ]
    leaf_interface_profile_dn       = aci_leaf_interface_profile.Interface_Profile_asgard-leaf201.id
    description                     = "asgard-apic01-E2-1"
    name                            = "Eth1-25"
    access_port_selector_type       = "range"
}

#------------------------------------------
# Create Leaf Interface Selector Blocks
#------------------------------------------

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-asgard-leaf201/hports-Eth1-25-typ-range/portblk-Eth1-25"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > asgard-leaf201:Eth1-25
*/
resource "aci_access_port_block" "Interface_Profile_asgard-leaf201_Selector_Eth1-25_PortBlock" {
    depends_on              = [
        aci_leaf_interface_profile.Interface_Profile_asgard-leaf201,
        aci_access_port_selector.Interface_Profile_asgard-leaf201_Selector_Eth1-25
    ]
    access_port_selector_dn = aci_access_port_selector.Interface_Profile_asgard-leaf201_Selector_Eth1-25.id
    description             = "asgard-apic01-E2-1"
    name                    = "Eth1-25"
    from_card               = "1"
    from_port               = "25"
    to_card                 = "1"
    to_port                 = "25"
}

#------------------------------------------
# Create Leaf Interface Selectors
#------------------------------------------

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: "uni/infra/accportprof-asgard-leaf201/hports-Eth1-27-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > asgard-leaf201:Eth1-27
*/
resource "aci_access_port_selector" "Interface_Profile_asgard-leaf201_Selector_Eth1-27" {
    depends_on                      = [
        aci_leaf_interface_profile.Interface_Profile_asgard-leaf201,
    ]
    leaf_interface_profile_dn       = aci_leaf_interface_profile.Interface_Profile_asgard-leaf201.id
    description                     = "143b-core01-E1/27"
    name                            = "Eth1-27"
    access_port_selector_type       = "range"
    relation_infra_rs_acc_base_grp  = "uni/infra/funcprof/accbundle-asgard-leaf201-202_vpc27"
}

#------------------------------------------
# Create Leaf Interface Selector Blocks
#------------------------------------------

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-asgard-leaf201/hports-Eth1-27-typ-range/portblk-Eth1-27"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > asgard-leaf201:Eth1-27
*/
resource "aci_access_port_block" "Interface_Profile_asgard-leaf201_Selector_Eth1-27_PortBlock" {
    depends_on              = [
        aci_leaf_interface_profile.Interface_Profile_asgard-leaf201,
        aci_access_port_selector.Interface_Profile_asgard-leaf201_Selector_Eth1-27
    ]
    access_port_selector_dn = aci_access_port_selector.Interface_Profile_asgard-leaf201_Selector_Eth1-27.id
    description             = "143b-core01-E1/27"
    name                    = "Eth1-27"
    from_card               = "1"
    from_port               = "27"
    to_card                 = "1"
    to_port                 = "27"
}

#------------------------------------------
# Create Leaf Interface Selectors
#------------------------------------------

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: "uni/infra/accportprof-asgard-leaf201/hports-Eth1-28-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > asgard-leaf201:Eth1-28
*/
resource "aci_access_port_selector" "Interface_Profile_asgard-leaf201_Selector_Eth1-28" {
    depends_on                      = [
        aci_leaf_interface_profile.Interface_Profile_asgard-leaf201,
    ]
    leaf_interface_profile_dn       = aci_leaf_interface_profile.Interface_Profile_asgard-leaf201.id
    description                     = "143c-core02-E1/27"
    name                            = "Eth1-28"
    access_port_selector_type       = "range"
    relation_infra_rs_acc_base_grp  = "uni/infra/funcprof/accbundle-asgard-leaf201-202_vpc27"
}

#------------------------------------------
# Create Leaf Interface Selector Blocks
#------------------------------------------

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-asgard-leaf201/hports-Eth1-28-typ-range/portblk-Eth1-28"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > asgard-leaf201:Eth1-28
*/
resource "aci_access_port_block" "Interface_Profile_asgard-leaf201_Selector_Eth1-28_PortBlock" {
    depends_on              = [
        aci_leaf_interface_profile.Interface_Profile_asgard-leaf201,
        aci_access_port_selector.Interface_Profile_asgard-leaf201_Selector_Eth1-28
    ]
    access_port_selector_dn = aci_access_port_selector.Interface_Profile_asgard-leaf201_Selector_Eth1-28.id
    description             = "143c-core02-E1/27"
    name                    = "Eth1-28"
    from_card               = "1"
    from_port               = "28"
    to_card                 = "1"
    to_port                 = "28"
}

#------------------------------------------
# Create Leaf Interface Selectors
#------------------------------------------

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: "uni/infra/accportprof-asgard-leaf201/hports-Eth1-29-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > asgard-leaf201:Eth1-29
*/
resource "aci_access_port_selector" "Interface_Profile_asgard-leaf201_Selector_Eth1-29" {
    depends_on                      = [
        aci_leaf_interface_profile.Interface_Profile_asgard-leaf201,
    ]
    leaf_interface_profile_dn       = aci_leaf_interface_profile.Interface_Profile_asgard-leaf201.id
    description                     = "asgard-ucs-a-E1/97"
    name                            = "Eth1-29"
    access_port_selector_type       = "range"
    relation_infra_rs_acc_base_grp  = "uni/infra/funcprof/accbundle-asgard-leaf201-202_vpc29"
}

#------------------------------------------
# Create Leaf Interface Selector Blocks
#------------------------------------------

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-asgard-leaf201/hports-Eth1-29-typ-range/portblk-Eth1-29"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > asgard-leaf201:Eth1-29
*/
resource "aci_access_port_block" "Interface_Profile_asgard-leaf201_Selector_Eth1-29_PortBlock" {
    depends_on              = [
        aci_leaf_interface_profile.Interface_Profile_asgard-leaf201,
        aci_access_port_selector.Interface_Profile_asgard-leaf201_Selector_Eth1-29
    ]
    access_port_selector_dn = aci_access_port_selector.Interface_Profile_asgard-leaf201_Selector_Eth1-29.id
    description             = "asgard-ucs-a-E1/97"
    name                    = "Eth1-29"
    from_card               = "1"
    from_port               = "29"
    to_card                 = "1"
    to_port                 = "29"
}

#------------------------------------------
# Create Leaf Interface Selectors
#------------------------------------------

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: "uni/infra/accportprof-asgard-leaf201/hports-Eth1-30-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > asgard-leaf201:Eth1-30
*/
resource "aci_access_port_selector" "Interface_Profile_asgard-leaf201_Selector_Eth1-30" {
    depends_on                      = [
        aci_leaf_interface_profile.Interface_Profile_asgard-leaf201,
    ]
    leaf_interface_profile_dn       = aci_leaf_interface_profile.Interface_Profile_asgard-leaf201.id
    description                     = "asgard-ucs-b-E1/97"
    name                            = "Eth1-30"
    access_port_selector_type       = "range"
    relation_infra_rs_acc_base_grp  = "uni/infra/funcprof/accbundle-asgard-leaf201-202_vpc30"
}

#------------------------------------------
# Create Leaf Interface Selector Blocks
#------------------------------------------

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-asgard-leaf201/hports-Eth1-30-typ-range/portblk-Eth1-30"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > asgard-leaf201:Eth1-30
*/
resource "aci_access_port_block" "Interface_Profile_asgard-leaf201_Selector_Eth1-30_PortBlock" {
    depends_on              = [
        aci_leaf_interface_profile.Interface_Profile_asgard-leaf201,
        aci_access_port_selector.Interface_Profile_asgard-leaf201_Selector_Eth1-30
    ]
    access_port_selector_dn = aci_access_port_selector.Interface_Profile_asgard-leaf201_Selector_Eth1-30.id
    description             = "asgard-ucs-b-E1/97"
    name                    = "Eth1-30"
    from_card               = "1"
    from_port               = "30"
    to_card                 = "1"
    to_port                 = "30"
}

