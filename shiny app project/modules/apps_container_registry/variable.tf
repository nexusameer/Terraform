variable "sensor_container_registry_name" {}
variable "az_pe_we_apps_to_cr_we_core" {}
variable "dns_record_westeurope_data" {}
variable "environment" {}
variable "sensor_rg_name" {}
variable "sensor_rg_location" {}
variable "az_snet_we_pe_sensor_id" {}
variable "acr_private_dns_name" {}
# variable "acr_private_dns_id" {}
variable "core_rg_name" {}
variable "dns_record_azcrweapp" {}
variable "gitlab_rg_name" {}
variable "tags" {
  description = "Dynamic map of tags to apply to resources"
  type        = map(string)
  default     = {}
}
variable "admin_enabled" {
  default = true
}
variable "public_network_access_enabled" {
  default = false
}
variable "container_registry_sku" {
  default = "Premium"
}
variable "identity_type" {
  default = "SystemAssigned"
}
variable "acr_private_dns_zone_group_name" {
    default = "gitlab-private-dns-zone"
}
variable "subresource_names" { 
    type = list(string) 
    default = [ "registry" ]
}
variable "private_service_connection_type" {
  default = false
}
variable "ttl" {
  default = 10
}
