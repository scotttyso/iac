module "schema_common_bd" {
  source   = "../modules/bd"
  tenant   = "common"
  schema   = "Common"
  template = "common"
  vrf_name = "default"
  bd_list = [
    {
      # Provide a Name for the Bridge Domain
      bridge_domain = "example2"
      # Intersite BUM is either true or false.
      intersite_bum_traffic = true
      # Layer2 Stretch is either true or false.
      layer2_stretch = true
      # Unknown Unicast is either flood or proxy.
      layer2_unknown_unicast = "flood"
      # Layer3 Multicast is either true or false.
      layer3_multicast = false
      # Optimize WAN Bandwidth is either true or false.
      # If layer2_unknown_unicast is flood set this to false.
      # If layer2_unknown_unicast is proxy set this to true.
      optimize_wan_bandwidth = false
    },
    {
      bridge_domain          = "example3"
      intersite_bum_traffic  = true
      layer2_stretch         = true
      layer2_unknown_unicast = "proxy"
      layer3_multicast       = false
      optimize_wan_bandwidth = true
    }
  ]
}

module "schema_common_app" {
  source   = "../modules/app"
  tenant   = "common"
  schema   = "Common"
  template = "common"
  app_list = [
    {
      app_profile = "example2"
    },
    {
      app_profile = "example3"
    }
  ]
}

module "schema_common_epg" {
  depends_on = [
    module.schema_common_bd,
    module.schema_common_app
  ]
  source   = "../modules/epg"
  tenant   = "common"
  schema   = "Common"
  template = "common"
  vrf_name = "default"
  epg_list = [
    # Make sure the BD Exists in MSO or that you created it in the previous module.
    {
      bridge_domain     = "example1"
      app_profile       = "example1"
      epg               = "example1"
      contract_consumer = "default"
      contract_provider = "default"
    },
    {
      bridge_domain     = "example2"
      app_profile       = "example1"
      epg               = "example2"
      contract_consumer = "default"
      contract_provider = "default"
    },
    {
      bridge_domain     = "example2"
      app_profile       = "example2"
      epg               = "example3"
      contract_consumer = "default"
      contract_provider = "default"
    }
  ]
}
