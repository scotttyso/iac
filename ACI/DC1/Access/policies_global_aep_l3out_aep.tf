#------------------------------------------
# Create Attachable Access Entity Profiles
#------------------------------------------

/*
API Information:
 - Class: "infraAttEntityP"
 - Distinguished Name: "uni/infra/attentp-l3out_aep"
GUI Location:
 - Fabric > Access Policies > Policies > Global > Attachable Access Entity Profiles : l3out_aep
*/
resource "aci_attachable_access_entity_profile" "l3out_aep" {
    name                    = "l3out_aep"
    relation_infra_rs_dom_p = [
        aci_l3_domain_profile.l3out.id,
    ]
}
