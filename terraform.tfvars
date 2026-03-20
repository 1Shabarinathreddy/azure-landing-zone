management_subscription_id = "your-subscription-id-here"
root_management_group_id   = "your-tenant-id-here"
root_management_group_name = "Tenant Root Group"
location    = "eastus"
environment = "prod"

tags = {
  project    = "azure-landing-zone"
  managed_by = "terraform"
  owner      = "shabarinath"
}

management_group_hierarchy = {
  "mg-platform" = {
    display_name = "Platform"
    parent_id    = "root"
  }
  "mg-landingzones" = {
    display_name = "Landing Zones"
    parent_id    = "root"
  }
  "mg-connectivity" = {
    display_name = "Connectivity"
    parent_id    = "mg-platform"
  }
  "mg-identity" = {
    display_name = "Identity"
    parent_id    = "mg-platform"
  }
  "mg-management" = {
    display_name = "Management"
    parent_id    = "mg-platform"
  }
  "mg-corp" = {
    display_name = "Corp"
    parent_id    = "mg-landingzones"
  }
  "mg-online" = {
    display_name = "Online"
    parent_id    = "mg-landingzones"
  }
}