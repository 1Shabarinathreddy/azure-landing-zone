variable "management_subscription_id" {
  description = "subscription ID where the terraform state and management resources live"
  type        = string
}

variable "root_management_group_id" {
  description = "tenant ID, this becomes the root management group ID"
  type        = string
}

variable "root_management_group_name" {
  description = "display name for the root management group"
  type        = string
  default     = "Tenant Root Group"
}

variable "management_group_hierarchy" {
  description = "map of all management groups to create with their parent"
  type = map(object({
    display_name = string
    parent_id    = string
  }))
}

variable "location" {
  description = "azure region where resources will be deployed"
  type        = string
  default     = "eastus"
}

variable "environment" {
  description = "environment name like dev, staging, prod"
  type        = string
  default     = "prod"
}

variable "tags" {
  description = "common tags applied to all resources"
  type        = map(string)
  default = {
    project     = "azure-landing-zone"
    managed_by  = "terraform"
  }
}