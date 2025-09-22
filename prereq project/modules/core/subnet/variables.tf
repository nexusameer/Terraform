variable "environment" {}
variable "resource_group_name" {}
variable "virtual_network_name" {}
variable "sensor_db_subnet_name" {}
# variable "db_ch_subnet_name" {}
variable "sensor_pe_subnet_name" {}
variable "sensor_batch_account_subnet_name" {}
variable "sensor_functionapp_subnet_name" {}
variable "sensor_bastion_subnet_name" {}
variable "sensor_db_address_prefix" { type = list(string) }
# variable "database_ch_address_prefix" { type = list(string) }
variable "sensor_pe_address_prefix" { type = list(string) }
variable "sensor_batch_account_address_prefix" { type = list(string) }
variable "sensor_functionapp_address_prefix" { type = list(string) }
variable "sensor_bastion_address_prefix" { type = list(string) }
variable "d_bricks_container_subnet_name" {}
variable "d_bricks_container_address_prefix" {}
variable "d_bricks_host_subnet_name" {}
variable "d_bricks_host_address_prefix" {}
variable "pe_d_bricks_cp_subnet_name" {}
variable "pe_d_bricks_cp_address_prefix" {}
variable "pe_d_bricks_managed_storage_subnet_name" {}
variable "pe_d_bricks_managed_storage_address_prefix" {}
variable "pe_d_bricks_metastore_subnet_name" {}
variable "ml_batch_account_subnet_name" {}
variable "ml_batch_account_address_prefix" {}
variable "ml_function_app_subnet_name" {}
variable "ml_function_app_address_prefix" {}
variable "ml_pe_subnet_name" {}
variable "ml_pe_subnet_address_prefix" {}
variable "lss_batch_account_subnet_name" {}
variable "lss_batch_account_address_prefix" {}
variable "lss_function_app_subnet_name" {}
variable "lss_function_app_address_prefix" {}
variable "lss_pe_subnet_name" {}
variable "lss_pe_address_prefix" {}
variable "inv_db_subnet_name" {}
variable "inv_vm_subnet_name" {}
variable "inv_db_address_prefix" {}
variable "inv_vm_address_prefix" {}
variable "inv_function_app_subnet_name" {}
variable "inv_function_app_address_prefix" {}
variable "inv_pe_subnet_name" {}
variable "inv_pe_address_prefix" {}
variable "event_hub_pe_subnet_name" {}
variable "event_hub_address_prefix" {}

