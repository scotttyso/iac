#----------------------------------------------
# Create a VPC Domain Pair
#----------------------------------------------

/*
API Information:
 - Class: "fabricExplicitGEp"
 - Distinguished Name: "uni/fabric/protpol/expgep-dc2-leaf201-202-vpc"
GUI Location:
 - Fabric > Access Policies > Policies > Virtual Port Channel default
*/
resource "aci_vpc_explicit_protection_group" "vpc_domain_dc2-leaf201-202-vpc" {
    name                                = "dc2-leaf201-202-vpc"
    switch1                             = "201"
    switch2                             = "202"
    vpc_domain_policy                   = ""
    vpc_explicit_protection_group_id    = "201"
}

