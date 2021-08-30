#______________________________________________
#
# UCS Server Profiles
#______________________________________________

ucs_server_profiles = {
  "ESX1" = {
    action                      = "No-op"
    assign_server               = false
    description                 = ""
    organization                = "UCS-DEMO2_ClientA"
    serial_number               = ""
    target_platform             = "FI-Attached"
    ucs_server_profile_template = "ESX"
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
  "ESX2" = {
    action                      = "No-op"
    assign_server               = false
    description                 = ""
    organization                = "UCS-DEMO2_ClientA"
    serial_number               = ""
    target_platform             = "FI-Attached"
    ucs_server_profile_template = "ESX"
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
  "test-easyucs-conversion-sp" = {
    action                      = "No-op"
    assign_server               = false
    description                 = ""
    organization                = "UCS-DEMO2_ClientA"
    serial_number               = ""
    target_platform             = "FI-Attached"
    ucs_server_profile_template = "ESX"
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
  "test-easyucs-static-wnnn" = {
    action                      = "No-op"
    assign_server               = false
    description                 = ""
    organization                = "UCS-DEMO2_ClientA"
    serial_number               = ""
    target_platform             = "FI-Attached"
    ucs_server_profile_template = "ESX"
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