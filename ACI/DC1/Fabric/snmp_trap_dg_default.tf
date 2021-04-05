/*
API Information:
 - Class: "snmpGroup"
 - Distinguished Name: "uni/fabric/snmpgroup-default"
GUI Location:
 - Admin > External Data Collectors > Monitoring Destinations > SNMP > default
*/
resource "aci_rest" "snmp_trap_dest_grp_default" {
    path        = "/api/node/mo/uni/fabric/snmpgroup-default.json"
    class_name  = "snmpGroup"
    payload     = <<EOF
{
    "snmpGroup": {
        "attributes": {
            "dn": "uni/fabric/snmpgroup-default",
            "descr": "default SNMP Trap Destination Group created by the Terraform Startup Script",
            "name": "default"
        }
    }
}
    EOF
}

