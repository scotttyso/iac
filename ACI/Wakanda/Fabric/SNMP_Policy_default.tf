/*
API Information:
 - Class: "snmpPol"
 - Distinguished Name: "uni/fabric/snmppol-default"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default
*/
resource "aci_rest" "SNMP_Policy_default" {
    path        = "/api/node/mo/uni/fabric/snmppol-default.json"
    class_name  = "snmpPol"
    payload     = <<EOF
{
    "snmpPol": {
        "attributes": {
            "adminSt": "enabled",
            "contact": "rich-lab@cisco.com",
            "descr": "This is the default SNMP Policy",
            "dn": "uni/fabric/snmppol-default",
            "loc": "Wakanda - Rack143A",
            "name": "default"
        },
        "children": []
    }
}
    EOF
}

/*
API Information:
 - Class: "snmpClientGrpP"
 - Distinguished Name: "uni/fabric/snmppol-default/clgrp-inband"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default: inband
*/
resource "aci_rest" "SNMP_Policy_default_Client_Group_inband" {
    depends_on  = [
        aci_rest.SNMP_Policy_default
    ]
    path        = "/api/node/mo/uni/fabric/snmppol-default/clgrp-inband.json"
    class_name  = "snmpClientGrpP"
    payload     = <<EOF
{
    "snmpClientGrpP": {
        "attributes": {
            "descr": "Inband Client Group",
            "dn": "uni/fabric/snmppol-default/clgrp-inband",
            "name": "inband",
        },
        "children": [
            {
                "snmpRsEpg": {
                    "attributes": {
                        "tDn": "${var.in_band}"
                    }
                }
            }
        ]
    }
}
    EOF
}

/*
API Information:
 - Class: "snmpClientGrpP"
 - Distinguished Name: "uni/fabric/snmppol-default/clgrp-oob"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default: oob
*/
resource "aci_rest" "SNMP_Policy_default_Client_Group_oob" {
    depends_on  = [
        aci_rest.SNMP_Policy_default
    ]
    path        = "/api/node/mo/uni/fabric/snmppol-default/clgrp-oob.json"
    class_name  = "snmpClientGrpP"
    payload     = <<EOF
{
    "snmpClientGrpP": {
        "attributes": {
            "descr": "Out-of-Band Client Group",
            "dn": "uni/fabric/snmppol-default/clgrp-oob",
            "name": "oob",
        },
        "children": [
            {
                "snmpRsEpg": {
                    "attributes": {
                        "tDn": "${var.out_of_band}"
                    }
                }
            }
        ]
    }
}
    EOF
}

/*
API Information:
 - Class: "snmpClientP"
 - Distinguished Name: "uni/fabric/snmppol-default/clgrp-/client-[10.101.128.24]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default > Client Group Policies: oob > Client Entries
*/
resource "aci_rest" "SNMP_Policy_default_Client_Group_oob_Client_10-101-128-24" {
    depends_on  = [
        aci_rest.SNMP_Policy_default,
        aci_rest.SNMP_Policy_default_Client_Group_oob
    ]
    path        = "/api/node/mo/uni/fabric/snmppol-default/clgrp-oob/client-[10.101.128.24].json"
    class_name  = "snmpClientP"
    payload     = <<EOF
{
    "snmpClientP": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default/clgrp-oob/client-[10.101.128.24]",
            "name": "lnx1",
            "addr": "10.101.128.24",
        },
        "children": []
    }
}
    EOF
}

/*
API Information:
 - Class: "snmpClientP"
 - Distinguished Name: "uni/fabric/snmppol-default/clgrp-/client-[10.101.128.25]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default > Client Group Policies: oob > Client Entries
*/
resource "aci_rest" "SNMP_Policy_default_Client_Group_oob_Client_10-101-128-25" {
    depends_on  = [
        aci_rest.SNMP_Policy_default,
        aci_rest.SNMP_Policy_default_Client_Group_oob
    ]
    path        = "/api/node/mo/uni/fabric/snmppol-default/clgrp-oob/client-[10.101.128.25].json"
    class_name  = "snmpClientP"
    payload     = <<EOF
{
    "snmpClientP": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default/clgrp-oob/client-[10.101.128.25]",
            "name": "lnx2",
            "addr": "10.101.128.25",
        },
        "children": []
    }
}
    EOF
}

/*
API Information:
 - Class: "snmpCommunityP"
 - Distinguished Name: "uni/fabric/snmppol-default/community-SNMP_Community1"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default > Community Policies
*/
resource "aci_rest" "SNMP_Policy_default_Community_SNMP_Community1" {
    depends_on  = [
        aci_rest.SNMP_Policy_default
    ]
    path        = "/api/node/mo/uni/fabric/snmppol-default/community-${var.SNMP_Community1}.json"
    class_name  = "snmpCommunityP"
    payload     = <<EOF
{
    "snmpCommunityP": {
        "attributes": {
            "descr": "Community String 1",
            "dn": "uni/fabric/snmppol-default/community-${var.SNMP_Community1}",
            "name": "${var.SNMP_Community1}",
        },
        "children": []
    }
}
    EOF
}

/*
API Information:
 - Class: "snmpCommunityP"
 - Distinguished Name: "uni/fabric/snmppol-default/community-SNMP_Community2"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default > Community Policies
*/
resource "aci_rest" "SNMP_Policy_default_Community_SNMP_Community2" {
    depends_on  = [
        aci_rest.SNMP_Policy_default
    ]
    path        = "/api/node/mo/uni/fabric/snmppol-default/community-${var.SNMP_Community2}.json"
    class_name  = "snmpCommunityP"
    payload     = <<EOF
{
    "snmpCommunityP": {
        "attributes": {
            "descr": "Community String 2",
            "dn": "uni/fabric/snmppol-default/community-${var.SNMP_Community2}",
            "name": "${var.SNMP_Community2}",
        },
        "children": []
    }
}
    EOF
}

/*
API Information:
 - Class: "snmpUserP"
 - Distinguished Name: "uni/fabric/snmppol-default/user-cisco_user1"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default: SNMP V3 Users
*/
resource "aci_rest" "SNMP_Policy_default_V3_User_cisco_user1" {
    depends_on  = [
        aci_rest.SNMP_Policy_default
    ]
    path        = "/api/node/mo/uni/fabric/snmppol-default/user-cisco_user1.json"
    class_name  = "snmpUserP"
    payload     = <<EOF
{
    "snmpUserP": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default/user-cisco_user1",
            "name": "cisco_user1",
            "privType": "aes-128",
            "privKey": "${var.Privacy_Key1}",
            "authType": "hmac-sha1-96",
            "authKey": "${var.Authorization_Key1}"
        },
        "children": []
    }
}
    EOF
}

/*
API Information:
 - Class: "snmpTrapFwdServerP"
 - Distinguished Name: "uni/fabric/snmppol-default/trapfwdserver-[10.101.128.24]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default: Trap Forward Servers
*/
resource "aci_rest" "SNMP_Policy_default_Trap_Server_10-101-128-24" {
    depends_on  = [
        aci_rest.SNMP_Policy_default
    ]
    path        = "/api/node/mo/uni/fabric/snmppol-default/trapfwdserver-[10.101.128.24].json"
    class_name  = "snmpTrapFwdServerP"
    payload     = <<EOF
{
    "snmpTrapFwdServerP": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default/trapfwdserver-[10.101.128.24]",
            "addr": "10.101.128.24",
            "port": "162"
        },
        "children": []
    }
}
    EOF
}

/*
API Information:
 - Class: "snmpTrapFwdServerP"
 - Distinguished Name: "uni/fabric/snmppol-default/trapfwdserver-[10.101.128.25]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default: Trap Forward Servers
*/
resource "aci_rest" "SNMP_Policy_default_Trap_Server_10-101-128-25" {
    depends_on  = [
        aci_rest.SNMP_Policy_default
    ]
    path        = "/api/node/mo/uni/fabric/snmppol-default/trapfwdserver-[10.101.128.25].json"
    class_name  = "snmpTrapFwdServerP"
    payload     = <<EOF
{
    "snmpTrapFwdServerP": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default/trapfwdserver-[10.101.128.25]",
            "addr": "10.101.128.25",
            "port": "162"
        },
        "children": []
    }
}
    EOF
}

