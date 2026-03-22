terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.80"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "stterraformstate"
    container_name       = "tfstate"
    key                  = "landing-zone.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.management_subscription_id
}

#  Management Groups 
module "management_groups" {
  source = "./modules/management_groups"

  root_management_group_id   = var.root_management_group_id
  root_management_group_name = var.root_management_group_name
  management_group_hierarchy = var.management_group_hierarchy
}

module "logging" {
  source = "./modules/logging"

  location                    = var.location
  environment                 = var.environment
  log_analytics_workspace_sku = var.log_analytics_workspace_sku
  log_retention_days          = var.log_retention_days
  tags                        = var.tags
}


# Networking 

module "networking" {
  source = "./modules/networking"

  location                   = var.location
  environment                = var.environment
  hub_vnet_address_space     = var.hub_vnet_address_space
  gateway_subnet_cidr        = var.gateway_subnet_cidr
  firewall_subnet_cidr       = var.firewall_subnet_cidr
  bastion_subnet_cidr        = var.bastion_subnet_cidr
  log_analytics_workspace_id = module.logging.log_analytics_workspace_id
  tags                       = var.tags
}


# Policys

module "policy" {
  source = "./modules/policy"

  root_management_group_id         = module.management_groups.root_management_group_id
  landing_zone_management_group_id = module.management_groups.landing_zone_management_group_id
  allowed_locations                = var.allowed_locations
  environment                      = var.environment
  tags                             = var.tags
}