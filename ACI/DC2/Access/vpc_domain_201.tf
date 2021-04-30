#----------------------------------------------
# Create a VPC Domain Pair
#----------------------------------------------

/*
API Information:
 - Class: "fabricExplicitGEp"
 - Distinguished Name: "uni/fabric/protpol/expgep-dc2-leaf201-202-vpc"
GUI Location:
 - Fabric > Access Policies > Policies > Virtual Port Channel default
*/
# resource "aci_vpc_explicit_protection_group" "vpc_domain_dc2-leaf201-202-vpc" {
#     # annotation                          = ""
#     name                                = "dc2-leaf201-202-vpc"
#     pod_id                              = ""
#     switch1                             = "201"
#     switch2                             = "202"
#     vpc_domain_policy                   = ""
#     vpc_explicit_protection_group_id    = "201"
# }
resource "aci_rest" "vpc_domain_dc2-leaf201-202-vpc_201" {
    path        = "/api/node/mo/uni/fabric/protpol/expgep-dc2-leaf201-202-vpc.json"
    class_name  = "fabricExplicitGEp"
    payload     = <<EOF
{
    "fabricExplicitGEp": {
        "attributes": {
            "dn": "uni/fabric/protpol/expgep-dc2-leaf201-202-vpc",
            "id": "201",
            "name": "dc2-leaf201-202-vpc"
        },
        "children": [
            {
                "fabricNodePEp": {
                    "attributes": {
                        "dn": "uni/fabric/protpol/expgep-dc2-leaf201-202-vpc/nodepep-201",
                        "id": "201",
                    },
                    "children": []
                }
            },
            {
                "fabricNodePEp": {
                    "attributes": {
                        "dn": "uni/fabric/protpol/expgep-dc2-leaf201-202-vpc/nodepep-202",
                        "id": "202",
                    },
                    "children": []
                }
            },
            {
                "fabricRsVpcInstPol": {
                    "attributes": {
                        "tnVpcInstPolName": ""
                    },
                    "children": []
                }
            }
        ]
    }
}
    EOF
}

