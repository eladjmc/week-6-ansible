# Using Terraform
### Please check out my terraform project repo for information about how to install and run a terraform project:
https://github.com/eladjmc/terraform-project
 
 
 ## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine_scale_set.weight-app-vmss](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set) | resource |
| [azurerm_monitor_autoscale_setting.autoscale_setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_autoscale_setting) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | Vmss password | `string` | n/a | yes |
| <a name="input_admin_user"></a> [admin\_user](#input\_admin\_user) | Vmss admin user name | `string` | n/a | yes |
| <a name="input_lb_bpepool_id"></a> [lb\_bpepool\_id](#input\_lb\_bpepool\_id) | Load balancer back end pool id | `string` | n/a | yes |
| <a name="input_lbnatpool_id"></a> [lbnatpool\_id](#input\_lbnatpool\_id) | Load balancer nat pool id | `string` | n/a | yes |
| <a name="input_number_of_instances"></a> [number\_of\_instances](#input\_number\_of\_instances) | Amount of machines to start the vmss with - default value is 2 | `number` | `2` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | n/a | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group | `string` | n/a | yes |
| <a name="input_weight_app_name_prefix"></a> [weight\_app\_name\_prefix](#input\_weight\_app\_name\_prefix) | Variable that hold the prefixed name of the project | `string` | n/a | yes |
| <a name="input_weight_app_nsg_id"></a> [weight\_app\_nsg\_id](#input\_weight\_app\_nsg\_id) | The id of the nsg connected to the vmss subnet | `string` | n/a | yes |
| <a name="input_weight_app_subbnet_id"></a> [weight\_app\_subbnet\_id](#input\_weight\_app\_subbnet\_id) | The vmss subnet id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vmss_password"></a> [vmss\_password](#output\_vmss\_password) | Output the vmss password so it can be access from root module |
