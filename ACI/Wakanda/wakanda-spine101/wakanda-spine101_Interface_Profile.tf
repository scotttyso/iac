/*
API Information:
 - Class: "infraSpAccPortP"
 - Distinguished Name: "uni/infra/spaccportprof-wakanda-spine101"
GUI Location:
 - Fabric > Access Policies > Interfaces > Spine Interfaces > Profiles > wakanda-spine101
*/
resource "aci_spine_interface_profile" "Interface_Profile_wakanda-spine101" {
    name        = "wakanda-spine101"
}

