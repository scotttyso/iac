# ACI - MSO Infrastructure as Code


[![published](https://static.production.devnetcloud.com/codeexchange/assets/images/devnet-published.svg)](https://developer.cisco.com/codeexchange/github/repo/scotttyso/iac)

- Terraform ACI Provider
- Terraform Intersight Provider
- Terraform MSO Provider

## Updates/News

### NOTICE - This modules is depricated and no longer being actively developed.

It has been replaces with: 
## ![iac-easy-aci](https://github.com/scotttyso/iac-easy-aci)

### Deprication Reason

The new version of the module has been re-architectured to use a more modular approach instead of individual resource files for each object being created.  This new method makes it so the modules are much easier to find/read and give the user an opportunity to move away from the Excel Spreadsheet and use Infrastructure as Code directly.

As it was such a major shift from how this module is built today, it was better to migrate instead of change in the event people are still using this.

## Synopsis

The purpose of these Terraform and Python scripts are to deploy Infrastructure.  Much of the automation is written to simplify the procedures for customers when doing infrastructure as code.  The naming convention is very generic and should work for most customers

## Overview

ACI

Cisco Application Centric Infrastructure is a widely adopted technology.  The biggest challenge in adopting is the shift from the traditional CLI based management of the traditional Cisco networking technologies.  The purpose of these scripts/tools is to ease that transition and to help customers more quickly adopt/transition to Cisco ACI.

Intersight

Intersight is the management platform of the future for Compute Infrastructure.  The Automation herein will automate deployments of infrastructure through intersight.

## Deployment Features - What this will build

The Startup Scripts will Deploy the following

ACI

- Register ACI Leaf and Spine devices for Fabric Membership
- Configure DNS Servers and Search Domains
- Configure NTP Servers
- Configure BGP Autonomous System and register Spines as Route-Reflectors
- Create Fabric Access Policies
  - Interface Policies
    - CDP Policies
    - LACP Policies
    - Link Speed Policies
    - LLDP Policies
    - MCP Policies
  - Fibre-Channel Policies
    - Link Speed Policies
    - NP and F port Policies
  - AAEP Policies
  - Layer 3 Domain Policies
  - Physical Domain Policies
- Vlan Pools
- Create Leaf Profiles
  - Associate Leaf Interface Profiles
  - create default interface selectors

To sum this up... the goal is to make the ACI Fabric ready to go out of the box.

## Resources

Youtube Video's to follow.  This is still a work in progress

## Getting Started

Terraform Requirements

- terraform must be installed with the following providers:

- ACI: Providers/CiscoDevNet/aci/ Version 0.5.3+ in place
- Intersight: Providers/CiscoDevNet/intersight Version 0.1.2+ in place

Python Requirements

- Python 3.6+.  Refer to requirements.txt for modules

## Disclaimer

This code is provided as is.  No warranty, support, or guarantee is provided with this.
