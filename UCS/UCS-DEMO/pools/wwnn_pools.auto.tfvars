#______________________________________________
#
# Fibre Channel WWNN Pools
#______________________________________________

wwnn_pools = {
  "DEMO" = {
    id_blocks        = [
      {
        from = "20:00:00:25:B5:10:10:00",
        to = "20:00:00:25:B5:10:10:FF",
      },
    ]
    organization     = "UCS-DEMO"
    pool_purpose     = "WWNN"
    tags             = [
      {
        key   = "easyucs_origin",
        value = "convert"
      },
      {
        key   = "easyucs_version",
        value = "0.9.8"
      },
    ]
  }
}