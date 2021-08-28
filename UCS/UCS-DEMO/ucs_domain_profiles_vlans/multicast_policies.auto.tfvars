#______________________________________________
#
# Multicast Policies
#______________________________________________

multicast_policies = {
  "UCS-DEMO" = {
    description             = ""
    organization            = "UCS-DEMO"
    querier_ip_address      = ""
    querier_ip_address_peer = ""
    querier_state           = "Disabled"
    snooping_state          = "Enabled"
    tags                    = [
      {
        key   = "easyucs_origin",
        value = "convert"
      },
      {
        key   = "easyucs_version",
        value = "0.9.8"
      },
    ]
  }
}