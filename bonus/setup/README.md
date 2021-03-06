# Using Terraform
### Please check out my terraform project repo for information about how to install and run a terraform project:
https://github.com/eladjmc/terraform-project


Task is explained on the "bonus" folder

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 2.65 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.11.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_network_interface.network_int_web_Tier](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_security_group.NSG_backend](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.NSG_frontend](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_postgresql_flexible_server.PosrgreSQLFlexibleDataServer](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server) | resource |
| [azurerm_postgresql_flexible_server_configuration.flexible_server_configuration](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_configuration) | resource |
| [azurerm_postgresql_flexible_server_database.db](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_database) | resource |
| [azurerm_postgresql_flexible_server_firewall_rule.postgres](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_firewall_rule) | resource |
| [azurerm_private_dns_zone.Flexibale_Postgres_DataBase_DNS](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.postgres-vnet-link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_public_ip.vmPublicIP](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.RG](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet.Data_Tier](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.Web_Tier](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.app_nsg_association_backend](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_network_security_group_association.app_nsg_association_frontend](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_windows_virtual_machine.vm_frontend](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_range__front"></a> [address\_range\_\_front](#input\_address\_range\_\_front) | address range frontend subnet | `list(any)` | n/a | yes |
| <a name="input_address_range_db"></a> [address\_range\_db](#input\_address\_range\_db) | address range database subnet | `list(any)` | n/a | yes |
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | password for vm login | `string` | n/a | yes |
| <a name="input_admin_user_name"></a> [admin\_user\_name](#input\_admin\_user\_name) | user name for vm login | `string` | n/a | yes |
| <a name="input_dns_loadBalancer"></a> [dns\_loadBalancer](#input\_dns\_loadBalancer) | n/a | `string` | n/a | yes |
| <a name="input_dns_postgresSQL"></a> [dns\_postgresSQL](#input\_dns\_postgresSQL) | DNS name for postgres | `string` | n/a | yes |
| <a name="input_ip_connecter_via_RDP"></a> [ip\_connecter\_via\_RDP](#input\_ip\_connecter\_via\_RDP) | IP address from which yo will connect to controller | `string` | n/a | yes |
| <a name="input_ip_connecter_via_ssh"></a> [ip\_connecter\_via\_ssh](#input\_ip\_connecter\_via\_ssh) | n/a | `string` | n/a | yes |
| <a name="input_ip_connecter_via_ssh_controller"></a> [ip\_connecter\_via\_ssh\_controller](#input\_ip\_connecter\_via\_ssh\_controller) | ip of the controller vm | `string` | n/a | yes |
| <a name="input_pg_pass"></a> [pg\_pass](#input\_pg\_pass) | postgres admin password | `any` | n/a | yes |
| <a name="input_pg_user"></a> [pg\_user](#input\_pg\_user) | postgres admin user | `any` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | resource group name | `any` | n/a | yes |
| <a name="input_rg_location"></a> [rg\_location](#input\_rg\_location) | resource group location | `string` | n/a | yes |
| <a name="input_vnet_address_range"></a> [vnet\_address\_range](#input\_vnet\_address\_range) | address space | `list(any)` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | virtual network name | `string` | `"my-vnet"` | no |

## Outputs

No outputs.
