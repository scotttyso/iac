/*
API Information:
 - Class: "fileRemotePath"
 - Distinguished Name: "uni/fabric/path-lnx2.rich.ciscolabs.com"
GUI Location:
 - Admin > Import/Export > Remote Locations:lnx2.rich.ciscolabs.com
*/
resource "aci_rest" "Remote_Location_lnx2-rich-ciscolabs-com" {
    path        = "/api/node/mo/uni/fabric/path-lnx2.rich.ciscolabs.com.json"
    class_name  = "fileRemotePath"
    payload     = <<EOF
{
    "fileRemotePath": {
        "attributes": {
            "authType": "usePassword",
            "descr": "LNX Backup Server",
            "dn": "uni/fabric/path-lnx2.rich.ciscolabs.com",
            "host": "lnx2.rich.ciscolabs.com",
            "name": "lnx2.rich.ciscolabs.com",
            "protocol": "sftp",
            "remotePath": "/tmp",
            "remotePort": "22",
            "userName": "${var.Backup_User1}",
            "userPasswd": "${var.Pwd_or_SSHPhrase1}",
            "rn": "path-lnx2.rich.ciscolabs.com"
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

