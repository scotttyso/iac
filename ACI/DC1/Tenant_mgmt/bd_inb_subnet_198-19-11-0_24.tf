/*
API Information:
 - Class: "fvSubnet"
 - Distinguished Name: "/uni/tn-mgmt/BD-inb/subnet-[198.19.11.1/24]"
GUI Location:
 - Tenants > mgmt > Networking > Bridge Domains > inb > Subnets
*/
resource "aci_subnet" "inb_198-19-11-0_24" {
    depends_on                          = [aci_bridge_domain.mgmt_inb]
    parent_dn                           = aci_bridge_domain.mgmt_inb.id
    ctrl                                = ["nd"]
    description                         = "DC2 Inband Subnet"
    ip                                  = "198.19.11.1/24"
    preferred                           = "no"
    scope                               = ["public"]
    virtual                             = "no"
}

