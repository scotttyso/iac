#______________________________________________
#
# IQN Pools
#______________________________________________

iqn_pools = {
  "IQN-Pool" = {
    iqn_suffix_blocks = [
      {
        from = "1",
        suffix = "aa13-6332-host",
        to = "16",
      },
    ]
    organization      = "UCS-DEMO2"
    prefix            = "iqn.2010-11.com.flexpod"
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
  "ocb-poc" = {
    iqn_suffix_blocks = [
      {
        from = "1",
        suffix = "esxi",
        to = "50",
      },
    ]
    organization      = "UCS-DEMO2"
    prefix            = "iqn.2020.local.ocb-poc"
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