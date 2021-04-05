#------------------------------------------
# Create Physical Domain Profiles
#------------------------------------------

/*
API Information:
 - Class: "physDomP"
 - Distinguished Name: "uni/infra/phys-access"
GUI Location:
 - Fabric > Access Policies > Physical and External Domains > Physical Domains: access
*/
resource "aci_physical_domain" "access" {
    depends_on                  = [aci_vlan_pool.access]
    name                        = "access"
    name_alias                  = ""
    relation_infra_rs_vlan_ns   = aci_vlan_pool.access.id
}
