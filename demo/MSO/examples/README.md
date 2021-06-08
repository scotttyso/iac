# Terraform Nexus Dashboard Orchestrator Module Example

## Usage

Please refer to the main.tf for an example of consuming these modules.

This module will Create the following in a Schema Template.

* Bridge Domain(s)
* Application Profile(s)
* Endpoint Group(s)

## MSO Reference Information

* GUI Location: Application Management > Schemas > {Schema Name} > {Template Name}

## Important Notes when Running the Module

Note: Make sure to use the "-parallelism=1" Option when running the apply.  In example:

``` hcl

terraform plan -out=main.plan

terraform apply -parallelism=1 main.plan

```

For the Provider Variables we would recommend you add these as Variables either in Environment or the workspace instance

``` bash

export TF_VAR_mso_hostname="nexusdashboard.example.com"
export TF_VAR_mso_domain="MY_DOMAIN"
export TF_VAR_mso_user="administrator"
export TF_VAR_mso_password="secure_password"

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.15.1 |
| <a name="requirement_mso"></a> [mso](#requirement\_mso) | >=0.1.5 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_schema_common_app"></a> [schema\_common\_app](#module\_schema\_common\_app) | ../modules/app | n/a |
| <a name="module_schema_common_bd"></a> [schema\_common\_bd](#module\_schema\_common\_bd) | ../modules/bd | n/a |
| <a name="module_schema_common_epg"></a> [schema\_common\_epg](#module\_schema\_common\_epg) | ../modules/epg | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_mso_domain"></a> [mso\_domain](#input\_mso\_domain) | Domain for MSO Authentication. | `string` | n/a | yes |
| <a name="input_mso_hostname"></a> [mso\_hostname](#input\_mso\_hostname) | Hostname or IP Address for MSO Connectivity. | `string` | n/a | yes |
| <a name="input_mso_password"></a> [mso\_password](#input\_mso\_password) | Password for MSO Authentication. | `string` | n/a | yes |
| <a name="input_mso_user"></a> [mso\_user](#input\_mso\_user) | Username for MSO Authentication. | `string` | `"admin"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
