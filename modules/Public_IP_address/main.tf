resource "azurerm_public_ip" "public_ip" {
  for_each            = var.public_ip_variable
  name                = each.value["name"]
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = each.value["allocation_method"]
}