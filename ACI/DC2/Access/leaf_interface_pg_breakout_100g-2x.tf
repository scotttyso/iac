#------------------------------------------
# Create Breakout Port Policy Groups
#------------------------------------------

/*
API Information:
 - Class: "infraBrkoutPortGrp"
 - Distinguished Name: "uni/infra/funcprof/brkoutportgrp-100g-2x"
GUI Location:
 - Fabric > Access Policies > Interface > Leaf Interfaces > Policy Groups > Leaf Breakout Port Group:100g-2x
*/
resource "aci_rest" "breakout" {
    path        = "/api/node/mo/uni/infra/funcprof/brkoutportgrp-100g-2x.json"
    class_name  = "infraBrkoutPortGrp"
    payload     = <<EOF
{
  "infraBrkoutPortGrp": {
        "attributes": {
            "descr": "Breakup Map for 2 x 100G",
            "brkoutMap": "100g-2x",
            "dn": "uni/infra/funcprof/brkoutportgrp-100g-2x",
            "name": "100g-2x",
        },
        "children": []
    }
}
  EOF
}

