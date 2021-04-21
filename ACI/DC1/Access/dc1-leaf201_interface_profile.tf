#------------------------------------------
# Create a Leaf Interface Profile
#------------------------------------------

/*
API Information:
 - Class: "infraAccPortP"
 - Distinguished Name: "uni/infra/accportprof-dc1-leaf201"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > dc1-leaf201
*/
resource "aci_leaf_interface_profile" "dc1-leaf201" {
    # annotation  = 
    description = each.value["description"]
    name        = dc1-leaf201
    # name_alias  = 
}


