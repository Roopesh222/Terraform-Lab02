variable "public_ip_variable" {
  type = map(object({
    name              = string
    allocation_method = string
  }))
}
variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}