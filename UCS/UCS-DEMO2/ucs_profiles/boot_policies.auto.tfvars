#______________________________________________
#
# Boot Order Policy Variables
#______________________________________________

boot_policies = {
  "CDROM-HDD-PXE" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2"
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
        additional_properties = ""
        enabled               = true
        name                  = "1"
        object_type           = "boot.LocalCdd"
      },
      "2" = {
        additional_properties = jsonencode(
          {
            Bootloader = {
              ClassId     = "boot.Bootloader",
              Description = "UEFI Bootloader",
              Name        = "BOOTx64.EFI",
              ObjectType  = "boot.Bootloader",
              Path        = "\\EFI\\BOOT\\",
            },
            Slot = "MLOM"
          }
        )
        enabled               = true
        name                  = "2"
        object_type           = "boot.LocalDisk"
      },
      "3_primary" = {
        additional_properties = jsonencode(
          {
            InterfaceName   = "eth0",
            InterfaceSource = "name",
            IpType          = "IPv4",
            MacAddress      = "",
            Port            = -1,
            Slot            = "MLOM"
          }
        )
        enabled               = true
        name                  = "3_primary"
        object_type           = "boot.Pxe"
      },
      "3_secondary" = {
        additional_properties = jsonencode(
          {
            InterfaceName   = "eth1",
            InterfaceSource = "name",
            IpType          = "",
            MacAddress      = "",
            Port            = -1,
            Slot            = "MLOM"
          }
        )
        enabled               = true
        name                  = "3_secondary"
        object_type           = "boot.Pxe"
      },
    }
  }
  "default" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2"
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
        additional_properties = jsonencode(
          {
            Bootloader = {
              ClassId     = "boot.Bootloader",
              Description = "UEFI Bootloader",
              Name        = "BOOTx64.EFI",
              ObjectType  = "boot.Bootloader",
              Path        = "\\EFI\\BOOT\\",
            },
            Slot = "MLOM"
          }
        )
        enabled               = true
        name                  = "1"
        object_type           = "boot.LocalDisk"
      },
      "2_primary" = {
        additional_properties = jsonencode(
          {
            InterfaceName   = "default",
            InterfaceSource = "name",
            IpType          = "None",
            MacAddress      = "",
            Port            = -1,
            Slot            = "MLOM"
          }
        )
        enabled               = true
        name                  = "2_primary"
        object_type           = "boot.Pxe"
      },
      "3" = {
        additional_properties = ""
        enabled               = true
        name                  = "3"
        object_type           = "boot.LocalCdd"
      },
    }
  }
  "default-UEFI" = {
    boot_mode          = "Uefi"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2"
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
        additional_properties = jsonencode(
          {
            Bootloader = {
              ClassId     = "boot.Bootloader",
              Description = "UEFI Bootloader",
              Name        = "BOOTx64.EFI",
              ObjectType  = "boot.Bootloader",
              Path        = "\\EFI\\BOOT\\",
            },
            Slot = "MLOM"
          }
        )
        enabled               = true
        name                  = "1"
        object_type           = "boot.LocalDisk"
      },
      "2_primary" = {
        additional_properties = jsonencode(
          {
            InterfaceName   = "default",
            InterfaceSource = "name",
            IpType          = "None",
            MacAddress      = "",
            Port            = -1,
            Slot            = "MLOM"
          }
        )
        enabled               = true
        name                  = "2_primary"
        object_type           = "boot.Pxe"
      },
      "3" = {
        additional_properties = ""
        enabled               = true
        name                  = "3"
        object_type           = "boot.LocalCdd"
      },
    }
  }
  "diag" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2"
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
        additional_properties = ""
        enabled               = true
        name                  = "1"
        object_type           = "boot.LocalCdd"
      },
    }
  }
  "Easy_ismayil" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2"
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
      "1_primary" = {
        additional_properties = jsonencode(
          {
            InterfaceName   = "eth0",
            InterfaceSource = "name",
            IpType          = "",
            MacAddress      = "",
            Port            = -1,
            Slot            = "MLOM"
          }
        )
        enabled               = true
        name                  = "1_primary"
        object_type           = "boot.Pxe"
      },
    }
  }
  "FC" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2"
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
        additional_properties = ""
        enabled               = true
        name                  = "1"
        object_type           = "boot.LocalCdd"
      },
      "2_primary_primary" = {
        additional_properties = jsonencode(
          {
            InterfaceName = "SAN-A",
            Lun           = 0,
            Port          = -1,
            Slot          = "MLOM",
            Wwpn          = "20:03:D0:39:EA:1D:32:89"
          }
        )
        enabled               = true
        name                  = "2_primary_primary"
        object_type           = "boot.San"
      },
      "2_primary_secondary" = {
        additional_properties = jsonencode(
          {
            InterfaceName = "SAN-A",
            Lun           = 0,
            Port          = -1,
            Slot          = "MLOM",
            Wwpn          = "20:04:D0:39:EA:1D:32:89"
          }
        )
        enabled               = true
        name                  = "2_primary_secondary"
        object_type           = "boot.San"
      },
      "2_secondary_primary" = {
        additional_properties = jsonencode(
          {
            InterfaceName = "SAN-B",
            Lun           = 0,
            Port          = -1,
            Slot          = "MLOM",
            Wwpn          = "20:01:D0:39:EA:1D:32:89"
          }
        )
        enabled               = true
        name                  = "2_secondary_primary"
        object_type           = "boot.San"
      },
      "2_secondary_secondary" = {
        additional_properties = jsonencode(
          {
            InterfaceName = "SAN-B",
            Lun           = 0,
            Port          = -1,
            Slot          = "MLOM",
            Wwpn          = "20:02:D0:39:EA:1D:32:89"
          }
        )
        enabled               = true
        name                  = "2_secondary_secondary"
        object_type           = "boot.San"
      },
      "3" = {
        additional_properties = jsonencode({ Subtype = "cimc-mapped-dvd" })
        enabled               = true
        name                  = "3"
        object_type           = "boot.VirtualMedia"
      },
    }
  }
  "global-default" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2"
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
        additional_properties = jsonencode(
          {
            Bootloader = {
              ClassId     = "boot.Bootloader",
              Description = "UEFI Bootloader",
              Name        = "BOOTx64.EFI",
              ObjectType  = "boot.Bootloader",
              Path        = "\\EFI\\BOOT\\",
            },
            Slot = "MLOM"
          }
        )
        enabled               = true
        name                  = "1"
        object_type           = "boot.LocalDisk"
      },
      "2_primary" = {
        additional_properties = jsonencode(
          {
            InterfaceName   = "default",
            InterfaceSource = "name",
            IpType          = "None",
            MacAddress      = "",
            Port            = -1,
            Slot            = "MLOM"
          }
        )
        enabled               = true
        name                  = "2_primary"
        object_type           = "boot.Pxe"
      },
      "3" = {
        additional_properties = ""
        enabled               = true
        name                  = "3"
        object_type           = "boot.LocalCdd"
      },
    }
  }
  "ipvtest" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2"
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
      "1_primary" = {
        additional_properties = jsonencode(
          {
            InterfaceName   = "",
            InterfaceSource = "name",
            IpType          = "IPv4",
            MacAddress      = "",
            Port            = -1,
            Slot            = "MLOM"
          }
        )
        enabled               = true
        name                  = "1_primary"
        object_type           = "boot.Pxe"
      },
    }
  }
  "ISCSI" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2"
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
        additional_properties = ""
        enabled               = true
        name                  = "1"
        object_type           = "boot.LocalCdd"
      },
      "2_primary" = {
        additional_properties = jsonencode(
          {
            InterfaceName = "ISCSI-BOOT-A",
            Port          = -1,
            Slot          = "MLOM"
          }
        )
        enabled               = true
        name                  = "2_primary"
        object_type           = "boot.Iscsi"
      },
      "2_secondary" = {
        additional_properties = jsonencode(
          {
            InterfaceName = "ISCSI-BOOT-B",
            Port          = -1,
            Slot          = "MLOM"
          }
        )
        enabled               = true
        name                  = "2_secondary"
        object_type           = "boot.Iscsi"
      },
      "3" = {
        additional_properties = jsonencode({ Subtype = "cimc-mapped-dvd" })
        enabled               = true
        name                  = "3"
        object_type           = "boot.VirtualMedia"
      },
    }
  }
  "ISCSI-2" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2"
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
        additional_properties = ""
        enabled               = true
        name                  = "1"
        object_type           = "boot.LocalCdd"
      },
      "2_primary" = {
        additional_properties = jsonencode(
          {
            InterfaceName = "ISCSI-A",
            Port          = -1,
            Slot          = "MLOM"
          }
        )
        enabled               = true
        name                  = "2_primary"
        object_type           = "boot.Iscsi"
      },
      "2_secondary" = {
        additional_properties = jsonencode(
          {
            InterfaceName = "ISCSI-B",
            Port          = -1,
            Slot          = "MLOM"
          }
        )
        enabled               = true
        name                  = "2_secondary"
        object_type           = "boot.Iscsi"
      },
      "3" = {
        additional_properties = jsonencode({ Subtype = "cimc-mapped-dvd" })
        enabled               = true
        name                  = "3"
        object_type           = "boot.VirtualMedia"
      },
    }
  }
  "SDCard" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2"
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
        additional_properties = ""
        enabled               = true
        name                  = "1"
        object_type           = "boot.LocalCdd"
      },
      "2" = {
        additional_properties = jsonencode(
          {
            Lun     = 0,
            Subtype = ""
          }
        )
        enabled               = true
        name                  = "2"
        object_type           = "boot.SdCard"
      },
      "3" = {
        additional_properties = jsonencode({ Subtype = "cimc-mapped-dvd" })
        enabled               = true
        name                  = "3"
        object_type           = "boot.VirtualMedia"
      },
    }
  }
  "testIscsi" = {
    boot_mode          = "Uefi"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2"
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
        additional_properties = jsonencode(
          {
            Bootloader = {
              ClassId     = "boot.Bootloader",
              Description = "UEFI Bootloader",
              Name        = "BOOTx64.EFI",
              ObjectType  = "boot.Bootloader",
              Path        = "\\EFI\\BOOT\\",
            },
            Slot = "MLOM"
          }
        )
        enabled               = true
        name                  = "1"
        object_type           = "boot.LocalDisk"
      },
      "2_primary" = {
        additional_properties = jsonencode(
          {
            Bootloader = {
              ClassId     = "boot.Bootloader",
              Description = "UEFI Bootloader",
              Name        = "BOOTx64.EFI",
              ObjectType  = "boot.Bootloader",
              Path        = "\\EFI\\BOOT\\",
            },
            InterfaceName = "test",
            Port          = -1,
            Slot          = "MLOM"
          }
        )
        enabled               = true
        name                  = "2_primary"
        object_type           = "boot.Iscsi"
      },
      "2_secondary" = {
        additional_properties = jsonencode(
          {
            Bootloader = {
              ClassId     = "boot.Bootloader",
              Description = "UEFI Bootloader",
              Name        = "BOOTx64.EFI",
              ObjectType  = "boot.Bootloader",
              Path        = "\\EFI\\BOOT\\",
            },
            InterfaceName = "toto",
            Port          = -1,
            Slot          = "MLOM"
          }
        )
        enabled               = true
        name                  = "2_secondary"
        object_type           = "boot.Iscsi"
      },
    }
  }
  "utility" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2"
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
      "1_primary" = {
        additional_properties = jsonencode(
          {
            InterfaceName   = "default",
            InterfaceSource = "name",
            IpType          = "None",
            MacAddress      = "",
            Port            = -1,
            Slot            = "MLOM"
          }
        )
        enabled               = true
        name                  = "1_primary"
        object_type           = "boot.Pxe"
      },
    }
  }
  "VCF-iSCSI" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2"
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
        additional_properties = ""
        enabled               = true
        name                  = "1"
        object_type           = "boot.LocalCdd"
      },
      "2_primary" = {
        additional_properties = jsonencode(
          {
            InterfaceName = "ETH2-BOOT-iSCSI",
            Port          = -1,
            Slot          = "MLOM"
          }
        )
        enabled               = true
        name                  = "2_primary"
        object_type           = "boot.Iscsi"
      },
      "2_secondary" = {
        additional_properties = jsonencode(
          {
            InterfaceName = "ETH3-BOOT-iSCSI",
            Port          = -1,
            Slot          = "MLOM"
          }
        )
        enabled               = true
        name                  = "2_secondary"
        object_type           = "boot.Iscsi"
      },
      "3" = {
        additional_properties = jsonencode({ Subtype = "cimc-mapped-dvd" })
        enabled               = true
        name                  = "3"
        object_type           = "boot.VirtualMedia"
      },
    }
  }
}