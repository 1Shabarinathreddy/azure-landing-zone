output "hub_vnet_id" {
  description = "ID of the hub virtual network"
  value       = azurerm_virtual_network.hub.id
}

output "hub_vnet_name" {
  description = "name of the hub virtual network"
  value       = azurerm_virtual_network.hub.name
}

output "gateway_subnet_id" {
  description = "ID of the gateway subnet"
  value       = azurerm_subnet.gateway.id
}

output "firewall_subnet_id" {
  description = "ID of the firewall subnet"
  value       = azurerm_subnet.firewall.id
}

output "bastion_subnet_id" {
  description = "ID of the bastion subnet"
  value       = azurerm_subnet.bastion.id
}

output "resource_group_name" {
  description = "name of the networking resource group"
  value       = azurerm_resource_group.networking.name
}