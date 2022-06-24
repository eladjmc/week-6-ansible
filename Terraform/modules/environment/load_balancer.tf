# Creating load balancer

resource "azurerm_public_ip" "my_lb_ip" {
  name                = "${var.weight_app_name_prefix}-ip"
  location            = azurerm_resource_group.terraform_rg.location
  resource_group_name = azurerm_resource_group.terraform_rg.name
  allocation_method   = "Static"
  domain_name_label   = "${azurerm_resource_group.terraform_rg.name}-eladjmc"
}

resource "azurerm_lb" "app_load_balancer" {
  name                = "${var.weight_app_name_prefix}-lb"
  location            = azurerm_resource_group.terraform_rg.location
  resource_group_name = azurerm_resource_group.terraform_rg.name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.my_lb_ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "bpepool" {
  loadbalancer_id = azurerm_lb.app_load_balancer.id
  name            = "BackEndAddressPool"
}

resource "azurerm_lb_nat_pool" "lbnatpool" {
  resource_group_name            = azurerm_resource_group.terraform_rg.name
  name                           = "ssh"
  loadbalancer_id                = azurerm_lb.app_load_balancer.id
  protocol                       = "Tcp"
  frontend_port_start            = 50000
  frontend_port_end              = 50010
  backend_port                   = 22
  frontend_ip_configuration_name = "PublicIPAddress"
}

# Creating load balancer rules
resource "azurerm_lb_rule" "lb_rule_8080" {
  loadbalancer_id                = azurerm_lb.app_load_balancer.id
  name                           = "lb_rule_8080"
  protocol                       = "Tcp"
  frontend_port                  = 8080
  backend_port                   = 8080
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.bpepool.id]
  frontend_ip_configuration_name = "PublicIPAddress"
}


resource "azurerm_lb_probe" "app_lb_prob" {
  loadbalancer_id = azurerm_lb.app_load_balancer.id
  name            = "http-probe"
  protocol        = "Http"
  request_path    = "/health"
  port            = 8080
}



