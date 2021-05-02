#------------------------------------------
# Create Port Security Interface Policies
#------------------------------------------

/*
API Information:
 - Class: "l2PortSecurityPol"
 - Distinguished Name: "uni/infra/portsecurityP-default"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > Port Security : default
*/
resource "aci_port_security_policy" "Port_Security_default" {
    maximum     =  "0"
    name        =  "default"
    name_alias  =  "None"
    timeout     =  "60"
}

