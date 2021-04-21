/*
API Information:
 - Class: "fvSubnet"
 - Distinguished Name: "/uni/tn-prod/BD-sap_db/subnet-[2001:db8::1/64]"
GUI Location:
 - Tenants > prod > Networking > Bridge Domains > sap_db > Subnets
*/
resource "aci_subnet" "sap_db_2001-db8--_64" {
    depends_on                          = [aci_bridge_domain.prod_sap_db]
    parent_dn                           = aci_bridge_domain.prod_sap_db.id
    ctrl                                = ["nd"]
    description                         = "SAP DB Subnet"
    ip                                  = "2001:db8::1/64"
    preferred                           = "no"
    scope                               = ["public"]
    virtual                             = "no"
}

