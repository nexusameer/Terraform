variable "control_panel_app_service_name" {}
variable "environment" {}
variable "az_app_service_plan_id" {} 
variable "sensor_rg_name" {}
variable "sensor_rg_location" {}
variable "az_snet_we_pe_sensor_id" {}
variable "container_registry_id" {}
variable "keyvault_core_id" {}
variable "key_vault_name" {}
variable "container_registry_name" {}
variable "az_snet_we_webapp_sensor_id" {}
variable "appservice_private_dns_id" {}
variable "appservice_private_dns_name" {}
variable "key_vault_url" {}
variable "app_subscription_id" {}
variable "gitlab_rg_name" {}
variable "tags" {
  description = "Dynamic map of tags to apply to resources"
  type        = map(string)
  default     = {}
}
variable "app_service_plan_kind" {
  default = "Linux"
}
variable "app_service_reserved_field" {
  default = true
}
variable "app_service_plan_sku_tier" {
  default = "Premium0V3"
}
variable "app_service_plan_sku_size" {
  default = "P0v3"
}
variable "acr_role_definition_name" {
  default = "AcrPull"
}
variable "ftps_state" {
  default = "FtpsOnly"
}
variable "always_on" {
  default = true
}
variable "http2_enabled" {
  default = true
}
variable "acr_use_managed_identity_credentials" {
  default = true
}
variable "vnet_route_all_enabled" {
  default = true
}
variable "auth_settings_enabled" {
  default = false
}
variable "identity_type" {
  default = "SystemAssigned"
}
variable "app_service_keyvault_role_name" {
  default = "Key Vault Secrets User"
}
variable "contorl_app_private_endpoint_name" {
  default = "AZ_PE_WE_CP_APPSRV_TO_SNET_SENSOR"
}
variable "private_dns_zone_group_name" {
  default = "gitlab-private-dns-zone"
}
variable "private_service_connection_name" {
  default = "AZ_PE_WE_APPSRV_TO_SNET_SENSOR"
}
variable "subresource_names" { 
    type = list(string) 
    default = [ "sites" ]
}
variable "image_name" {
  default = "reef-control-panel"
}
variable "image_tag" {
  default = "latest"
}
variable "ttl" {
  default = 10
}