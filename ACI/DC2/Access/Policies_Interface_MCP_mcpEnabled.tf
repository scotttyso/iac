#------------------------------------------
# Create Mis-Cabling Protocol Policies
#------------------------------------------

/*
API Information:
 - Class: "mcpIfPol"
 - Distinguished Name: "uni/infra/mcpIfP-mcpEnabled"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > MCP Interface : mcpEnabled
*/
resource "aci_miscabling_protocol_interface_policy" "MCP_mcpEnabled" {
    admin_st    =  "enabled"
    name        =  "mcpEnabled"
    name_alias  =  "None"
}

