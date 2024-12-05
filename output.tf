# Resource Group Name
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

# Resource Group Location
output "resource_group_location" {
  value = azurerm_resource_group.rg.location
}

# Virtual Network Name
output "virtual_network_name" {
  value = azurerm_virtual_network.vnet.name
}

# Subnet ID
output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

# Virtual Machine Private IP Address
output "vm_private_ip" {
  value = azurerm_linux_virtual_machine.vm.private_ip_address
}

# Virtual Machine Public IP Address
output "vm_public_ip" {
  value = azurerm_public_ip.public_ip.ip_address
}

# Storage Account Name
output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}

# Storage Account ID
output "storage_account_id" {
  value = azurerm_storage_account.storage.id
}
