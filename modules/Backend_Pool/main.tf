data "azurerm_lb" "load_balancer" {
  for_each            = var.backend_pool_variable
  name                = each.value["lb_name"]
resource_group_name = var.resource_group_name
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  for_each = var.backend_pool_variable
  name = each.value["name"]
  loadbalancer_id = data.azurerm_lb.load_balancer[each.key].id
  load_balancer_backend_address_pools_ids = [azurerm_lb_backend_address_pool.example.id]
}