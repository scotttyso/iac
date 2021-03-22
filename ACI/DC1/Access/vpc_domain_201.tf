/*
API Information:
 - Class: "fabricExplicitGEp"
 - Distinguished Name: "uni/fabric/protpol/expgep-dc1-leaf201-202-vpc"
GUI Location:
 - Fabric > Access Policies > Policies > Virtual Port Channel default
*/
resource "aci_rest" "vpc_domain_dc1-leaf201-202-vpc" {
    path        = "/api/node/mo/uni/fabric/protpol/expgep-dc1-leaf201-202-vpc.json"
    class_name    = "fabricExplicitGEp"
    payload        = <<EOF
{
    "fabricExplicitGEp": {
        "attributes": {
            "dn": "uni/fabric/protpol/expgep-dc1-leaf201-202-vpc",
            "name": "dc1-leaf201-202-vpc",
            "id": "201",
            "rn": "expgep-dc1-leaf201-202-vpc"
        },
        "children": [
            {
                "fabricNodePEp": {
                    "attributes": {
                        "dn": "uni/fabric/protpol/expgep-dc1-leaf201-202-vpc/nodepep-201",
                        "id": "201",
                        "rn": "nodepep-201"
                    },
                    "children": []
                }
            },
            {
                "fabricNodePEp": {
                    "attributes": {
                        "dn": "uni/fabric/protpol/expgep-dc1-leaf201-202-vpc/nodepep-202",
                        "id": "202",
                        "rn": "nodepep-202"
                    },
                    "children": []
                }
            },
            {
                "fabricRsVpcInstPol": {
                    "attributes": {
                        "tnVpcInstPolName": "default"
                    },
                    "children": []
                }
            }
        ]
    }
}
    EOF
}

