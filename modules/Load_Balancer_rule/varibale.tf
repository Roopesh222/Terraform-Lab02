variable "load_balancer_rule_variable" {
  type = map(object({
 load_balancer_name = string
    name = string
    backend_port = string
    frontend_port = string
    protocol = string
  }))
}

variable "resource_group_name" {
  type = string
}