#------------------------------------------
# Create L3 Domain Profiles
#------------------------------------------

/*
API Information:
 - Class: "l3extDomP"
 - Distinguished Name: "uni/l3dom-L3Out"
GUI Location:
 - Fabric > Access Policies > Physical and External Domains > L3 Domains: L3Out
*/
data "aci_l3_domain_profile" "L3Out" {
    name                        = "L3Out"
}

