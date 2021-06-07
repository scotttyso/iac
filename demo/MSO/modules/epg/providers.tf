terraform {
    # Terraform Engine version
    required_version = ">=0.15.1"
    required_providers {
        mso = {
            # MSO Provider Source
            source = "CiscoDevNet/mso"
            # MSO Provider Version
            version = ">=0.1.5"
        }
    }
}
