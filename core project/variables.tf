variable "tags" {
  description = "Map of dynamic tags"
  type        = map(string)
}
variable "acr_private_dns_name" {}
variable "core_subscription_id" {}
variable "core_rg" {}
variable "core_vnet" {}
# variable "az_pe_we_core_to_cr_we_dp_core" {}
variable "connection_name" {}
variable "environment" {}
# variable "web_app" {}
variable "core_function_app_subnet_name" {}
variable "pe_subnet_name" {}
variable "acr_name" {}
# variable "we_record" {}
# variable "web_apps" {}
################################################
##                                            ##
##                Key Vault                   ##
##                                            ##
################################################

variable "keyvault_name" {}
variable "pe_name" {}
# variable "service_name" {}


################################################
##                                            ##
##                Function APp                ##
##                                            ##
################################################

variable "service_plan_name" {}
variable "function_app_name" {}
variable "fapp_storage_acc_name" {}
variable "blob_pe_to_fap_name" {}
variable "function_app_pe_name" {}
# variable "dns_group_name_suffix" {}
variable "file_pe_to_fap_name" {}
# variable "file_suffix" {}
variable "file_private_dns_zone_name" {}
variable "blob_private_dns_zone_name" {}
variable "table_private_dns_zone_name" {}
variable "queue_private_dns_zone_name" {}
variable "table_pe_to_fap_name" {}
# variable "table_suffix" {}
# variable "table_endpoint_name" {}
variable "queue_pe_to_fap_name" {}
# variable "queue_suffix" {}
# variable "queue_service_name" {}
variable "psql_private_dns_zone_name" {}
variable "fap_private_dns_zone_name" {}
variable "batch_private_dns_zone_name" {}
variable "keyvault_private_dns_zone_name" {}

# variable "prefix" {}
# variable "suffix" {}
# variable "queue_dns_group_name" {}
# variable "table_private_dns_zone_group_name" {}
# variable "dns_group_name_prefix" {}
################################################
##                                            ##
##                Batch Account               ##
##                                            ##
################################################

variable "batch_name" {}
variable "batch_pe_name" {}
# variable "batch_private_service_connection" {}
variable "node_management" {}
variable "identity_name" {}
# variable "batch_record_name" {}
# variable "batch_record_region" {}
variable "batch_pool_name" {}
variable "batch_account_subnet_name" {}
variable "shinyapp_batch_name" {}
variable "shinyapp_db_name" {}
variable "shinyapp_storage_name" {}
variable "acr_image_name" {}

################################################
##                                            ##
##                Data Factory                ##
##                                            ##
################################################

variable "adf_name" {}
variable "storage_private_endpoint_name" {}
variable "vault_private_endpoint_name" {}
variable "fap_pe_name" {}
variable "datalake_private_endpoint_name" {}
# variable "client_id" {}
variable "datalake_linked_name" {}
variable "keyvault_linked_name" {}
variable "keyvault_connection_name" {}
variable "keyvault_connection_name_suffix" {}
variable "function_app_linked_name" {}

# variable "keyvault_url" {}
# variable "vault_domain" {}
# variable "db_string" {}
# variable "db_suffix" {}
# variable "sql_linked_Service_name" {}


################################################
##                                            ##
##                Loganalytics                ##
##                                            ##
################################################

# variable "az_law_we_security_logs" {}
# variable "az_law_we_activity_logs" {}



################################################
##                                            ##
##                Postgres                    ##
##                                            ##
################################################

variable "core_db_subnet" {}
variable "az_pstgre_we_sensor_db_core" {}
variable "az_pstgre_we_sensor_db_core_version" {}
variable "pstgre_db_username" {}
variable "pstgre_db_password" {}
variable "az_pstgre_we_sensor_db_core_zone" {}
variable "pstgre_storage_mb" {}
variable "pstgre_storage_tier" {}
variable "pstgre_sku_name" {}
variable "azure_extensions_name" {}
variable "azure_extensions_values" {}
variable "postgres_port" {}
variable "sensor_db_name" {}
variable "shared_preload_libraries_name" {}
variable "shared_preload_libraries_values" {}

################################################
##                                            ##
##           Storage Account                  ##
##                                            ##
################################################
variable "corekvap" {}
variable "coresensor" {}
variable "azsawestagingcore" {}
variable "datalake_name" {}
variable "file_pe_to_datalake_name" {}
variable "datalake_private_dns_zone_name" {}
variable "core_storage_account_name" {}
variable "blob_pe_placeholder" {}
variable "file_pe_placeholder" {}
variable "table_pe_placeholder" {}
variable "queue_pe_placeholder" {}
variable "blob_pe_to_datalake_name" {}
variable "digital_assets_core" {}
variable "digital_assets_staging" {}
variable "digital_assets_datalake" {}
variable "da_staging_datalake" {}

################################################
##                                            ##
##              BASTION HOST                  ##
##                                            ##
################################################

variable "core_bastion_pip" {}
variable "bastion_name" {}
variable "azure_client_id" {}
variable "azure_client_secret" {}
# variable "client_secret" {}
variable "azure_tenant_id" {}
variable "apps_subscription_id" {}
variable "dns_rg" {}
variable "tre_subscription_id" {}
variable "connectivity_subscription_id" {}
variable "management_subscription_id" {}
variable "kcri_rg" {}

variable "dashboard_name" {}

# variable "keyvault_url" {}
# variable "az_kv_name" {}


variable "soc_security_rg_name" {}
variable "backup_vault_name" {}
variable "psql_policy_name" {}
variable "storage_account_policy_name" {}
variable "core_datalake_access_key" {}



######DataBricks######

variable "databricks_name" {}

variable "loganalytics_workspace_name" {}
