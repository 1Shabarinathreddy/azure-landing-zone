variable "allowed_locations" {
  description = "list of azure regions where resources are allowed"
  type        = list(string)
  default     = ["eastus", "eastus2", "westus"]
}

variable "root_management_group_id" {
  description = "ID of the root management group"
  type        = string
}

variable "landing_zone_management_group_id" {
  description = "ID of the landing zones management group"
  type        = string
}

variable "environment" {
  description = "environment name"
  type        = string
}

variable "tags" {
  description = "tags to apply to all resources"
  type        = map(string)
  default     = {}
}