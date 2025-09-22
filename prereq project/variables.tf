######################## KCRI ######################################

variable "kcri_resource_group_name" {}

######################## Subscription ID ######################################

variable "kcri_subscription_id" {}
variable "connectivity_subscription_id" {}

######################## Resource Group ######################################

variable "resource_group_name" {
  description = "The base name of the resource group."
  type        = string
}

variable "resource_group_location" {
  description = "The Azure region where the resource group will be created."
  type        = string
}

variable "core_subscription_id" {
  type = string
}

variable "environment" {}

variable "tags" {
  description = "Map of dynamic tags"
  type        = map(string)
}

################################ vnet #######################################
variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the Virtual Network"
  type        = list(string)
  #default     = ["10.255.242.0/24"]
}



# ################################ Subnet #######################################


variable "sensor_db_subnet_name" {
  type = string
}

variable "sensor_pe_subnet_name" {
  type = string
}

variable "sensor_batch_account_subnet_name" {
  type = string
}

variable "sensor_functionapp_subnet_name" {
  type = string
}

variable "sensor_bastion_subnet_name" {
  type = string
}

variable "sensor_db_address_prefix" {
  type = list(string)
}

variable "sensor_pe_address_prefix" {
  type = list(string)
}

variable "sensor_batch_account_address_prefix" {
  type = list(string)
}
variable "sensor_functionapp_address_prefix" {
  type = list(string)
}

variable "sensor_bastion_address_prefix" {
  type = list(string)
}

variable "pe_d_bricks_metastore_subnet_name" {}
variable "d_bricks_container_subnet_name" {}
variable "pe_d_bricks_cp_subnet_name" {}
variable "pe_d_bricks_managed_storage_subnet_name" {}
variable "d_bricks_host_subnet_name" {}
variable "d_bricks_container_address_prefix" {}
variable "pe_d_bricks_managed_storage_address_prefix" {}
variable "pe_d_bricks_cp_address_prefix" {}
variable "d_bricks_host_address_prefix" {}



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
variable "kvap_vm_subnet_name" {}
variable "kvap_vm_address_prefix" {}
variable "ch_db_subnet_name" {}
variable "ch_db_address_prefix" {}
variable "ch_pe_address_prefix" {}



# variable "database_ch_address_prefix" {}
# variable "db_ch_subnet_name" {}


####################################### APP Resource Groups #################################################

variable "sensor_resource_group_name" {
  type = string
}
variable "sensor_resource_group_location" {
  type = string
}

variable "app_subscription_id" {
  type = string
}

######################################## APP Vnet ###########################################################
variable "sensor_vnet_name" {
  type = string
}
variable "sensor_vnet_address_space" {
  type = list(string)
}

######################################## APP Subnets ###########################################################

variable "webapp_sensor_subnet_name" {
  type = string
}

# Variable for PE Core subnet
variable "private_endpoint_sensor_subnet_name" {
  description = "The name for the PE Core subnet"
  type        = string
}

# Variable for BA Core subnet
variable "virtual_machine_sensor_subnet_name" {
  description = "The name for the BA Core subnet"
  type        = string
}

variable "webapp_sensor_address_prefix" {
  type = list(string)
}

variable "private_endpoint_sensor_address_prefix" {
  type = list(string)
}

variable "virtual_machine_sensor_address_prefix" {
  type = list(string)
}


####################################### CH Resource Groups #################################################

variable "resource_group_ch_name" {
  type = string
}

######################################## CH Vnet ###########################################################
variable "vnet_ch_name" {
  type = string
}
variable "vnet_ch_address_space" {
  type = list(string)
}


######################################## CH Subnets ###########################################################
# variable "machine_learning_ch_subnet_name" {}
# variable "machine_learning_ch_address_prefix" {}
# variable "function_app_ch_subnet_name" {}
# variable "function_app_ch_address_prefix" {}
# variable "virtual_machine_ch_subnet_name" {}
# variable "virtual_machine_ch_address_prefix" {}
variable "aks_ch_subnet_name" {}
variable "aks_ch_address_prefix" {}
variable "private_endpoint_ch_subnet_name" {}
variable "ch_pe_subnet_name" {}
variable "ch_appgtw_subnet_name" {}
variable "ch_appgtw_address_prefix" {}



#######################################################################################
variable "acr_sensor_private_dns_name" {}
variable "acr_sensor_link_name" {}
variable "sensor_appservice_dns_name" {}
variable "sensor_appservice_link_name" {}
variable "sensor_link_name" {}
# variable "app_batch_link_name" {}
variable "sensor_psql_dns_vnet_name" {}

#################################################################################
variable "core_batch_private_dns_name" {}
variable "core_batch_link_name" {}
variable "core_acr_private_dns_name" {}
variable "core_acr_link_name" {}
variable "core_fap_private_dns_name" {}
variable "core_network_name" {}
variable "core_file_dns_name" {}
variable "core_file_link_name" {}
variable "core_fap_dns_name" {}
variable "core_table_fap_dns_name" {}
variable "core_table_link_name" {}
variable "core_table_record_name" {}
variable "core_blob_link_name" {}
variable "aks_link_name_ch" {}
variable "aks_link_name_core" {}
variable "core_vault_name" {}
variable "core_link_name" {}
variable "core_psql_dns_vnet_name" {}
variable "core_queue_fap_dns_name" {}
variable "core_queue_link_name" {}
variable "core_psql_dns_name" {}
variable "core_queue_record_name" {}


variable "vnet_peering_sensor_name" {}
variable "vnet_peering_core_name" {}
variable "vnet_peering_gitlab_name" {}
variable "vnet_peering_kvap_name" {}
variable "vnet_peering_ch_name" {}

########################### Core Route Tanble ##########################

variable "core_route_table_name" {}

variable "core_route" {}

variable "core_route_address_prefix" {}

variable "core_next_hop_type" {}

variable "core_next_hop_ip_address" {}

# variable "batchaccount_subnet_id" {}

# variable "db_subnet_id" {}

# variable "functionapp_subnet_id" {}

# variable "private_endpoint_subnet_id" {}



########################### App Route Tanble ##########################

variable "app_route_table_name" {}

variable "app_route" {}

variable "app_route_address_prefix" {}

variable "app_next_hop_type" {}

variable "app_next_hop_ip_address" {}


########################## CH Route Table ############################

variable "ch_route_table_name" {}
variable "ch_route" {}
variable "ch_route_address_prefix" {}
variable "ch_next_hop_type" {}
variable "ch_next_hop_ip_address" {}
variable "ch_internet_route_table_name" {}
variable "ch_routes" {
  default = {}
}

############################ Gitlab #################################
variable "gitlab_resource_group_name" {}
variable "dns_rg_name" {}
variable "management_subscription_id" {}
variable "gitlab_vnet_name" {}
variable "gitlab_acr_link_name" {}
variable "gitlab_psql_dns_vnet_name" {}
variable "gitlab_batch_link_name" {}



############################ KVAP #################################

variable "kvap_rg_name" {}
variable "kvap_rg_location" {}
variable "kvap_vnet_name" {}
variable "kvap_address_space" {
  type = list(string)
}
# var iable "vm_gpu_kvap_subnet_name" {}
# variable "vm_gpu_kvap_subnet_prefix" {
# type = list(string)
# }
# variable "vm_cpu_kvap_subnet_name" {}
# variable "vm_cpu_kvap_subnet_prefix" {
#   type = list(string)
# }


############################ Action Group #################################
variable "recipient" {}


############################ Import Resources #################################
variable "psql_private_dns_zone_name" {}
variable "keyvault_private_dns_zone_name" {}
variable "batch_private_dns_zone_name" {}
variable "fap_private_dns_zone_name" {}
variable "table_private_dns_zone_name" {}
variable "queue_private_dns_zone_name" {}
variable "blob_private_dns_zone_name" {}
variable "file_private_dns_zone_name" {}
variable "acr_private_dns_name" {}
variable "eventhub_private_dns_name" {}
variable "ch_link_name" {}
variable "eventhub_link_name" {}
variable "aks_private_dns_zone_name" {}



############################ private dns vnet link #################################


variable "sensor_blob_link_name" {}
variable "psql_link_name" {}
variable "acr_link_name" {}
variable "blob_link_name" {}

################################################
##                                            ##
##                Loganalytics                ##
##                                            ##
################################################




################################################
##                                            ##
##               Backup Vaults                ##
##                                            ##
################################################
variable "backup_vault_name" {}

variable "soc_security_rg_name" {}
variable "security_rg_location" {}
variable "az_law_we_security_logs" {}




variable "connectivity_vnet_name" {}
variable "connectivity_rg_name" {}
variable "network_collection_rule_name" {}
variable "management_collection_rule_name" {}
variable "fw_policy_rule_cg_name" {}
variable "core_to_ch_rule_name" {}
variable "firewall_policy_name" {}
variable "firewall_name" {}
variable "ch_to_core_rule_name" {}
variable "core_to_kvap_rule_name" {}
variable "kvap_to_core_rule_name" {}
variable "core_to_sensor_rule_name" {}
variable "sensor_to_core_rule_name" {}
variable "gitlab_to_core_rule_name" {}
variable "core_to_gitlab_rule_name" {}

variable "gitlab_to_sensor_rule_name" {}
variable "sensor_to_gitlab_rule_name" {}
variable "gitlab_to_ch_rule_name" {}
variable "ch_to_gitlab_rule_name" {}
variable "gitlab_to_kvap_rule_name" {}
variable "kvap_to_gitlab_rule_name" {}
variable "vpop_collection_rule_name" {}
variable "vpop_address_space" {}
variable "core_to_vpop_rule_name" {}
variable "vpop_to_core_rule_name" {}
variable "ch_to_vpop_rule_name" {}
variable "vpop_to_ch_rule_name" {}
variable "vpop_to_kvap_rule_name" {}
variable "kvap_to_vpop_rule_name" {}
variable "sensor_to_vpop_rule_name" {}
variable "vpop_to_sensor_rule_name" {}
variable "gitlab_to_vpop_rule_name" {}
variable "vpop_to_gitlab_rule_name" {}
variable "sensor_to_internet_rule_name" {}
variable "gitlab_to_internet_rule_name" {}
variable "batch_account_sensor_to_internet_rule_name" {}
variable "function_app_sensor_to_internet_rule_name" {}
variable "function_app_ml_to_internet_rule_name" {}
variable "batch_account_ml_to_internet_rule_name" {}
variable "batch_account_lss_to_internet_rule_name" {}
variable "function_app_lss_to_internet_rule_name" {}
variable "function_app_inv_to_internet_rule_name" {}
variable "core_nsg_name" {}
variable "ch_nsg_name" {}
variable "app_nsg_name" {}
variable "kvap_nsg_name" {}
