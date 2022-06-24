
# Creating a virtual network
resource "azurerm_virtual_network" "terraform_vnet" {
  name                = "${var.weight_app_name_prefix}-vnet"
  address_space       = [var.vnet_address_range]
  location            = var.resource_group_location
  resource_group_name = azurerm_resource_group.terraform_rg.name
}

# Creating two subnets - one for app and one for database
resource "azurerm_subnet" "app-subnet" {
  name                 = "${var.weight_app_name_prefix}-subnet"
  resource_group_name  = azurerm_resource_group.terraform_rg.name
  virtual_network_name = azurerm_virtual_network.terraform_vnet.name
  address_prefixes     = [var.app_subnet_address_range]
}

resource "azurerm_subnet" "database-subnet" {
  name                 = "database-${var.weight_app_name_prefix}-subnet"
  resource_group_name  = azurerm_resource_group.terraform_rg.name
  virtual_network_name = azurerm_virtual_network.terraform_vnet.name
  address_prefixes     = [var.database_subnet_address_range]
  service_endpoints    = ["Microsoft.Storage"]

  # Delegate to service flexiable postgres
  delegation {
    name = "db-${var.weight_app_name_prefix}-endpoint"

    service_delegation {
      name    = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", ]
    }
  }
}

# Creating the application network security group with rules to allow access via port 8080 and secure the others
resource "azurerm_network_security_group" "app_nsg" {
  name                = "${var.weight_app_name_prefix}-nsg"
  location            = var.resource_group_location
  resource_group_name = azurerm_resource_group.terraform_rg.name

  security_rule {
    name                       = "port_8080"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "port_22"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = var.authorized_ip_address
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "DENY_ALL"
    priority                   = 150
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Creating the database network security group with rules to allow communication between the app machines and the db service
resource "azurerm_network_security_group" "db_nsg" {
  name                = "database-nsg"
  location            = var.resource_group_location
  resource_group_name = azurerm_resource_group.terraform_rg.name

  security_rule {
    name                       = "ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "22"
    destination_port_range     = "*"
    source_address_prefix      = var.app_subnet_address_range
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "port_5432"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "5432"
    destination_port_range     = "*"
    source_address_prefix      = var.app_subnet_address_range
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "DENY_ALL"
    priority                   = 150
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Associating the security groups to the subnets
resource "azurerm_subnet_network_security_group_association" "app_nsg_association" {
  subnet_id                 = azurerm_subnet.app-subnet.id
  network_security_group_id = azurerm_network_security_group.app_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "db_nsg_association" {
  subnet_id                 = azurerm_subnet.database-subnet.id
  network_security_group_id = azurerm_network_security_group.db_nsg.id
} 
