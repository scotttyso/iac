#______________________________________________
#
# Syslog Policies
#______________________________________________

syslog_policies = {
  "UCS-DEMO" = {
    description  = ""
    priority     = ""
    receive      = ""
    send         = ""
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
  }
}