/*
API Information:
 - Class: "snmpUserP"
 - Distinguished Name: "uni/fabric/snmppol-default/user-{{SNMP_User}}"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default: SNMP V3 Users
*/
resource "aci_rest" "snmp_user_{{SNMP_User}}" {
	path		= "/api/node/mo/uni/fabric/snmppol-default/user-{{SNMP_User}}.json"
	class_name	= "snmpUserP"
	payload		= <<EOF
{
    "snmpUserP": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default/user-{{SNMP_User}}",
            "name": "{{SNMP_User}}",
{%- if Privacy_Type %}
            "privType": "{{Privacy_Type}}",
            "privKey": "{{Privacy_Key}}",{% endif %}
{%- if Authorization_Type %}
            "authType": "{{Authorization_Type}}",{% endif %}
            "authKey": "{{Authorization_Key}}"
        },
        "children": []
    }
}
	EOF
}