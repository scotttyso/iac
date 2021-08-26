#______________________________________________
#
# BIOS Policies
#______________________________________________

policies_bios_custom = {


    "ESX-Stan" = {
        organization = "default"
        tags         = []
        # BIOS Customization Settings
        core_multi_processing = "All"
        cpu_performance = "Enterprise"
        dram_clock_throttling = "Performance"
        cpu_energy_performance = "Performance"
        enhanced_intel_speed_step_tech = "Enabled"
        execute_disable_bit = "Enabled"
        cpu_frequency_floor = "Enabled"
        intel_hyper_threading_tech = "Enabled"
        intel_turbo_boost_tech = "Enabled"
        intel_virtualization_technology = "Enabled"
        intel_vt_for_directed_io = "Enabled"
        legacy_usb_support = "Enabled"
        lv_ddr_mode = "Performance-Mode"
        select_memory_ras_configuration = "Maximum-Performance"
        numa_optimized = "Enabled"
        cpu_power_management = "Performance"
        processor_c1e = "Disabled"
        processor_c3report = "Disabled"
        processor_c6report = "Disabled"
        processor_cstate = "Disabled"
    }


    "ESX-Stan-S" = {
        organization = "default"
        tags         = []
        description  = "Speedstep and turboboost enabled"
        # BIOS Customization Settings
        enhanced_intel_speed_step_tech = "Enabled"
        intel_turbo_boost_tech = "Enabled"
    }


    "ESX-Standard" = {
        organization = "default"
        tags         = []
        # BIOS Customization Settings
        execute_disable_bit = "Enabled"
    }


    "Linux-Standard" = {
        organization = "default"
        tags         = []
        # BIOS Customization Settings
        core_multi_processing = "All"
        cpu_performance = "Enterprise"
        enhanced_intel_speed_step_tech = "Disabled"
        execute_disable_bit = "Disabled"
        intel_hyper_threading_tech = "Disabled"
        intel_turbo_boost_tech = "Enabled"
        intel_virtualization_technology = "Disabled"
        intel_vt_for_directed_io = "Disabled"
        lv_ddr_mode = "Performance-Mode"
        select_memory_ras_configuration = "Maximum-Performance"
        numa_optimized = "Enabled"
        processor_c1e = "Disabled"
        processor_c3report = "Disabled"
        processor_c6report = "Disabled"
        processor_cstate = "Disabled"
        serial_port_aenable = "Disabled"
    }


    "SRIOV" = {
        organization = "default"
        tags         = []
        description  = "Recommended bios settings for SRIOV vNICs"
        # BIOS Customization Settings
        direct_cache_access = "Enabled"
        intel_virtualization_technology = "Enabled"
        intel_vt_for_directed_io = "Enabled"
        intel_vtd_coherency_support = "Disabled"
        intel_vtd_interrupt_remapping = "Enabled"
        cbs_cmn_gnb_nb_iommu = "Enabled"
        svm_mode = "Enabled"
    }


    "usNIC" = {
        organization = "default"
        tags         = []
        description  = "Recommended bios settings for usNIC vNICs"
        # BIOS Customization Settings
        core_multi_processing = "All"
        direct_cache_access = "Enabled"
        enhanced_intel_speed_step_tech = "Enabled"
        execute_disable_bit = "Disabled"
        intel_hyper_threading_tech = "Disabled"
        intel_turbo_boost_tech = "Enabled"
        intel_virtualization_technology = "Enabled"
        intel_vt_for_directed_io = "Enabled"
        intel_vtdats_support = "Enabled"
        intel_vtd_coherency_support = "Enabled"
        lv_ddr_mode = "Performance-Mode"
        memory_mapped_io_above4gb = "Disabled"
        select_memory_ras_configuration = "Maximum-Performance"
        numa_optimized = "Enabled"
        processor_c1e = "Disabled"
        processor_c6report = "Disabled"
    }


    "Windows" = {
        organization = "default"
        tags         = []
        # BIOS Customization Settings
        core_multi_processing = "All"
        cpu_performance = "Enterprise"
        dram_clock_throttling = "Performance"
        cpu_energy_performance = "Performance"
        enhanced_intel_speed_step_tech = "Disabled"
        execute_disable_bit = "Disabled"
        intel_hyper_threading_tech = "Disabled"
        intel_turbo_boost_tech = "Enabled"
        intel_virtualization_technology = "Disabled"
        intel_vt_for_directed_io = "Disabled"
        lv_ddr_mode = "Performance-Mode"
        select_memory_ras_configuration = "Maximum-Performance"
        cpu_power_management = "Performance"
        processor_c1e = "Disabled"
        processor_c3report = "Disabled"
        processor_c6report = "Disabled"
        processor_cstate = "Disabled"
    }


    "Windows-C460-HT" = {
        organization = "default"
        tags         = []
        # BIOS Customization Settings
        cpu_performance = "Enterprise"
        dram_clock_throttling = "Performance"
        cpu_energy_performance = "Performance"
        lv_ddr_mode = "Performance-Mode"
        select_memory_ras_configuration = "Maximum-Performance"
        cpu_power_management = "Performance"
    }


    "Windows-Citrix" = {
        organization = "default"
        tags         = []
        # BIOS Customization Settings
        core_multi_processing = "All"
        cpu_performance = "Enterprise"
        enhanced_intel_speed_step_tech = "Disabled"
        execute_disable_bit = "Disabled"
        intel_hyper_threading_tech = "Enabled"
        intel_turbo_boost_tech = "Enabled"
        intel_virtualization_technology = "Disabled"
        intel_vt_for_directed_io = "Disabled"
        lv_ddr_mode = "Performance-Mode"
        select_memory_ras_configuration = "Maximum-Performance"
        numa_optimized = "Enabled"
        processor_c1e = "Disabled"
        processor_c3report = "Disabled"
        processor_c6report = "Disabled"
        processor_cstate = "Disabled"
        serial_port_aenable = "Disabled"
    }


    "Windows-Citrix-S" = {
        organization = "default"
        tags         = []
        description  = "Speedstep enabled"
        # BIOS Customization Settings
        core_multi_processing = "All"
        cpu_performance = "Enterprise"
        enhanced_intel_speed_step_tech = "Enabled"
        execute_disable_bit = "Disabled"
        intel_hyper_threading_tech = "Enabled"
        intel_turbo_boost_tech = "Enabled"
        intel_virtualization_technology = "Disabled"
        intel_vt_for_directed_io = "Disabled"
        lv_ddr_mode = "Performance-Mode"
        select_memory_ras_configuration = "Maximum-Performance"
        numa_optimized = "Enabled"
        processor_c1e = "Disabled"
        processor_c3report = "Disabled"
        processor_c6report = "Disabled"
        processor_cstate = "Disabled"
        serial_port_aenable = "Disabled"
    }


    "Windows-Standard" = {
        organization = "default"
        tags         = []
        description  = "Windows-Standard - Hyper Threading disabled."
        # BIOS Customization Settings
        core_multi_processing = "All"
        cpu_performance = "Enterprise"
        enhanced_intel_speed_step_tech = "Disabled"
        execute_disable_bit = "Disabled"
        intel_hyper_threading_tech = "Disabled"
        intel_turbo_boost_tech = "Enabled"
        intel_virtualization_technology = "Disabled"
        intel_vt_for_directed_io = "Disabled"
        lv_ddr_mode = "Performance-Mode"
        select_memory_ras_configuration = "Maximum-Performance"
        numa_optimized = "Enabled"
        processor_c1e = "Disabled"
        processor_c3report = "Disabled"
        processor_c6report = "Disabled"
        processor_cstate = "Disabled"
        serial_port_aenable = "Disabled"
    }


    "Windows-Std-HT" = {
        organization = "default"
        tags         = []
        description  = "Windows-Standard - Hyper Threading enabled."
        # BIOS Customization Settings
        core_multi_processing = "All"
        cpu_performance = "Enterprise"
        enhanced_intel_speed_step_tech = "Disabled"
        execute_disable_bit = "Disabled"
        intel_hyper_threading_tech = "Enabled"
        intel_turbo_boost_tech = "Enabled"
        intel_virtualization_technology = "Disabled"
        intel_vt_for_directed_io = "Disabled"
        lv_ddr_mode = "Performance-Mode"
        select_memory_ras_configuration = "Maximum-Performance"
        numa_optimized = "Enabled"
        processor_c1e = "Disabled"
        processor_c3report = "Disabled"
        processor_c6report = "Disabled"
        processor_cstate = "Disabled"
        serial_port_aenable = "Disabled"
    }

}

#______________________________________________
#
# Boot Order Policies
#______________________________________________

policies_boot_order_custom = {

