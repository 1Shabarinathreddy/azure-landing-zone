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