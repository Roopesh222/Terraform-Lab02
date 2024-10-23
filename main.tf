################# Resource Group #####################
module "rg_module" {
  source              = "./modules/Resource_Group"
  resource_group_name = var.resource_group_name
  location            = var.location
}
###################### Virtual Network ##################
module "vnet_module" {
  source                   = "./modules/Virtual_Network"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  virtual_network_variable = var.virtual_network_variable
  depends_on               = [module.rg_module]
}

######################### SUBNET ####################
module "subnet_module" {
  source              = "./modules/Subnets"
  resource_group_name = var.resource_group_name
  subnet_variable     = var.subnet_variable
  depends_on          = [module.vnet_module]
}

###################### NIC ##########################
module "nic_card" {
  source                     = "./modules/NIC"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  network_interface_variable = var.network_interface_variable
  depends_on                 = [module.subnet_module, module.rg_module]
}

################## Virtual Machine ###################
module "virtual_machine" {
  source                   = "./modules/Virtual_Machine"
  location                 = var.location
  resource_group_name      = var.resource_group_name
  virtual_machine_variable = var.virtual_machine_variable
  depends_on               = [module.rg_module, module.subnet_module, module.nic_card]
}

################### NSG #################################
module "nsg_module" {
  source = "./modules/NSG"
  location = var.location
  resource_group_name = var.resource_group_name
  nsg_variable = var.nsg_variable
  depends_on = [ module.rg_module ]
}
####################### load balancer ######################
module "load_balancer_module" {
  source                 = "./modules/Load_Balancer"
  location               = var.location
  resource_group_name    = var.resource_group_name
  load_balancer_variable = var.load_balancer_variable
  depends_on             = [module.rg_module, module.public_ip_module]
}

##################### Public IP ########################
module "public_ip_module" {
  source              = "./modules/Public_IP_address"
  location            = var.location
  resource_group_name = var.resource_group_name
  public_ip_variable  = var.public_ip_variable
  depends_on          = [module.rg_module]
}

################### Backend pool address ####################
module "backend_pool_module" {
  source = "./modules/Backend_Pool"
  resource_group_name = var.resource_group_name
  backend_pool_variable = var.backend_pool_variable
  depends_on = [ module.rg_module ]
}

