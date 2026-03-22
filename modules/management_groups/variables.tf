variable "root_management_group_id" {
  description = "name for the root management group"
  type        = string
}

variable "root_management_group_name" {
  description = "display name for the root management group"
  type        = string
}

variable "management_group_hierarchy" {
  description = "map of management groups to create"
  type = map(object({
    display_name = string
    parent_id    = string
  }))
}