variable "snmp_ctx" {
	default = {
		"mgmt_inb_ctx" = {
			name        = "mgmt_inb_ctx"
			tenant      = "mgmt"
			ctx         = "inb"
		},
		"mgmt_oob_ctx" = {
			name        = "mgmt_oob_ctx"
			tenant      = "mgmt"
			ctx         = "oob"
		},
	}
}
