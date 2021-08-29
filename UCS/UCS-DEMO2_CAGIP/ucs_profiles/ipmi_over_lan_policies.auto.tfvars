#______________________________________________
#
# IPMI over LAN Policies
#______________________________________________

ipmi_over_lan_policies = {
  "IPMI-OSB3-DID" = {
    description    = ""
    enabled        = true
    encryption_key = var.encryption_key
    privilege      = "admin"
    organization   = "UCS-DEMO2_CAGIP"
    tags = [
      {
        key = "easyucs_origin",
        value = "convert",
      },
      {
        key = "easyucs_version",
        value = "0.9.8",
      },
    ]
  }
}