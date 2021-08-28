#______________________________________________
#
# BIOS Policies
#______________________________________________

bios_policies = {
  "ESX" = {
    description  = "Recommended-bios-settings-for-usNIC-vNICs"
    name         = "ESX"
    organization = "UCS-DEMO_ClientA"
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
    # BIOS Customization Settings
    cdn_enable = "enabled",
    enhanced_intel_speed_step_tech = "disabled",
    execute_disable_bit = "enabled",
    intel_hyper_threading_tech = "enabled",
    intel_turbo_boost_tech = "disabled",
    intel_virtualization_technology = "enabled",
    intel_vt_for_directed_io = "enabled",
    intel_vtd_interrupt_remapping = "enabled",
  }
  "HyperV" = {
    description  = "Recommended-bios-settings-for-usNIC-vNICs"
    name         = "HyperV"
    organization = "UCS-DEMO_ClientA"
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
    # BIOS Customization Settings
    cdn_enable = "enabled",
    enhanced_intel_speed_step_tech = "disabled",
    execute_disable_bit = "enabled",
    intel_hyper_threading_tech = "enabled",
    intel_turbo_boost_tech = "enabled",
    intel_virtualization_technology = "enabled",
    intel_vt_for_directed_io = "enabled",
  }
}