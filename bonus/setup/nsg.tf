# azurerm_subnet_network_security_group_association
resource "azurerm_subnet_network_security_group_association" "app_nsg_association_backend" {
  subnet_id                 = azurerm_subnet.Data_Tier.id
  network_security_group_id = azurerm_network_security_group.NSG_backend.id
}


# azurerm_subnet_network_security_group_association
resource "azurerm_subnet_network_security_group_association" "app_nsg_association_frontend" {
  subnet_id                 = azurerm_subnet.Web_Tier.id
  network_security_group_id = azurerm_network_security_group.NSG_frontend.id
}


# azurerm_network_security_group
resource "azurerm_network_security_group" "NSG_frontend" {
  name                = "NSG_frontend"
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name

  security_rule {
    name                       = "ssh"
    priority                   = 105
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "22"
    destination_port_range     = "*"
    source_address_prefix      = var.ip_connecter_via_ssh_controller
    destination_address_prefix = "*"
  }


  security_rule {
    name                       = "RDP"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "3389"
    destination_port_range     = "*"
    source_address_prefix      = var.ip_connecter_via_RDP
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow_8080"
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
    name                       = "Deny"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}


# azurerm_network_security_group
resource "azurerm_network_security_group" "NSG_backend" {
  name                = "NSG_backend"
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name


  security_rule {
    name                       = "Postgres"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "5432"
    destination_port_range     = "5432"
    source_address_prefix      = var.address_range__front[0]
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "controller access"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "5985"
    destination_port_range     = "5985"
    source_address_prefix      = var.address_range__front[0]
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Deny"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}
