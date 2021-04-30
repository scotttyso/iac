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
resource "aci_maintenance_policy" "maintenance_policy_MG_B" {
    admin_st                = "untriggered"
    graceful                = "yes"
    ignore_compat           = "no"
    name                    = "MG_B"
    notif_cond              = "notifyOnlyOnFailures"
    run_mode                = "pauseOnlyOnFailures"
    version                 = "simsw-5.1(3e)"
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
resource "aci_pod_maintenance_group" "maintenance_group_MG_B" {
    depends_on                  = [
        aci_maintenance_policy.maintenance_policy_MG_B
    ]
    fwtype                      = "switch"
    name                        = "MG_B"
    pod_maintenance_group_type  = "range"
    relation_maint_rs_mgrpp     = aci_maintenance_policy.maintenance_policy_MG_B.id
}

