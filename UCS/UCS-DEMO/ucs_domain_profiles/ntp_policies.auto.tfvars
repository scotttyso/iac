#______________________________________________
#
# NTP Policies
#______________________________________________

ntp_policies = {
  "UCS-DEMO" = {
    description  = ""
    enabled      = true
    ntp_servers  = [
      "ntp.esl.cisco.com",
    ]
    organization = "UCS-DEMO"
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
    timezone     = "Europe/Paris"
  }
}