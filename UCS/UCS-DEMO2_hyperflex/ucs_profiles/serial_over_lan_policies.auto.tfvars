#______________________________________________
#
# Serial over LAN Policies
#______________________________________________

serial_over_lan_policies = {
  "HyperFlex" = {
    baud_rate    = 115200
    com_port     = ""
    description  = "Recommended-Serial-over-LAN-policy-for-HyperFlex-servers"
    enabled      = true
    ssh_port     = 2400
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