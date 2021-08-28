#______________________________________________
#
# MAC Pools
#______________________________________________

mac_pools = {
  "ESX" = {
    mac_blocks        = [
      {
        from = "00:25:B5:11:11:00",
        to   = "00:25:B5:11:11:FF"
      },
    ]
    organization      = "UCS-DEMO_ClientA"
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
    mac_blocks        = [
      {
        from = "00:25:B5:12:11:00",
        to   = "00:25:B5:12:11:FF"
      },
    ]
    organization      = "UCS-DEMO_ClientA"
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
    mac_blocks        = [
      {
        from = "00:25:B5:13:11:00",
        to   = "00:25:B5:13:11:FF"
      },
    ]
    organization      = "UCS-DEMO_ClientA"
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