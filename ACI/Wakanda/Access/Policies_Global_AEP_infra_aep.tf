#------------------------------------------
# Create Attachable Access Entity Profiles
#------------------------------------------

/*
API Information:
 - Class: "infraAttEntityP"
 - Distinguished Name: "uni/infra/attentp-infra_aep"
GUI Location:
 - Fabric > Access Policies > Policies > Global > Attachable Access Entity Profiles : infra_aep
*/
resource "aci_attachable_access_entity_profile" "AEP_infra_aep" {
    depends_on              = [
        aci_l3_domain_profile.L3_Domain_l3out,
        aci_physical_domain.Phys_Domain_access,
    ]
    description             = "AEP for Infra Trunk"
    name                    = "infra_aep"
    relation_infra_rs_dom_p = [
        aci_l3_domain_profile.L3_Domain_l3out.id,
        aci_physical_domain.Phys_Domain_access.id,
    ]
}

