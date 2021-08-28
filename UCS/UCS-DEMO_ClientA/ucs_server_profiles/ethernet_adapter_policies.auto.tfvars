#______________________________________________
#
# Ethernet (vNIC) Adapter Policies Policies
#______________________________________________

ethernet_adapter_policies = {
  "VMWare" = {
    completion_queue_count                   = 2
    completion_ring_size                     = 
    enable_advanced_filter                   = False
    enable_accelerated_receive_flow_steering = False
    enable_interrupt_scaling                 = False
    enable_geneve_offload                    = False
    enable_nvgre_offload                     = False
    enable_vxlan_offload                     = False
    description                              = "Recommended-adapter-settings-for-VMWare"
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    organization                             = "UCS-DEMO_ClientA"
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    receive_side_scaling_enable              = 
    rss_enable_ipv4_hash                     = true
    rss_enable_ipv6_extensions_hash          = false
    rss_enable_ipv6_hash                     = true
    rss_enable_tcp_and_ipv4_hash             = true
    rss_enable_tcp_and_ipv6_extensions_hash  = false
    rss_enable_tcp_and_ipv6_hash             = true
    rss_enable_udp_and_ipv4_hash             = false
    rss_enable_udp_and_ipv6_hash             = false
    receive_queue_count                      = 1
    receive_ring_size                        = 512
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    transmit_queue_count                     = 1
    transmit_ring_size                       = 256
    uplink_failback_timeout                  = 5
    tags         = [
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
  "Windows" = {
    completion_queue_count                   = 5
    completion_ring_size                     = 
    enable_advanced_filter                   = False
    enable_accelerated_receive_flow_steering = False
    enable_interrupt_scaling                 = False
    enable_geneve_offload                    = False
    enable_nvgre_offload                     = False
    enable_vxlan_offload                     = False
    description                              = "Recommended-adapter-settings-for-Windows"
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    organization                             = "UCS-DEMO_ClientA"
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    receive_side_scaling_enable              = 
    rss_enable_ipv4_hash                     = true
    rss_enable_ipv6_extensions_hash          = false
    rss_enable_ipv6_hash                     = true
    rss_enable_tcp_and_ipv4_hash             = true
    rss_enable_tcp_and_ipv6_extensions_hash  = false
    rss_enable_tcp_and_ipv6_hash             = true
    rss_enable_udp_and_ipv4_hash             = false
    rss_enable_udp_and_ipv6_hash             = false
    receive_queue_count                      = 4
    receive_ring_size                        = 512
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    transmit_queue_count                     = 1
    transmit_ring_size                       = 256
    uplink_failback_timeout                  = 5
    tags         = [
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