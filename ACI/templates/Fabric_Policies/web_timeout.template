resource "aci_rest" "web_interface_timeout" {
	path       = "/api/node/mo/uni/userext/pkiext/webtokendata.json"
	class_name = "pkiWebTokenData"
	payload    = <<EOF
{
	"pkiWebTokenData": {
		"attributes": {
			"dn": "uni/userext/pkiext/webtokendata",
			"uiIdleTimeoutSeconds": "65525"
		},
		"children": []
	}
}
	EOF
}