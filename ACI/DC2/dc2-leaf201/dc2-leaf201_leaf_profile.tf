#------------------------------------------
# Create a Leaf Profile and Attach
# Leaf Interface Profile(s)
#------------------------------------------

/*
API Information:
 - Class: "infraLeafS"
 - Distinguished Name: "uni/infra/nprof-dc2-leaf201"
GUI Location:
 - Fabric > Access Policies > Switches > Leaf Switches > Profiles > dc2-leaf201
*/
resource "aci_leaf_profile" "leaf_profile_dc2-leaf201" {
    depends_on                      = [
        aci_leaf_interface_profile.int_profile_dc2-leaf201,
        aci_rest.leaf_policy_group_default
    ]
    # annotation                      = 
    # description                     = None
    name                            = dc2-leaf201
    # name_alias                      = 
    relation_infra_rs_acc_port_p    = aci_leaf_interface_profile.int_profile_dc2-leaf201.id
    leaf_selector {
        name                    = dc2-leaf201
        switch_association_type = range
        node_block {
            name  = blk201-201
            from_ = 201
            to_   = 201
        }
    }
}

/*
API Information:
 - Class: "infraLeafS"
 - Class: "infraRsAccNodePGrp"
 - Distinguished Name: "uni/infra/nprof-/leaves--typ-range"
GUI Location:
 - Fabric > Access Policies > Switches > Leaf Switches > Profiles > : Leaf Selectors Policy Group: 
*/
resource "aci_rest" "leaf_profile_dc2-leaf201_pg_default" {
    depends_on  = [
        aci_leaf_profile.leaf_profile_dc2-leaf201
    ]
    path        = "/api/node/mo/uni/infra/nprof-/leaves--typ-range.json"
    class_name  = "infraLeafS"
    payload     = <<EOF
{
    "infraLeafS": {
        "attributes": {
            "dn": "uni/infra/nprof-/leaves--typ-range"
        },
        "children": [
            {
                "infraRsAccNodePGrp": {
                    "attributes": {
                        "tDn": "default"
                    },
                    "children": []
                }
            }
        ]
    }
}
  EOF
}

