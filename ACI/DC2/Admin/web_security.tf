/*
Admin > AAA > Security: Web Session Idle Timeout (s)
*/
resource "aci_rest" "web_security" {
	path       = "/api/node/mo/uni/userext.json"
	class_name = "aaaUserEp"
	payload    = <<EOF
{
	"aaaUserEp": {
		"attributes": {
			"dn": "uni/userext",
			"pwdStrengthCheck": "yes"
		},
		"children": [
			{
				"aaaPwdProfile": {
					"attributes": {
						"dn": "uni/userext/pwdprofile",
						"changeDuringInterval": "Enable",
						"noChangeInterval": "48",
						"changeCount": "2",
						"historyCount": "5"
					},
					"children": []
				}
			},
			{
				"aaaBlockLoginProfile": {
					"attributes": {
						"dn": "uni/userext/blockloginp",
						"enableLoginBlock": "disable",
						"maxFailedAttempts": "5",
						"maxFailedAttemptsWindow": "5",
						"blockDuration": "60"
					},
					"children": []
				}
			},
			{
				"pkiEp": {
					"attributes": {
						"dn": "uni/userext/pkiext"
					},
					"children": [
						{
							"pkiWebTokenData": {
								"attributes": {
									"dn": "uni/userext/pkiext/webtokendata",
									"webtokenTimeoutSeconds": "600",
									"maximumValidityPeriod": "24",
									"uiIdleTimeoutSeconds": "1200"
								},
								"children": []
							}
						}
					]
				}
			}
		]
	}
}
	EOF
}

