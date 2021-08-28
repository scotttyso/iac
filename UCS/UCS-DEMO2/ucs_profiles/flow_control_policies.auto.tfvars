#______________________________________________
#
# Flow Control Policies
#______________________________________________

flow_control_policies = {
  "UCS-DEMO2" = {
    description  = ""
    priority     = "auto"
    receive      = "Disabled"
    send         = "Disabled"
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
  }
  "flow_ctrl" = {
    description  = ""
    priority     = "auto"
    receive      = "Enabled"
    send         = "Enabled"
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
  }
  "flow_ctrl2" = {
    description  = ""
    priority     = "on"
    receive      = "Disabled"
    send         = "Disabled"
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
  }
}