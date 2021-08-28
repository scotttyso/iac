#______________________________________________
#
# Flow Control Policies
#______________________________________________

flow_control_policies = {
  "UCS-DEMO" = {
    description  = ""
    priority     = "auto"
    receive      = "Disabled"
    send         = "Disabled"
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