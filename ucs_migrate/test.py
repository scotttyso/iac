#!/usr/bin/env python3

from io import StringIO
from ucsmsdk.ucshandle import UcsHandle
from ucsmsdk.utils.ucsbackup import backup_ucs
import xml.etree.ElementTree as ET 

backup_dir = "./"
backup_filename = "config.xml"

def backup_ucsm():
    # Create a connection handle
    handle = UcsHandle("r143b-ucs.rich.ciscolabs.com", "admin", "N3ptune1")

    # Login to the server
    handle.login()


    backup_ucs(handle,
                backup_type="config-logical",
                file_dir= backup_dir,
                file_name= backup_filename)

    # Logout from the server
    handle.logout()

def parseXML(xmlfile): 
    # create element tree object 
    tree = ET.parse(xmlfile)

    # get root element 
    root = tree.getroot() 

    children = []

    children = root.getchildren()
    print(children)

    exit()

    orgs = []

    # create empty list for news items 
    config_dict = [] 
  
    # iterate news items 
    for item in root.findall('./channel/item'): 
  
        # empty news dictionary 
        news = {} 
  
        # iterate child elements of item 
        for child in item: 
  
            # special checking for namespace object content:media 
            if child.tag == '{http://search.yahoo.com/mrss/}content': 
                news['media'] = child.attrib['url'] 
            else: 
                news[child.tag] = child.text.encode('utf8') 
  
        # append news dictionary to news items list 
        config_dict.append(news) 
      
    # return news items list 
    return config_dict 

config_check = parseXML(backup_filename)