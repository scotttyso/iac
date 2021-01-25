/*
API Information:
 - Class: "snmpClientP"
 - Distinguished Name: "uni/fabric/snmppol-default/clgrp-Out-of-Band/client-[198.18.1.62]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default > Client Group Policies: Out-of-Band > Client Entries
*/
resource "aci_rest" "snmp_client_198-18-1-62" {
	depends_on  = [aci_rest.snmp_cg]
	path		= "/api/node/mo/uni/fabric/snmppol-default/clgrp-Out-of-Band/client-[198.18.1.62].json"
	class_name	= "snmpClientP"
	payload		= <<EOF
{
    "snmpClientP": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default/clgrp-Out-of-Band/client-[198.18.1.62]",
            "name": "snmp-server2",
            "addr": "198.18.1.62",
            "rn": "client-198.18.1.62"
        },
        "children": []
    }
}
	EOF
}

