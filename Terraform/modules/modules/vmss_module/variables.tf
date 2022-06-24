variable "weight_app_name_prefix" {
  type        = string
  description = "Variable that hold the prefixed name of the project"
}

variable "admin_user" {
  type        = string
  description = "Vmss admin user name"
}
variable "number_of_instances" {
  type        = number
  default     = 2
  description = "Amount of machines to start the vmss with - default value is 2"
}
variable "resource_group_location" {
  type = string
}
variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}
variable "admin_password" {
  type        = string
  description = "Vmss password"
}
variable "weight_app_nsg_id" {
  type        = string
  description = "The id of the nsg connected to the vmss subnet"
}
variable "weight_app_subbnet_id" {
  type        = string
  description = " The vmss subnet id"
}
variable "lb_bpepool_id" {
  type        = string
  description = "Load balancer back end pool id"
}
variable "lbnatpool_id" {
  type        = string
  description = "Load balancer nat pool id"
}

