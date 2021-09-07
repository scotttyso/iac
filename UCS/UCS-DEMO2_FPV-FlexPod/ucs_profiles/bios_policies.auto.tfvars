#______________________________________________
#
# BIOS Policy Variables
#______________________________________________

bios_policies = {
  "Virtual-Host" = {
    description  = "BIOS-Policy-for-Virtualization-on-Cisco-UCS-M5-Servers"
    name         = "Virtual-Host"
    organization = "UCS-DEMO2_FPV-FlexPod"
    tags         = [
      {
        key = "easyucs_origin",
        value = "convert",
      },
      {
        key = "easyucs_version",
        value = "0.9.8",
      },
    ]
    # BIOS Customization Settings
    cdn_enable = "enabled",
    cpu_energy_performance = "performance",
    cpu_frequency_floor = "enabled",
    dram_clock_throttling = "Performance",
    lv_ddr_mode = "performance-mode",
    processor_c1e = "disabled",
    processor_c3report = "disabled",
    processor_cstate = "disabled",
  }
  "ESX" = {
    description  = "BIOS-Policy-for-Virtualization-on-Cisco-UCS-M5-Servers"
    name         = "ESX"
    organization = "UCS-DEMO2_FPV-FlexPod"
    tags         = [
      {
        key = "easyucs_origin",
        value = "convert",
      },
      {
        key = "easyucs_version",
        value = "0.9.8",
      },
    ]
    # BIOS Customization Settings
    enhanced_intel_speed_step_tech = "disabled",
    execute_disable_bit = "enabled",
    intel_hyper_threading_tech = "enabled",
    intel_turbo_boost_tech = "disabled",
    intel_virtualization_technology = "enabled",
    intel_vt_for_directed_io = "enabled",
    intel_vtd_interrupt_remapping = "enabled",
  }
}