/*
API Information:
 - Class: "fileRemotePath"
 - Distinguished Name: "uni/fabric/path-lnx.example.com"
GUI Location:
 - Admin > Import/Export > Remote Locations:lnx.example.com
*/
resource "aci_rest" "backup_host_lnx-example-com" {
    path        = "/api/node/mo/uni/fabric/path-lnx.example.com.json"
    class_name  = "fileRemotePath"
    payload     = <<EOF
{
    "fileRemotePath": {
        "attributes": {
            "authType": "usePassword",
            "descr": "Linux Backup Server",
            "dn": "uni/fabric/path-lnx.example.com",
            "host": "lnx.example.com",
            "name": "lnx.example.com",
            "protocol": "sftp",
            "remotePath": "/tmp",
            "remotePort": "22",
            "userName": "${var.Backup_User1}",
            "userPasswd": "${var.Pwd_or_SSHPhrase1}",
            "rn": "path-lnx.example.com"
        },
        "children": [
            {
                "fileRsARemoteHostToEpg": {
                    "attributes": {
                        "tDn": "${var.out_of_band}"
                    },
                    "children": []
                }
            }
        ]
    }
}
    EOF
}

