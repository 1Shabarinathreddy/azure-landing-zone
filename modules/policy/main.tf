# policy definition


resource "azurerm_policy_definition" "allowed_locations" {
  name         = "allowed-locations"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Allowed Locations"
  description  = "restricts resources to be deployed only in allowed azure regions"

  metadata = jsonencode({
    category = "General"
  })

  policy_rule = jsonencode({
    if = {
      not = {
        field = "location"
        in    = "[parameters('allowedLocations')]"
      }
    }
    then = {
      effect = "Deny"
    }
  })

  parameters = jsonencode({
    allowedLocations = {
      type = "Array"
      metadata = {
        displayName = "Allowed Locations"
        description = "list of allowed azure regions"
      }
    }
  })
}


# mandatory tags and policy definitions


resource "azurerm_policy_definition" "mandatory_tags" {
  name         = "mandatory-tags"
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = "Mandatory Tags"
  description  = "requires resources to have mandatory tags like environment and project"

  metadata = jsonencode({
    category = "Tags"
  })

  policy_rule = jsonencode({
    if = {
      anyOf = [
        {
          field  = "tags['environment']"
          exists = "false"
        },
        {
          field  = "tags['project']"
          exists = "false"
        }
      ]
    }
    then = {
      effect = "Deny"
    }
  })

  parameters = jsonencode({})
}


# assigned  locations policy to root management group

resource "azurerm_management_group_policy_assignment" "allowed_locations" {
  name                 = "allow-locations"
  policy_definition_id = azurerm_policy_definition.allowed_locations.id
  management_group_id  = var.root_management_group_id

  parameters = jsonencode({
    allowedLocations = {
      value = var.allowed_locations
    }
  })
}

# assign mandatory tags policy to landing zones management group

resource "azurerm_management_group_policy_assignment" "mandatory_tags" {
  name                 = "mandatory-tags"
  policy_definition_id = azurerm_policy_definition.mandatory_tags.id
  management_group_id  = var.landing_zone_management_group_id
}