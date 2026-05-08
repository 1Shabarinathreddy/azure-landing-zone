resource "azurerm_resource_group" "logging" {
  name     = "rg-logging-${var.environment}"
  location = var.location
  tags     = var.tags
}

resource "azurerm_log_analytics_workspace" "main" {
  name                = "law-${var.environment}-001"
  location            = azurerm_resource_group.logging.location
  resource_group_name = azurerm_resource_group.logging.name
  sku                 = var.log_analytics_workspace_sku
  retention_in_days   = var.log_retention_days
  tags                = var.tags
}
