#______________________________________________
#
# Ethernet (vNIC) Network (VLAN) Group Policies
#______________________________________________

ethernet_network_group_policies = {
  "VG-ADMIN-SRV" = {
    allowed_vlans = "897"
    description   = ""
    native_vlan   = 2
    organization  = "UCS-DEMO2_CAGIP"
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
  "CEPH_CEPH-BE" = {
    allowed_vlans = "756"
    description   = ""
    native_vlan   = 2
    organization  = "UCS-DEMO2_CAGIP"
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
  "CEPH_CEPH-FE" = {
    allowed_vlans = "757"
    description   = ""
    native_vlan   = 2
    organization  = "UCS-DEMO2_CAGIP"
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
  "CPTE_CEPH-FE" = {
    allowed_vlans = "757"
    description   = ""
    native_vlan   = 2
    organization  = "UCS-DEMO2_CAGIP"
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
  "VG-SILCA" = {
    allowed_vlans = "1945"
    description   = ""
    native_vlan   = 2
    organization  = "UCS-DEMO2_CAGIP"
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
  "CPTE_OS-PRIVATE" = {
    allowed_vlans = "7"
    description   = ""
    native_vlan   = 2
    organization  = "UCS-DEMO2_CAGIP"
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