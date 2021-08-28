#______________________________________________
#
# NTP Policies Policies
#______________________________________________

ntp_policies = {#______________________________________________
#
# NTP Policies
#______________________________________________

policies_ntp = {
  "UCS-DEMO" = {
    description  = ""
    enabled      = true
    ntp_servers  = [
      "ntp.esl.cisco.com",
    ]
    organization = "UCS-DEMO"
    tags         = []
    timezone     = "Europe/Paris"
  }
}
}