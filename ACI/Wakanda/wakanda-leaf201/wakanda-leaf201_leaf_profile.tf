#------------------------------------------
# Create a Leaf Profile and Attach
# Leaf Interface Profile(s)
#------------------------------------------

/*
API Information:
 - Class: "infraLeafS"
 - Distinguished Name: "uni/infra/nprof-wakanda-leaf201"
GUI Location:
 - Fabric > Access Policies > Switches > Leaf Switches > Profiles > wakanda-leaf201
*/
resource "aci_leaf_profile" "Leaf_Profile_wakanda-leaf201" {
    depends_on                      = [
        aci_leaf_interface_profile.Interface_Profile_wakanda-leaf201,
    ]
    name                            = "wakanda-leaf201"
    relation_infra_rs_acc_port_p    = [aci_leaf_interface_profile.Interface_Profile_wakanda-leaf201.id]
    leaf_selector {
        name                    = "wakanda-leaf201"
        switch_association_type = "range"
        node_block {
            name  = "blk201-201"
            from_ = "201"
            to_   = "201"
        }
    }
}

/*
API Information:
 - Class: "infraLeafS"
 - Class: "infraRsAccNodePGrp"
 - Distinguished Name: "uni/infra/nprof-wakanda-leaf201/leaves-wakanda-leaf201-typ-range"
GUI Location:
 - Fabric > Access Policies > Switches > Leaf Switches > Profiles > wakanda-leaf201: Leaf Selectors Policy Group: wakanda-leaf201
*/
resource "aci_rest" "Leaf_Profile_wakanda-leaf201_PolicyGroup_default" {
    depends_on  = [
        aci_leaf_profile.Leaf_Profile_wakanda-leaf201
    ]
    path        = "/api/node/mo/uni/infra/nprof-wakanda-leaf201/leaves-wakanda-leaf201-typ-range.json"
    class_name  = "infraLeafS"
    payload     = <<EOF
{
    "infraLeafS": {
        "attributes": {
            "dn": "uni/infra/nprof-wakanda-leaf201/leaves-wakanda-leaf201-typ-range"
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

