# epg - Terraform Nexus Dashboard Orchestrator Module

## Usage

```hcl
module "epg_example" {

  source = "terraform-mso-schemas//modules/epg"

  # omitted...
}
```

This module will Create an EPG in a Schema Template.

## MSO Reference Information

* GUI Location: Application Management > Schemas > {Schema Name} > {Template Name} > +Add EPG

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_mso"></a> [mso](#provider\_mso) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [mso_schema_template_anp_epg.anp_epg](https://registry.terraform.io/providers/CiscoDevNet/mso/latest/docs/resources/schema_template_anp_epg) | resource |
| [mso_schema_template_anp_epg_contract.epg_contract_consumer](https://registry.terraform.io/providers/CiscoDevNet/mso/latest/docs/resources/schema_template_anp_epg_contract) | resource |
| [mso_schema_template_anp_epg_contract.epg_contract_provider](https://registry.terraform.io/providers/CiscoDevNet/mso/latest/docs/resources/schema_template_anp_epg_contract) | resource |
| [mso_schema.schema](https://registry.terraform.io/providers/CiscoDevNet/mso/latest/docs/data-sources/schema) | data source |
| [mso_tenant.tenant](https://registry.terraform.io/providers/CiscoDevNet/mso/latest/docs/data-sources/tenant) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_epg_list"></a> [epg\_list](#input\_epg\_list) | Block of Variables to send to MSO. | `list(map(string))` | n/a | yes |
| <a name="input_schema"></a> [schema](#input\_schema) | MSO Schema to configure Attributes in. | `string` | n/a | yes |
| <a name="input_template"></a> [template](#input\_template) | MSO Template assigned to the schema. | `string` | n/a | yes |
| <a name="input_tenant"></a> [tenant](#input\_tenant) | Tenant for the MSO Schema. | `string` | n/a | yes |
| <a name="input_vrf_name"></a> [vrf\_name](#input\_vrf\_name) | Name of the VRF for the Template. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
