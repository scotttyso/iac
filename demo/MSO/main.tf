resource "mso_site" "datacenter" {
    name            = var.dcname
    username        = var.dc1_user
    password        = var.dc1_password
    apic_site_id    = var.site_id
    urls            = [ var.mso_url ]
}

data "mso_user" "users" {
    username      = var.users[count.index]
}

resource "mso_tenant" "prod" {
    depends_on  = [
        mso_site.datacenter,
        for_each = mso_user.users


    ]
    name = "prod"
    display_name = "prod"
    site_associations{site_id = mso_site.dc1.id}
    user_associations{user_id = data.mso_user.tyscott.id,
                      user_id = data.mso_user.khoilee.id
                     }
}
