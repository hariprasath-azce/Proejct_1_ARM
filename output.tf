# Output: Resource Group Name
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

# Output: Virtual Network Name
output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

# Output: Subnet ID
output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

# Output: Virtual Machine Private IP
output "vm_private_ip" {
  value = azurerm_linux_virtual_machine.vm.private_ip_address
}

# Output: Virtual Machine Public IP
output "vm_public_ip" {
  value = azurerm_public_ip.public_ip.ip_address
}

# Output: Storage Account Name
output "storage_account_name" {
  value = azurerm_storage_account.example.name
}

# Output: Storage Account ID
output "storage_account_id" {
  value = azurerm_storage_account.example.id
}
