variable "environment" {}
variable "resource_group_ch_name" {}
variable "vnet_ch_name" {}
variable "aks_ch_subnet_name" {}
variable "private_endpoint_ch_subnet_name" {}
# variable "function_app_ch_subnet_name" {} 
# variable "machine_learning_ch_subnet_name" {}
# variable "virtual_machine_ch_subnet_name" {}
variable "aks_ch_address_prefix" { type = list(string) }
# variable "function_app_ch_address_prefix" { type = list(string) }
# variable "machine_learning_ch_address_prefix" { type = list(string) }
# variable "virtual_machine_ch_address_prefix" { type = list(string) }
variable "ch_db_subnet_name" {}
variable "ch_db_address_prefix" {}
variable "ch_pe_subnet_name" {}
variable "ch_pe_address_prefix" {}
variable "ch_appgtw_subnet_name" {}
variable "ch_appgtw_address_prefix" {}