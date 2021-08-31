#______________________________________________
#
# Virtual Media Policies
#______________________________________________

virtual_media_policies = {
  "HyperFlex" = {
    description                     = "vMedia-policy-to-install-or-re-install-software-on-HyperFlex-servers"
    enable_low_power_usb            = false
    enable_low_power_usb            = false
    enable_virtual_media_encryption = false
    organization                    = "UCS-DEMO2_hyperflex"
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
    vmedia_mounts = [
      {
        device_type             = "cdd",
        hostname                = "192.168.20.13",
        name                    = "ESXI7.0",
        protocol                = "http",
        remote_file             = "customesxi.iso",
        remote_path             = "/",
        username                = "root"
      },
    ]
  }
}