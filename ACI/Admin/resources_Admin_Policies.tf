/*
 This File will include Backup Policies, RADIUS, TACACS+ and Authentication Realm Policies
*/

/*
System > System Settings > Global AES Passphrase Ecryption Settings
*/
resource "aci_rest" "encryption_key" {
	path		= "/api/node/mo/uni/exportcryptkey.json"
	class_name	= "pkiExportEncryptionKey"
	payload		= <<EOF
{
    "pkiExportEncryptionKey": {
        "attributes": {
            "dn": "uni/exportcryptkey",
            "strongEncryptionEnabled": "true",
            "passphrase": "cisco123cisco123"
        },
        "children": []
    }
}
	EOF
}

/*
Admin > Import/Export > Remote Locations:[Remote Host]
*/
resource "aci_rest" "backup_lnx2_example_com" {
	path		= "/api/node/mo/uni/fabric/path-lnx2.example.com.json"
	class_name	= "fileRemotePath"
	payload		= <<EOF
{
    "fileRemotePath": {
        "attributes": {
            "dn": "uni/fabric/path-lnx2.example.com",
            "authType": "usePassword",
            "descr": "None",
            "host": "lnx2.example.com",
            "name": "lnx2.example.com",
            "protocol": "sftp",
            "remotePath": "/tmp",
            "remotePort": "22",
            "userName": "username",
            "userPasswd": "cisco123",
            "rn": "path-lnx2.example.com"
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

/*
Admin > Schedulers > Fabric > Every24Hours
*/
resource "aci_rest" "backup_scheduler" {
	path		= "/api/node/mo/uni/fabric/schedp-Every24Hours.json"
	class_name	= "trigSchedP"
	payload		= <<EOF
{
    "trigSchedP": {
        "attributes": {
            "dn": "uni/fabric/schedp-Every24Hours",
            "name": "Every24Hours",
            "descr": "Create Backups Every 24 Hours - Terraform Startup Script.",
            "rn": "schedp-Every24Hours"
        },
        "children": [
            {
                "trigRecurrWindowP": {
                    "attributes": {
                        "dn": "uni/fabric/schedp-Every24Hours/recurrwinp-Every24Hours",
                        "name": "Every24Hours",
                        "hour": "0",
                        "minute": "15",
                        "concurCap": "20",
                        "rn": "recurrwinp-Every24Hours"
                    },
                    "children": []
                }
            }
        ]
    }
}
	EOF
}

/*
Admin > Import/Export > Export Policies > Configuration > backup_every24Hours
*/
resource "aci_rest" "backup_Policy" {
	path		= "/api/node/mo/uni/fabric/configexp-backup_every24Hours.json"
	class_name	= "configExportP"
	payload		= <<EOF
{
    "configExportP": {
        "attributes": {
            "dn": "uni/fabric/configexp-backup_every24Hours",
            "adminSt": "triggered",
            "name": "backup_every24Hours",
            "descr": "Backup Configuration Every 24 Hours - Created by Terraform Startup Script",
            "rn": "configexp-backup_every24Hours"
        },
        "children": [
            {
                "configRsExportScheduler": {
                    "attributes": {
                        "tnTrigSchedPName": "Every24Hours"
                    },
                    "children": []
                }
            },
            {
                "configRsRemotePath": {
                    "attributes": {
                        "tnFileRemotePathName": "lnx2.example.com"
                    },
                    "children": []
                }
            }
        ]
    }
}
	EOF
}

/*
Admin > AAA > Authentication:RADIUS > Create RADIUS Provider
*/
resource "aci_rest" "aaaRadiusProvider_" {
	path		= "/api/node/mo/uni/userext/radiusext/radiusprovider-.json"
	class_name	= "aaaRadiusProvider"
	payload		= <<EOF
{
    "aaaRadiusProvider": {
        "attributes": {
            "dn": "uni/userext/radiusext/radiusprovider-",
            "timeout": "5",
            "retries": "5",
            "monitorServer": "disabled",
            "key": "cisco1231",
            "authProtocol": "pap",
            "name": "",
            "descr": "RADIUS Provider - .  Added by Terraform Startup Wizard.",
            "rn": "radiusprovider-"
        },
        "children": [
            {
                "aaaRsSecProvToEpg": {
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

/*
Admin > AAA > Authentication:AAA > Login Domain
*/
resource "aci_rest" "Ext_Login_RADIUS_prov-" {
	path		= "/api/node/mo/uni/userext.json"
	class_name	= "aaaUserEp"
	payload		= <<EOF
{
    "aaaUserEp": {
        "attributes": {
            "dn": "uni/userext"
        },
        "children": [
            {
                "aaaLoginDomain": {
                    "attributes": {
                        "dn": "uni/userext/logindomain-RAD_ISE",
                        "name": "RAD_ISE",
                        "rn": "logindomain-RAD_ISE"
                    },
                    "children": [
                        {
                            "aaaDomainAuth": {
                                "attributes": {
                                    "dn": "uni/userext/logindomain-RAD_ISE/domainauth",
                                    "providerGroup": "RAD_ISE",
                                    "realm": "radius",
                                    "descr": "RADIUS Login Domain RAD_ISE. Created by Terraform Wizard.",
                                    "rn": "domainauth"
                                },
                                "children": []
                            }
                        }
                    ]
                }
            },
            {
                "aaaRadiusEp": {
                    "attributes": {
                        "dn": "uni/userext/radiusext"
                    },
                    "children": [
                        {
                            "aaaRadiusProviderGroup": {
                                "attributes": {
                                    "dn": "uni/userext/radiusext/radiusprovidergroup-RAD_ISE"
                                },
                                "children": [
                                    {
                                        "aaaProviderRef": {
                                            "attributes": {
                                                "dn": "uni/userext/radiusext/radiusprovidergroup-RAD_ISE/providerref-",
                                                "order": "1",
                                                "name": "",
                                                "descr": "Added RADIUS Server  - Terraform Startup Wizard"
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
        ]
    }
}
	EOF
}

/*
Admin > AAA > Authentication:RADIUS > Create RADIUS Provider
*/
resource "aci_rest" "aaaRadiusProvider_" {
	path		= "/api/node/mo/uni/userext/radiusext/radiusprovider-.json"
	class_name	= "aaaRadiusProvider"
	payload		= <<EOF
{
    "aaaRadiusProvider": {
        "attributes": {
            "dn": "uni/userext/radiusext/radiusprovider-",
            "timeout": "5",
            "retries": "5",
            "monitorServer": "disabled",
            "key": "cisco123",
            "authProtocol": "pap",
            "name": "",
            "descr": "RADIUS Provider - .  Added by Terraform Startup Wizard.",
            "rn": "radiusprovider-"
        },
        "children": [
            {
                "aaaRsSecProvToEpg": {
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

/*
Admin > AAA > Authentication:AAA > Login Domain
*/
resource "aci_rest" "Ext_Login_RADIUS_prov-" {
	path		= "/api/node/mo/uni/userext.json"
	class_name	= "aaaUserEp"
	payload		= <<EOF
{
    "aaaUserEp": {
        "attributes": {
            "dn": "uni/userext"
        },
        "children": [
            {
                "aaaLoginDomain": {
                    "attributes": {
                        "dn": "uni/userext/logindomain-RAD_ISE",
                        "name": "RAD_ISE",
                        "rn": "logindomain-RAD_ISE"
                    },
                    "children": [
                        {
                            "aaaDomainAuth": {
                                "attributes": {
                                    "dn": "uni/userext/logindomain-RAD_ISE/domainauth",
                                    "providerGroup": "RAD_ISE",
                                    "realm": "radius",
                                    "descr": "RADIUS Login Domain RAD_ISE. Created by Terraform Wizard.",
                                    "rn": "domainauth"
                                },
                                "children": []
                            }
                        }
                    ]
                }
            },
            {
                "aaaRadiusEp": {
                    "attributes": {
                        "dn": "uni/userext/radiusext"
                    },
                    "children": [
                        {
                            "aaaRadiusProviderGroup": {
                                "attributes": {
                                    "dn": "uni/userext/radiusext/radiusprovidergroup-RAD_ISE"
                                },
                                "children": [
                                    {
                                        "aaaProviderRef": {
                                            "attributes": {
                                                "dn": "uni/userext/radiusext/radiusprovidergroup-RAD_ISE/providerref-",
                                                "order": "2",
                                                "name": "",
                                                "descr": "Added RADIUS Server  - Terraform Startup Wizard"
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
        ]
    }
}
	EOF
}

/*
Admin > External Data Collectors > Monitoring Destinations > TACACS > [TACACS Accounting Dest Group] > [TACACS Destinations]
*/
resource "aci_rest" "tacacs_TACACS_acct_198_18_1_71" {
	path		= "/api/node/mo/uni/fabric/tacacsgroup-TACACS_acct.json"
	class_name	= "tacacsGroup"
	payload		= <<EOF
{
    "tacacsGroup": {
        "attributes": {
            "dn": "uni/fabric/tacacsgroup-TACACS_acct",
            "descr": "TACACS Accounting Group TACACS_acct - Created by Terraform Startup Wizard",
            "name": "TACACS_acct",
            "rn": "tacacsgroup-TACACS_acct"
        },
        "children": [
            {
                "tacacsTacacsDest": {
                    "attributes": {
                        "dn": "uni/fabric/tacacsgroup-TACACS_acct/tacacsdest-198.18.1.71-port-49",
                        "authProtocol": "pap",
                        "host": "198.18.1.71",
                        "key": "cisco1231",
                        "rn": "tacacsdest-198.18.1.71-port-49"
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

/*
Fabric > Fabric Policies > Policies > Monitoring > Common Policies > Callhome/Smart Callhome/SNMP/Syslog/TACACS:TACACS > Create TACACS Source
*/
resource "aci_rest" "tacacsSrc" {
	path		= "/api/node/mo/uni/fabric/moncommon/tacacssrc-TACACS_Src.json"
	class_name	= "tacacsSrc"
	payload		= <<EOF
{
    "tacacsSrc": {
        "attributes": {
            "dn": "uni/fabric/moncommon/tacacssrc-TACACS_Src",
            "name": "TACACS_Src",
            "rn": "tacacssrc-TACACS_Src"
        },
        "children": [
            {
                "tacacsRsDestGroup": {
                    "attributes": {
                        "tDn": "uni/fabric/tacacsgroup-TACACS_acct"
                    },
                    "children": []
                }
            }
        ]
    }
}
	EOF
}

/*
Admin > AAA > Authentication:TACACS > Create TACACS Provider
*/
resource "aci_rest" "aaaTacacsPlusProvider_198_18_1_71" {
	path		= "/api/node/mo/uni/userext/tacacsext/tacacsplusprovider-198.18.1.71.json"
	class_name	= "aaaTacacsPlusProvider"
	payload		= <<EOF
{
    "aaaTacacsPlusProvider": {
        "attributes": {
            "dn": "uni/userext/tacacsext/tacacsplusprovider-198.18.1.71",
            "timeout": "5",
            "retries": "5",
            "monitorServer": "disabled",
            "key": "cisco1231",
            "authProtocol": "pap",
            "port": "49",
            "name": "198.18.1.71",
            "descr": "TACACS+ Provider - 198.18.1.71.  Added by Terraform Startup Wizard.",
            "rn": "tacacsplusprovider-198.18.1.71"
        },
        "children": [
            {
                "aaaRsSecProvToEpg": {
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

/*
Admin > AAA > Authentication:AAA > Login Domain
*/
resource "aci_rest" "Ext_Login_TACACS_prov-198_18_1_71" {
	path		= "/api/node/mo/uni/userext.json"
	class_name	= "aaaUserEp"
	payload		= <<EOF
{
    "aaaUserEp": {
        "attributes": {
            "dn": "uni/userext"
        },
        "children": [
            {
                "aaaLoginDomain": {
                    "attributes": {
                        "dn": "uni/userext/logindomain-ISE",
                        "name": "ISE",
                        "rn": "logindomain-ISE"
                    },
                    "children": [
                        {
                            "aaaDomainAuth": {
                                "attributes": {
                                    "dn": "uni/userext/logindomain-ISE/domainauth",
                                    "providerGroup": "ISE",
                                    "realm": "tacacs",
                                    "descr": "TACACS+ Login Domain ISE. Created by Terraform Wizard.",
                                    "rn": "domainauth"
                                },
                                "children": []
                            }
                        }
                    ]
                }
            },
            {
                "aaaTacacsPlusEp": {
                    "attributes": {
                        "dn": "uni/userext/tacacsext"
                    },
                    "children": [
                        {
                            "aaaTacacsPlusProviderGroup": {
                                "attributes": {
                                    "dn": "uni/userext/tacacsext/tacacsplusprovidergroup-ISE"
                                },
                                "children": [
                                    {
                                        "aaaProviderRef": {
                                            "attributes": {
                                                "dn": "uni/userext/tacacsext/tacacsplusprovidergroup-ISE/providerref-198.18.1.71",
                                                "order": "1",
                                                "name": "198.18.1.71",
                                                "descr": "Added TACACS Server 198.18.1.71 - Terraform Startup Wizard"
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
        ]
    }
}
	EOF
}

/*
Admin > External Data Collectors > Monitoring Destinations > TACACS > [TACACS Accounting Dest Group] > [TACACS Destinations]
*/
resource "aci_rest" "tacacs_TACACS_acct_198_18_1_72" {
	path		= "/api/node/mo/uni/fabric/tacacsgroup-TACACS_acct.json"
	class_name	= "tacacsGroup"
	payload		= <<EOF
{
    "tacacsGroup": {
        "attributes": {
            "dn": "uni/fabric/tacacsgroup-TACACS_acct",
            "descr": "TACACS Accounting Group TACACS_acct - Created by Terraform Startup Wizard",
            "name": "TACACS_acct",
            "rn": "tacacsgroup-TACACS_acct"
        },
        "children": [
            {
                "tacacsTacacsDest": {
                    "attributes": {
                        "dn": "uni/fabric/tacacsgroup-TACACS_acct/tacacsdest-198.18.1.72-port-49",
                        "authProtocol": "pap",
                        "host": "198.18.1.72",
                        "key": "cisco123",
                        "rn": "tacacsdest-198.18.1.72-port-49"
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

/*
Fabric > Fabric Policies > Policies > Monitoring > Common Policies > Callhome/Smart Callhome/SNMP/Syslog/TACACS:TACACS > Create TACACS Source
*/
resource "aci_rest" "tacacsSrc" {
	path		= "/api/node/mo/uni/fabric/moncommon/tacacssrc-TACACS_Src.json"
	class_name	= "tacacsSrc"
	payload		= <<EOF
{
    "tacacsSrc": {
        "attributes": {
            "dn": "uni/fabric/moncommon/tacacssrc-TACACS_Src",
            "name": "TACACS_Src",
            "rn": "tacacssrc-TACACS_Src"
        },
        "children": [
            {
                "tacacsRsDestGroup": {
                    "attributes": {
                        "tDn": "uni/fabric/tacacsgroup-TACACS_acct"
                    },
                    "children": []
                }
            }
        ]
    }
}
	EOF
}

/*
Admin > AAA > Authentication:TACACS > Create TACACS Provider
*/
resource "aci_rest" "aaaTacacsPlusProvider_198_18_1_72" {
	path		= "/api/node/mo/uni/userext/tacacsext/tacacsplusprovider-198.18.1.72.json"
	class_name	= "aaaTacacsPlusProvider"
	payload		= <<EOF
{
    "aaaTacacsPlusProvider": {
        "attributes": {
            "dn": "uni/userext/tacacsext/tacacsplusprovider-198.18.1.72",
            "timeout": "5",
            "retries": "5",
            "monitorServer": "disabled",
            "key": "cisco123",
            "authProtocol": "pap",
            "port": "49",
            "name": "198.18.1.72",
            "descr": "TACACS+ Provider - 198.18.1.72.  Added by Terraform Startup Wizard.",
            "rn": "tacacsplusprovider-198.18.1.72"
        },
        "children": [
            {
                "aaaRsSecProvToEpg": {
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

/*
Admin > AAA > Authentication:AAA > Login Domain
*/
resource "aci_rest" "Ext_Login_TACACS_prov-198_18_1_72" {
	path		= "/api/node/mo/uni/userext.json"
	class_name	= "aaaUserEp"
	payload		= <<EOF
{
    "aaaUserEp": {
        "attributes": {
            "dn": "uni/userext"
        },
        "children": [
            {
                "aaaLoginDomain": {
                    "attributes": {
                        "dn": "uni/userext/logindomain-ISE",
                        "name": "ISE",
                        "rn": "logindomain-ISE"
                    },
                    "children": [
                        {
                            "aaaDomainAuth": {
                                "attributes": {
                                    "dn": "uni/userext/logindomain-ISE/domainauth",
                                    "providerGroup": "ISE",
                                    "realm": "tacacs",
                                    "descr": "TACACS+ Login Domain ISE. Created by Terraform Wizard.",
                                    "rn": "domainauth"
                                },
                                "children": []
                            }
                        }
                    ]
                }
            },
            {
                "aaaTacacsPlusEp": {
                    "attributes": {
                        "dn": "uni/userext/tacacsext"
                    },
                    "children": [
                        {
                            "aaaTacacsPlusProviderGroup": {
                                "attributes": {
                                    "dn": "uni/userext/tacacsext/tacacsplusprovidergroup-ISE"
                                },
                                "children": [
                                    {
                                        "aaaProviderRef": {
                                            "attributes": {
                                                "dn": "uni/userext/tacacsext/tacacsplusprovidergroup-ISE/providerref-198.18.1.72",
                                                "order": "2",
                                                "name": "198.18.1.72",
                                                "descr": "Added TACACS Server 198.18.1.72 - Terraform Startup Wizard"
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
        ]
    }
}
	EOF
}

resource "aci_rest" "auth-realm_console" {
	path		= "/api/node/mo/uni/userext/authrealm.json"
	class_name	= "aaaAuthRealm"
	payload		= <<EOF
{
    "aaaAuthRealm": {
        "attributes": {
            "dn": "uni/userext/authrealm"
        },
        "children": [
            {
                "{child_class}}": {
                    "attributes": {
                        "dn": "uni/userext/authrealm/consoleauth",
                        "realm": "tacacs",
                        "providerGroup": "ISE"
                    },
                    "children": []
                }
            }
        ]
    }
}
	EOF
}

resource "aci_rest" "auth-realm_default" {
	path		= "/api/node/mo/uni/userext/authrealm.json"
	class_name	= "aaaAuthRealm"
	payload		= <<EOF
{
    "aaaAuthRealm": {
        "attributes": {
            "dn": "uni/userext/authrealm"
        },
        "children": [
            {
                "{child_class}}": {
                    "attributes": {
                        "dn": "uni/userext/authrealm/defaultauth",
                        "realm": "local",
                        "providerGroup": ""
                    },
                    "children": []
                }
            }
        ]
    }
}
	EOF
}

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

