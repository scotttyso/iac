#______________________________________________
#
# System QoS
#______________________________________________

system_qos_policies = {
  "UCS-DEMO" = {
    classes = [
      {
        cos                 = 1
        mtu                 = 1500
        multicast_optimized = false
        packet_drop         = true
        priority            = "Bronze"
        state               = "Disabled"
        weight              = 7
      },
      {
        cos                 = 4
        mtu                 = 1500
        multicast_optimized = false
        packet_drop         = true
        priority            = "Gold"
        state               = "Disabled"
        weight              = 9
      },
      {
        cos                 = 5
        mtu                 = 1500
        multicast_optimized = false
        packet_drop         = false
        priority            = "Platinum"
        state               = "Disabled"
        weight              = 10
      },
      {
        cos                 = 2
        mtu                 = 1500
        multicast_optimized = false
        packet_drop         = true
        priority            = "Silver"
        state               = "Disabled"
        weight              = 8
      },
      {
        cos                 = 3
        mtu                 = 2240
        multicast_optimized = false
        packet_drop         = false
        priority            = "FC"
        state               = "Enabled"
        weight              = 5
      },
      {
        cos                 = 255
        mtu                 = 1500
        multicast_optimized = false
        packet_drop         = true
        priority            = "Best Effort"
        state               = "Enabled"
        weight              = 5
      },
    ]
    description  = ""
    organization = "UCS-DEMO"
    Tags         = [
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