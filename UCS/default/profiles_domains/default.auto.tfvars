#______________________________________________
#
# Flow Control Policies
#______________________________________________

policies_flow_control = {
  "default" = {
    description          = ""
    flow_control_mode    = "auto"
    flow_control_receive = "off"
    flow_control_send    = "off"
    organization         = "default"
    tags                 = []
  }
}

#______________________________________________
#
# Link Aggregation Policies
#______________________________________________

policies_link_aggregation = {
  "default" = {
    description        = ""
    lacp_rate          = "normal"
    organization       = "default"
    suspend_individual = false
    tags               = []
  }
}

#______________________________________________
#
# Link Control Policies
#______________________________________________

policies_link_control = {
  "default" = {
    description      = ""
    organization     = "default"
    tags             = []
    udld_admin_state = "disabled"
    udld_mode        = "normal"
  }
}


policies_multicast = {
  "default" = {
    description    = ""
    organization   = "default"
    querier_ip     = ""
    querier_state  = "disabled"
    snooping_state = "enabled"
    tags           = []
    udld_admin_state = ""
    udld_mode        = ""
  }
 }

policies_vlan = {
  "default_vlans" = {
    auto_allow_on_uplinks = true
    description           = ""
    multicast_policy      = ""
    organization          = "default"
    vlan_list             = ""
    vlan_native           = "665"
    vlan_prefix           = ""
    vlan_map = [
      {
        name    = "2-ST-CORE"
        vlan_id = 2
      },
      {
        name    = "26-AL-Private-ESX"
        vlan_id = 26
      },
      {
        name    = "59-RADIOLOGY-BSRB-SERVERS"
        vlan_id = 59
      },
      {
        name    = "243-ST-Sentillian"
        vlan_id = 243
      },
      {
        name    = "249-ST-Server-Net"
        vlan_id = 249
      },
      {
        name    = "259-ST-FWSM-MiChart-DMZ"
        vlan_id = 259
      },
      {
        name    = "260-ST-Ds-Novell-AL-MR"
        vlan_id = 260
      },
      {
        name    = "270-AL-CS11K-ALMR-Internal"
        vlan_id = 270
      },
      {
        name    = "276-SYS-WBI-1"
        vlan_id = 276
      },
      {
        name    = "288-ST-VmWare-NAS"
        vlan_id = 288
      },
      {
        name    = "293-ST-DS-WIN-AL-MR"
        vlan_id = 293
      },
      {
        name    = "294-ST-DS-OMP-PROD"
        vlan_id = 294
      },
      {
        name    = "295-ST-DS-OMP-TEST"
        vlan_id = 295
      },
      {
        name    = "296-ST-DS-OMP-Monitor"
        vlan_id = 296
      },
      {
        name    = "297-ST-EHIS"
        vlan_id = 297
      },
      {
        name    = "658-AL-ESX-VC-Console"
        vlan_id = 658
      },
      {
        name    = "659-AL-ESX-VMoition"
        vlan_id = 659
      },
      {
        name    = "984-Call-Manager-VMs"
        vlan_id = 984
      },
      {
        name    = "1100-ST-RADIOLOGY-SERVERS"
        vlan_id = 1100
      },
      {
        name    = "1101-ST-RADIOLOGY-SERVERS"
        vlan_id = 1101
      },
      {
        name    = "1105-ST-RADIOLOGY-SERVERS"
        vlan_id = 1105
      },
      {
        name    = "1106-RADIOLOGY-WS-VM"
        vlan_id = 1106
      },
      {
        name    = "1109-ST-RADIOLOGY"
        vlan_id = 1109
      },
      {
        name    = "1112-ST-RADIOLOGY-ESX-CONSOLE"
        vlan_id = 1112
      },
      {
        name    = "1224-NET-NAC-ISE"
        vlan_id = 1224
      },
      {
        name    = "1225-ST-DS-SERVERS-A"
        vlan_id = 1225
      },
      {
        name    = "1226-NC-DS-Servers-B"
        vlan_id = 1226
      },
      {
        name    = "1230-NC-ACE-LOCAL-Services-A"
        vlan_id = 1230
      },
      {
        name    = "1231-NC-ACE-LOCAL-Services-B"
        vlan_id = 1231
      },
      {
        name    = "1232-NC-ACE-LOCAL-Services-C"
        vlan_id = 1232
      },
      {
        name    = "1233-NC-ACE-LOCAL-Services-D"
        vlan_id = 1233
      },
      {
        name    = "1234-NET-APPLIANCES"
        vlan_id = 1234
      },
      {
        name    = "1235-NC-ESX-SVC-Consoles"
        vlan_id = 1235
      },
      {
        name    = "1236-IDM-LOADBALANCED"
        vlan_id = 1236
      },
      {
        name    = "1237-ST-ESX-SVC-Consoles"
        vlan_id = 1237
      },
      {
        name    = "1238-MAC-SECURITY"
        vlan_id = 1238
      },
      {
        name    = "1239-NC-DS-WINDOWS-Servers"
        vlan_id = 1239
      },
      {
        name    = "1245-P-UMHS"
        vlan_id = 1245
      },
      {
        name    = "1247-NC-NTS-AMCOM-ACE"
        vlan_id = 1247
      },
      {
        name    = "1252-ST-Exchange-Replication"
        vlan_id = 1252
      },
      {
        name    = "1253-ST-Exchange-Mapi"
        vlan_id = 1253
      },
      {
        name    = "1256-ST-MailRelay"
        vlan_id = 1256
      },
      {
        name    = "1285-ST-IDMT-ACE-Servers"
        vlan_id = 1285
      },
      {
        name    = "1288-ST-EHIS-CLUSTER-HEART"
        vlan_id = 1288
      },
      {
        name    = "1289-ST-UCS-BLADE-CIMC"
        vlan_id = 1289
      },
      {
        name    = "1355-RES-HSRN"
        vlan_id = 1355
      },
      {
        name    = "1356-CEI"
        vlan_id = 1356
      },
      {
        name    = "1357-CEI"
        vlan_id = 1357
      },
      {
        name    = "1359-ST-UMHS"
        vlan_id = 1359
      },
      {
        name    = "1360-OPENSHIFT-QA"
        vlan_id = 1360
      },
      {
        name    = "1361-FW-AZURE-VPN-OUTSIDE"
        vlan_id = 1361
      },
      {
        name    = "1362-FW-AZURE-FAILOVER"
        vlan_id = 1362
      },
      {
        name    = "1363-FW-AZURE-STATE"
        vlan_id = 1363
      },
      {
        name    = "1364-KUBERNETES-NFS"
        vlan_id = 1364
      },
      {
        name    = "1365-OPENSHIFT-PROD"
        vlan_id = 1365
      },
      {
        name    = "1400-VIDEO-ARCHIVE"
        vlan_id = 1400
      },
      {
        name    = "1401-ST-NTS-Video-Application"
        vlan_id = 1401
      },
      {
        name    = "1402-OMNICELL"
        vlan_id = 1402
      },
      {
        name    = "1403-FW-Maclab"
        vlan_id = 1403
      },
      {
        name    = "1407-FW-SIEMENSVIBE"
        vlan_id = 1407
      },
      {
        name    = "1409-ST-NTS-FWSM-NTSKDXCATH"
        vlan_id = 1409
      },
      {
        name    = "1411-ST-FW-AMCOMNEW"
        vlan_id = 1411
      },
      {
        name    = "1412-ST-FW-AMCOMTEST"
        vlan_id = 1412
      },
      {
        name    = "1413-ST-FWSM-NTS-HUGS"
        vlan_id = 1413
      },
      {
        name    = "1414-ST-FWSM-NTS-Nursecall"
        vlan_id = 1414
      },
      {
        name    = "1415"
        vlan_id = 1415
      },
      {
        name    = "1416-ST-FWSM-NTS-CCURE9K"
        vlan_id = 1416
      },
      {
        name    = "1417-ST-PIM-VAULT"
        vlan_id = 1417
      },
      {
        name    = "1418-ST-FWSM-NTS-Siemens-BMS"
        vlan_id = 1418
      },
      {
        name    = "1419-ST-NTS-PEDS-XPER"
        vlan_id = 1419
      },
      {
        name    = "1420-FW-EXTERNAL"
        vlan_id = 1420
      },
      {
        name    = "1422-ST-OBIX-PROD"
        vlan_id = 1422
      },
      {
        name    = "1423-ST-OBIX-TEST"
        vlan_id = 1423
      },
      {
        name    = "1426-NETSCALER"
        vlan_id = 1426
      },
      {
        name    = "1427-FW-AVAYA-PHONEPROXY"
        vlan_id = 1427
      },
      {
        name    = "1431-FW-APIM-INSIDE-PROD"
        vlan_id = 1431
      },
      {
        name    = "1433-FW-APIM-DMZ-DEV"
        vlan_id = 1433
      },
      {
        name    = "1434-FW-APIM-INSIDE-DEV"
        vlan_id = 1434
      },
      {
        name    = "1435-FW-NTS-BMS"
        vlan_id = 1435
      },
      {
        name    = "1454-ST-MiChart-Win"
        vlan_id = 1454
      },
      {
        name    = "1455-ST-LB-MICHART-WIN-VIPS"
        vlan_id = 1455
      },
      {
        name    = "1455-ST-MiChart-Win-VIPS"
        vlan_id = 1455
      },
      {
        name    = "1456-ST-MiChart-CITRIX"
        vlan_id = 1456
      },
      {
        name    = "1458-AMCOM-PROD-PRIV"
        vlan_id = 1458
      },
      {
        name    = "1466-UMHS-MULTIMEDIA"
        vlan_id = 1466
      },
      {
        name    = "1476-ST-RADONC-CITRIX"
        vlan_id = 1476
      },
      {
        name    = "1498-ST-FWSM-NTS-Ped-Card"
        vlan_id = 1498
      },
      {
        name    = "1500-UC-SFB-PUBLIC"
        vlan_id = 1500
      },
      {
        name    = "1501-UC-SFB-PRIVATE"
        vlan_id = 1501
      },
      {
        name    = "1670-ST-GWN"
        vlan_id = 1670
      },
      {
        name    = "2001-Call-Manager-VMs"
        vlan_id = 2001
      },
      {
        name    = "2012-Call-Manager-VMs"
        vlan_id = 2012
      },
      {
        name    = "2153-ASPECT"
        vlan_id = 2153
      },
      {
        name    = "2154-ASPECT"
        vlan_id = 2154
      },
      {
        name    = "2251-ST-ASPECT"
        vlan_id = 2251
      },
      {
        name    = "2252-ST-ASPECT"
        vlan_id = 2252
      },
      {
        name    = "2253-ST-ASPECT"
        vlan_id = 2253
      },
      {
        name    = "2254-ST-ASPECT"
        vlan_id = 2254
      },
      {
        name    = "3147-ST-STORAGE"
        vlan_id = 3147
      },
    ]
  }
}

policies_network_connectivity = {
  "default_dns" = {
    description = ""
    dns_server_v4 = [
      "172.20.1.244",
      "172.20.1.252",
    ]
    dns_server_v6 = []
    organization  = "default"
    tags          = []
    update_domain = ""
  }
}

#______________________________________________
#
# NTP Policies
#______________________________________________

policies_ntp = {
  "default_ntp_sw" = {
    description  = ""
    enabled      = true
    ntp_servers  = [
      "ntp.ent.med.umich.edu",
    ]
    organization = "default"
    tags         = []
    timezone     = "America/Detroit"
  }
}

