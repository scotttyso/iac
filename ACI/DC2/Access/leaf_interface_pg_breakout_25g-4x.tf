#------------------------------------------
# Create Breakout Port Policy Groups
#------------------------------------------

/*
API Information:
 - Class: "infraBrkoutPortGrp"
 - Distinguished Name: "uni/infra/funcprof/brkoutportgrp-25g-4x"
GUI Location:
 - Fabric > Access Policies > Interface > Leaf Interfaces > Policy Groups > Leaf Breakout Port Group:25g-4x
*/
resource "aci_rest" "breakout" {
    path        = "/api/node/mo/uni/infra/funcprof/brkoutportgrp-25g-4x.json"
    class_name  = "infraBrkoutPortGrp"
    payload     = <<EOF
{
  "infraBrkoutPortGrp": {
        "attributes": {
            "descr": "Breakup Map for 4 x 25G",
            "brkoutMap": "25g-4x",
            "dn": "uni/infra/funcprof/brkoutportgrp-25g-4x",
            "name": "25g-4x",
        },
        "children": []
    }
}
  EOF
}

