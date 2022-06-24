# Creating and configin postgres server - PaaS
resource "azurerm_private_dns_zone" "private_dns_zone" {
  name                = "${azurerm_resource_group.terraform_rg.name}-database-tf3.postgres.database.azure.com"
  resource_group_name = azurerm_resource_group.terraform_rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "private_dns_zone_vnl" {
  name                  = "${azurerm_resource_group.terraform_rg.name}3.dns-link"
  private_dns_zone_name = azurerm_private_dns_zone.private_dns_zone.name
  virtual_network_id    = azurerm_virtual_network.terraform_vnet.id
  resource_group_name   = azurerm_resource_group.terraform_rg.name
}

resource "azurerm_postgresql_flexible_server" "postgres_server" {
  name                   = "${azurerm_resource_group.terraform_rg.name}-3database-tf"
  resource_group_name    = azurerm_resource_group.terraform_rg.name
  location               = azurerm_resource_group.terraform_rg.location
  version                = "12"
  delegated_subnet_id    = azurerm_subnet.database-subnet.id
  private_dns_zone_id    = azurerm_private_dns_zone.private_dns_zone.id
  administrator_login    = var.postgres_admin_username
  administrator_password = var.postgres_password
  zone                   = "1"

  storage_mb = 32768

  sku_name   = var.postgres_sku_name
  depends_on = [azurerm_private_dns_zone_virtual_network_link.private_dns_zone_vnl]

}
# Disabling SSL - notice after doing this action data base service might require a restart in order to apply 
resource "azurerm_postgresql_flexible_server_configuration" "db-config-no-ssl" {
  name      = "require_secure_transport"
  server_id = azurerm_postgresql_flexible_server.postgres_server.id
  value     = "off"
}
