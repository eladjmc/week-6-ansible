
variable "resource_group_name" {
  description = "resource group name"
}

variable "vnet_name" {
  default     = "my-vnet"
  description = "virtual network name"
}

variable "vnet_address_range" {
  type        = list(any)
  description = "address space"

}

variable "ip_connecter_via_ssh_controller" {
  type        = string
  description = "ip of the controller vm"
}

variable "address_range__front" {
  type        = list(any)
  description = "address range frontend subnet"

}

variable "address_range_db" {
  type        = list(any)
  description = "address range database subnet"

}

variable "rg_location" {
  type        = string
  description = "resource group location"

}

variable "admin_user_name" {
  type        = string
  description = "user name for vm login"
}
variable "admin_password" {
  type        = string
  description = "password for vm login"

}

variable "pg_user" {
  # default = ""
  description = "postgres admin user"
}

variable "pg_pass" {
  # default = ""
  description = "postgres admin password"
}

variable "dns_postgresSQL" {
  type        = string
  description = "DNS name for postgres"

}

variable "ip_connecter_via_RDP" {
  type        = string
  description = "IP address from which yo will connect to controller"

}

variable "dns_loadBalancer" {
  type = string
}

variable "ip_connecter_via_ssh" {
  type = string
}

