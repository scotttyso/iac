#______________________________________________
#
# LAN Connectivity Policies
#______________________________________________

lan_connectivity_policies = {
  "HyperFlex" = {
    description                 = "Recommended-LAN-connectivity-policy-for-HyperFlex-servers"
    enable_azure_stack_host_qos = false
    iqn_allocation_type         = "None"
    iqn_pool                    = [""]
    iqn_static_identifier       = ""
    organization                = "UCS-DEMO2_hyperflex"
    vnic_placement_mode         = "auto"
    target_platform             = "FI-Attached"
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
    vnics = [
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "HyperFlex",
        ethernet_network_control_policy = "HyperFlex-infra",
        ethernet_network_group_policy   = "HyperFlex_hv-mgmt-a",
        ethernet_qos_policy             = "silver",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["hv-mgmt-a"],
        name                            = "hv-mgmt-a",
        pci_order                       = 1,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "HyperFlex",
        ethernet_network_control_policy = "HyperFlex-infra",
        ethernet_network_group_policy   = "HyperFlex_hv-mgmt-b",
        ethernet_qos_policy             = "silver",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["hv-mgmt-b"],
        name                            = "hv-mgmt-b",
        pci_order                       = 2,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "HyperFlex",
        ethernet_network_control_policy = "HyperFlex-infra",
        ethernet_network_group_policy   = "HyperFlex_hv-vmotion-a",
        ethernet_qos_policy             = "bronze_mtu9000",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["hv-vmotion-a"],
        name                            = "hv-vmotion-a",
        pci_order                       = 7,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "HyperFlex",
        ethernet_network_control_policy = "HyperFlex-infra",
        ethernet_network_group_policy   = "HyperFlex_hv-vmotion-b",
        ethernet_qos_policy             = "bronze_mtu9000",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["hv-vmotion-b"],
        name                            = "hv-vmotion-b",
        pci_order                       = 8,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "HyperFlex",
        ethernet_network_control_policy = "HyperFlex-infra",
        ethernet_network_group_policy   = "HyperFlex_storage-data-a",
        ethernet_qos_policy             = "platinum_mtu9000",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["storage-data-a"],
        name                            = "storage-data-a",
        pci_order                       = 3,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "HyperFlex",
        ethernet_network_control_policy = "HyperFlex-infra",
        ethernet_network_group_policy   = "HyperFlex_storage-data-b",
        ethernet_qos_policy             = "platinum_mtu9000",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["storage-data-b"],
        name                            = "storage-data-b",
        pci_order                       = 4,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "HyperFlex",
        ethernet_network_control_policy = "HyperFlex-vm",
        ethernet_network_group_policy   = "HyperFlex_vm-network-a",
        ethernet_qos_policy             = "gold",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["vm-network-a"],
        name                            = "vm-network-a",
        pci_order                       = 5,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "HyperFlex",
        ethernet_network_control_policy = "HyperFlex-vm",
        ethernet_network_group_policy   = "HyperFlex_vm-network-b",
        ethernet_qos_policy             = "gold",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["vm-network-b"],
        name                            = "vm-network-b",
        pci_order                       = 6,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
    ]
  }
}