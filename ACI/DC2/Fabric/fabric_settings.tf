/*
- This Resource File will create Recommended Default Policies Based on the Best Practice Wizard and additional Best Practices
*/

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

/*
API Information:
 - Class: "coopPol"
 - Distinguished Named "uni/fabric/pol-default"
GUI Location:
 - System > System Settings > Coop Group > Type
*/
resource "aci_rest" "Coop_Group" {
    path       = "/api/node/mo/uni/fabric/pol-default.json"
    class_name = "coopPol"
    payload    = <<EOF
{
    "coopPol": {
        "attributes": {
            "dn": "uni/fabric/pol-default",
            "type": "strict"
        }
    }
}
    EOF
}

/*
API Information:
 - Class: "fabricNodeControl"
 - Distinguished Named "uni/fabric/nodecontrol-default"
GUI Location:
 - Fabric > Fabric Policies > Policies > Monitoring > Fabric Node Controls > default
*/
resource "aci_rest" "Fabric_Node_Control" {
    path       = "/api/node/mo/uni/fabric/nodecontrol-default.json"
    class_name = "fabricNodeControl"
    payload    = <<EOF
{
    "fabricNodeControl": {
        "attributes": {
            "control": "1",
            "descr": "Configured by Terraform",
            "dn": "uni/fabric/nodecontrol-default",
            "featureSel": "telemetry",
            "name": "default"
        }
    }
}
    EOF
}

/*
API Information:
 - Class: "l3IfPol"
 - Distinguished Named "uni/fabric/l3IfP-default"
GUI Location:
 - Fabric > Fabric Policies > Policies > L3 Interface > default
*/
resource "aci_rest" "L3_Intf_Policy" {
    path       = "/api/node/mo/uni/fabric/l3IfP-default.json"
    class_name = "l3IfPol"
    payload    = <<EOF
{
    "l3IfPol": {
        "attributes": {
            "bfdIsis": "enabled",
            "descr": "Fabric/Underlay BFD Policy to enable BFD on Fabric Uplinks",
            "dn": "uni/fabric/l3IfP-default",
            "name": "default",
            "nameAlias": "None"
        }
    }
}
    EOF
}

/*
API Information:
 - Class: "qosInstPol"
 - Distinguished Name: "uni/infra/qosinst-default"
GUI Location:
 - Fabric > Access Policies > Policies > Global > QOS Class

*/
resource "aci_rest" "Preserve_CoS" {
    path       = "/api/node/mo/uni/infra/qosinst-default.json"
    class_name = "qosInstPol"
    payload    = <<EOF
{
    "qosInstPol": {
        "attributes": {
            "dn": "uni/infra/qosinst-default",
            "ctrl": "dot1p-preserve"
        }
    }
}
    EOF
}

