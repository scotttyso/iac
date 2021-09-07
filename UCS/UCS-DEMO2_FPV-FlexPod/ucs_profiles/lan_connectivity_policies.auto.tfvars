#______________________________________________
#
# LAN Connectivity Policy Variables
#______________________________________________

lan_connectivity_policies = {
  "iSCSI-Boot" = {
    description                 = ""
    enable_azure_stack_host_qos = false
    iqn_allocation_type         = "None"
    iqn_pool                    = [""]
    iqn_static_identifier       = ""
    organization                = "UCS-DEMO2_FPV-FlexPod"
    vnic_placement_mode         = "auto"
    target_platform             = "FIAttached"
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
    vnics = {
        "00-Infra-A" = {
        cdn_source                      = "vnic"
        enable_failover                 = false
        ethernet_adapter_policy         = "VMWare"
        ethernet_network_control_policy = "Enable-CDP-LLDP"
        ethernet_network_group_policy   = "iSCSI-Boot_00-Infra-A"
        ethernet_qos_policy             = "default_mtu9000"
        mac_address_allocation_type     = "POOL"
        mac_address_pool                = "MAC-Pool-A"
        name                            = "00-Infra-A"
        placement_pci_order             = 6
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
        "01-Infra-B" = {
        cdn_source                      = "vnic"
        enable_failover                 = false
        ethernet_adapter_policy         = "VMWare"
        ethernet_network_control_policy = "Enable-CDP-LLDP"
        ethernet_network_group_policy   = "iSCSI-Boot_01-Infra-B"
        ethernet_qos_policy             = "default_mtu9000"
        mac_address_allocation_type     = "POOL"
        mac_address_pool                = "MAC-Pool-B"
        name                            = "01-Infra-B"
        placement_pci_order             = 5
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
        "02-iSCSI-A" = {
        cdn_source                      = "vnic"
        enable_failover                 = false
        ethernet_adapter_policy         = "VMWare"
        ethernet_network_control_policy = "Enable-CDP-LLDP"
        ethernet_network_group_policy   = "iSCSI-Boot_02-iSCSI-A"
        ethernet_qos_policy             = "default_mtu9000"
        mac_address_allocation_type     = "POOL"
        mac_address_pool                = "MAC-Pool-A"
        name                            = "02-iSCSI-A"
        placement_pci_order             = 4
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
        "03-iSCSI-B" = {
        cdn_source                      = "vnic"
        enable_failover                 = false
        ethernet_adapter_policy         = "VMWare"
        ethernet_network_control_policy = "Enable-CDP-LLDP"
        ethernet_network_group_policy   = "iSCSI-Boot_03-iSCSI-B"
        ethernet_qos_policy             = "default_mtu9000"
        mac_address_allocation_type     = "POOL"
        mac_address_pool                = "MAC-Pool-B"
        name                            = "03-iSCSI-B"
        placement_pci_order             = 3
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
        "04-APIC-vDS-A" = {
        cdn_source                      = "vnic"
        enable_failover                 = false
        ethernet_adapter_policy         = "VMware-HighTrf"
        ethernet_network_control_policy = "Enable-CDP-LLDP"
        ethernet_network_group_policy   = "iSCSI-Boot_04-APIC-vDS-A"
        ethernet_qos_policy             = "default_mtu9000"
        mac_address_allocation_type     = "POOL"
        mac_address_pool                = "MAC-Pool-A"
        name                            = "04-APIC-vDS-A"
        placement_pci_order             = 2
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
        "05-APIC-vDS-B" = {
        cdn_source                      = "vnic"
        enable_failover                 = false
        ethernet_adapter_policy         = "VMware-HighTrf"
        ethernet_network_control_policy = "Enable-CDP-LLDP"
        ethernet_network_group_policy   = "iSCSI-Boot_05-APIC-vDS-B"
        ethernet_qos_policy             = "default_mtu9000"
        mac_address_allocation_type     = "POOL"
        mac_address_pool                = "MAC-Pool-B"
        name                            = "05-APIC-vDS-B"
        placement_pci_order             = 1
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
    }
  }
  "TUTU_LCP" = {
    description                 = ""
    enable_azure_stack_host_qos = false
    iqn_allocation_type         = "None"
    iqn_pool                    = [""]
    iqn_static_identifier       = ""
    organization                = "UCS-DEMO2_FPV-FlexPod"
    vnic_placement_mode         = "auto"
    target_platform             = "FIAttached"
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
    vnics = {
        "00-Infra-A" = {
        enable_failover                 = false
        ethernet_adapter_policy         = "VMWare"
        ethernet_network_control_policy = "Enable-CDP-LLDP"
        ethernet_network_group_policy   = "TUTU_LCP_00-Infra-A"
        ethernet_qos_policy             = "default_mtu9000"
        mac_address_allocation_type     = "POOL"
        mac_address_pool                = "MAC-Pool-A"
        name                            = "00-Infra-A"
        placement_pci_order             = 61
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
        "01-Infra-B" = {
        enable_failover                 = false
        ethernet_adapter_policy         = "VMWare"
        ethernet_network_control_policy = "Enable-CDP-LLDP"
        ethernet_network_group_policy   = "TUTU_LCP_01-Infra-B"
        ethernet_qos_policy             = "default_mtu9000"
        mac_address_allocation_type     = "POOL"
        mac_address_pool                = "MAC-Pool-B"
        name                            = "01-Infra-B"
        placement_pci_order             = 60
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
        "02-iSCSI-A" = {
        enable_failover                 = false
        ethernet_adapter_policy         = "VMWare"
        ethernet_network_control_policy = "Enable-CDP-LLDP"
        ethernet_network_group_policy   = "TUTU_LCP_02-iSCSI-A"
        ethernet_qos_policy             = "default_mtu9000"
        mac_address_allocation_type     = "POOL"
        mac_address_pool                = "MAC-Pool-A"
        name                            = "02-iSCSI-A"
        placement_pci_order             = 59
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
        "03-iSCSI-B" = {
        enable_failover                 = false
        ethernet_adapter_policy         = "VMWare"
        ethernet_network_control_policy = "Enable-CDP-LLDP"
        ethernet_network_group_policy   = "TUTU_LCP_03-iSCSI-B"
        ethernet_qos_policy             = "default_mtu9000"
        mac_address_allocation_type     = "POOL"
        mac_address_pool                = "MAC-Pool-B"
        name                            = "03-iSCSI-B"
        placement_pci_order             = 58
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
        "04-APIC-vDS-A" = {
        enable_failover                 = false
        ethernet_adapter_policy         = "VMware-HighTrf"
        ethernet_network_control_policy = "Enable-CDP-LLDP"
        ethernet_network_group_policy   = "TUTU_LCP_04-APIC-vDS-A"
        ethernet_qos_policy             = "default_mtu9000"
        mac_address_allocation_type     = "POOL"
        mac_address_pool                = "MAC-Pool-A"
        name                            = "04-APIC-vDS-A"
        placement_pci_order             = 57
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
        "05-APIC-vDS-B" = {
        enable_failover                 = false
        ethernet_adapter_policy         = "VMware-HighTrf"
        ethernet_network_control_policy = "Enable-CDP-LLDP"
        ethernet_network_group_policy   = "TUTU_LCP_05-APIC-vDS-B"
        ethernet_qos_policy             = "default_mtu9000"
        mac_address_allocation_type     = "POOL"
        mac_address_pool                = "MAC-Pool-B"
        name                            = "05-APIC-vDS-B"
        placement_pci_order             = 56
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
        "dynamic-prot-001" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-001"
        placement_pci_order             = 2
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
        "dynamic-prot-002" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-002"
        placement_pci_order             = 3
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
        "dynamic-prot-003" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-003"
        placement_pci_order             = 4
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
        "dynamic-prot-004" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-004"
        placement_pci_order             = 5
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
        "dynamic-prot-005" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-005"
        placement_pci_order             = 6
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
        "dynamic-prot-006" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-006"
        placement_pci_order             = 7
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
        "dynamic-prot-007" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-007"
        placement_pci_order             = 8
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
        "dynamic-prot-008" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-008"
        placement_pci_order             = 9
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
        "dynamic-prot-009" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-009"
        placement_pci_order             = 10
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
        "dynamic-prot-010" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-010"
        placement_pci_order             = 11
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
        "dynamic-prot-011" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-011"
        placement_pci_order             = 12
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
        "dynamic-prot-012" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-012"
        placement_pci_order             = 13
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
        "dynamic-prot-013" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-013"
        placement_pci_order             = 14
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
        "dynamic-prot-014" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-014"
        placement_pci_order             = 15
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
        "dynamic-prot-015" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-015"
        placement_pci_order             = 16
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
        "dynamic-prot-016" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-016"
        placement_pci_order             = 17
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
        "dynamic-prot-017" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-017"
        placement_pci_order             = 18
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
        "dynamic-prot-018" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-018"
        placement_pci_order             = 19
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
        "dynamic-prot-019" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-019"
        placement_pci_order             = 20
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
        "dynamic-prot-020" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-020"
        placement_pci_order             = 21
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
        "dynamic-prot-021" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-021"
        placement_pci_order             = 22
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
        "dynamic-prot-022" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-022"
        placement_pci_order             = 23
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
        "dynamic-prot-023" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-023"
        placement_pci_order             = 24
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
        "dynamic-prot-024" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-024"
        placement_pci_order             = 25
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
        "dynamic-prot-025" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-025"
        placement_pci_order             = 26
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
        "dynamic-prot-026" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-026"
        placement_pci_order             = 27
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
        "dynamic-prot-027" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-027"
        placement_pci_order             = 28
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
        "dynamic-prot-028" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-028"
        placement_pci_order             = 29
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
        "dynamic-prot-029" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-029"
        placement_pci_order             = 30
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
        "dynamic-prot-030" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-030"
        placement_pci_order             = 31
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
        "dynamic-prot-031" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-031"
        placement_pci_order             = 32
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
        "dynamic-prot-032" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-032"
        placement_pci_order             = 33
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
        "dynamic-prot-033" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-033"
        placement_pci_order             = 34
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
        "dynamic-prot-034" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-034"
        placement_pci_order             = 35
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
        "dynamic-prot-035" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-035"
        placement_pci_order             = 36
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
        "dynamic-prot-036" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-036"
        placement_pci_order             = 37
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
        "dynamic-prot-037" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-037"
        placement_pci_order             = 38
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
        "dynamic-prot-038" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-038"
        placement_pci_order             = 39
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
        "dynamic-prot-039" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-039"
        placement_pci_order             = 40
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
        "dynamic-prot-040" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-040"
        placement_pci_order             = 41
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
        "dynamic-prot-041" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-041"
        placement_pci_order             = 42
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
        "dynamic-prot-042" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-042"
        placement_pci_order             = 43
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
        "dynamic-prot-043" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-043"
        placement_pci_order             = 44
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
        "dynamic-prot-044" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-044"
        placement_pci_order             = 45
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
        "dynamic-prot-045" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-045"
        placement_pci_order             = 46
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
        "dynamic-prot-046" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-046"
        placement_pci_order             = 47
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
        "dynamic-prot-047" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-047"
        placement_pci_order             = 48
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
        "dynamic-prot-048" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-048"
        placement_pci_order             = 49
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
        "dynamic-prot-049" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-049"
        placement_pci_order             = 50
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
        "dynamic-prot-050" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-050"
        placement_pci_order             = 51
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
        "dynamic-prot-051" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-051"
        placement_pci_order             = 52
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
        "dynamic-prot-052" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-052"
        placement_pci_order             = 53
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
        "dynamic-prot-053" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-053"
        placement_pci_order             = 54
        placement_slot_id               = "MLOM"
        placement_switch_id             = "A"
      },
        "dynamic-prot-054" = {
        enable_failover                 = true
        ethernet_adapter_policy         = "default"
        ethernet_network_control_policy = "default"
        ethernet_qos_policy             = "default"
        mac_address_allocation_type     = "STATIC"
        mac_address_static              = "12:34:56:78:90:AB"
        name                            = "dynamic-prot-054"
        placement_pci_order             = 55
        placement_slot_id               = "MLOM"
        placement_switch_id             = "B"
      },
    }
  }
}