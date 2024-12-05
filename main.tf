# main.tf
resource "azurerm_resource_group" "rg" {
   name     = "Project1-resource-group"
   location = "East US"
    }

# Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "Project1-vnet"
  location            = var.location
  resource_group_name = "Project1-resource-group"
  address_space       = ["10.0.0.0/16"]
}

# Subnet with Service Endpoint
resource "azurerm_subnet" "subnet" {
  name                = "Project1-subnet"
  resource_group_name = "Project1-resource-group"
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]

  # Add the service endpoint for Microsoft.Storage
  service_endpoints = ["Microsoft.Storage"]  
}

# Network Interface
resource "azurerm_network_interface" "nic" {
  name                = "Project1-nic"
  location            = azurerm_virtual_network.vnet.location
  resource_group_name = "Project1-resource-group"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
    
    
  }
}

# Network Security Group
resource "azurerm_network_security_group" "nsg" {
  name                = "Project1-nsg"
  location            = azurerm_virtual_network.vnet.location
  resource_group_name = "Project1-resource-group"

  security_rule {
    name                       = "AllowSSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Public IP (using Static allocation)
resource "azurerm_public_ip" "public_ip" {
  name                = "Project1-public-ip"
  resource_group_name = "Project1-resource-group"
  location            = azurerm_virtual_network.vnet.location
  allocation_method   = "Static"
  sku                 = "Standard"
}


# Virtual Machine
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "Project1-vm"
  resource_group_name = "Project1-resource-group"
  location            = azurerm_virtual_network.vnet.location
  size                = "Standard_B1s"
  network_interface_ids = [azurerm_network_interface.nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  computer_name  = "Project1-vm"
  admin_username = "azureuser"
  admin_password = "YourPassword1!"  # Make sure it's complex
  disable_password_authentication = false

  # Or, use SSH keys for authentication
  # ssh_key {
  #   path     = "/path/to/your/public/key.pub"
  #   key_data = file("/path/to/your/public/key.pub")
  # }
}

# Storage Account (with a unique name)
resource "azurerm_storage_account" "example" {
  name                     = "storageaccountproj1hd123"  # Unique name
  resource_group_name      = "Project1-resource-group"
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
    default_action             = "Allow"
    ip_rules                   = []
    virtual_network_subnet_ids = [azurerm_subnet.subnet.id]
  }
}