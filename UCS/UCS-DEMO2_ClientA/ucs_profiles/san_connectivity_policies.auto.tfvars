#______________________________________________
#
# SAN Connectivity Policy Variables
#______________________________________________

san_connectivity_policies = {
  "ESX" = {
    description          = ""
    organization         = "UCS-DEMO2_ClientA"
    target_platform             = "FIAttached"
    vhba_placement_mode  = "auto"
    wwnn_allocation_type = "POOL"
    wwnn_static_address  = ""
    wwnn_pool            = "ESX"
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
    vhbas = {
      "vfc0" = {
        fibre_channel_adapter_policy = "VMWare"
        fibre_channel_network_policy = "ESX_vfc0"
        fibre_channel_qos_policy     = "default"
        name                         = "vfc0"
        placement_pci_order          = 2
        placement_slot_id            = "MLOM"
        placement_switch_id          = "A"
        wwpn_allocation_type         = "POOL"
        wwpn_pool                    = "ESX-WWPN"
      },
      "vfc1" = {
        fibre_channel_adapter_policy = "VMWare"
        fibre_channel_network_policy = "ESX_vfc1"
        fibre_channel_qos_policy     = "default"
        name                         = "vfc1"
        placement_pci_order          = 4
        placement_slot_id            = "MLOM"
        placement_switch_id          = "B"
        wwpn_allocation_type         = "POOL"
        wwpn_pool                    = "ESX-WWPN"
      },
    }
  }
  "test-easyucs-conversion-sp_SCP" = {
    description          = ""
    organization         = "UCS-DEMO2_ClientA"
    target_platform             = "FIAttached"
    vhba_placement_mode  = "auto"
    wwnn_allocation_type = "POOL"
    wwnn_static_address  = ""
    wwnn_pool            = "DEMO"
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
    vhbas = {
      "fc0" = {
        fibre_channel_adapter_policy = "VMWare"
        fibre_channel_network_policy = "test-easyucs-conversion-sp_SCP_fc0"
        fibre_channel_qos_policy     = "default"
        name                         = "fc0"
        placement_pci_order          = 1
        placement_slot_id            = "MLOM"
        placement_switch_id          = "A"
        wwpn_allocation_type         = "POOL"
        wwpn_pool                    = "DEMO-SAN-A"
      },
      "fc1" = {
        fibre_channel_adapter_policy = "VMWare"
        fibre_channel_network_policy = "test-easyucs-conversion-sp_SCP_fc1"
        fibre_channel_qos_policy     = "default"
        name                         = "fc1"
        placement_pci_order          = 2
        placement_slot_id            = "MLOM"
        placement_switch_id          = "B"
        wwpn_allocation_type         = "POOL"
        wwpn_pool                    = "DEMO-SAN-B"
      },
      "fc2" = {
        fibre_channel_adapter_policy = "default"
        fibre_channel_network_policy = "test-easyucs-conversion-sp_SCP_fc2"
        fibre_channel_qos_policy     = "default"
        name                         = "fc2"
        placement_pci_order          = 3
        placement_slot_id            = "MLOM"
        placement_switch_id          = "A"
        wwpn_allocation_type         = "STATIC"
        wwpn_static_address          = "20:12:34:56:78:90:AB:CD"
      },
      "fc3" = {
        fibre_channel_adapter_policy = "default"
        fibre_channel_network_policy = "test-easyucs-conversion-sp_SCP_fc3"
        fibre_channel_qos_policy     = "default"
        name                         = "fc3"
        placement_pci_order          = 4
        placement_slot_id            = "MLOM"
        placement_switch_id          = "A"
        wwpn_allocation_type         = "STATIC"
        wwpn_static_address          = "50:00:00:00:00:00:00:00"
      },
    }
  }
  "test-easyucs-static-wnnn_SCP" = {
    description          = ""
    organization         = "UCS-DEMO2_ClientA"
    target_platform             = "FIAttached"
    vhba_placement_mode  = "auto"
    wwnn_allocation_type = "STATIC"
    wwnn_static_address  = "20:00:00:25:B5:00:00:01"
    wwnn_pool            = ""
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
    vhbas = {
      "fc0" = {
        fibre_channel_adapter_policy = "default"
        fibre_channel_network_policy = "test-easyucs-static-wnnn_SCP_fc0"
        fibre_channel_qos_policy     = "default"
        name                         = "fc0"
        placement_pci_order          = 2
        placement_slot_id            = "MLOM"
        placement_switch_id          = "A"
        wwpn_allocation_type         = "STATIC"
        wwpn_static_address          = "20:12:34:56:78:90:AB:CD"
      },
      "fc1" = {
        fibre_channel_adapter_policy = "default"
        fibre_channel_network_policy = "test-easyucs-static-wnnn_SCP_fc1"
        fibre_channel_qos_policy     = "default"
        name                         = "fc1"
        placement_pci_order          = 1
        placement_slot_id            = "MLOM"
        placement_switch_id          = "B"
        wwpn_allocation_type         = "STATIC"
        wwpn_static_address          = "20:12:34:56:78:90:AB:CD"
      },
    }
  }
}