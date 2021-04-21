#------------------------------------------
# Create a Leaf Profile and Attach
# Leaf Interface Profile(s)
#------------------------------------------

/*
API Information:
 - Class: "infraLeafS"
 - Distinguished Name: "uni/infra/nprof-dc1-leaf201"
GUI Location:
 - Fabric > Access Policies > Switches > Leaf Switches > Profiles > dc1-leaf201
*/
resource "aci_leaf_profile" "dc1-leaf201" {
    depends_on                      = [
        aci_leaf_interface_profile.dc1-leaf201,
        aci_rest.leaf_policy_group_default
    ]
    # annotation                      = 
    # description                     = None
    name                            = dc1-leaf201
    # name_alias                      = 
    relation_infra_rs_acc_port_p    = aci_leaf_interface_profile.dc1-leaf201.id

    leaf_selector {
        name                    = dc1-leaf201
        switch_association_type = range
        node_block {
            name  = blk201-201
            from_ = 201
            to_   = 201
        }
    }

}

