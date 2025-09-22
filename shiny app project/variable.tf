################################ Resource Group #######################################
variable "resource_group_name_sensor" {}
variable "resource_group_name_core" {}
variable "az_vnet_we_sensor_dashboard" {}
variable "az_snet_we_webapp_sensor" {}
variable "az_snet_we_pe_sensor" {}
variable "az_snet_we_vm_sensor" {}
variable "private_dns_zone_name_webapp" {}
variable "az-kv-we-core" {}
variable "acr_private_dns_name" {}
variable "dns_record_azcrweapp" {}
variable "dns_record_westeurope_data" {}
variable "sensor_container_registry_name" {}
variable "resource_group_name_gitlab" {}

################################ environment #######################################
variable "environment" {}
variable "kcri_subscription_id" {}
variable "resource_group_name_kcri" {}
variable "connectivity_subscription_id" {}
variable "tags" {
  description = "Map of dynamic tags"
  type        = map(string)
  default     = {}
}

################################ Shiny vm #######################################
variable "shinyapp_nic_name" {}
variable "shiny_vm_name" {}
variable "diagnostic_storage_account_name" {}
variable "shiny_vm_admin_username" {}
variable "shiny_vm_admin_password" {}
variable "shiny_vm_size" {}
variable "shiny_vm_os_disk_storage_account_type" {}
variable "diagnostic_storage_account_tier" {}
variable "vm_backup_vault_name" {}
variable "vm_backup_vault_policy_name" {}
variable "azsawebootdiagapps_backup_vault_name" {}
variable "azsawebootdiagapps_backup_vault_policy_name" {}

################################ App service #######################################
variable "app_service_name" {}
variable "sensor_app_service_plan_name" {}
variable "app_subscription_id" {}


################################ Control Panel App service ####################################
variable "control_panel_app_service_name" {}


################################ App container registry #######################################
variable "az_pe_we_apps_to_cr_we_core" {}


################################ provider.tf #######################################
variable "core_subscription_id" {}

################################ Action group #######################################
variable "action_group_name" {}
variable "dashboard_name" {}



variable "backup_vault_name" {}
variable "backup_vault_policy_name" {}
variable "soc_security_rg_name" {}
variable "management_subscription_id" {}

variable "ARM_CLIENT_ID" {}
variable "ARM_CLIENT_SECRET" {}
variable "ARM_TENANT_ID" {}
variable "loganalytics_workspace_name" {}