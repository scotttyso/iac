#______________________________________________
#
# IPMI over LAN Policies
#______________________________________________

ipmi_over_lan_policies = {
  "dff" = {
    description    = ""
    enabled        = true
    encryption_key = var.encryption_key
    privilege      = "admin"
    organization = "UCS-DEMO2_FPV-FlexPod"
    tags         = [
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