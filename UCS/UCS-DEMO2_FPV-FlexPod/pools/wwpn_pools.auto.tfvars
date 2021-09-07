#______________________________________________
#
# Fibre Channel WWPN Pool Variables
#______________________________________________

wwpn_pools = {
  "DEMO-SAN-A" = {
    id_blocks        = [
      {
        from = "20:00:00:25:B5:11:AA:00",
        to = "20:00:00:25:B5:11:AA:FF",
      },
    ]
    organization     = "UCS-DEMO2_FPV-FlexPod"
    pool_purpose     = "WWPN"
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