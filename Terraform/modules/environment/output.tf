# taking vmss password output from vmss module and making it root output so it can be viewed
output "vmss_password" {
  sensitive = true
  value     = module.weight_app_vmss.vmss_password
}
