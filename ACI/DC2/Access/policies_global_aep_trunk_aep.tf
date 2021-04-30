#------------------------------------------
# Create Attachable Access Entity Profiles
#------------------------------------------

/*
API Information:
 - Class: "infraAttEntityP"
 - Distinguished Name: "uni/infra/attentp-trunk_aep"
GUI Location:
 - Fabric > Access Policies > Policies > Global > Attachable Access Entity Profiles : trunk_aep
*/
resource "aci_attachable_access_entity_profile" "aep_trunk_aep" {
    depends_on              = [
        aci_physical_domain.phys_domain_access,
    ]
    description             = "AEP for EPG Assignment"
    name                    = "trunk_aep"
    relation_infra_rs_dom_p = [
        aci_physical_domain.phys_domain_access.id,
    ]
}

