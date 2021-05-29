#----------------------------------------------
# Create a Triggered Scheduler
#----------------------------------------------

/*
API Information:
 - Class: "trigSchedP"
 - Distinguished Name: "uni/fabric/schedp-Every24Hours"
GUI Location:
 - Admin > Schedulers > Fabric > Every24Hours
*/
resource "aci_trigger_scheduler" "Every24Hours" {
    description = "Backup Every 24 Hours"
    name  = "Every24Hours"
}

#----------------------------------------------------
# Assign a Recurring Window to the Trigger Scheduler
#----------------------------------------------------
/*
API Information:
 - Class: "trigRecurrWindowP"
 - Distinguished Name: "uni/fabric/schedp-Every24Hours/recurrwinp-Every24Hours"
GUI Location:
 - Admin > Schedulers > Fabric > Every24Hours > Recurring Window Every24Hours
*/
resource "aci_rest" "Every24Hours_Recurring_Window" {
    depends_on  = [
        aci_trigger_scheduler.Every24Hours
    ]
    path        = "/api/node/mo/uni/fabric/schedp-Every24Hours/recurrwinp-Every24Hours.json"
    class_name  = "trigRecurrWindowP"
    payload     = <<EOF
{
    "trigRecurrWindowP": {
        "attributes": {
            "concurCap": "unlimited",
            "day": "every-day",
            "dn": "uni/fabric/schedp-Every24Hours/recurrwinp-Every24Hours",
            "hour": "0",
            "minute": "15",
            "name": "Every24Hours",
        },
        "children": []
    }
}
    EOF
}

#----------------------------------------------------
# Create Configuration Export Policy
#----------------------------------------------------

/*
API Information:
 - Class: "configExportP"
 - Distinguished Name: "uni/fabric/configexp-DailyBackup"
GUI Location:
 - Admin > Import/Export > Export Policies > Configuration > DailyBackup
*/
resource "aci_configuration_export_policy" "DailyBackup_to_lnx2-rich-ciscolabs-com" {
    depends_on                              = [
        aci_rest.Remote_Location_lnx2-rich-ciscolabs-com,
        aci_trigger_scheduler.Every24Hours
    ]
    admin_st                                = "untriggered"
    description                             = "Daily Configuraton Export Policy"
    format                                  = "json"
    include_secure_fields                   = "yes"
    max_snapshot_count                      = "3"
    name                                    = "DailyBackup"
    snapshot                                = "yes"
    target_dn                               = aci_rest.Remote_Location_lnx2-rich-ciscolabs-com.id
    relation_config_rs_export_destination   = aci_rest.Remote_Location_lnx2-rich-ciscolabs-com.id
    # relation_trig_rs_triggerable            = "Unsure"
    relation_config_rs_remote_path          = aci_rest.Remote_Location_lnx2-rich-ciscolabs-com.id
    relation_config_rs_export_scheduler     = aci_trigger_scheduler.Every24Hours.id
}

