#______________________________________________
#
# Serial over LAN Policies
#______________________________________________

serial_over_lan_policies = {
  "SOL-ENABLE" = {
    baud_rate    = 9600
    com_port     = ""
    description  = ""
    enabled      = true
    ssh_port     = 2400
    receive      = ""
    send         = ""
    organization = "UCS-DEMO2_CAGIP"
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