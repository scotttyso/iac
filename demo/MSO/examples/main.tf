module "schema_common_epg" {
    source    = "../modules/epg"
    tenant    = "common"
    schema    = "common"
    template  = "common"
    vrf_name  = "default"
    mso_item_list   = [
        {
            bridge_domain       = "example1"
            app_profile         = "example1"
            epg                 = "example1"
            contract_consumer   = "default"
            contract_provider   = "default"
        },
        {
            bridge_domain       = "example2"
            app_profile         = "example2"
            epg                 = "example2"
            contract_consumer   = "default"
            contract_provider   = "default"
        }
    ]
}
