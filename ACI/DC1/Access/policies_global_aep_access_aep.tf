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
resource "aci_attachable_access_entity_profile" "access_aep" {
    description             = "Default AEP for Static and Dynamic Bindings"
    name                    = "access_aep"
    relation_infra_rs_dom_p = [
        aci_l3_domain_profile.l3out.id,
        aci_physical_domain.access.id,
        aci_vmm_domain.vmm.id,
    ]
}

