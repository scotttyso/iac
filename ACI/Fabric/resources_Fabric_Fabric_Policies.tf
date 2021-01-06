/*
 This File will include DNS, Domain, NTP, SmartCallHome,
 SNMP, Syslog and other Fabric Policy Configurations
*/

resource "aci_rest" "dns_epg_oob-default" {
	path		= "/api/node/mo/uni/fabric/dnsp-default.json"
	class_name	= "dnsRsProfileToEpg"
	payload		= <<EOF
{
    "dnsRsProfileToEpg": {
        "attributes": {
            "tDn": "uni/tn-mgmt/mgmtp-default/oob-default"
        },
        "children": []
    }
}
	EOF
}

resource "aci_rest" "dns_198_18_1_52" {
	path		= "/api/node/mo/uni/fabric/dnsp-default/prov-[198.18.1.52].json"
	class_name	= "dnsProv"
	payload		= <<EOF
{
    "dnsProv": {
        "attributes": {
            "dn": "uni/fabric/dnsp-default/prov-[198.18.1.52]",
            "addr": "198.18.1.52",
            "preferred": "yes",
            "rn": "prov-[198.18.1.52]"
        },
        "children": []
    }
}
	EOF
}

resource "aci_rest" "dns_198_18_1_51" {
	path		= "/api/node/mo/uni/fabric/dnsp-default/prov-[198.18.1.51].json"
	class_name	= "dnsProv"
	payload		= <<EOF
{
    "dnsProv": {
        "attributes": {
            "dn": "uni/fabric/dnsp-default/prov-[198.18.1.51]",
            "addr": "198.18.1.51",
            "preferred": "no",
            "rn": "prov-[198.18.1.51]"
        },
        "children": []
    }
}
	EOF
}

resource "aci_rest" "domain_cisco_com" {
	path		= "/api/node/mo/uni/fabric/dnsp-default/dom-[cisco.com].json"
	class_name	= "dnsDomain"
	payload		= <<EOF
{
    "dnsDomain": {
        "attributes": {
            "dn": "uni/fabric/dnsp-default/dom-[cisco.com]",
            "name": "cisco.com",
            "isDefault": "no",
            "rn": "dom-[cisco.com]"
        },
        "children": []
    }
}
	EOF
}

resource "aci_rest" "domain_rich_ciscolabs_com" {
	path		= "/api/node/mo/uni/fabric/dnsp-default/dom-[rich.ciscolabs.com].json"
	class_name	= "dnsDomain"
	payload		= <<EOF
{
    "dnsDomain": {
        "attributes": {
            "dn": "uni/fabric/dnsp-default/dom-[rich.ciscolabs.com]",
            "name": "rich.ciscolabs.com",
            "isDefault": "yes",
            "rn": "dom-[rich.ciscolabs.com]"
        },
        "children": []
    }
}
	EOF
}

resource "aci_rest" "ntp_198_18_1_52" {
	path		= "/api/node/mo/uni/fabric/time-default/ntpprov-198.18.1.52.json"
	class_name	= "datetimeNtpProv"
	payload		= <<EOF
{
    "datetimeNtpProv": {
        "attributes": {
            "dn": "uni/fabric/time-default/ntpprov-198.18.1.52",
            "name": "198.18.1.52",
            "preferred": "true",
            "rn": "ntpprov-198.18.1.52"
        },
        "children": [
            {
                "datetimeRsNtpProvToEpg": {
                    "attributes": {
                        "tDn": "uni/tn-mgmt/mgmtp-default/oob-default"
                    }
                }
            }
        ]
    }
}
	EOF
}

resource "aci_rest" "ntp_198_18_1_51" {
	path		= "/api/node/mo/uni/fabric/time-default/ntpprov-198.18.1.51.json"
	class_name	= "datetimeNtpProv"
	payload		= <<EOF
{
    "datetimeNtpProv": {
        "attributes": {
            "dn": "uni/fabric/time-default/ntpprov-198.18.1.51",
            "name": "198.18.1.51",
            "preferred": "false",
            "rn": "ntpprov-198.18.1.51"
        },
        "children": [
            {
                "datetimeRsNtpProvToEpg": {
                    "attributes": {
                        "tDn": "uni/tn-mgmt/mgmtp-default/oob-default"
                    }
                }
            }
        ]
    }
}
	EOF
}

resource "aci_rest" "SmartCallHome_dg" {
	path		= "/api/node/mo/uni/fabric/smartgroup-SmartCallHome_dg.json"
	class_name	= "callhomeSmartGroup"
	payload		= <<EOF
{
    "callhomeSmartGroup": {
        "attributes": {
            "dn": "uni/fabric/smartgroup-SmartCallHome_dg",
            "name": "SmartCallHome_dg",
            "rn": "smartgroup-SmartCallHome_dg"
        },
        "children": [
            {
                "callhomeProf": {
                    "attributes": {
                        "dn": "uni/fabric/smartgroup-SmartCallHome_dg/prof",
                        "port": "25",
                        "from": "cust-aci-fabric@example.com",
                        "replyTo": "network-ops@example.com",
                        "email": "network-ops@example.com",
                        "phone": "+1 408-555-5555",
                        "contact": "25",
                        "addr": "5555 Some Streat Some City, CA 95000",
                        "contract": "5555555",
                        "customer": "5555555",
                        "site": "555555",
                        "rn": "prof"
                    },
                    "children": [
                        {
                            "callhomeSmtpServer": {
                                "attributes": {
                                    "dn": "uni/fabric/smartgroup-SmartCallHome_dg/prof/smtp",
                                    "host": "cisco-smtp.example.com",
                                    "rn": "smtp"
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
                    ]
                }
            },
            {
                "callhomeSmartDest": {
                    "attributes": {
                        "dn": "uni/fabric/smartgroup-SmartCallHome_dg/smartdest-SCH_Receiver",
                        "name": "SCH_Receiver",
                        "email": "network-ops@example.com,
                        "format": "short-txt",
                        "rn": "smartdest-SCH_Receiver"
                    },
                    "children": []
                }
            }
        ]
    }
}
	EOF
}

resource "aci_rest" "callhomeSmartSrc" {
	path		= "/api/node/mo/uni/infra/moninfra-default/smartchsrc.json"
	class_name	= "callhomeSmartSrc"
	payload		= <<EOF
{
    "callhomeSmartSrc": {
        "attributes": {
            "dn": "uni/infra/moninfra-default/smartchsrc",
            "rn": "smartchsrc"
        },
        "children": [
            {
                "callhomeRsSmartdestGroup": {
                    "attributes": {
                        "tDn": "uni/fabric/smartgroup-SmartCallHome_dg"
                    },
                    "children": []
                }
            }
        ]
    }
}
	EOF
}

resource "aci_rest" "snmp_client_198_18_1_62" {
	depends_on		= [aci_rest.snmp_cg]
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

resource "aci_rest" "snmp_client_198_18_1_61" {
	depends_on		= [aci_rest.snmp_cg]
	path		= "/api/node/mo/uni/fabric/snmppol-default/clgrp-Out-of-Band/client-[198.18.1.61].json"
	class_name	= "snmpClientP"
	payload		= <<EOF
{
    "snmpClientP": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default/clgrp-Out-of-Band/client-[198.18.1.61]",
            "name": "snmp-server1",
            "addr": "198.18.1.61",
            "rn": "client-198.18.1.61"
        },
        "children": []
    }
}
	EOF
}

resource "aci_rest" "snmp_comm_will-this-work" {
	path		= "/api/node/mo/uni/fabric/snmppol-default/community-will-this-work.json"
	class_name	= "snmpCommunityP"
	payload		= <<EOF
{
    "snmpCommunityP": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default/community-will-this-work",
            "descr": "Community String 2",
            "name": "will-this-work",
            "rn": "community-will-this-work"
        },
        "children": []
    }
}
	EOF
}

resource "aci_rest" "snmp_comm_will-this-work" {
	path		= "/api/node/mo/uni/fabric/snmppol-default/community-will-this-work.json"
	class_name	= "snmpCommunityP"
	payload		= <<EOF
{
    "snmpCommunityP": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default/community-will-this-work",
            "descr": "Community String 2",
            "name": "will-this-work",
            "rn": "community-will-this-work"
        },
        "children": []
    }
}
	EOF
}

resource "aci_rest" "snmp_info" {
	path		= "/api/node/mo/uni/fabric/snmppol-default.json"
	class_name	= "snmpPol"
	payload		= <<EOF
{
    "snmpPol": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default",
            "descr": "This is the default SNMP Policy",
            "adminSt": "enabled",
            "contact": "rich-lab@cisco.com",
            "loc": "Richfield Ohio"
        },
        "children": []
    }
}
	EOF
}

resource "aci_rest" "snmp_trap_default_198_18_1_62" {
	path		= "/api/node/mo/uni/fabric/snmppol-default/trapfwdserver-[198.18.1.62].json"
	class_name	= "snmpTrapFwdServerP"
	payload		= <<EOF
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

resource "aci_rest" "snmp_trap_dest_198_18_1_62" {
	path		= "/api/node/mo/uni/fabric/snmpgroup-SNMP-TRAP_dg.json"
	class_name	= "snmpGroup"
	payload		= <<EOF
{
    "snmpGroup": {
        "attributes": {
            "dn": "uni/fabric/snmpgroup-SNMP-TRAP_dg",
            "descr": "SNMP Trap Destination Group - Created by Terraform Startup Script",
            "name": "SNMP-TRAP_dg",
            "rn": "snmpgroup-SNMP-TRAP_dg"
        },
        "children": [
            {
                "snmpTrapDest": {
                    "attributes": {
                        "dn": "uni/fabric/snmpgroup-SNMP-TRAP_dg/trapdest-198.18.1.62-port-162",
                        "ver": "v3",
                        "host": "198.18.1.62",
                        "port": "162",
                        "secName": "read_access",
                        "v3SecLvl": "priv",
                        "rn": "trapdest-198.18.1.62-port-162"
                    },
                    "children": [
                        {
                            "fileRsARemoteHostToEpg": {
                                "attributes": {
                                    "tDn": "uni/tn-mgmt/mgmtp-default/oob-default"
                                }
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

resource "aci_rest" "snmp_trap_default_198_18_1_61" {
	path		= "/api/node/mo/uni/fabric/snmppol-default/trapfwdserver-[198.18.1.61].json"
	class_name	= "snmpTrapFwdServerP"
	payload		= <<EOF
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

resource "aci_rest" "snmp_trap_dest_198_18_1_61" {
	path		= "/api/node/mo/uni/fabric/snmpgroup-SNMP-TRAP_dg.json"
	class_name	= "snmpGroup"
	payload		= <<EOF
{
    "snmpGroup": {
        "attributes": {
            "dn": "uni/fabric/snmpgroup-SNMP-TRAP_dg",
            "descr": "SNMP Trap Destination Group - Created by Terraform Startup Script",
            "name": "SNMP-TRAP_dg",
            "rn": "snmpgroup-SNMP-TRAP_dg"
        },
        "children": [
            {
                "snmpTrapDest": {
                    "attributes": {
                        "dn": "uni/fabric/snmpgroup-SNMP-TRAP_dg/trapdest-198.18.1.61-port-162",
                        "ver": "v2c",
                        "host": "198.18.1.61",
                        "port": "162",
                        "secName": "read_access",
                        "v3SecLvl": "noauth",
                        "rn": "trapdest-198.18.1.61-port-162"
                    },
                    "children": [
                        {
                            "fileRsARemoteHostToEpg": {
                                "attributes": {
                                    "tDn": "uni/tn-mgmt/mgmtp-default/oob-default"
                                }
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

resource "aci_rest" "snmp_user_cisco_user3" {
	path		= "/api/node/mo/uni/fabric/snmppol-default/user-cisco_user3.json"
	class_name	= "snmpUserP"
	payload		= <<EOF
{
    "snmpUserP": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default/user-cisco_user3",
            "name": "cisco_user3",
            "privType": "none",
            "privKey": "",
            "authType": "hmac-sha1-96",
            "authKey": "cisco123"
        },
        "children": []
    }
}
	EOF
}

resource "aci_rest" "snmp_user_cisco_user2" {
	path		= "/api/node/mo/uni/fabric/snmppol-default/user-cisco_user2.json"
	class_name	= "snmpUserP"
	payload		= <<EOF
{
    "snmpUserP": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default/user-cisco_user2",
            "name": "cisco_user2",
            "privType": "des",
            "privKey": "cisco123",
            "authKey": "cisco123"
        },
        "children": []
    }
}
	EOF
}

resource "aci_rest" "snmp_user_cisco_user1" {
	path		= "/api/node/mo/uni/fabric/snmppol-default/user-cisco_user1.json"
	class_name	= "snmpUserP"
	payload		= <<EOF
{
    "snmpUserP": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default/user-cisco_user1",
            "name": "cisco_user1",
            "privType": "aes-128",
            "privKey": "cisco123",
            "authType": "hmac-sha1-96",
            "authKey": "cisco123"
        },
        "children": []
    }
}
	EOF
}

resource "aci_rest" "syslog_dg_default" {
	path		= "/api/node/mo/uni/fabric/slgroup-default.json"
	class_name	= "syslogGroup"
	payload		= <<EOF
{
	"syslogGroup": {
		"attributes": {
			"dn": "uni/fabric/slgroup-default",
			"name": "default",
            "format": "aci",
			"includeMilliSeconds": "true",
			"includeTimeZone": "true",
			"descr": "Default Syslog Destination Group.  Created by Terraform Startup Script",
			"rn": "slgroup-default"
		},
		"children": [
			{
				"syslogConsole": {
					"attributes": {
						"dn": "uni/fabric/slgroup-default/console",
                        "adminState": "enabled",
                        "severity": "critical",
                        "rn": "console"
					},
					"children": []
				}
			},
			{
				"syslogFile": {
					"attributes": {
						"dn": "uni/fabric/slgroup-default/file",
                        "adminState": "enabled",
                        "severity": "information",
                        "rn": "file"
					},
					"children": []
				}
			},
			{
				"syslogProf": {
					"attributes": {
						"dn": "uni/fabric/slgroup-default/prof",
						"rn": "prof"
					},
					"children": []
				}
			}
		]
	}
}
	EOF
}

resource "aci_rest" "syslog_Src_" {
	path		= "/api/node/mo/uni/fabric/moncommon/slsrc-.json"
	class_name	= "syslogSrc"
	payload		= <<EOF
{
	"syslogSrc": {
		"attributes": {
			"dn": "uni/fabric/moncommon/slsrc-",
			"name": "",
			"incl": "faults",
            "minSev": "information",
			"rn": "slsrc-",
		},
		"children": [
			{
				"syslogRsDestGroup": {
					"attributes": {
						"tDn": "uni/fabric/slgroup-",
					},
					"children": []
				}
			}
		]
	}
}
	EOF
}

resource "aci_rest" "syslog_198_18_1_61" {
	path		= "/api/node/mo/uni/fabric/slgroup-default/rdst-198.18.1.61.json"
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

