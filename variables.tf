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
variable "log_analytics_workspace_sku" {
  description = "SKU for log analytics workspace"
  type        = string
  default     = "PerGB2018"
}

variable "log_retention_days" {
  description = "number of days to retain logs"
  type        = number
  default     = 30
}


variable "hub_vnet_address_space" {
  description = "address space for the hub virtual network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "gateway_subnet_cidr" {
  description = "CIDR for the gateway subnet"
  type        = string
  default     = "10.0.1.0/27"
}

variable "firewall_subnet_cidr" {
  description = "CIDR for the firewall subnet"
  type        = string
  default     = "10.0.2.0/26"
}

variable "bastion_subnet_cidr" {
  description = "CIDR for the bastion subnet"
  type        = string
  default     = "10.0.3.0/27"
}