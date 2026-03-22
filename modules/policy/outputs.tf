output "allowed_locations_policy_id" {
  description = "ID of the allowed locations policy definition"
  value       = azurerm_policy_definition.allowed_locations.id
}

output "mandatory_tags_policy_id" {
  description = "ID of the mandatory tags policy definition"
  value       = azurerm_policy_definition.mandatory_tags.id
}