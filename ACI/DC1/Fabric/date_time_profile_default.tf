/*
API Information:
 - Class: "datetimePol"
 - Distinguished Name: "uni/fabric/time-default"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > Date and Time > Policy default
*/
resource "aci_rest" "date_and_time_default" {
    path           = "/api/node/mo/uni/fabric/time-default.json"
    class_name     = "datetimePol"
    payload        = <<EOF
{
    "datetimePol": {
        "attributes": {
            "adminSt": "enabled",
            "authSt": "disabled",
            "descr": "Default Date and Time Profile",
            "dn": "uni/fabric/time-default",
            "masterMode": "disabled",
            "name": "default",
            "serverState": "disabled",
        }
    }
}
    EOF
}

