/*
- This Resource File will create Recommended Default Policies for Admin Policies
- Need the vars_Admin.tf File for Variable Definitions
*/

/*
Create Pod Maintenance Groups
 - Maintance Group
 - Firmware Group

API Information:
 - Class: "maintMaintP"
 - Distinguished Name: "uni/fabric/maintpol-{name}"
GUI Location:
 - Admin > Firmware > Nodes > Actions > Create Update Group
*/
resource "aci_pod_maintenance_group" "default" {
	for_each    = var.admin_maintgroup
    name  = each.value.name
    fwtype  = each.value.fwtype
}
 
/*
API Information:
 - Class: "firmwareFwGrp"
 - Distinguished Name: "uni/fabric/fwgrp-{name}"
GUI Location:
 - Admin > Firmware > Nodes > Actions > Create Update Group
*/
resource "aci_firmware_group" "default" {
	for_each   			= var.admin_fwg
	name       			= each.value.name
	firmware_group_type = each.value.firmware_group_type
}
