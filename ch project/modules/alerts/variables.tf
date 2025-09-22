# variable "prefix" {
#   description = "Prefix for alert names"
#   type        = string
# }

variable "resource_group_name" {
  description = "Resource group for the alerts"
  type        = string
}

variable "scope_resource_id" {
  description = "Resource ID of AKS cluster to monitor"
  type        = string
}

variable "action_group_id" {
  description = "Action Group ID for notifications"
  type        = string
}

# variable "frequency" {
#   description = "Evaluation frequency for alerts"
#   type        = string
#   default     = "PT1M" # every 1 min
# }

# variable "window_size" {
#   description = "Time window size for alert evaluation"
#   type        = string
#   default     = "PT5M" # last 5 mins
# }

# variable "aks_alert_metrics" {
#   description = "List of metrics to create alerts on"
#   type = list(object({
#     name             = string
#     metric_namespace = string
#     aggregation      = string
#     operator         = string
#     threshold        = number
#     severity         = number
#     description      = optional(string)
#   }))
# }

variable "database_id" {
  description = "List of PostgreSQL database IDs"
  type        = list(string)
}
variable "ch_event_hub_id" {}
variable "core_event_hub_id" {}

variable "core_rg_name" {}

variable "batch_account" {
  type = map(string) # or list(string) if you prefer
}

variable "inv_vm_id" {}
variable "functionapp_id" {
  type = map(string)
}

variable "storage_account" {
  type = map(string)
}

variable "aks_id" {}
variable "rg_location" {}