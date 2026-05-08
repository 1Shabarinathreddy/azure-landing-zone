variable "location" {
  description = "azure region where logging resources will be deployed"
  type        = string
}

variable "environment" {
  description = "environment name like dev, staging, prod"
  type        = string
}

variable "log_analytics_workspace_sku" {
  description = "SKU for the log analytics workspace"
  type        = string
  default     = "PerGB2018"
}

variable "log_retention_days" {
  description = "number of days to retain logs"
  type        = number
  default     = 30
}

variable "tags" {
  description = "tags to apply to all resources"
  type        = map(string)
  default     = {}
}
