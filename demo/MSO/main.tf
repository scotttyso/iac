resource "mso_site" "dc1" {
    name            = "dc1"
    username        = "admin"
    password        = "password"
    apic_site_id    = "102"
    urls            = [ "marvel-ase01.rich.ciscolabs.com"]
}

data "mso_user" "tyscott" {
    username      = "tyscott"
}

data "mso_user" "khoilee" {
    username      = "khoilee"
}
resource "mso_tenant" "prod" {
    depends_on  = [
        mso_site.dc1,
        mso_user.user1
    ]
    name = "prod"
    display_name = "prod"
    site_associations{site_id = mso_site.dc1.id}
    user_associations{user_id = data.mso_user.tyscott.id,
                      user_id = data.mso_user.khoilee.id
                     }
}
