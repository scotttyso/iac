/*
API Information:
 - Class: "syslogRemoteDest"
 - Distinguished Name: "uni/tn-mgmt/mgmtp-default/oob-default"
GUI Location:
 - Admin > External Data Collectors > Monitoring Destinations > Syslog > [Syslog Dest Group] > Create Syslog Remote Destination
*/
resource "aci_rest" "syslog_198-18-1-61" {
	path		= "/api/node/mo/uni/fabric/slgroup-/rdst-198.18.1.61.json"
	class_name	= "syslogRemoteDest"
	payload		= <<EOF
{
	"syslogRemoteDest": {
		"attributes": {
			"dn": "uni/fabric/slgroup-default/rdst-198.18.1.61",
			"host": "198.18.1.61",
			"name": "198.18.1.61",
			"forwardingFacility": "local7",
			"port": "514",
			"severity": "warnings",
			"rn": "rdst-198.18.1.61"
		},
		"children": [
			{
				"fileRsARemoteHostToEpg": {
					"attributes": {
						"tDn": "uni/tn-mgmt/mgmtp-default/oob-default"
					},
					"children": []
				}
			}
		]
	}
}
	EOF
}

