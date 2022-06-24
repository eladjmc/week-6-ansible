# azurerm_resource_group
resource "azurerm_resource_group" "RG" {
  name     = var.resource_group_name
  location = var.rg_location
}

# Azure Public Ip for Load Balancer
resource "azurerm_public_ip" "vmPublicIP" {
  name                = "vmPublicIP"
  resource_group_name = azurerm_resource_group.RG.name
  location            = azurerm_resource_group.RG.location
  allocation_method   = "Static"
  sku                 = "Standard"
  domain_name_label   = var.dns_loadBalancer

}

# azurerm_network_interface
resource "azurerm_network_interface" "network_int_web_Tier" {
  name                = "network_int_web"
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.Web_Tier.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vmPublicIP.id
  }
}

# azurerm_windows_virtual_machine
resource "azurerm_windows_virtual_machine" "vm_frontend" {
  name                = "webVm"
  resource_group_name = azurerm_resource_group.RG.name
  location            = azurerm_resource_group.RG.location
  size                = "Standard_B2s"
  admin_username      = var.admin_user_name
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.network_int_web_Tier.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}


#  azurerm_private_dns_zone
resource "azurerm_private_dns_zone" "Flexibale_Postgres_DataBase_DNS" {
  name                = "Flexible.postgres.database.azure.com"
  resource_group_name = azurerm_resource_group.RG.name

}



#  azurerm_postgresql_flexible_server
resource "azurerm_postgresql_flexible_server" "PosrgreSQLFlexibleDataServer" {
  name                   = var.dns_postgresSQL
  resource_group_name    = azurerm_resource_group.RG.name
  location               = azurerm_resource_group.RG.location
  version                = "13"
  delegated_subnet_id    = azurerm_subnet.Data_Tier.id
  private_dns_zone_id    = azurerm_private_dns_zone.Flexibale_Postgres_DataBase_DNS.id
  administrator_login    = var.pg_user
  administrator_password = var.pg_pass
  zone                   = "1"
  create_mode            = "Default"
  storage_mb             = 32768

  sku_name   = "B_Standard_B1ms"
  depends_on = [azurerm_private_dns_zone_virtual_network_link.postgres-vnet-link]

}

#  azurerm_postgresql_flexible_server_database
resource "azurerm_postgresql_flexible_server_database" "db" {
  name      = "db"
  server_id = azurerm_postgresql_flexible_server.PosrgreSQLFlexibleDataServer.id
  collation = "en_US.utf8"
  charset   = "utf8"

}

#  azurerm_postgresql_flexible_server_firewall_rule
resource "azurerm_postgresql_flexible_server_firewall_rule" "postgres" {
  name      = "postgres"
  server_id = azurerm_postgresql_flexible_server.PosrgreSQLFlexibleDataServer.id

  start_ip_address = "0.0.0.0"
  end_ip_address   = "255.255.255.255"

}


#  azurerm_postgresql_flexible_server_configuration
resource "azurerm_postgresql_flexible_server_configuration" "flexible_server_configuration" {
  name      = "require_secure_transport"
  server_id = azurerm_postgresql_flexible_server.PosrgreSQLFlexibleDataServer.id
  value     = "off"

}


#  azurerm_private_dns_zone_virtual_network_link
resource "azurerm_private_dns_zone_virtual_network_link" "postgres-vnet-link" {
  name                  = "postgres-vnet-link"
  private_dns_zone_name = azurerm_private_dns_zone.Flexibale_Postgres_DataBase_DNS.name
  virtual_network_id    = azurerm_virtual_network.vnet.id
  resource_group_name   = azurerm_resource_group.RG.name

}
