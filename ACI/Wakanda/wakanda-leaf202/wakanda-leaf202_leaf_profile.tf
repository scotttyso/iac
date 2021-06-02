#------------------------------------------
# Create a Leaf Profile and Attach
# Leaf Interface Profile(s)
#------------------------------------------

/*
API Information:
 - Class: "infraLeafS"
 - Distinguished Name: "uni/infra/nprof-wakanda-leaf202"
GUI Location:
 - Fabric > Access Policies > Switches > Leaf Switches > Profiles > wakanda-leaf202
*/
resource "aci_leaf_profile" "Leaf_Profile_wakanda-leaf202" {
    depends_on                      = [
        aci_leaf_interface_profile.Interface_Profile_wakanda-leaf202,
    ]
    name                            = "wakanda-leaf202"
    relation_infra_rs_acc_port_p    = [aci_leaf_interface_profile.Interface_Profile_wakanda-leaf202.id]
    leaf_selector {
        name                    = "wakanda-leaf202"
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
 - Distinguished Name: "uni/infra/nprof-wakanda-leaf202/leaves-wakanda-leaf202-typ-range"
GUI Location:
 - Fabric > Access Policies > Switches > Leaf Switches > Profiles > wakanda-leaf202: Leaf Selectors Policy Group: wakanda-leaf202
*/
resource "aci_rest" "Leaf_Profile_wakanda-leaf202_PolicyGroup_default" {
    depends_on  = [
        aci_leaf_profile.Leaf_Profile_wakanda-leaf202
    ]
    path        = "/api/node/mo/uni/infra/nprof-wakanda-leaf202/leaves-wakanda-leaf202-typ-range.json"
    class_name  = "infraLeafS"
    payload     = <<EOF
{
    "infraLeafS": {
        "attributes": {
            "dn": "uni/infra/nprof-wakanda-leaf202/leaves-wakanda-leaf202-typ-range"
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

