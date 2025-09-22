variable "environment" {
  description = "Name of the environment"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "resource_group_id" {}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
}

variable "cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "dns_prefix" {}

variable "node_count" {
  description = "The number of nodes in the AKS cluster"
  type        = number
}

variable "node_size" {
  description = "The size of the nodes in the AKS cluster"
  type        = string
}

variable "subnet_id" {
  description = "The id of subnet"
  type        = string
}

variable "agic_subnet_id" {}

variable "default_node_pool_name" {
  description = "Default node pool"
  type        = string
}

variable "node_os_disk_size" {
  description = "OS Disk Size"
  type        = number
  default     = 30
}

variable "agw_id" {}

variable "tags" {
  description = "Tags for resources"
}

variable "private_cluster_enabled" {
  default = false
}

variable "aks_sku_tier" {
  description = "(Optional) The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free, Standard (which includes the Uptime SLA) and Premium. Defaults to Free."
  default     = "Free"
}

variable "cost_analysis_enabled" {
  description = "(Optional) Should cost analysis be enabled for this Kubernetes Cluster? Defaults to false. The sku_tier must be set to Standard or Premium to enable this feature. Enabling this will add Kubernetes Namespace and Deployment details to the Cost Analysis views in the Azure portal."
  default     = false
}

variable "kubernetes_version" {
  default = "1.31.6"
}

variable "automatic_upgrade_channel" {
  description = "(Optional) The upgrade channel for this Kubernetes Cluster. Possible values are patch, rapid, node-image and stable. Omitting this field sets this value to none"
  default     = "patch"
}

variable "availability_zones" {}

variable "min_count" {}
variable "max_count" {}
variable "auto_scaling_enabled" {}
variable "drain_timeout_in_minutes" {
  default = 0
}
variable "max_surge" {
  default = "10%"
}
variable "node_soak_duration_in_minutes" {
  default = 0
}

variable "container_registry_id" {}
# variable "kubernetes_namespace_name" {}
variable "aks_private_dns_name" {}
variable "gitlab_rg_name" {}
variable "ttl" {
  default = 10
}
variable "private_dns_zone_id" {}
variable "gitlab_vnet_id" {}
variable "keda_enabled" {}
variable "vertical_pod_autoscaler_enabled" {}
# variable "action_group_id" {}
variable "log_analytics_workspace_id" {}

variable "agic_identity_name" {
  description = "The name of the Managed Identity for AGIC"
  type        = string
}