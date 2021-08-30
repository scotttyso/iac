#______________________________________________
#
# Virtual Media Policies
#______________________________________________

virtual_media_policies = {
  "ESXI7.0" = {
    description  = ""
    priority     = ""
    receive      = ""
    send         = ""
    organization = "UCS-DEMO2_ClientA"
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
  "test_writeable" = {
    description  = ""
    priority     = ""
    receive      = ""
    send         = ""
    organization = "UCS-DEMO2_ClientA"
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