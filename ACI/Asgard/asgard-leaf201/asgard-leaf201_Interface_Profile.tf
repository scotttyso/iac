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
 - Distinguished Name: "uni/infra/accportprof-asgard-leaf201/hports-Eth1-48-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > asgard-leaf201:Eth1-48
*/
resource "aci_access_port_selector" "Interface_Profile_asgard-leaf201_Selector_Eth1-48" {
    depends_on                      = [
        aci_leaf_interface_profile.Interface_Profile_asgard-leaf201,
    ]
    leaf_interface_profile_dn       = aci_leaf_interface_profile.Interface_Profile_asgard-leaf201.id
    description                     = "asgard-apic01-E2-1"
    name                            = "Eth1-48"
    access_port_selector_type       = "range"
}

#------------------------------------------
# Create Leaf Interface Selector Blocks
#------------------------------------------

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-asgard-leaf201/hports-Eth1-48-typ-range/portblk-Eth1-48"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > asgard-leaf201:Eth1-48
*/
resource "aci_access_port_block" "Interface_Profile_asgard-leaf201_Selector_Eth1-48_PortBlock" {
    depends_on              = [
        aci_leaf_interface_profile.Interface_Profile_asgard-leaf201,
        aci_access_port_selector.Interface_Profile_asgard-leaf201_Selector_Eth1-48
    ]
    access_port_selector_dn = aci_access_port_selector.Interface_Profile_asgard-leaf201_Selector_Eth1-48.id
    description             = "asgard-apic01-E2-1"
    name                    = "Eth1-48"
    from_card               = "1"
    from_port               = "48"
    to_card                 = "1"
    to_port                 = "48"
}

#------------------------------------------
# Create Leaf Interface Selectors
#------------------------------------------

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: "uni/infra/accportprof-asgard-leaf201/hports-Eth1-49-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > asgard-leaf201:Eth1-49
*/
resource "aci_access_port_selector" "Interface_Profile_asgard-leaf201_Selector_Eth1-49" {
    depends_on                      = [
        aci_leaf_interface_profile.Interface_Profile_asgard-leaf201,
    ]
    leaf_interface_profile_dn       = aci_leaf_interface_profile.Interface_Profile_asgard-leaf201.id
    description                     = "143b-core01-E1/27"
    name                            = "Eth1-49"
    access_port_selector_type       = "range"
    relation_infra_rs_acc_base_grp  = "uni/infra/funcprof/accbundle-asgard-leaf201-202_vpc49"
}

#------------------------------------------
# Create Leaf Interface Selector Blocks
#------------------------------------------

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-asgard-leaf201/hports-Eth1-49-typ-range/portblk-Eth1-49"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > asgard-leaf201:Eth1-49
*/
resource "aci_access_port_block" "Interface_Profile_asgard-leaf201_Selector_Eth1-49_PortBlock" {
    depends_on              = [
        aci_leaf_interface_profile.Interface_Profile_asgard-leaf201,
        aci_access_port_selector.Interface_Profile_asgard-leaf201_Selector_Eth1-49
    ]
    access_port_selector_dn = aci_access_port_selector.Interface_Profile_asgard-leaf201_Selector_Eth1-49.id
    description             = "143b-core01-E1/27"
    name                    = "Eth1-49"
    from_card               = "1"
    from_port               = "49"
    to_card                 = "1"
    to_port                 = "49"
}

#------------------------------------------
# Create Leaf Interface Selectors
#------------------------------------------

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: "uni/infra/accportprof-asgard-leaf201/hports-Eth1-50-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > asgard-leaf201:Eth1-50
*/
resource "aci_access_port_selector" "Interface_Profile_asgard-leaf201_Selector_Eth1-50" {
    depends_on                      = [
        aci_leaf_interface_profile.Interface_Profile_asgard-leaf201,
    ]
    leaf_interface_profile_dn       = aci_leaf_interface_profile.Interface_Profile_asgard-leaf201.id
    description                     = "143c-core02-E1/27"
    name                            = "Eth1-50"
    access_port_selector_type       = "range"
    relation_infra_rs_acc_base_grp  = "uni/infra/funcprof/accbundle-asgard-leaf201-202_vpc49"
}

#------------------------------------------
# Create Leaf Interface Selector Blocks
#------------------------------------------

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-asgard-leaf201/hports-Eth1-50-typ-range/portblk-Eth1-50"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > asgard-leaf201:Eth1-50
*/
resource "aci_access_port_block" "Interface_Profile_asgard-leaf201_Selector_Eth1-50_PortBlock" {
    depends_on              = [
        aci_leaf_interface_profile.Interface_Profile_asgard-leaf201,
        aci_access_port_selector.Interface_Profile_asgard-leaf201_Selector_Eth1-50
    ]
    access_port_selector_dn = aci_access_port_selector.Interface_Profile_asgard-leaf201_Selector_Eth1-50.id
    description             = "143c-core02-E1/27"
    name                    = "Eth1-50"
    from_card               = "1"
    from_port               = "50"
    to_card                 = "1"
    to_port                 = "50"
}

#------------------------------------------
# Create Leaf Interface Selectors
#------------------------------------------

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: "uni/infra/accportprof-asgard-leaf201/hports-Eth1-51-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > asgard-leaf201:Eth1-51
*/
resource "aci_access_port_selector" "Interface_Profile_asgard-leaf201_Selector_Eth1-51" {
    depends_on                      = [
        aci_leaf_interface_profile.Interface_Profile_asgard-leaf201,
    ]
    leaf_interface_profile_dn       = aci_leaf_interface_profile.Interface_Profile_asgard-leaf201.id
    description                     = "asgard-ucs-a-E1/97"
    name                            = "Eth1-51"
    access_port_selector_type       = "range"
    relation_infra_rs_acc_base_grp  = "uni/infra/funcprof/accbundle-asgard-leaf201-202_vpc51"
}

#------------------------------------------
# Create Leaf Interface Selector Blocks
#------------------------------------------

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-asgard-leaf201/hports-Eth1-51-typ-range/portblk-Eth1-51"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > asgard-leaf201:Eth1-51
*/
resource "aci_access_port_block" "Interface_Profile_asgard-leaf201_Selector_Eth1-51_PortBlock" {
    depends_on              = [
        aci_leaf_interface_profile.Interface_Profile_asgard-leaf201,
        aci_access_port_selector.Interface_Profile_asgard-leaf201_Selector_Eth1-51
    ]
    access_port_selector_dn = aci_access_port_selector.Interface_Profile_asgard-leaf201_Selector_Eth1-51.id
    description             = "asgard-ucs-a-E1/97"
    name                    = "Eth1-51"
    from_card               = "1"
    from_port               = "51"
    to_card                 = "1"
    to_port                 = "51"
}

#------------------------------------------
# Create Leaf Interface Selectors
#------------------------------------------

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: "uni/infra/accportprof-asgard-leaf201/hports-Eth1-52-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > asgard-leaf201:Eth1-52
*/
resource "aci_access_port_selector" "Interface_Profile_asgard-leaf201_Selector_Eth1-52" {
    depends_on                      = [
        aci_leaf_interface_profile.Interface_Profile_asgard-leaf201,
    ]
    leaf_interface_profile_dn       = aci_leaf_interface_profile.Interface_Profile_asgard-leaf201.id
    description                     = "asgard-ucs-b-E1/97"
    name                            = "Eth1-52"
    access_port_selector_type       = "range"
    relation_infra_rs_acc_base_grp  = "uni/infra/funcprof/accbundle-asgard-leaf201-202_vpc52"
}

#------------------------------------------
# Create Leaf Interface Selector Blocks
#------------------------------------------

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-asgard-leaf201/hports-Eth1-52-typ-range/portblk-Eth1-52"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > asgard-leaf201:Eth1-52
*/
resource "aci_access_port_block" "Interface_Profile_asgard-leaf201_Selector_Eth1-52_PortBlock" {
    depends_on              = [
        aci_leaf_interface_profile.Interface_Profile_asgard-leaf201,
        aci_access_port_selector.Interface_Profile_asgard-leaf201_Selector_Eth1-52
    ]
    access_port_selector_dn = aci_access_port_selector.Interface_Profile_asgard-leaf201_Selector_Eth1-52.id
    description             = "asgard-ucs-b-E1/97"
    name                    = "Eth1-52"
    from_card               = "1"
    from_port               = "52"
    to_card                 = "1"
    to_port                 = "52"
}

