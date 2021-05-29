/*
API Information:
 - Class: "pkiExportEncryptionKey"
 - Distinguished Name: "uni/exportcryptkey"
GUI Location:
 - System > System Settings > Global AES Passphrase Ecryption Settings
*/
resource "aci_rest" "Global_Encryption_Key" {
    path        = "/api/node/mo/uni/exportcryptkey.json"
    class_name  = "pkiExportEncryptionKey"
    payload     = <<EOF
{
    "pkiExportEncryptionKey": {
        "attributes": {
            "dn": "uni/exportcryptkey",
            "strongEncryptionEnabled": "true",
            "passphrase": "${var.Encryption_Key1}"
        },
        "children": []
    }
}
    EOF
}

