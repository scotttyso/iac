#______________________________________________
#
# Fibre Channel WWPN Pools
#______________________________________________

wwpn_pools = {
  "DEMO-SAN_A" = {
    id_blocks        = [
      {
        from = "20:0A:00:25:B5:10:10:00",
        to = "20:0A:00:25:B5:10:10:FF",
      },
    ]
    organization     = "UCS-DEMO"
    pool_purpose     = "WWPN"
    tags             = [
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
  "DEMO-SAN_B" = {
    id_blocks        = [
      {
        from = "20:0B:00:25:B5:10:10:00",
        to = "20:0B:00:25:B5:10:10:FF",
      },
    ]
    organization     = "UCS-DEMO"
    pool_purpose     = "WWPN"
    tags             = [
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