#------------------------------------------
# Create a Leaf Profile and Attach
# Leaf Interface Profile(s)
#------------------------------------------

/*
API Information:
 - Class: "infraLeafS"
 - Distinguished Name: "uni/infra/nprof-asgard-leaf201"
GUI Location:
 - Fabric > Access Policies > Switches > Leaf Switches > Profiles > asgard-leaf201
*/
resource "aci_leaf_profile" "Leaf_Profile_asgard-leaf201" {
    depends_on                      = [
        aci_leaf_interface_profile.Interface_Profile_asgard-leaf201,
    ]
    name                            = "asgard-leaf201"
    relation_infra_rs_acc_port_p    = [aci_leaf_interface_profile.Interface_Profile_asgard-leaf201.id]
    leaf_selector {
        name                    = "asgard-leaf201"
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
 - Distinguished Name: "uni/infra/nprof-asgard-leaf201/leaves-asgard-leaf201-typ-range"
GUI Location:
 - Fabric > Access Policies > Switches > Leaf Switches > Profiles > asgard-leaf201: Leaf Selectors Policy Group: asgard-leaf201
*/
resource "aci_rest" "Leaf_Profile_asgard-leaf201_PolicyGroup_default" {
    depends_on  = [
        aci_leaf_profile.Leaf_Profile_asgard-leaf201
    ]
    path        = "/api/node/mo/uni/infra/nprof-asgard-leaf201/leaves-asgard-leaf201-typ-range.json"
    class_name  = "infraLeafS"
    payload     = <<EOF
{
    "infraLeafS": {
        "attributes": {
            "dn": "uni/infra/nprof-asgard-leaf201/leaves-asgard-leaf201-typ-range"
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

