variable "service_plan_name" {}
variable "fapp_storage_acc_name" {}
variable "function_app_name" {}
variable "core_rg_location" {}
variable "core_rg" {}
variable "core_function_app_subnet_id" {}
variable "core_pe_subnet_id" {}
variable "blob_pe_to_fap_name" {}
variable "file_pe_to_fap_name" {}
variable "table_pe_to_fap_name" {}
variable "queue_pe_to_fap_name" {}
variable "function_app_pe_name" {}
variable "environment" {}
variable "tags" {}
variable "function_app_private_dns_zone_name" {}
variable "table_private_dns_zone_name" {}
variable "file_private_dns_zone_name" {}
variable "queue_private_dns_zone_name" {}
variable "blob_private_dns_zone_name" {}
variable "gitlab_resource_group_name" {}
variable "keyvault_name" {}
variable "key_vault_url" {}
variable "azsawefapcore_lock_name" {
  type    = string
  default = "azsawefapcore_lock"
}
variable "azsawefapcore_lock_level" {
  type    = string
  default = "CanNotDelete"
}
variable "azsawefapcore_container" {
  type    = string
  default = "azsawefapcore-container"
}

