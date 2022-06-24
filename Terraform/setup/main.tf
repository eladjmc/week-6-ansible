# Creating the enviorenments
module "environment" {
  source = "../modules/environment"
  for_each = var.resource_group_name
  resource_group_name = each.value
  weight_app_name_prefix = var.weight_app_name_prefix
  vnet_address_range =var.vnet_address_range
  resource_group_location = var.resource_group_location
  authorized_ip_address = var.authorized_ip_address
  app_subnet_address_range = var.app_subnet_address_range
  database_subnet_address_range = var.database_subnet_address_range
  weight_app_key = var.weight_app_key
  admin_user = var.admin_user
  admin_password =var.admin_password
  postgres_password =var.postgres_password
  postgres_admin_username = var.postgres_admin_username
  postgres_sku_name = var.postgres_sku_name
}