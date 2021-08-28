#______________________________________________
#
# Link Control Policies
#______________________________________________

link_control_policies = {
  "UCS-DEMO" = {
    admin_state  = "Disabled"
    description  = ""
    mode         = "normal"
    organization = "UCS-DEMO"
    Tags         = [
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