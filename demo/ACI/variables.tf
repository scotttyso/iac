variable "apicUser" {
  type          = string
  description   = "APIC Username"
  default       = "admin"
}

variable "apicPass" {
  type          = string
  description   = "APIC Password"
}

variable "apicHost" {
  type          = string
  description   = "API Endpoint URL"
  default       = "https://192.168.64.84"
}
