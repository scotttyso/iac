#______________________________________________
#
# Ethernet (vNIC) Network (VLAN) Group Policies
#______________________________________________

ethernet_network_group_policies = {
  "HyperFlex_hv-mgmt-a" = {
    allowed_vlans = "2"
    description   = ""
    native_vlan   = 3120
    organization  = "UCS-DEMO2_hyperflex"
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
  }
  "HyperFlex_hv-mgmt-b" = {
    allowed_vlans = "2"
    description   = ""
    native_vlan   = 3120
    organization  = "UCS-DEMO2_hyperflex"
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
  }
  "HyperFlex_hv-vmotion-a" = {
    allowed_vlans = "52"
    description   = ""
    native_vlan   = 3120
    organization  = "UCS-DEMO2_hyperflex"
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
  }
  "HyperFlex_hv-vmotion-b" = {
    allowed_vlans = "52"
    description   = ""
    native_vlan   = 3120
    organization  = "UCS-DEMO2_hyperflex"
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
  }
  "HyperFlex_storage-data-a" = {
    allowed_vlans = "51"
    description   = ""
    native_vlan   = 3120
    organization  = "UCS-DEMO2_hyperflex"
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
  }
  "HyperFlex_storage-data-b" = {
    allowed_vlans = "51"
    description   = ""
    native_vlan   = 3120
    organization  = "UCS-DEMO2_hyperflex"
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
  }
  "HyperFlex_vm-network-a" = {
    allowed_vlans = "53"
    description   = ""
    native_vlan   = 3120
    organization  = "UCS-DEMO2_hyperflex"
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
  }
  "HyperFlex_vm-network-b" = {
    allowed_vlans = "53"
    description   = ""
    native_vlan   = 3120
    organization  = "UCS-DEMO2_hyperflex"
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
  }
}