#----------------------------------------------
# Create a Maintenance Group Policy
#----------------------------------------------

/*
API Information:
 - Class: "maintMaintP"
 - Distinguished Name: "uni/fabric/maintpol-MG_A"
GUI Location:
 - This is not available from the UI
*/
resource "aci_maintenance_policy" "Maintenance_Policy_MG_A" {
    admin_st                = "untriggered"
    graceful                = "yes"
    ignore_compat           = "no"
    name                    = "MG_A"
    notif_cond              = "notifyOnlyOnFailures"
    run_mode                = "pauseOnlyOnFailures"
    version                 = "n9000-15.2(3e)"
    version_check_override  = "untriggered"
}

#----------------------------------------------
# Create a Maintenance Group
#----------------------------------------------

/*
API Information:
 - Class: "maintMaintGrp"
 - Distinguished Name: "uni/fabric/maintgrp-MG_A"
GUI Location:
 - Admin > Firmware > Nodes > Actions > Create Update Group
*/
resource "aci_pod_maintenance_group" "Maintenance_Group_MG_A" {
    depends_on                  = [
        aci_maintenance_policy.Maintenance_Policy_MG_A
    ]
    fwtype                      = "switch"
    name                        = "MG_A"
    pod_maintenance_group_type  = "range"
    relation_maint_rs_mgrpp     = aci_maintenance_policy.Maintenance_Policy_MG_A.id
}

#------------------------------------------
# Add Node Block(s) to a Maintenance Group
#------------------------------------------

/*
API Information:
 - Class: "fabricNodeBlk"
 - Distinguished Name: "uni/fabric/maintgrp-MG_A/nodeblk-blk101-101"
GUI Location:
 - Admin > Firmware > Nodes > {Maintenance Group Name}
*/
resource "aci_maintenance_group_node" "Maintenance_Group_MG_A_Nodeblk_101" {
    depends_on  = [
        aci_pod_maintenance_group.Maintenance_Group_MG_A
    ]
    pod_maintenance_group_dn = aci_pod_maintenance_group.Maintenance_Group_MG_A.id
    name                     = "blk101-101"
    from_                    = "101"
    to_                      = "101"
}

#------------------------------------------
# Add Node Block(s) to a Maintenance Group
#------------------------------------------

/*
API Information:
 - Class: "fabricNodeBlk"
 - Distinguished Name: "uni/fabric/maintgrp-MG_A/nodeblk-blk201-201"
GUI Location:
 - Admin > Firmware > Nodes > {Maintenance Group Name}
*/
resource "aci_maintenance_group_node" "Maintenance_Group_MG_A_Nodeblk_201" {
    depends_on  = [
        aci_pod_maintenance_group.Maintenance_Group_MG_A
    ]
    pod_maintenance_group_dn = aci_pod_maintenance_group.Maintenance_Group_MG_A.id
    name                     = "blk201-201"
    from_                    = "201"
    to_                      = "201"
}

