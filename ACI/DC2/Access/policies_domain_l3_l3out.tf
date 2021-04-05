#------------------------------------------
# Create L3 Domain Profiles
#------------------------------------------

/*
API Information:
 - Class: "l3extDomP"
 - Distinguished Name: "uni/l3dom-l3out"
GUI Location:
 - Fabric > Access Policies > Physical and External Domains > L3 Domains: l3out
*/
resource "aci_l3_domain_profile" "l3out" {
    depends_on                  = [aci_vlan_pool.l3out]
    name                        = "l3out"
    name_alias                  = ""
    relation_infra_rs_vlan_ns   = aci_vlan_pool.l3out.id
}

