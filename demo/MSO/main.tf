data "mso_site" "datacenter" {
    name            = var.dcname
}

data "mso_user" "users" {
    username    = var.users[count.index].name
    count       = length(var.users)
}

# resource "mso_tenant" "prod" {
#     depends_on  = [
#         mso_site.datacenter,
#         for_each = mso_user.users
#         mso_user.users
#
#     ]
#     name = "prod"
#     display_name = "prod"
#     site_associations{site_id = mso_site.dc1.id}
#     user_associations{user_id = data.mso_user.tyscott.id,
#                       user_id = data.mso_user.khoilee.id
#                      }
# }
