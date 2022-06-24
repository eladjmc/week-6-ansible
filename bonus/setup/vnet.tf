# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_range
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name
}


# Create a subnet for the data base
resource "azurerm_subnet" "Data_Tier" {
  name                 = "db-subnet"
  resource_group_name  = azurerm_resource_group.RG.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.address_range_db
  service_endpoints    = ["Microsoft.Storage"]
  delegation {
    name = "pg_deligation"
    service_delegation {
      name    = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", ]
    }
  }
}

# Create a subnet for the app servers the web tier
resource "azurerm_subnet" "Web_Tier" {
  name                 = "front-subnet"
  resource_group_name  = azurerm_resource_group.RG.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.address_range__front #["10.10.1.0/24"]
}
