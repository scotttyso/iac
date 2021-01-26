/*
- This Resource File will create Recommended Default Policies for Admin Policies
- Need the vars_Admin.tf File for Variable Definitions
*/

/*
Create Pod Maintenance Groups
Admin > Firmware > Nodes > Actions > Create Update Group
 - Maintance Group
 - Firmware Group
*/
resource "aci_pod_maintenance_group" "default" {
	for_each    = var.admin_maintgroup
    name  = each.value.name
    fwtype  = each.value.fwtype
}

resource "aci_firmware_group" "default" {
	for_each   			= var.admin_fwg
	name       			= each.value.name
	firmware_group_type = each.value.firmware_group_type
}
