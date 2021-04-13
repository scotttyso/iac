#------------------------------------------
# Create Breakout Port Policy Groups
#------------------------------------------

/*
API Information:
 - Class: "infraBrkoutPortGrp"
 - Distinguished Name: "uni/infra/funcprof/brkoutportgrp-50g-8x"
GUI Location:
 - Fabric > Access Policies > Interface > Leaf Interfaces > Policy Groups > Leaf Breakout Port Group:50g-8x
*/
resource "aci_rest" "breakout" {
    path        = "/api/node/mo/uni/infra/funcprof/brkoutportgrp-50g-8x.json"
    class_name  = "infraBrkoutPortGrp"
    payload     = <<EOF
{
  "infraBrkoutPortGrp": {
        "attributes": {
            "descr": "Breakup Map for 8 x 50G",
            "brkoutMap": "50g-8x",
            "dn": "uni/infra/funcprof/brkoutportgrp-50g-8x",
            "name": "50g-8x",
        },
        "children": []
    }
}
  EOF
}

