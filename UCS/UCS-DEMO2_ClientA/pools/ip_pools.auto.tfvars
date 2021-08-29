#______________________________________________
#
# IP Pools
#______________________________________________

ip_pools = {
  "inband" = {
    ipv4_block       = [
      {
        from = "192.168.20.50",
        to = "192.168.20.94",
      },
    ]
    ipv4_config      = [
      {
        gateway = "192.168.20.1",
        netmask = "255.255.255.0",
      },
    ]
    ipv6_block       = [
      {
        from = "44::",
        to = "44::8",
      },
    ]
    ipv6_config      = [
      {
        gateway = "44::12",
        prefix = "64",
        primary_dns = "::",
        secondary_dns = "::",
      },
    ]
    organization     = "UCS-DEMO2_ClientA"
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