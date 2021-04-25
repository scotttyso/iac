/*
*** main.tf Variables **
- To Protect Sensitive Information from a GitHub repository, store these variables in your environment using:
  TF_VAR_<variable>='value' 
  In Example:
  TF_VAR_aciUser='admin'
- If you want to store Sensitive Information in this file, then in the variable attributes add the default value... 
  For Example:
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

