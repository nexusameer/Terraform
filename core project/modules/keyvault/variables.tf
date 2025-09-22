# variable "kv_object_id" {}
# variable "dns_zone_id" {}
variable "az_kv_name" {}
variable "environment" {}
variable "core_rg_location" {}
variable "core_rg" {}
variable "azure_tenant_id" {}
variable "pe_name" {}
variable "service_name" {}
variable "pe_subnet_id" {}
variable "tags" {}
variable "keyvault_private_dns_zone_name" {}
variable "gitlab_resource_group_name" {}
variable "kv_lock_name" {
  type    = string
  default = "AZ_KV_Lock"
}
variable "kv_lock_level" {
  type    = string
  default = "CanNotDelete"
}