output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "subnet_ids" {
  value = [for s in azurerm_subnet.subnets : s.id]
}

output "nsg_id" {
  value = var.enable_nsg ? azurerm_network_security_group.nsg[0].id : null
}