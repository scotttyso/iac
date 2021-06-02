#------------------------------------------
# Create L3 Domain Profiles
#------------------------------------------

/*
API Information:
 - Class: "l3extDomP"
 - Distinguished Name: "uni/l3dom-l3out"
GUI Location:
 - Fabric > Access Policies > Physical and External Domains > L3 Domains: l3out
*/
data "aci_l3_domain_profile" "L3_Domain_l3out" {
    name                        = "l3out"
}

