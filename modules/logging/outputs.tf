output "log_analytics_workspace_id" {
  description = "ID of the log analytics workspace"
  value       = azurerm_log_analytics_workspace.main.id
}

output "log_analytics_workspace_name" {
  description = "name of the log analytics workspace"
  value       = azurerm_log_analytics_workspace.main.name
}

output "resource_group_name" {
  description = "name of the logging resource group"
  value       = azurerm_resource_group.logging.name
}
