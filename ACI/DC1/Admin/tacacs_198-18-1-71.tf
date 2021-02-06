/*
API Information:
 - Class: "tacacsGroup"
 - Distinguished Name: "uni/fabric/tacacsgroup-TACACS_acct"
GUI Location:
 - Admin > External Data Collectors > Monitoring Destinations > TACACS > [TACACS Accounting Dest Group] > [TACACS Destinations]
*/
resource "aci_rest" "tacacs_TACACS_acct_198-18-1-71" {
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
API Information:
 - Class: "aaaTacacsPlusProvider"
 - Distinguished Name: "userext/tacacsext/tacacsplusprovider-198.18.1.71"
GUI Location:
 - Admin > AAA > Authentication:TACACS > Create TACACS Provider
*/
resource "aci_rest" "aaaTacacsPlusProvider_198-18-1-71" {
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
            "key": var.aaa_secret,
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
API Information:
 - Class: "aaaUserEp"
 - Distinguished Name: "uni/userext"
GUI Location:
 - Admin > AAA > Authentication:AAA > Login Domain
*/
resource "aci_rest" "Ext_Login_TACACS_prov-198-18-1-71" {
    depends_on  = [aci_rest.aaaTacacsPlusProvider_198-18-1-71]
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
                        "dn": "uni/userext/logindomain-ISEplus",
                        "name": "ISEplus",
                        "rn": "logindomain-ISEplus"
                    },
                    "children": [
                        {
                            "aaaDomainAuth": {
                                "attributes": {
                                    "dn": "uni/userext/logindomain-ISEplus/domainauth",
                                    "providerGroup": "ISEplus",
                                    "realm": "tacacs",
                                    "descr": "TACACS+ Login Domain ISEplus. Created by Terraform Wizard.",
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
                                    "dn": "uni/userext/tacacsext/tacacsplusprovidergroup-ISEplus"
                                },
                                "children": [
                                    {
                                        "aaaProviderRef": {
                                            "attributes": {
                                                "dn": "uni/userext/tacacsext/tacacsplusprovidergroup-ISEplus/providerref-198.18.1.71",
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

