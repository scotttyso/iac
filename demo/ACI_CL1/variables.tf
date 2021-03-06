variable "apicUser" {
  type          = string
  description   = "APIC Username"
  default       = "admin"
}

variable "apicPass" {
  type          = string
  sensitive     = true
  description   = "APIC Password"
}

variable "apicHost" {
  type          = string
  description   = "API Endpoint URL"
  default       = "https://wakanda-apic01.rich.ciscolabs.com"
}
