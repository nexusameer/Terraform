variable "corekvap" {}
variable "environment" {}
variable "coresensor" {}
variable "core_rg" {}
variable "core_rg_location" {}
variable "azsawestagingcore" {}
variable "datalake_name" {}
variable "core_pe_subnet_id" {}
variable "file_pe_to_datalake_name" {}
variable "tags" {}
variable "file_private_dns_zone_name" {}
variable "gitlab_resource_group_name" {}
variable "blob_private_dns_zone_name" {}
variable "blob_pe_to_datalake_name" {}
variable "digital_assets_core" {}
variable "digital_assets_staging" {}
variable "digital_assets_datalake" {}
variable "da_staging_datalake" {}
variable "storageaccount_pe_name" {
  type    = string
  default = "AZ_PE_WE_CORE_TO_SA_STAGESTORAGE_CORE"
}
variable "azsawestagingcore_lock_name" {
  type    = string
  default = "azsawestagingcore_lock"
}
variable "lock_level" {
  type    = string
  default = "CanNotDelete"
}
variable "azsawedatalakecore_lock_name" {
  type    = string
  default = "azsawedatalakecore_lock"
}