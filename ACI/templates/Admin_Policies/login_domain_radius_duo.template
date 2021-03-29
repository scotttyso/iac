#----------------------------------------------
# Create a Login Domain
#----------------------------------------------

/*
API Information:
 - Class: "aaaUserEp"
 - Distinguished Name: "uni/userext"
GUI Location:
 - Admin > AAA > Authentication:AAA > Login Domain
*/
# strength (true|false)
# realm (ldap|local|radius|rsa|saml|tacacs)
# realmsubtype (default|duo)
# auto   1ull   Uses push or phone notification   NO COMMENTS
# push   2ull   Push notification on DuoMobile app   NO COMMENTS
# phone   4ull   Call the user phone   NO COMMENTS
# passcode   8ull   Use a passcode generated on DuoMobile app   NO COMMENTS
# DEFAULT   auto(1ull)   Uses push or phone notification   NO COMMENTS
resource "aci_rest" "login_domain" {
  for_each   = local.login_domain
  path       = "/api/node/mo/uni/userext.json"
  class_name = "aaaUserEp"
  payload    = <<EOF
{
  "aaaUserEp": {
    "attributes": {
      "dn": "uni/userext",
    },
    "children": [
      {
        "aaaDuoEp": {
          "attributes": {
            "dn": "uni/userext/duoext",
          },
          "children": [
            {
              "aaaDuoProviderGroup": {
                "attributes": {
                  "dn": "uni/userext/duoext/duoprovidergroup-xyz",
                  "providerType": "radius"
                },
                "children": [
                  {
                    "aaaProviderRef": {
                      "attributes": {
                        "dn": "uni/userext/duoext/duoprovidergroup-xyz/providerref-8.8.8.8",
                        "order": "1",
                        "name": "8.8.8.8",
                        "descr": "adf",
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
        "aaaLoginDomain": {
          "attributes": {
            "dn": "uni/userext/logindomain-xyz",
            "descr": "test",
            "name": "xyz",
          },
          "children": [
            {
              "aaaDomainAuth": {
                "attributes": {
                  "dn": "uni/userext/logindomain-xyz/domainauth",
                  "providerGroup": "xyz",
                  "realm": "radius",
                  "realmSubType": "duo",
                  "descr": "test",
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
