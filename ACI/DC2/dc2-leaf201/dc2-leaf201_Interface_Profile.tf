#------------------------------------------
# Create a Leaf Interface Profile
#------------------------------------------

/*
API Information:
 - Class: "infraAccPortP"
 - Distinguished Name: "uni/infra/accportprof-dc2-leaf201"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc2-leaf201
*/
resource "aci_leaf_interface_profile" "Interface_Profile_dc2-leaf201" {
    name        = "dc2-leaf201"
}


