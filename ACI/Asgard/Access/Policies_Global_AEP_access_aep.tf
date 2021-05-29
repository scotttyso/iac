#------------------------------------------
# Create Attachable Access Entity Profiles
#------------------------------------------

/*
API Information:
 - Class: "infraAttEntityP"
 - Distinguished Name: "uni/infra/attentp-access_aep"
GUI Location:
 - Fabric > Access Policies > Policies > Global > Attachable Access Entity Profiles : access_aep
*/
resource "aci_attachable_access_entity_profile" "AEP_access_aep" {
    depends_on              = [
        aci_physical_domain.Phys_Domain_access,
    ]
    description             = "Default AEP for Static and Dynamic Bindings"
    name                    = "access_aep"
    relation_infra_rs_dom_p = [
        aci_physical_domain.Phys_Domain_access.id,
    ]
}

