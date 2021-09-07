#______________________________________________
#
# SAN Connectivity Policy Variables
#______________________________________________

san_connectivity_policies = {
  "ESX" = {
    description          = ""
    organization         = "UCS-DEMO2_ClientA"
    target_platform      = "FI-Attached"
    vhba_placement_mode  = "auto"
    wwnn_allocation_type = "pool"
    wwnn_static          = ""
    wwnn_pool            = ["ESX"]
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
    vhbas = [
      {
        fibre_channel_adapter_policy = "VMWare",
        fibre_channel_network_policy = "ESX_vfc0",
        fibre_channel_qos_policy     = "default",
        name                         = "vfc0",
        pci_order                    = 2,
        slot_id                      = "MLOM",
        switch_id                    = "A",
        wwpn_allocation_type         = "pool",
        wwpn_pool                    = "ESX-WWPN",
      },
      {
        fibre_channel_adapter_policy = "VMWare",
        fibre_channel_network_policy = "ESX_vfc1",
        fibre_channel_qos_policy     = "default",
        name                         = "vfc1",
        pci_order                    = 4,
        slot_id                      = "MLOM",
        switch_id                    = "B",
        wwpn_allocation_type         = "pool",
        wwpn_pool                    = "ESX-WWPN",
      },
    ]
  }
  "test-easyucs-conversion-sp_SCP" = {
    description          = ""
    organization         = "UCS-DEMO2_ClientA"
    target_platform      = "FI-Attached"
    vhba_placement_mode  = "auto"
    wwnn_allocation_type = "pool"
    wwnn_static          = ""
    wwnn_pool            = ["DEMO"]
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
    vhbas = [
      {
        fibre_channel_adapter_policy = "VMWare",
        fibre_channel_network_policy = "test-easyucs-conversion-sp_SCP_fc0",
        fibre_channel_qos_policy     = "default",
        name                         = "fc0",
        pci_order                    = 1,
        slot_id                      = "MLOM",
        switch_id                    = "A",
        wwpn_allocation_type         = "pool",
        wwpn_pool                    = "DEMO-SAN-A",
      },
      {
        fibre_channel_adapter_policy = "VMWare",
        fibre_channel_network_policy = "test-easyucs-conversion-sp_SCP_fc1",
        fibre_channel_qos_policy     = "default",
        name                         = "fc1",
        pci_order                    = 2,
        slot_id                      = "MLOM",
        switch_id                    = "B",
        wwpn_allocation_type         = "pool",
        wwpn_pool                    = "DEMO-SAN-B",
      },
      {
        fibre_channel_adapter_policy = "default",
        fibre_channel_network_policy = "test-easyucs-conversion-sp_SCP_fc2",
        fibre_channel_qos_policy     = "default",
        name                         = "fc2",
        pci_order                    = 3,
        slot_id                      = "MLOM",
        switch_id                    = "A",
        wwpn_allocation_type         = "static",
        wwpn_static                  = ["20:12:34:56:78:90:AB:CD"],
      },
      {
        fibre_channel_adapter_policy = "default",
        fibre_channel_network_policy = "test-easyucs-conversion-sp_SCP_fc3",
        fibre_channel_qos_policy     = "default",
        name                         = "fc3",
        pci_order                    = 4,
        slot_id                      = "MLOM",
        switch_id                    = "A",
        wwpn_allocation_type         = "static",
        wwpn_static                  = ["50:00:00:00:00:00:00:00"],
      },
    ]
  }
  "test-easyucs-static-wnnn_SCP" = {
    description          = ""
    organization         = "UCS-DEMO2_ClientA"
    target_platform      = "FI-Attached"
    vhba_placement_mode  = "auto"
    wwnn_allocation_type = "static"
    wwnn_static          = "20:00:00:25:B5:00:00:01"
    wwnn_pool            = [""]
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
    vhbas = [
      {
        fibre_channel_adapter_policy = "default",
        fibre_channel_network_policy = "test-easyucs-static-wnnn_SCP_fc0",
        fibre_channel_qos_policy     = "default",
        name                         = "fc0",
        pci_order                    = 2,
        slot_id                      = "MLOM",
        switch_id                    = "A",
        wwpn_allocation_type         = "static",
        wwpn_static                  = ["20:12:34:56:78:90:AB:CD"],
      },
      {
        fibre_channel_adapter_policy = "default",
        fibre_channel_network_policy = "test-easyucs-static-wnnn_SCP_fc1",
        fibre_channel_qos_policy     = "default",
        name                         = "fc1",
        pci_order                    = 1,
        slot_id                      = "MLOM",
        switch_id                    = "B",
        wwpn_allocation_type         = "static",
        wwpn_static                  = ["20:12:34:56:78:90:AB:CD"],
      },
    ]
  }
}