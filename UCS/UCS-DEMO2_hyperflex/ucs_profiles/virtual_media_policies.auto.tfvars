#______________________________________________
#
# Virtual Media Policies
#______________________________________________

virtual_media_policies = {
  "HyperFlex" = {
    description  = "vMedia-policy-to-install-or-re-install-software-on-HyperFlex-servers"
    priority     = ""
    receive      = ""
    send         = ""
    organization = "UCS-DEMO2_hyperflex"
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