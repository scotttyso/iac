#------------------------------------------
# Create Mis-Cabling Protocol Policies
#------------------------------------------

/*
API Information:
 - Class: "mcpIfPol"
 - Distinguished Name: "uni/infra/mcpIfP-mcpDisabled"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > MCP Interface : mcpDisabled
*/
resource "aci_miscabling_protocol_interface_policy" "mcpDisabled" {
    admin_st    =  "disabled"
    name        =  "mcpDisabled"
    name_alias  =  "None"
}

