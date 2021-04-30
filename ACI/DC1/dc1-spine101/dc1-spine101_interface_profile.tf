/*
API Information:
 - Class: "infraSpAccPortP"
 - Distinguished Name: "uni/infra/spaccportprof-dc1-spine101"
GUI Location:
 - Fabric > Access Policies > Interfaces > Spine Interfaces > Profiles > dc1-spine101
*/
resource "aci_spine_interface_profile" "int_profile_dc1-spine101" {
    # annotation  = ""
    description = "None"
    name        = "dc1-spine101"
    # name_alias  = ""
}

