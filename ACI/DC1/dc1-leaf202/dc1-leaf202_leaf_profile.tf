#------------------------------------------
# Create a Leaf Profile and Attach
# Leaf Interface Profile(s)
#------------------------------------------

/*
API Information:
 - Class: "infraLeafS"
 - Distinguished Name: "uni/infra/nprof-dc1-leaf202"
GUI Location:
 - Fabric > Access Policies > Switches > Leaf Switches > Profiles > dc1-leaf202
*/
resource "aci_leaf_profile" "Leaf_Profile_dc1-leaf202" {
    depends_on                      = [
        aci_leaf_interface_profile.Interface_Profile_dc1-leaf202,
    ]
    name                            = "dc1-leaf202"
    relation_infra_rs_acc_port_p    = [aci_leaf_interface_profile.Interface_Profile_dc1-leaf202.id]
    leaf_selector {
        name                    = "dc1-leaf202"
        switch_association_type = "range"
        node_block {
            name  = "blk202-202"
            from_ = "202"
            to_   = "202"
        }
    }
}

/*
API Information:
 - Class: "infraLeafS"
 - Class: "infraRsAccNodePGrp"
 - Distinguished Name: "uni/infra/nprof-dc1-leaf202/leaves-dc1-leaf202-typ-range"
GUI Location:
 - Fabric > Access Policies > Switches > Leaf Switches > Profiles > dc1-leaf202: Leaf Selectors Policy Group: dc1-leaf202
*/
resource "aci_rest" "Leaf_Profile_dc1-leaf202_PolicyGroup_default" {
    depends_on  = [
        aci_leaf_profile.Leaf_Profile_dc1-leaf202
    ]
    path        = "/api/node/mo/uni/infra/nprof-dc1-leaf202/leaves-dc1-leaf202-typ-range.json"
    class_name  = "infraLeafS"
    payload     = <<EOF
{
    "infraLeafS": {
        "attributes": {
            "dn": "uni/infra/nprof-dc1-leaf202/leaves-dc1-leaf202-typ-range"
        },
        "children": [
            {
                "infraRsAccNodePGrp": {
                    "attributes": {
                        "tDn": "uni/infra/funcprof/accnodepgrp-default"
                    },
                    "children": []
                }
            }
        ]
    }
}
  EOF
}

