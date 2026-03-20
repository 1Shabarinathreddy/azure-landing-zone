output "root_management_group_id" {
  description = "ID of the root management group"
  value       = azurerm_management_group.root.id
}

output "platform_management_group_id" {
  description = "ID of the platform management group"
  value       = azurerm_management_group.hierarchy["mg-platform"].id
}

output "landing_zone_management_group_id" {
  description = "ID of the landing zones management group"
  value       = azurerm_management_group.hierarchy["mg-landingzones"].id
}

output "all_management_group_ids" {
  description = "map of all management group IDs"
  value = {
    for k, v in azurerm_management_group.hierarchy : k => v.id
  }
}