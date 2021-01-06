/*
 Fabric Policies > Policies > Pod > SNMP > Default - [Client Group Policies]
*/
variable "SNMP_ClntGrps" {
  default = {
  	"Inband" = {
  		name    = "Inband"
  		epg		= "inb-default"
  	},
  	"Out-of-Band" = {
  		name    = "Out-of-Band"
  		epg		= "oob-default"
  	},
  }
}