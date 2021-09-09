#______________________________________________
#
# Boot Order Policy Variables
#______________________________________________

boot_policies = {
  "default" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2_ClientA"
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
  "CDROM-HDD-PXE" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2_ClientA"
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
      "2" = {
        enabled     = true
        name        = "2"
        object_type = "boot.LocalDisk"
        Slot        = ""
      },
      "3_primary" = {
        enabled         = true
        InterfaceName   = "eth0",
        InterfaceSource = "name",
        IpType          = "IPv4",
        MacAddress      = "",
        name            = "3_primary"
        object_type     = "boot.Pxe"
        Port            = -1,
        Slot            = ""
      },
      "3_secondary" = {
        enabled         = true
        InterfaceName   = "eth1",
        InterfaceSource = "name",
        IpType          = "",
        MacAddress      = "",
        name            = "3_secondary"
        object_type     = "boot.Pxe"
        Port            = -1,
        Slot            = ""
      },
    }
  }
}