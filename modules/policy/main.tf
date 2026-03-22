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