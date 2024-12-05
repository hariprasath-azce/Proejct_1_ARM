# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "Project1-resource-group"
  location = "East US"
}

# Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "Project1-vnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]

  # Ensure VNet waits for Resource Group
  depends_on = [azurerm_resource_group.rg]
}

# Subnet
resource "azurerm_subnet" "subnet" {
  name                 = "Project1-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]

  # Add service endpoint for Microsoft.Storage
  service_endpoints = ["Microsoft.Storage"]
}

# Storage Account
resource "azurerm_storage_account" "storage" {
  name                     = "storageaccountproj1hd123" # Must be globally unique
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
    default_action             = "Allow"
    virtual_network_subnet_ids = [azurerm_subnet.subnet.id]
  }
}
