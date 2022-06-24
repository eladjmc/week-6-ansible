# Output the vmss password so it can be access from root module
output "vmss_password" {
  sensitive = true
  value     = azurerm_linux_virtual_machine_scale_set.weight-app-vmss.admin_password
}
