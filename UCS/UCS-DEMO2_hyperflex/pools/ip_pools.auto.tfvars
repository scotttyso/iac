#______________________________________________
#
# IP Pools
#______________________________________________

ip_pools = {
  "hx-ext-mgmt" = {
    ipv4_block       = [
      {
        from = "10.60.10.240",
        to = "10.60.10.243",
      },
    ]
    ipv4_config      = [
      {
        gateway = "10.60.10.254",
        netmask = "255.255.255.0",
      },
    ]
    ipv6_block       = [
      {
        from = "44::",
        size = "9",
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
    organization     = "UCS-DEMO2_hyperflex"
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