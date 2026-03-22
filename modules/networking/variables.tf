variable "location" {
  description = "azure region where networking resources will be deployed"
  type        = string
}

variable "environment" {
  description = "environment name like dev, staging, prod"
  type        = string
}

variable "hub_vnet_address_space" {
  description = "address space for the hub virtual network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "gateway_subnet_cidr" {
  description = "CIDR range for the gateway subnet"
  type        = string
  default     = "10.0.1.0/27"
}

variable "firewall_subnet_cidr" {
  description = "CIDR range for the azure firewall subnet"
  type        = string
  default     = "10.0.2.0/26"
}

variable "bastion_subnet_cidr" {
  description = "CIDR range for the bastion subnet"
  type        = string
  default     = "10.0.3.0/27"
}

variable "log_analytics_workspace_id" {
  description = "ID of the log analytics workspace for diagnostics"
  type        = string
}

variable "tags" {
  description = "tags to apply to all resources"
  type        = map(string)
  default     = {}
}