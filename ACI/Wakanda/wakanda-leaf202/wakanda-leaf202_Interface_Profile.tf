#------------------------------------------
# Create a Leaf Interface Profile
#------------------------------------------

/*
API Information:
 - Class: "infraAccPortP"
 - Distinguished Name: "uni/infra/accportprof-wakanda-leaf202"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > wakanda-leaf202
*/
resource "aci_leaf_interface_profile" "Interface_Profile_wakanda-leaf202" {
    name        = "wakanda-leaf202"
}


