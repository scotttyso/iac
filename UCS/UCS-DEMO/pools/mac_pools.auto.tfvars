#______________________________________________
#
# MAC Pools
#______________________________________________

mac_pools = {
  "DEMO" = {
    mac_blocks       = [
      {
        from = "00:25:B5:10:10:00",
        to = "00:25:B5:10:10:FF",
      },
    ]
    organization     = "UCS-DEMO"
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