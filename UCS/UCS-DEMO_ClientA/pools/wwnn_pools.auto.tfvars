#______________________________________________
#
# Fibre Channel WWNN Pools
#______________________________________________

wwnn_pools = {
  "ESX" = {
    id_blocks         = [
      {
        from = "20:00:00:25:B5:11:11:00",
        to   = "20:00:00:25:B5:11:11:FF"
      },
    ]
    organization      = "UCS-DEMO_ClientA"
    pool_purpose      = "WWNN"
    tags              = [
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
  "LINUX" = {
    id_blocks         = [
      {
        from = "20:00:00:25:B5:12:11:00",
        to   = "20:00:00:25:B5:12:11:FF"
      },
    ]
    organization      = "UCS-DEMO_ClientA"
    pool_purpose      = "WWNN"
    tags              = [
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
  "WINDOWS" = {
    id_blocks         = [
      {
        from = "20:00:00:25:B5:13:11:00",
        to   = "20:00:00:25:B5:13:11:FF"
      },
    ]
    organization      = "UCS-DEMO_ClientA"
    pool_purpose      = "WWNN"
    tags              = [
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