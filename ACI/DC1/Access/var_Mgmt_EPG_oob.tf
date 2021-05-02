/*
 - Setting up the Mgmt EPG Distinguished Names
*/
variable "out_of_band" {
  description   = "out_of_band Distinguished Name"
  type          = string
  default       = "uni/tn-mgmt/mgmtp-default/oob-default"
}

