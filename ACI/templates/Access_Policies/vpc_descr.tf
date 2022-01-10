/*
Add Description to Virtual Port Channel default
API Information:
 - Class: "fabricProtPol"
 - Distinguished Name: "uni/fabric/protpol"
GUI Location:
 - Fabric > Access Policies > Policies > Switch > Virtual Port Channel default
*/
resource "aci_rest" "vpc_description" {
  path       = "/api/node/mo/uni/fabric/protpol.json"
  class_name = "fabricProtPol"
  payload    = <<EOF
{
    "fabricProtPol": {
        "attributes": {
            "dn": "uni/fabric/protpol",
            "descr": "VPC Pair Configuration.  Configured by Terraform startup Wizard"
        },
        "children": []
    }
}
    EOF
}
