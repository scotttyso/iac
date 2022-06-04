terraform {
  experiments = [module_variable_optional_attrs]
}

variable "certName" {
  default     = ""
  description = "Cisco ACI Certificate Name for SSL Based Authentication"
  sensitive   = true
  type        = string
}

variable "apicPass" {
  default     = "cisco123"
  description = "Password for User based Authentication."
  sensitive   = true
  type        = string
}

variable "apicUrl" {
  default = "64.14.100.15"
  description = "Cisco APIC URL.  In Example http://apic.example.com"
  type        = string
}

variable "apicUser" {
  default     = "admin"
  description = "Username for User based Authentication."
  type        = string
}

variable "apic_version" {
  default     = "5.2(1g)"
  description = "The Version of ACI Running in the Environment."
  type        = string
}

variable "privateKey" {
  default     = ""
  description = "Cisco ACI Private Key for SSL Based Authentication."
  sensitive   = true
  type        = string
}

variable "annotation" {
  default     = ""
  description = "workspace tag value."
  type        = string
}
