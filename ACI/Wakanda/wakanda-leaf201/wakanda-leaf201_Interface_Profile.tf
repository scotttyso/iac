#------------------------------------------
# Create a Leaf Interface Profile
#------------------------------------------

/*
API Information:
 - Class: "infraAccPortP"
 - Distinguished Name: "uni/infra/accportprof-wakanda-leaf201"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > wakanda-leaf201
*/
resource "aci_leaf_interface_profile" "Interface_Profile_wakanda-leaf201" {
    name        = "wakanda-leaf201"
}


