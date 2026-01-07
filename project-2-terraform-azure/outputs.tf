output "resource_group_name" {
  value = azurerm_resource_group.devops_rg.name
}

output "resource_group_location" {
  value = azurerm_resource_group.devops_rg.location
}

output "vm_public_ip" {
  description = "Public IP address of the DevOps VM"
  value       = azurerm_public_ip.devops_public_ip.ip_address
}
