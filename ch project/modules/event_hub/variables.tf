variable "environment" {
  description = "Name of the environment"
  type        = string
}

variable "created_by" {
  description = "Name of the creater"
  type        = string
}

variable "ch_rg_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
}

variable "namespace_name" {
  description = "The name of the Event Hub namespace"
  type        = string
}

variable "eventhub_name" {
  description = "The name of the Event Hub"
  type        = string
}

variable "partition_count" {
  description = "The number of partitions for the Event Hub"
  type        = number
}

variable "message_retention" {
  description = "Message retention period in days for the Event Hub"
  type        = number
}

variable "consumer_groups" {
  description = "List of consumer groups for the Event Hub"
  type        = list(string)
}

variable "public_network_access_enabled" {
  description = "Enable or disable public network access for the Event Hub"
  type        = bool
}

# variable "core_db_subnet_id" {
#   description = "The id of the core Subnet"
#   type        = string 
# }

variable "ch_aks_subnet_id" {
  description = "The id of the ch Subnet"
  type        = string
}

variable "eventhub_namespace_core" {
  description = "The core eventhub namespace"
  type        = string
}

variable "eventhub_namespace_aks" {
  description = "The ch aks eventhub namespace"
  type        = string
}

variable "eventhub_namespace_k8" {
  description = "The ch k8 eventhub namespace"
  type        = string
}
variable "core_rg_name" {
  description = "Resource group name of core"
  type        = string
}
variable "sku" {
  type = string
}
variable "lss_topic_name" {
  description = "Name of eventbridge topic"
  type        = string
}
variable "wq_topic_name" {
  description = "Name of eventbridge topic"
  type        = string
}
variable "ml_topic_name" {
  description = "Name of eventbridge topic"
  type        = string
}

variable "idb_topic_name" {
  description = "Name of eventbridge topic"
  type        = string
}

variable "eventhub_connection_name" {}
variable "pe_eh_subnet_id" {}
variable "tags" {}
variable "eh_private_dns_zone_name" {}
variable "gitlab_resource_group_name" {}

variable "eventhub_namespace_ch" {}
variable "ch_eventhub_connection_name" {}
variable "pe_ch_subnet_id" {}
variable "locationtopic_name" {}
variable "task_eventhub_name" {}
variable "nursery_eventhub_name" {}
variable "userstopic_name" {}
variable "nurserytopic_name" {}
variable "sensortopic_name" {}
variable "waterchemistrytopic_name" {}