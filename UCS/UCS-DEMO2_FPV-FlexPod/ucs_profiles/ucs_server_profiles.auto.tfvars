#______________________________________________
#
# UCS Server Profiles
#______________________________________________

ucs_server_profiles = {
  "fpv-esxi-01" = {
    action                      = "No-op"
    assign_server               = false
    description                 = ""
    organization                = "UCS-DEMO2_FPV-FlexPod"
    serial_number               = ""
    target_platform             = "FI-Attached"
    ucs_server_profile_template = "iSCSI-Boot-A"
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
  "fpv-esxi-02" = {
    action                      = "No-op"
    assign_server               = false
    description                 = ""
    organization                = "UCS-DEMO2_FPV-FlexPod"
    serial_number               = ""
    target_platform             = "FI-Attached"
    ucs_server_profile_template = "iSCSI-Boot-A"
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
  "TUTU" = {
    action                      = "No-op"
    assign_server               = false
    description                 = ""
    organization                = "UCS-DEMO2_FPV-FlexPod"
    serial_number               = ""
    target_platform             = "FI-Attached"
    ucs_server_profile_template = "iSCSI-Boot-A"
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