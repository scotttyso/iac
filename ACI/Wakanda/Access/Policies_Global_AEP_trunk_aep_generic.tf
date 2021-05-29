#------------------------------------------------------
# Create Attachable Access Entity Generic Encap Policy
#------------------------------------------------------

/*
API Information:
 - Class: "infraAttEntityP"
 - Distinguished Name: "uni/infra/attentp-trunk_aep"
GUI Location:
 - Fabric > Access Policies > Policies > Global > Attachable Access Entity Profiles : trunk_aep
*/
resource "aci_access_generic" "access_generic_trunk_aep" {
    depends_on                          = [aci_attachable_access_entity_profile.AEP_trunk_aep]
    attachable_access_entity_profile_dn = aci_attachable_access_entity_profile.AEP_trunk_aep.id
    name                                = "default"
}

