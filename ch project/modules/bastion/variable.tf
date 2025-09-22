variable "environment" {}
variable "bastion_nic_name" {}
variable "diagnostic_storage_account_name" {}
variable "ch_rg_name" {}
variable "ch_rg_location" {}
variable "az_snet_we_bastion_ch_id" {}
variable "diagonistic_container_name" {
  default = "diagnostics"
}
variable "diag_container_access_type" {
  default = "private"
}
variable "bastion_nic_ip_config_name" {
  default = "internal"
}
variable "bastion_nic_ip_config_allocation" {
  default = "Dynamic"
}
variable "bastion_name" {}
variable "bastion_computer_name" {
  default = "AZSENSOR"
}
variable "bastion_admin_username" {}
variable "bastion_admin_password" {}
variable "bastion_size" {}
variable "bastion_os_disk_name" {
  default = "myOsDisk"
}
variable "bastion_os_disk_caching" {
  default = "ReadWrite"
}
variable "bastion_os_disk_storage_account_type" {}
variable "bastion_publisher" {
  default = "MicrosoftWindowsDesktop"
}
variable "bastion_offer" {
  default = "windows-11"
}
variable "bastion_sku" {
  default = "win11-22h2-pro"
}
variable "bastion_rg_version" {
  default = "latest"
}
variable "workspace_name" {
  default = "acctest-01"
}
variable "workspace_sku" {
  default = "PerGB2018"
}
variable "bastion_diag_name" {
  default = "bastion-vm-diagnostic-settings"
}
variable "bastion_diag_metric_category" {
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