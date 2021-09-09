#______________________________________________
#
# Boot Order Policy Variables
#______________________________________________

boot_policies = {
  "iSCSI-Boot" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2_FPV-FlexPod"
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
    boot_devices = {
      "1" = {
        enabled     = true
        name        = "1"
        object_type = "boot.LocalCdd"
      },
      "2_primary" = {
        enabled       = true
        InterfaceName = "iSCSI-Boot-A",
        Port          = -1,
        name          = "2_primary"
        object_type   = "boot.Iscsi"
        Slot          = ""
      },
      "2_secondary" = {
        enabled       = true
        InterfaceName = "iSCSI-Boot-B",
        Port          = -1,
        name          = "2_secondary"
        object_type   = "boot.Iscsi"
        Slot          = ""
      },
    }
  }
  "default" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2_FPV-FlexPod"
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
    boot_devices = {
      "1" = {
        enabled     = true
        name        = "1"
        object_type = "boot.LocalDisk"
        Slot        = ""
      },
      "2_primary" = {
        enabled         = true
        InterfaceName   = "default",
        InterfaceSource = "name",
        IpType          = "None",
        MacAddress      = "",
        name            = "2_primary"
        object_type     = "boot.Pxe"
        Port            = -1,
        Slot            = ""
      },
      "3" = {
        enabled     = true
        name        = "3"
        object_type = "boot.LocalCdd"
      },
    }
  }
}