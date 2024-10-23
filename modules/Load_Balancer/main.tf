data "azurerm_public_ip" "public_ip" {
  for_each            = var.load_balancer_variable
  name                = each.value["pip_name"]
  resource_group_name = var.resource_group_name
}

resource "azurerm_lb" "load_balancer" {
  for_each            = var.load_balancer_variable
  name                = each.value["name"]
  location            = var.location
  resource_group_name = var.resource_group_name
  frontend_ip_configuration {
    name                 = each.value["frontend_ip_configuration_name"]
    public_ip_address_id = data.azurerm_public_ip.public_ip[each.key].id
  }
}