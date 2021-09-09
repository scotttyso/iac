#------------------------------------------------------
# Data Attachable Access Entity Generic Encap Policy
#------------------------------------------------------

/*
API Information:
 - Class: "infraAttEntityP"
 - Distinguished Name: "uni/infra/attentp-trunk_aep"
GUI Location:
 - Fabric > Access Policies > Policies > Global > Attachable Access Entity Profiles : trunk_aep
*/
data "aci_attachable_access_entity_profile" "AEP_trunk_aep" {
    name = "trunk_aep"
}

data "aci_access_generic" "AEP_trunk_aep" {
    depends_on                          = [
      data.aci_attachable_access_entity_profile.AEP_trunk_aep
    ]
    attachable_access_entity_profile_dn = data.aci_attachable_access_entity_profile.AEP_trunk_aep.id
    name                                = "default"
}

