variable "environment" {
  description = "Name of the environment"
  type        = string
}

variable "created_by" {
  description = "Name of the creater"
  type        = string
}

# variable "resource_group_name" {
#   description = "The name of the resource group"
#   type        = string
# }

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
  default     = "East US"
}

variable "aks_cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "dns_prefix" {}

variable "appgw_name" {
  description = "Application Gateway Name"
  type        = string
}

variable "aks_node_count" {
  description = "The number of nodes in the AKS cluster"
  type        = number
  default     = 3
}

variable "aks_node_size" {
  description = "The size of the nodes in the AKS cluster"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "private_cluster_enabled" {
  default = false
}

variable "node_pool_name" {}
variable "vm_size" {}
variable "node_os_disk_size" {
  description = "Node OS Disk Size"
  default     = 30
}
variable "node_count" {}
variable "auto_scaling_enabled" {}
variable "node_min_count" {}
variable "node_max_count" {}
variable "drain_timeout_in_minutes" {
  default = 0
}
variable "max_surge" {
  default = "10%"
}
variable "node_soak_duration_in_minutes" {
  default = 0
}

variable "keda_enabled" {}
variable "vertical_pod_autoscaler_enabled" {}

# variable "kubernetes_namespace_name" {}

variable "aks_sku_tier" {
  description = "(Optional) The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free, Standard (which includes the Uptime SLA) and Premium. Defaults to Free."
  default     = "Free"
}

variable "cost_analysis_enabled" {
  description = "(Optional) Should cost analysis be enabled for this Kubernetes Cluster? Defaults to false. The sku_tier must be set to Standard or Premium to enable this feature. Enabling this will add Kubernetes Namespace and Deployment details to the Cost Analysis views in the Azure portal."
  default     = false
}

variable "kubernetes_version" {
  default = "1.31.6"
}

variable "automatic_upgrade_channel" {
  description = "(Optional) The upgrade channel for this Kubernetes Cluster. Possible values are patch, rapid, node-image and stable. Omitting this field sets this value to none"
  default     = "patch"
}

variable "availability_zones" {}

variable "min_count" {}
variable "max_count" {}

variable "aks_private_dns_name" {}
variable "gitlab_rg_name" {}

variable "eventhub_namespace_name" {
  description = "The name of the Event Hub namespace"
  type        = string
}

variable "eventhub_name" {
  description = "The name of the Event Hub"
  type        = string
}

variable "eventhub_partition_count" {
  description = "The number of partitions for the Event Hub"
  type        = number
  default     = 4
}

variable "eventhub_message_retention" {
  description = "Message retention period in days for the Event Hub"
  type        = number
  default     = 1
}

variable "eventhub_consumer_groups" {
  description = "List of consumer groups for the Event Hub"
  type        = list(string)
  default     = ["cg1", "cg2"]
}
# variable "subscription_id" {
#   description = "The id of the subscription"
#   type        = string
# }

# variable "tenant_id" {
#   description = "The id of the tenant"
#   type        = string
# }

# variable "client_id" {
#   description = "The id of the client"
#   type        = string
# }

# variable "client_secret" {
#   description = "The id of the secret"
#   type        = string
# }

############################################ Event Hub #################################

variable "eventhub_namespace_core" {
  description = "The core eventhub namespace"
  type        = string
}
variable "eventhub_namespace_ch" {}

variable "eventhub_namespace_aks" {
  description = "The ch aks eventhub namespace"
  type        = string
}

variable "eventhub_namespace_k8" {
  description = "The ch k8 eventhub namespace"
  type        = string
}

variable "sku" {
  type = string
}

variable "lss_topic_name" {
  description = "Name of eventbridge topic"
  type        = string
}

variable "wq_topic_name" {
  description = "Name of eventbridge topic"
  type        = string
}

variable "ml_topic_name" {
  description = "Name of eventbridge topic"
  type        = string
}

variable "idb_topic_name" {
  description = "Name of eventbridge topic"
  type        = string
}
variable "sensortopic_name" {}
############################################Import Resources#################################
variable "core_rg" {}
variable "dns_rg_name" {}
variable "gitlab_rg" {}
variable "gitlab_vnet_name" {}
variable "core_vnet" {}
# variable "core_db_subnet_name" {}
variable "core_pe_subnet_name" {}
variable "container_registry_name" {}
variable "core_inv_db_subnet_name" {}
variable "ch_db_subnet_name" {}


############################################ Postgres #################################

# variable "db_name" {}
# variable "db_version" {}
# variable "pstgre_db_username" {}
# variable "pstgre_db_password" {}
# variable "zone" {}
# variable "pstgre_storage_mb" {}
# variable "pstgre_storage_tier" {}
# variable "pstgre_sku_name" {}
# variable "extenshion_name" {}
# variable "extenshion_value" {}


############################################ Private DNS Zone #################################

variable "psql_private_dns_zone_name" {}
variable "admin_principal_name" {}


variable "az_snet_we_aks_ch" {}
variable "resource_group_name_ch" {}
variable "resource_group_name_connectivity" {}
variable "resource_group_name_sensor" {}
variable "resource_group_name_core" {}
variable "az-kv-we-core" {}
variable "acr_private_dns_name" {}
variable "blob_private_dns_name" {}
variable "file_private_dns_name" {}
variable "table_private_dns_name" {}
variable "queue_private_dns_name" {}
variable "aks_private_dns_zone_name" {}
variable "db_zone" {}
# variable "az_vnet_we_sensor_dashboard" {}
variable "az_snet_we_pe_sensor" {}
variable "az_snet_we_webapp_sensor" {}
variable "az_snet_we_vm_sensor" {}
variable "private_dns_zone_name_webapp" {}
variable "dns_record_azcrweapp" {}
variable "dns_record_westeurope_data" {}
variable "resource_group_name_kcri" {}
variable "resource_group_name_gitlab" {}
variable "action_group_name" {}
variable "apps_subscription_id" {}
variable "core_subscription_id" {}
variable "tre_subscription_id" {}
# variable "security_subscription_id" {}
variable "connectivity_subscription_id" {}
variable "management_subscription_id" {}
variable "az_vnet_we_ch" {}
variable "az_vnet_we_connectivity" {}

variable "default_node_pool_name" {
  description = "Default node pool"
  type        = string
}

variable "fapp_storage_acc_name" {}
variable "lss_service_plan_name" {}
variable "inv_service_plan_name" {}
variable "ml_service_plan_name" {}
variable "lss_function_app_name" {}
variable "crs_function_app_name" {}
variable "crs_function_app_pe_name" {}
variable "inv_ml_function_app_pe_name" {}
variable "inv_lss_function_app_pe_name" {}
variable "inv_wq_function_app_name" {}
variable "inv_lss_function_app_name" {}
variable "inv_ml_function_app_name" {}
variable "wq_function_app_name" {}
variable "agic_identity_name" {}
variable "az_snet_we_agic_ch" {}
variable "az_snet_we_agic_connectivity" {}
variable "az_snet_we_vm_inv" {}
variable "lss_hist_function_app_name" {}
variable "ml_hist_function_app_name" {}
variable "inv_wq_function_app_pe_name" {}
variable "lss_hist_function_app_pe_name" {}
variable "ml_hist_function_app_pe_name" {}
variable "elastic_instance_minimum" {}
variable "pre_warmed_instance_count" {}
################################################
##                                            ##
##                Postgres                    ##
##                                            ##
################################################

# variable "core_db_subnet" {}
variable "ch_db_name" {}
variable "inv_db_name" {}
variable "az_pstgre_we_sensor_db_core" {}
variable "az_pstgre_we_sensor_db_core_version" {}
variable "pstgre_db_username" {}
variable "pstgre_db_password" {}
variable "az_pstgre_we_sensor_db_core_zone" {}
variable "pstgre_storage_mb" {}
variable "pstgre_storage_tier" {}
variable "pstgre_sku_name" {}
variable "extenshion_name" {}
variable "extenshion_value" {}
variable "postgres_port" {}
variable "sensor_db_name" {}
variable "timescaledb_extension_name" {}
variable "timescaledb_extension_value" {}
variable "tablefunc_extension_name" {}
variable "tablefunc_extension_value" {}
variable "dn_database_name" {}
variable "inv_database_name" {}
variable "inv_database_name_2" {}
variable "inv_database_name_3" {}
variable "ch_database_name" {}
variable "ch_database_name_2" {}
variable "ch_database_name_3" {}
variable "tags" {}
variable "inv_user1" {}
variable "inv_user2" {}
variable "inv_user3" {}
variable "ch_user1" {}
variable "ch_user2" {}
variable "ch_user3" {}
variable "inv_userdb_admin" {
  type = set(string)
}
variable "inv_userdb_appuser" {
  type = set(string)
}
variable "ch_userdb_admin" {
  type = set(string)
}
variable "ch_userdb_appuser" {
  type = set(string)
}
variable "inv_user_db_map" {
  type = map(string)
}
variable "ch_user_db_map" {
  type = map(string)
}
variable "ha_mode" {}

################################################
##                                            ##
##       Nursery Storage Account              ##
##                                            ##
################################################

variable "sanursery" {}
variable "sanursery_pe_name_blob" {}
variable "sanursery_pe_name_file" {}
variable "blob_pe_to_fap_name" {}
variable "file_pe_to_fap_name" {}
variable "table_pe_to_fap_name" {}
variable "queue_pe_to_fap_name" {}
variable "blob_pe_placeholder" {}
variable "file_pe_placeholder" {}
variable "table_pe_placeholder" {}
variable "queue_pe_placeholder" {}

###############################################
##                                           ##
##            Application Gateway IC         ##
##                                           ##
###############################################
variable "gateway_ip_configuration" {}
variable "appgw_public_ip_name" {}
variable "sku_name" {}
variable "sku_tier" {}
variable "sku_capacity" {}
variable "frontend_port" {
  default = 80
}
variable "backend_address_pool_name" {
  default = "appgw-backend-pool"
}
variable "backend_http_settings_name" {
  default = "http-settings"
}
variable "cookie_based_affinity" {
  default = "Disabled"
}
variable "backend_http_settings_port" {
  default = 80
}
variable "backend_http_settings_protocol" {
  default = "Http"
}
variable "request_timeout" {
  default = 30
}
variable "http_listener_name" {
  default = "http-listener"
}
variable "frontend_public_ip_configuration_name" {
  default = "appgw-public-frontend-ip"
}
variable "frontend_private_ip_configuration_name" {
  default = "appgw-private-frontend-ip"
}
variable "ssl_certificate_name" {}
variable "certfile_path" {}
variable "cert_password" {}
variable "agic_private_ip_address" {}
variable "frontend_port_name" {
  default = "http-port"
}
variable "frontend_http_listener_protocol" {
  default = "Http"
}

variable "request_routing_rule_name" {
  default = "http-rule"
}
variable "rule_type" {
  default = "Basic"
}

variable "zones" {}

################################ Bastion #######################################
variable "bastion_nic_name" {}
variable "bastion_name" {}
variable "diagnostic_storage_account_name" {}
variable "bastion_admin_username" {}
variable "bastion_admin_password" {}
variable "bastion_size" {}
variable "bastion_os_disk_storage_account_type" {}
variable "diagnostic_storage_account_tier" {}

############################### ACR #########################

variable "acr_name" {}
variable "connection_name" {}
# variable "ip_range" {}

############################MANAGED BY ZAMRAN################
variable "identity_name" {}
variable "core_lss_subnet_name" {}
variable "core_lss_batch_subnet_name" {}
variable "core_ml_batch_subnet_name" {}
variable "lss_batch_name" {}
variable "lss_batch_pe_name" {}
variable "lss_node_management" {}
variable "lss_batch_pool_name" {}
variable "lss_acr_image_name" {}
variable "batch_private_dns_zone_name" {}
variable "gitlab_resource_group_name" {}
variable "ml_batch_name" {}
variable "ml_batch_pe_name" {}
variable "ml_node_management" {}
variable "ml_batch_pool_name" {}
variable "ml_acr_image_name" {}

variable "eventhub_connection_name" {}
variable "core_eh_subnet_name" {}
variable "eh_private_dns_zone_name" {}
variable "core_lss_fap_subnet_name" {}
variable "core_inv_fap_subnet_name" {}
variable "core_ml_fap_subnet_name" {}
variable "lss_function_app_pe_name" {}
variable "ml_function_app_pe_name" {}
variable "core_inv_pe_subnet_name" {}
variable "core_ml_pe_subnet_name" {}
variable "pe_subnet_ch_name" {}
variable "ch_eventhub_connection_name" {}
variable "locationtopic_name" {}
variable "task_eventhub_name" {}
variable "nursery_eventhub_name" {}
variable "userstopic_name" {}
variable "nurserytopic_name" {}
variable "waterchemistrytopic_name" {}
variable "ml_cognito_password_value" {}
variable "ml_cognito_username_value" {}
############################MANAGED BY ZAMRAN################


################################ Shiny vm #######################################
variable "shinyapp_nic_name" {}
variable "shiny_vm_name" {}
variable "shiny_vm_admin_username" {}
variable "shiny_vm_admin_password" {}
variable "shiny_vm_size" {}
variable "shiny_vm_os_disk_storage_account_type" {}

################################ ACS #######################
variable "acs_name" {}

################################ ECS #######################
variable "ecs_name" {}
variable "ecs_service_domain_name" {}
variable "domain_management" {}

############ Log Analytics #################################

variable "azurerm_log_analytics_workspace_name" {}
variable "soc_security_rg_name" {}


variable "lss_password" {}
variable "db_user" {}
variable "db_passwd" {}
variable "db_name" {}
variable "reportingdb" {}
variable "ml_batch_key" {}
variable "ml_cognito_username" {}
variable "ml_cognito_password" {}
variable "ml_kafka_access_key" {}
variable "reportingdb_admin" {}

variable "app_name" {}

variable "inv_storage_name" {}
variable "inv_pe_name_file" {}
variable "lss_hist_pe_name_blob" {}
variable "inv_pe_name_blob" {}
variable "lss_hist_pe_name_file" {}
variable "lss_hist_service_plan_name" {}
variable "ml_hist_service_plan_name" {}

variable "lss_hist_storage_name" {}

variable "ml_hist_storage_name" {}
variable "ml_hist_pe_name_file" {}
variable "ml_hist_pe_name_blob" {}
variable "ml_function_app_name" {}

variable "inv_pe_name_table" {}
variable "inv_pe_name_queue" {}
variable "lss_hist_pe_name_table" {}
variable "lss_hist_pe_name_queue" {}
variable "ml_hist_pe_name_table" {}
variable "ml_hist_pe_name_queue" {}
variable "acrdpcore_name" {}
variable "dashboard_name" {}

variable "ml_function_app_access_key" {}

variable "gitlab_url" {}
variable "CH_ACCESS_TOKEN" {}
variable "gitlab_ch_nursery_repo_id" {}
variable "gitlab_ch_users_repo_id" {}
variable "adf_name" {}
variable "azure_client_id" {}
variable "azure_client_secret" {}
variable "azure_tenant_id" {}