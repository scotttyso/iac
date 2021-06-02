#----------------------------------------------
# Create a Maintenance Group Policy
#----------------------------------------------

/*
API Information:
 - Class: "maintMaintP"
 - Distinguished Name: "uni/fabric/maintpol-MG_B"
GUI Location:
 - This is not available from the UI
*/
resource "aci_maintenance_policy" "Maintenance_Policy_MG_B" {
    admin_st                = "untriggered"
    graceful                = "yes"
    ignore_compat           = "no"
    name                    = "MG_B"
    notif_cond              = "notifyOnlyOnFailures"
    run_mode                = "pauseOnlyOnFailures"
    version                 = "n9000-15.1(4c)"
    version_check_override  = "untriggered"
}

#----------------------------------------------
# Create a Maintenance Group
#----------------------------------------------

/*
API Information:
 - Class: "maintMaintGrp"
 - Distinguished Name: "uni/fabric/maintgrp-MG_B"
GUI Location:
 - Admin > Firmware > Nodes > Actions > Create Update Group
*/
resource "aci_pod_maintenance_group" "Maintenance_Group_MG_B" {
    depends_on                  = [
        aci_maintenance_policy.Maintenance_Policy_MG_B
    ]
    fwtype                      = "switch"
    name                        = "MG_B"
    pod_maintenance_group_type  = "range"
    relation_maint_rs_mgrpp     = aci_maintenance_policy.Maintenance_Policy_MG_B.id
}

#------------------------------------------
# Add Node Block(s) to a Maintenance Group
#------------------------------------------

/*
API Information:
 - Class: "fabricNodeBlk"
 - Distinguished Name: "uni/fabric/maintgrp-MG_B/nodeblk-blk102-102"
GUI Location:
 - Admin > Firmware > Nodes > {Maintenance Group Name}
*/
resource "aci_maintenance_group_node" "Maintenance_Group_MG_B_Nodeblk_102" {
    depends_on  = [
        aci_pod_maintenance_group.Maintenance_Group_MG_B
    ]
    pod_maintenance_group_dn = aci_pod_maintenance_group.Maintenance_Group_MG_B.id
    name                     = "blk102-102"
    from_                    = "102"
    to_                      = "102"
}

#------------------------------------------
# Add Node Block(s) to a Maintenance Group
#------------------------------------------

/*
API Information:
 - Class: "fabricNodeBlk"
 - Distinguished Name: "uni/fabric/maintgrp-MG_B/nodeblk-blk202-202"
GUI Location:
 - Admin > Firmware > Nodes > {Maintenance Group Name}
*/
resource "aci_maintenance_group_node" "Maintenance_Group_MG_B_Nodeblk_202" {
    depends_on  = [
        aci_pod_maintenance_group.Maintenance_Group_MG_B
    ]
    pod_maintenance_group_dn = aci_pod_maintenance_group.Maintenance_Group_MG_B.id
    name                     = "blk202-202"
    from_                    = "202"
    to_                      = "202"
}

