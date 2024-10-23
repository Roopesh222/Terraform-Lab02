data "azurerm_lb" "load_balancer" {
  for_each            = var.load_balancer_rule
  name = each.value["load_balancer_name"]
  resource_group_name = var.resource_group_name
}


resource "azurerm_lb_rule" "lb_rule" {
  for_each = var.load_balancer_rule
  name = each.value["name"]
  backend_port = each.value["backend_port"]
  frontend_port = each.value["frontend_port"]
  protocol = each.value["protocol"]
  frontend_ip_configuration_name = data.azurerm_lb.load_balancer[each.key].frontend_ip_configuration_name[0].name
  loadbalancer_id = data.azurerm_lb.load_balancer[each.key].id
}