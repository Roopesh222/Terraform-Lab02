resource_group_name = "Lab01_rg"
location            = "eastus"


virtual_network_variable = {
  vnet01 = {
    name          = "Lab01_Vnet"
    address_space = ["10.0.0.0/16"]
  }
}

subnet_variable = {
  "subnet01" = {
    virtual_network_name = "Lab01_Vnet"
    name                 = "Web_Server_Subnet"
    address_prefixes     = ["10.0.1.0/24"]
  },
  "subnet02" = {
    virtual_network_name = "Lab01_Vnet"
    name                 = "Database_Server_Subnet"
    address_prefixes     = ["10.0.2.0/24"]
  }
}

network_interface_variable = {
  "nic01" = {
    subnet_name          = "Web_Server_Subnet"
    virtual_network_name = "Lab01_Vnet"
    name                 = "vm_01_NIC"
    ip_config_name       = "ip_config"
    ip_allocation        = "Dynamic"
  },
  "nic02" = {
    subnet_name          = "Web_Server_Subnet"
    virtual_network_name = "Lab01_Vnet"
    name                 = "vm_02_NIC"
    ip_config_name       = "ip_config"
    ip_allocation        = "Dynamic"
  }
}
network_interface_variable = {
  "nic1" = {
    lb_name                = "lab02_lb"
    backend_pool_name      = "example-backend-pool"
    subnet_name            = "Web_Server_Subnet"
    virtual_network_name   = "Lab01_Vnet"
    name                   = "nic-1"
    ip_config_name         = "ipconfig1"
    ip_allocation          = "Dynamic"
  },
  "nic2" = {
    lb_name                = "lab02_lb"
    backend_pool_name      = "example-backend-pool"
    subnet_name            = "Web_Server_Subnet"
    virtual_network_name   = "Lab01_Vnet"
    name                   = "nic-2"
    ip_config_name         = "ipconfig2"
    ip_allocation          = "Dynamic"
  }
}


virtual_machine_variable = {
  "vm01" = {
    nic_name             = "vm_01_NIC"
    name                 = "LB_VM_01"
    size                 = "Standard_F2"
    admin_username       = "username01"
    admin_password       = "helloword1234!"
    computer_name        = "computername"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "MicrosoftWindowsServer"
    offer                = "WindowsServer"
    sku                  = "2016-Datacenter"
    version              = "latest"
  },
  "vm02" = {
    nic_name             = "vm_02_NIC"
    name                 = "LB_VM_02"
    size                 = "Standard_F2"
    admin_username       = "username01"
    admin_password       = "helloword1234!"
    computer_name        = "computername"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "MicrosoftWindowsServer"
    offer                = "WindowsServer"
    sku                  = "2016-Datacenter"
    version              = "latest"
  }
}

load_balancer_variable = {
  "lb" = {
    pip_name                       = "load_balancer_pip"
    name                           = "lab02_lb"
    frontend_ip_configuration_name = "frontend_IP"
  }
}

public_ip_variable = {
  "pip" = {
    name              = "load_balancer_pip"
    allocation_method = "Static"
  }
}

backend_pool_variable = {
  "backed_pool" = {
    lb_name = "lab02_lb"
    name = "backend_pool"
  }
}

# load_balancer_rule_variable = {
#   "lb_rule" = {
#     load_balancer_name = "lab02_lb"
#     name = "lb_rules"
#     backend_port = "3389"
#     frontend_port = "3389"
#     protocol = "Tcp"
#   }
# }

nsg_variable = {
  nsg1 = {
    name = "nsg_lab02"
    security_rules = [
      {
        name                       = "Allow-HTTP"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "Allow-HTTPS"
        priority                   = 101
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "Deny-8080"
        priority                   = 102
        direction                  = "Inbound"
        access                     = "Deny"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "8080"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "Deny-SMTP"
        priority                   = 103
        direction                  = "Inbound"
        access                     = "Deny"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "25"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
}

