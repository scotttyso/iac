#______________________________________________
#
# NTP Policies
#______________________________________________

ntp_policies = {
  "UCS-DEMO2" = {
    description  = ""
    enabled      = true
    ntp_servers  = [
      "ntp.esl.cisco.com",
    ]
    organization = "UCS-DEMO2"
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