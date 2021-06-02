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
            "contact": "cust-lab@example.com",
            "descr": "This is the default SNMP Policy",
            "dn": "uni/fabric/snmppol-default",
            "loc": "DC2",
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
 - Distinguished Name: "uni/fabric/snmppol-default/clgrp-/client-[198.18.1.61]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default > Client Group Policies: inband > Client Entries
*/
resource "aci_rest" "SNMP_Policy_default_Client_Group_inband_Client_198-18-1-61" {
    depends_on  = [
        aci_rest.SNMP_Policy_default,
        aci_rest.SNMP_Policy_default_Client_Group_inband
    ]
    path        = "/api/node/mo/uni/fabric/snmppol-default/clgrp-inband/client-[198.18.1.61].json"
    class_name  = "snmpClientP"
    payload     = <<EOF
{
    "snmpClientP": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default/clgrp-inband/client-[198.18.1.61]",
            "name": "snmp-server1",
            "addr": "198.18.1.61",
        },
        "children": []
    }
}
    EOF
}

/*
API Information:
 - Class: "snmpClientP"
 - Distinguished Name: "uni/fabric/snmppol-default/clgrp-/client-[198.18.1.62]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default > Client Group Policies: oob > Client Entries
*/
resource "aci_rest" "SNMP_Policy_default_Client_Group_oob_Client_198-18-1-62" {
    depends_on  = [
        aci_rest.SNMP_Policy_default,
        aci_rest.SNMP_Policy_default_Client_Group_oob
    ]
    path        = "/api/node/mo/uni/fabric/snmppol-default/clgrp-oob/client-[198.18.1.62].json"
    class_name  = "snmpClientP"
    payload     = <<EOF
{
    "snmpClientP": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default/clgrp-oob/client-[198.18.1.62]",
            "name": "snmp-server2",
            "addr": "198.18.1.62",
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
 - Class: "snmpUserP"
 - Distinguished Name: "uni/fabric/snmppol-default/user-cisco_user2"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default: SNMP V3 Users
*/
resource "aci_rest" "SNMP_Policy_default_V3_User_cisco_user2" {
    depends_on  = [
        aci_rest.SNMP_Policy_default
    ]
    path        = "/api/node/mo/uni/fabric/snmppol-default/user-cisco_user2.json"
    class_name  = "snmpUserP"
    payload     = <<EOF
{
    "snmpUserP": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default/user-cisco_user2",
            "name": "cisco_user2",
            "privType": "des",
            "privKey": "${var.Privacy_Key2}",
            "authKey": "${var.Authorization_Key2}"
        },
        "children": []
    }
}
    EOF
}

/*
API Information:
 - Class: "snmpUserP"
 - Distinguished Name: "uni/fabric/snmppol-default/user-cisco_user3"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default: SNMP V3 Users
*/
resource "aci_rest" "SNMP_Policy_default_V3_User_cisco_user3" {
    depends_on  = [
        aci_rest.SNMP_Policy_default
    ]
    path        = "/api/node/mo/uni/fabric/snmppol-default/user-cisco_user3.json"
    class_name  = "snmpUserP"
    payload     = <<EOF
{
    "snmpUserP": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default/user-cisco_user3",
            "name": "cisco_user3",
            "authType": "hmac-sha1-96",
            "authKey": "${var.Authorization_Key3}"
        },
        "children": []
    }
}
    EOF
}

/*
API Information:
 - Class: "snmpTrapFwdServerP"
 - Distinguished Name: "uni/fabric/snmppol-default/trapfwdserver-[198.18.1.61]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default: Trap Forward Servers
*/
resource "aci_rest" "SNMP_Policy_default_Trap_Server_198-18-1-61" {
    depends_on  = [
        aci_rest.SNMP_Policy_default
    ]
    path        = "/api/node/mo/uni/fabric/snmppol-default/trapfwdserver-[198.18.1.61].json"
    class_name  = "snmpTrapFwdServerP"
    payload     = <<EOF
{
    "snmpTrapFwdServerP": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default/trapfwdserver-[198.18.1.61]",
            "addr": "198.18.1.61",
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
 - Distinguished Name: "uni/fabric/snmppol-default/trapfwdserver-[198.18.1.62]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default: Trap Forward Servers
*/
resource "aci_rest" "SNMP_Policy_default_Trap_Server_198-18-1-62" {
    depends_on  = [
        aci_rest.SNMP_Policy_default
    ]
    path        = "/api/node/mo/uni/fabric/snmppol-default/trapfwdserver-[198.18.1.62].json"
    class_name  = "snmpTrapFwdServerP"
    payload     = <<EOF
{
    "snmpTrapFwdServerP": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default/trapfwdserver-[198.18.1.62]",
            "addr": "198.18.1.62",
            "port": "162"
        },
        "children": []
    }
}
    EOF
}

