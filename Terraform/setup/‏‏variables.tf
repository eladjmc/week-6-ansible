variable "weight_app_name_prefix" {
  type        = string
  description = "Variable that hold the prefixed name of the project"
}
variable "vnet_address_range" {
  type        = string
  description = "The virtual network range format: x.x.x.x/x"
}
variable "resource_group_location" {
  type        = string
  description = "The location of the resource group - location name"
}
variable "resource_group_name" {
  type    = map
  description = "Map with two different name for a group"
  default = { for x in ["production", "staging"] : x => x }
}
variable "authorized_ip_address" {
  type        = string
  description = "The ip that can access vmss via port 22"
}
variable "app_subnet_address_range" {
  type        = string
  description = "The vmss subnet ip ranges - format x.x.x.x/x"
}
variable "database_subnet_address_range" {
  type        = string
  description = "The database subnet ip rages -format x.x.x.x/x -cannot overlap with vmss subnet-"
}
variable "weight_app_key" {
  type        = string
  description = "Public key to be created"
}
variable "admin_user" {
  type        = string
  description = "Vmss admin user name"
}
variable "admin_password" {
  type        = string
  description = "Vmss password"
}
variable "postgres_password" {
  type        = string
  description = "Postgres password"
}
variable "postgres_admin_username" {
  type        = string
  description = "Posgress admin user name"
}
variable "postgres_sku_name" {
  type        = string
  description = "Holds the machine type for posgtres service"
}
