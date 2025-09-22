variable "resource_group_name_core" {}
variable "resource_group_name_sensor" {}
variable "az-kv-we-core" {}
variable "environment" {}
variable "az_vnet_we_sensor_dashboard" {}
variable "az_snet_we_pe_sensor" {}
variable "az_snet_we_webapp_sensor" {}
variable "az_snet_we_vm_sensor" {}
variable "acr_private_dns_name" {}
variable "private_dns_zone_name_webapp" {}
variable "dns_record_westeurope_data" {}
variable "dns_record_azcrweapp" {}
variable "resource_group_name_kcri" {}
variable "action_group_name" {}
variable "resource_group_name_gitlab" {}
variable "tags" {
  description = "Dynamic map of tags to apply to resources"
  type        = map(string)
  default     = {}
}
variable "backup_vault_name" {}
variable "soc_security_rg_name" {}
variable "loganalytics_workspace_name" {}