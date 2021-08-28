#______________________________________________
#
# Ethernet (vNIC) Network (VLAN) Group Policies
#______________________________________________

ethernet_network_group_policies = {
  "ESX_admin" = {
    allowed_vlans = "2"
    description   = ""
    native_vlan   = 2
    tags          = [
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
  "ESX_vmdata1-gold" = {
    allowed_vlans = "100,101,102,103"
    description   = ""
    native_vlan   = 2
    tags          = [
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
  "ESX_vmdata2-gold" = {
    allowed_vlans = "100,101,102,103"
    description   = ""
    native_vlan   = 2
    tags          = [
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
  "ESX_vmdata3-bronze" = {
    allowed_vlans = "109,110"
    description   = ""
    native_vlan   = 2
    tags          = [
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
  "ESX_vmdata4-bronze" = {
    allowed_vlans = "109,110"
    description   = ""
    native_vlan   = 2
    tags          = [
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
  "ESX_vmotion" = {
    allowed_vlans = "2"
    description   = ""
    native_vlan   = 2
    tags          = [
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
  "Windows_LCP_Admin" = {
    allowed_vlans = "2"
    description   = ""
    native_vlan   = 2
    tags          = [
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
  "Windows_LCP_Backup-A" = {
    allowed_vlans = "2"
    description   = ""
    native_vlan   = 2
    tags          = [
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
  "Windows_LCP_Backup-B" = {
    allowed_vlans = "2"
    description   = ""
    native_vlan   = 2
    tags          = [
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
  "Windows_LCP_FrontEnd-A" = {
    allowed_vlans = "2"
    description   = ""
    native_vlan   = 2
    tags          = [
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
  "Windows_LCP_FrontEnd-B" = {
    allowed_vlans = "2"
    description   = ""
    native_vlan   = 2
    tags          = [
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
  "Windows_LCP_Heartbeat" = {
    allowed_vlans = "2"
    description   = ""
    native_vlan   = 2
    tags          = [
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