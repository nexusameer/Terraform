variable "environment" {}
variable "shinyapp_nic_name" {}
variable "diagnostic_storage_account_name" {}
variable "sensor_rg_name" {}
variable "sensor_rg_location" {}
variable "az_snet_we_vm_sensor_id" {}
variable "diagonistic_container_name" {
  default = "diagnostics"
}
variable "diag_container_access_type" {
  default = "private"
}
variable "shiny_app_nic_ip_config_name" {
  default = "internal"
}
variable "shiny_app_nic_ip_config_allocation" {
  default = "Dynamic"
}
variable "shiny_vm_name" {}
variable "shiny_vm_computer_name" {
  default = "AZSENSOR"
}
variable "shiny_vm_admin_username" {}
variable "shiny_vm_admin_password" {}
variable "shiny_vm_size" {}
variable "shiny_vm_os_disk_name" {
  default = "myOsDisk"
}
variable "shiny_vm_os_disk_caching" {
  default = "ReadWrite"
}
variable "shiny_vm_os_disk_storage_account_type" {}
variable "shiny_vm_publisher" {
  default = "MicrosoftWindowsDesktop"
}
variable "shiny_vm_offer" {
  default = "windows-11"
}
variable "shiny_vm_sku" {
  default = "win11-23h2-pro"
}
variable "shiny_vm_rg_version" {
  default = "latest"
}
variable "workspace_name" {
  default = "acctest-01"
}
variable "workspace_sku" {
  default = "PerGB2018"
}
variable "shiny_vm_diag_name" {
  default = "shinyapp-vm-diagnostic-settings"
}
variable "shiny_vm_diag_metric_category" {
  default = "AllMetrics"
}

#Diagnostics Container
variable "diag_container_name" {
  default = "bootdiagnostics"
}
variable "diag_extension_name" {
  default = "IaaSDiagnostics"
}
variable "diag_extension_publisher" {
  default = "Microsoft.Azure.Diagnostics"
}
variable "diag_extension_type" {
  default = "IaaSDiagnostics"
}
variable "diag_extension_type_version" {
  default = "1.9"
}
variable "scheduledTransferLogLevelFilter" {
  default = "Verbose"
}
variable "scheduledTransferPeriod" {
  default = "PT1M"
}
variable "diag_extension_unit" {
  default = "Percent"
}
variable "diag_extension_sampleRate" {
  default = "PT60S"
}
variable "DataSource_name" {
  default = "Application!*[System[(Level=1 or Level=2 or Level=3)]]"
}
variable "Directories_containerName" {
  default = "wad-failed-request-logfiles"
}
variable "CrashDumps_containerName" {
  default = "wad-crash-dumps"
}
variable "CrashDumps_processName" {
  default = "process_name.exe"
}
variable "diagnostic_storage_account_tier" {}
variable "account_replication_type" {
  default = "LRS"
}
variable "default_action" {
  default = "Allow"
}
variable "min_tls_version" {
  default = "TLS1_2"
}
variable "tags" {
  description = "Dynamic map of tags to apply to resources"
  type        = map(string)
  default     = {}
}
variable "vm_lock_name" {
  type    = string
  default = "azsawefapcore_lock"
}
variable "vm_lock_level" {
  type    = string
  default = "CanNotDelete"
}

variable "azsawebootdiagapps_lock_name" {
  type    = string
  default = "azsawestagingcore_lock"
}
variable "lock_level" {
  type    = string
  default = "CanNotDelete"
}