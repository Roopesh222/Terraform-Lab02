variable "load_balancer_variable" {
  type = map(object({
    pip_name                       = string
    name                           = string
    frontend_ip_configuration_name = string
  }))
}

variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}