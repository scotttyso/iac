#______________________________________________
#
# Fibre Channel WWPN Pools
#______________________________________________

wwpn_pools = {
  "ESX-SAN_A" = {
    id_blocks        = [
      {
        from = "20:0A:00:25:B5:11:11:00",
        to = "20:0A:00:25:B5:11:11:FF",
      },
    ]
    organization     = "UCS-DEMO_ClientA"
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
  "ESX-SAN_B" = {
    id_blocks        = [
      {
        from = "20:0B:00:25:B5:11:11:00",
        to = "20:0B:00:25:B5:11:11:FF",
      },
    ]
    organization     = "UCS-DEMO_ClientA"
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
  "LINUX-SAN_A" = {
    id_blocks        = [
      {
        from = "20:0A:00:25:B5:12:11:00",
        to = "20:0A:00:25:B5:12:11:FF",
      },
    ]
    organization     = "UCS-DEMO_ClientA"
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
  "LINUX-SAN_B" = {
    id_blocks        = [
      {
        from = "20:0B:00:25:B5:12:11:00",
        to = "20:0B:00:25:B5:12:11:FF",
      },
    ]
    organization     = "UCS-DEMO_ClientA"
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
  "WINDOWS-SAN_A" = {
    id_blocks        = [
      {
        from = "20:0A:00:25:B5:13:11:00",
        to = "20:0A:00:25:B5:13:11:FF",
      },
    ]
    organization     = "UCS-DEMO_ClientA"
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
  "WINDOWS-SAN_B" = {
    id_blocks        = [
      {
        from = "20:0B:00:25:B5:13:11:00",
        to = "20:0B:00:25:B5:13:11:FF",
      },
    ]
    organization     = "UCS-DEMO_ClientA"
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