# Using Terraform
### Please check out my terraform project repo for information about how to install and run a terraform project:
https://github.com/eladjmc/terraform-project

The task is explained on the main repo folder

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.0.2 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_environment"></a> [environment](#module\_environment) | ../modules/environment | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | Vmss password | `string` | n/a | yes |
| <a name="input_admin_user"></a> [admin\_user](#input\_admin\_user) | Vmss admin user name | `string` | n/a | yes |
| <a name="input_app_subnet_address_range"></a> [app\_subnet\_address\_range](#input\_app\_subnet\_address\_range) | The vmss subnet ip ranges - format x.x.x.x/x | `string` | n/a | yes |
| <a name="input_authorized_ip_address"></a> [authorized\_ip\_address](#input\_authorized\_ip\_address) | The ip that can access vmss via port 22 | `string` | n/a | yes |
| <a name="input_database_subnet_address_range"></a> [database\_subnet\_address\_range](#input\_database\_subnet\_address\_range) | The database subnet ip rages -format x.x.x.x/x -cannot overlap with vmss subnet- | `string` | n/a | yes |
| <a name="input_postgres_admin_username"></a> [postgres\_admin\_username](#input\_postgres\_admin\_username) | Posgress admin user name | `string` | n/a | yes |
| <a name="input_postgres_password"></a> [postgres\_password](#input\_postgres\_password) | Postgres password | `string` | n/a | yes |
| <a name="input_postgres_sku_name"></a> [postgres\_sku\_name](#input\_postgres\_sku\_name) | Holds the machine type for posgtres service | `string` | n/a | yes |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | The location of the resource group - location name | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Map with two different name for a group | `map` | <pre>{<br>  "production": "production",<br>  "staging": "staging"<br>}</pre> | no |
| <a name="input_vnet_address_range"></a> [vnet\_address\_range](#input\_vnet\_address\_range) | The virtual network range format: x.x.x.x/x | `string` | n/a | yes |
| <a name="input_weight_app_key"></a> [weight\_app\_key](#input\_weight\_app\_key) | Public key to be created | `string` | n/a | yes |
| <a name="input_weight_app_name_prefix"></a> [weight\_app\_name\_prefix](#input\_weight\_app\_name\_prefix) | Variable that hold the prefixed name of the project | `string` | n/a | yes |

## Outputs

No outputs.
