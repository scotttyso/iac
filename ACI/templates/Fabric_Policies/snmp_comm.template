/*
API Information:
 - Class: "snmpCommunityP"
 - Distinguished Name: "uni/fabric/snmppol-default/community-{{SNMP_Community}}"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default > Community Policies
*/
resource "aci_rest" "snmp_comm_{{SNMP_Community}}" {
	path		= "/api/node/mo/uni/fabric/snmppol-default/community-{{SNMP_Community}}.json"
	class_name	= "snmpCommunityP"
	payload		= <<EOF
{
    "snmpCommunityP": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default/community-{{SNMP_Community}}",
{%- if Description %}
            "descr": "{{Description}}",{% endif %}
            "name": "{{SNMP_Community}}",
            "rn": "community-{{SNMP_Community}}"
        },
        "children": []
    }
}
	EOF
}