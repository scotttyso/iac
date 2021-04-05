/*
*** main.tf Variables **
- To not publicly store this information on GitHub store these variables in your environment using
  TF_VAR_<variable>='value' in example:
  TF_VAR_aciUser='admin'
- If you want to store in this file then in the variable attributes add the value... for example:
  variable "aciUser" {
    default   = "admin"
  }
*/
variable "aciPrivateKey" {
  description   = "Private-Key to Authenticate the Certificate"
  type          = string
  sensitive     = true
}

variable "aciCertName" {
  description   = "Private-Key to Authenticate the Certificate"
  type          = string
  sensitive     = true
}

variable "aciUrl" {
  description   = "This can be the IP or Hostname of the ACI Host you will be configuring"
  type          = string
  default       = "https://brahma-apic2.rich.ciscolabs.com"
}

