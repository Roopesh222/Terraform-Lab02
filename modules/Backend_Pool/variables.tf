variable "backend_pool_variable" {
  type = map(object({
    lb_name = string
    name = string
  }))
}
variable "resource_group_name" {
  type = string
}