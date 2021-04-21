#----------------------------------------------
# Create a VPC Domain Pair
#----------------------------------------------

/*
API Information:
 - Class: "fabricExplicitGEp"
 - Distinguished Name: "uni/fabric/protpol/expgep-dc1-leaf201-202-vpc"
GUI Location:
 - Fabric > Access Policies > Policies > Virtual Port Channel default
*/
resource "aci_rest" "vpc_domain_dc1-leaf201-202-vpc_201" {
    path        = "/api/node/mo/uni/fabric/protpol/expgep-dc1-leaf201-202-vpc.json"
    class_name  = "fabricExplicitGEp"
    payload     = <<EOF
{
    "fabricExplicitGEp": {
        "attributes": {
            "dn": "uni/fabric/protpol/expgep-dc1-leaf201-202-vpc",
            "id": "201",
            "name": "dc1-leaf201-202-vpc"
        },
        "children": [
            {
                "fabricNodePEp": {
                    "attributes": {
                        "dn": "uni/fabric/protpol/expgep-dc1-leaf201-202-vpc/nodepep-201",
                        "id": "201",
                        "podId": ""
                    },
                    "children": []
                }
            },
            {
                "fabricNodePEp": {
                    "attributes": {
                        "dn": "uni/fabric/protpol/expgep-dc1-leaf201-202-vpc/nodepep-202",
                        "id": "202",
                        "podId": ""
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

