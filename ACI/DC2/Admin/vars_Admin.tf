variable "admin_fwg" {
	default = {
		"switch_MgA" = {
			name        = "switch_MgA"
			firmware_group_type = "range"
		},
		"switch_MgB" = {
			name        = "switch_MgB"
			firmware_group_type = "range"
		},
	}
}

variable "admin_maintgroup" {
	default = {
		"switch_MgB" = {
			name        = "switch_MgA"
			fwtype      = "switch"
		},
		"switch_MgB" = {
			name        = "switch_MgB"
			fwtype      = "switch"
		},
		"vpod_MgA" = {
			name        = "vpod_MgA"
			fwtype      = "vpod"
		},
		"vpod_MgB" = {
			name        = "vpod_MgB"
			fwtype      = "vpod"
		},
	}
}