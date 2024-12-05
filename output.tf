# outputs.tf

output "resource_group_name" {
  value       = "Project1-resource-group"
  description = "Name of the resource group"
}

output "virtual_network_name" {
  value = azurerm_virtual_network.vnet.name
  description = "Name of the virtual network"
}

output "virtual_network_id" {
  value = azurerm_virtual_network.vnet.id
  description = "ID of the virtual network"
}

output "subnet_name" {
  value = azurerm_subnet.subnet.name
  description = "Name of the subnet"
}

output "subnet_id" {
  value = azurerm_subnet.subnet.id
  description = "ID of the subnet"
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.vm.name
  description = "Name of the virtual machine"
}

output "vm_private_ip" {
  value = azurerm_linux_virtual_machine.vm.private_ip_address
  description = "Private IP address of the virtual machine"
}

output "vm_public_ip" {
  value = azurerm_network_interface.nic.private_ip_addresses[0]
  description = "Public IP address of the virtual machine"
}

output "storage_account_name" {
  value = azurerm_storage_account.example.name
  description = "Name of the storage account"
}

output "storage_account_id" {
  value = azurerm_storage_account.example.id
  description = "ID of the storage account"
}