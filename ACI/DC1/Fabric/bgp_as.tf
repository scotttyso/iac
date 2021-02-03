/*
API Information:
 - Class: "bgpAsP"
 - Distinguished Name: "uni/fabric/bgpInstP-default"
GUI Location:
 - System > System Settings > BGP Route Reflector: Autonomous System Number
*/
resource "aci_autonomous_system_profile" "as_65501" {
    asn         = "65501"
} 

