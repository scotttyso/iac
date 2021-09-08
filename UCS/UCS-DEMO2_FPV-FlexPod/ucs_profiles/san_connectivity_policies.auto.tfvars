#______________________________________________
#
# SAN Connectivity Policy Variables
#______________________________________________

san_connectivity_policies = {
  "TUTU_SCP" = {
    description          = ""
    organization         = "UCS-DEMO2_FPV-FlexPod"
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
      "vhba" = {
        fibre_channel_adapter_policy = "default"
        fibre_channel_network_policy = "TUTU_SCP_vhba"
        fibre_channel_qos_policy     = "default"
        name                         = "vhba"
        placement_pci_order          = 1
        placement_slot_id            = "MLOM"
        placement_switch_id          = "A"
        wwpn_allocation_type         = "POOL"
        wwpn_pool                    = "DEMO-SAN-A"
      },
    }
  }
}