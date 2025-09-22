variable "core_rg_name" {}
variable "location" {}
variable "storage_account_name" {}
variable "storage_account_key" {}
variable "function_app_name" {}
variable "environment" {}
variable "created_by" {}
variable "file_share_name" {}
variable "function_app_plan_id" {}
variable "function_app_subnet_id" {}
variable "function_app_pe_name" {}
variable "pe_subnet_id" {}
variable "tags" {}
variable "gitlab_resource_group_name" {}
variable "function_app_private_dns_zone_name" {}
variable "keyvault_core_id" {}
variable "core_acr_name" {}
variable "lss_functioapp_keyvault_role_name" {
  default = "Key Vault Secrets User"
}
variable "elastic_instance_minimum" {}
variable "pre_warmed_instance_count" {}
variable "worker_count" {
  default = 1
}