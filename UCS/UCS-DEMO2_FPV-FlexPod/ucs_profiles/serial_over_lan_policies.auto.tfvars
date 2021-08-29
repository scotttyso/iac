#______________________________________________
#
# Serial over LAN Policies
#______________________________________________

serial_over_lan_policies = {
  "fdfdffd" = {
    baud_rate    = 9600
    com_port     = ""
    description  = ""
    enabled      = false
    ssh_port     = 2400
    organization = "UCS-DEMO2_FPV-FlexPod"
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