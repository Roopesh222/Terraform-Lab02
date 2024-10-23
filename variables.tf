variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}

variable "virtual_network_variable" {
  type = map(object({
    name          = string
    address_space = list(string)
  }))
}

variable "subnet_variable" {
  type = map(object({
    virtual_network_name = string
    name                 = string
    address_prefixes     = list(string)
  }))
}

variable "network_interface_variable" {
  type = map(object({
    lb_name                = string
    backend_pool_name      = string
    subnet_name            = string
    virtual_network_name   = string
    name                   = string
    ip_config_name         = string
    ip_allocation          = string
  }))
}

variable "virtual_machine_variable" {
  type = map(object({
    nic_name             = string
    name                 = string
    size                 = string
    admin_username       = string
    admin_password       = string
    computer_name        = string
    caching              = string
    storage_account_type = string
    publisher            = string
    offer                = string
    sku                  = string
    version              = string
  }))
}

variable "load_balancer_variable" {
  type = map(object({
    pip_name                       = string
    name                           = string
    frontend_ip_configuration_name = string
  }))
}

variable "public_ip_variable" {
  type = map(object({
    name              = string
    allocation_method = string
  }))
}

variable "backend_pool_variable" {
  type = map(object({
    lb_name = string
    name = string
  }))
}

# variable "load_balancer_rule" {
#   type = map(object({
#  load_balancer_name = string
#     name = string
#     backend_port = string
#     frontend_port = string
#     protocol = string
#   }))
# }

variable "nsg_variable" {
  description = "Map of NSG configurations"
  type = map(object({
    name           = string
    security_rules = list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}
