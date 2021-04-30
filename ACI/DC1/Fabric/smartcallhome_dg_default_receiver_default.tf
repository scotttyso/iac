/*
API Information:
 - Class: "callhomeSmartGroup"
 - Distinguished Name: "uni/fabric/smartgroup-default"
GUI Location:
 - Admin > External Data Collectors > Monitoring Destinations > Smart Callhome > default > default
*/
resource "aci_rest" "SmartCallHome_receiver_default" {
    depends_on  = [
        aci_rest.SmartCallHome_dg_default
    ]
    path        = "/api/node/mo/uni/fabric/smartgroup-default.json"
    class_name  = "callhomeSmartDest"
    payload     = <<EOF
{
    "callhomeSmartDest": {
        "attributes": {
            "dn": "uni/fabric/smartgroup-default/smartdest-default",
            "email": "network-ops@example.com",
            "format": "short-txt",
            "name": "default",
            "rfcCompliant": "no",
        },
        "children": []
    }
}
    EOF
}

