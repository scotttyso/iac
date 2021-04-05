/*
API Information:
 - Class: "mgmtConnectivityPrefs"
 - Distinguished Named "uni/fabric/connectivityPrefs"
GUI Location:
 - System > System Settings > APIC Connectivity Preferences
*/
resource "aci_rest" "APIC_Mgmt_Preference" {
    path       = "/api/node/mo/uni/fabric/connectivityPrefs.json"
    class_name = "mgmtConnectivityPrefs"
    payload    = <<EOF
{
    "mgmtConnectivityPrefs": {
        "attributes": {
            "dn": "uni/fabric/connectivityPrefs",
            "interfacePref": "ooband"
        }
    }
}
    EOF
}

