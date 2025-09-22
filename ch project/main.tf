module "import_resources" {
  source      = "./modules/import_resources"
  core_rg     = var.core_rg
  dns_rg_name = var.dns_rg_name
  gitlab_rg   = var.gitlab_rg
  # appgw_name                       = var.appgw_name
  resource_group_name_sensor       = var.resource_group_name_sensor
  resource_group_name_core         = var.resource_group_name_core
  resource_group_name_ch           = var.resource_group_name_ch
  resource_group_name_connectivity = var.resource_group_name_connectivity
  az-kv-we-core                    = var.az-kv-we-core
  environment                      = var.environment
  acr_private_dns_name             = var.acr_private_dns_name
  blob_private_dns_name            = var.blob_private_dns_name
  file_private_dns_name            = var.file_private_dns_name
  table_private_dns_name           = var.table_private_dns_name
  queue_private_dns_name           = var.queue_private_dns_name
  aks_private_dns_zone_name        = var.aks_private_dns_zone_name
  # az_vnet_we_sensor_dashboard  = var.az_vnet_we_sensor_dashboard
  az_snet_we_pe_sensor                 = var.az_snet_we_pe_sensor
  az_snet_we_webapp_sensor             = var.az_snet_we_webapp_sensor
  az_snet_we_vm_sensor                 = var.az_snet_we_vm_sensor
  az_vnet_we_ch                        = var.az_vnet_we_ch
  az_vnet_we_connectivity              = var.az_vnet_we_connectivity
  az_snet_we_aks_ch                    = var.az_snet_we_aks_ch
  az_snet_we_agic_ch                   = var.az_snet_we_agic_ch
  az_snet_we_agic_connectivity         = var.az_snet_we_agic_connectivity
  az_snet_we_vm_inv                    = var.az_snet_we_vm_inv
  core_vnet                            = var.core_vnet
  psql_private_dns_zone_name           = var.psql_private_dns_zone_name
  admin_principal_name                 = var.admin_principal_name
  private_dns_zone_name_webapp         = var.private_dns_zone_name_webapp
  dns_record_azcrweapp                 = var.dns_record_azcrweapp
  dns_record_westeurope_data           = var.dns_record_westeurope_data
  resource_group_name_kcri             = var.resource_group_name_kcri
  resource_group_name_gitlab           = var.resource_group_name_gitlab
  fapp_storage_acc_name                = var.fapp_storage_acc_name
  action_group_name                    = var.action_group_name
  container_registry_name              = "${var.container_registry_name}${var.environment}"
  gitlab_vnet_name                     = var.gitlab_vnet_name
  identity_name                        = "${var.identity_name}-${var.environment}"
  core_lss_subnet_name                 = "${var.core_lss_subnet_name}_${var.environment}"
  core_lss_batch_subnet_name           = "${var.core_lss_batch_subnet_name}_${var.environment}"
  core_eh_subnet_name                  = var.core_eh_subnet_name
  batch_private_dns_zone_name          = var.batch_private_dns_zone_name
  gitlab_resource_group_name           = var.gitlab_resource_group_name
  core_pe_subnet_name                  = var.core_pe_subnet_name
  eh_private_dns_zone_name             = var.eh_private_dns_zone_name
  core_lss_fap_subnet_name             = var.core_lss_fap_subnet_name
  core_inv_fap_subnet_name             = var.core_inv_fap_subnet_name
  core_ml_fap_subnet_name              = var.core_ml_fap_subnet_name
  core_inv_pe_subnet_name              = var.core_inv_pe_subnet_name
  core_inv_db_subnet_name              = var.core_inv_db_subnet_name
  core_ml_pe_subnet_name               = var.core_ml_pe_subnet_name
  core_ml_batch_subnet_name            = "${var.core_ml_batch_subnet_name}_${var.environment}"
  pe_subnet_ch_name                    = var.pe_subnet_ch_name
  ch_db_subnet_name                    = var.ch_db_subnet_name
  acrdpcore_name                       = var.acrdpcore_name
  azurerm_log_analytics_workspace_name = var.azurerm_log_analytics_workspace_name
  soc_security_rg_name                 = var.soc_security_rg_name
  adf_name                             = "${var.adf_name}-${var.environment}"
  tags                                 = var.tags
  providers = {
    azurerm.core         = azurerm.core
    azurerm.apps         = azurerm.apps
    azurerm.tre          = azurerm.tre
    azurerm.connectivity = azurerm.connectivity
    azurerm.management   = azurerm.management
  }
}

# module "inv_hist_functionapp_service_plan" {
#   source            = "./modules/functionapp_plan"
#   service_plan_name = "${var.inv_hist_service_plan_name}-${var.environment}"
#   core_rg_name      = module.import_resources.core_rg_name
#   location          = module.import_resources.core_rg_location
#   environment       = var.environment
#   created_by        = var.created_by
#   providers = {
#     azurerm.core = azurerm.core
#   }
# }

# module "lss_hist_functionapp_service_plan" {
#   source            = "./modules/functionapp_plan"
#   service_plan_name = "${var.lss_hist_service_plan_name}-${var.environment}"
#   core_rg_name      = module.import_resources.core_rg_name
#   location          = module.import_resources.core_rg_location
#   environment       = var.environment
#   created_by        = var.created_by
#   providers = {
#     azurerm.core = azurerm.core
#   }
# }

# module "ml_hist_functionapp_service_plan" {
#   source            = "./modules/functionapp_plan"
#   service_plan_name = "${var.ml_hist_service_plan_name}-${var.environment}"
#   core_rg_name      = module.import_resources.core_rg_name
#   location          = module.import_resources.core_rg_location
#   environment       = var.environment
#   created_by        = var.created_by
#   providers = {
#     azurerm.core = azurerm.core
#   }
# }

module "lss_functionapp_service_plan" {
  source            = "./modules/functionapp_plan"
  service_plan_name = "${var.lss_service_plan_name}-${var.environment}"
  core_rg_name      = module.import_resources.core_rg_name
  location          = module.import_resources.core_rg_location
  environment       = var.environment
  created_by        = var.created_by
  providers = {
    azurerm.core = azurerm.core
  }
}

module "inv_functionapp_service_plan" {
  source            = "./modules/functionapp_plan"
  service_plan_name = "${var.inv_service_plan_name}-${var.environment}"
  core_rg_name      = module.import_resources.core_rg_name
  location          = module.import_resources.core_rg_location
  environment       = var.environment
  created_by        = var.created_by
  providers = {
    azurerm.core = azurerm.core
  }
}

module "ml_functionapp_service_plan" {
  source            = "./modules/functionapp_plan"
  service_plan_name = "${var.ml_service_plan_name}-${var.environment}"
  core_rg_name      = module.import_resources.core_rg_name
  location          = module.import_resources.core_rg_location
  environment       = var.environment
  created_by        = var.created_by
  providers = {
    azurerm.core = azurerm.core
  }
}

module "lss_function_app" {
  source                    = "./modules/functionapp"
  core_rg_name              = module.import_resources.core_rg_name
  location                  = module.import_resources.core_rg_location
  storage_account_name      = module.storage_account.lss_hist_storage_account_name
  storage_account_key       = module.storage_account.lss_hist_storage_account_key
  file_share_name           = module.storage_account.lss_function_app_file_share_storage_name
  function_app_plan_id      = module.lss_functionapp_service_plan.function_app_sevice_plan_id
  elastic_instance_minimum  = var.elastic_instance_minimum
  pre_warmed_instance_count = var.pre_warmed_instance_count
  function_app_name         = var.lss_function_app_name

  function_app_subnet_id             = module.import_resources.core_lss_fap_subnet_id
  gitlab_resource_group_name         = module.import_resources.dns_rg_name
  pe_subnet_id                       = module.import_resources.core_lss_pe_subnet_id
  function_app_private_dns_zone_name = module.import_resources.appservice_private_dns_name
  function_app_pe_name               = var.lss_function_app_pe_name
  tags                               = var.tags
  environment                        = var.environment
  created_by                         = var.created_by
  keyvault_core_id                   = module.import_resources.keyvault_core_id
  core_acr_name                      = module.import_resources.acrdpcore_name
  depends_on                         = [module.import_resources, module.storage_account]
  providers = {
    azurerm.core         = azurerm.core
    azurerm.connectivity = azurerm.connectivity

  }

}

module "inv_wq_function_app" {
  source                             = "./modules/functionapp"
  core_rg_name                       = module.import_resources.core_rg_name
  location                           = module.import_resources.core_rg_location
  storage_account_name               = module.storage_account.inv_storage_account_name
  storage_account_key                = module.storage_account.inv_storage_account_key
  file_share_name                    = module.storage_account.inv_wq_function_app_file_share_name
  function_app_plan_id               = module.inv_functionapp_service_plan.function_app_sevice_plan_id
  elastic_instance_minimum           = var.elastic_instance_minimum
  pre_warmed_instance_count          = var.pre_warmed_instance_count
  function_app_name                  = var.inv_wq_function_app_name
  function_app_subnet_id             = module.import_resources.core_inv_fap_subnet_id
  function_app_pe_name               = var.inv_wq_function_app_pe_name
  gitlab_resource_group_name         = module.import_resources.dns_rg_name
  function_app_private_dns_zone_name = module.import_resources.appservice_private_dns_name
  pe_subnet_id                       = module.import_resources.core_inv_pe_subnet_id
  tags                               = var.tags
  environment                        = var.environment
  created_by                         = var.created_by
  keyvault_core_id                   = module.import_resources.keyvault_core_id
  core_acr_name                      = module.import_resources.acrdpcore_name
  depends_on                         = [module.import_resources, module.storage_account]
  providers = {
    azurerm.core         = azurerm.core
    azurerm.connectivity = azurerm.connectivity
  }

}

module "crs_function_app" {
  source                             = "./modules/functionapp"
  core_rg_name                       = module.import_resources.core_rg_name
  location                           = module.import_resources.core_rg_location
  storage_account_name               = module.storage_account.inv_storage_account_name
  storage_account_key                = module.storage_account.inv_storage_account_key
  file_share_name                    = module.storage_account.crs_function_app_file_share_name
  function_app_plan_id               = module.inv_functionapp_service_plan.function_app_sevice_plan_id
  elastic_instance_minimum           = var.elastic_instance_minimum
  pre_warmed_instance_count          = var.pre_warmed_instance_count
  function_app_name                  = var.crs_function_app_name
  function_app_subnet_id             = module.import_resources.core_inv_fap_subnet_id
  function_app_pe_name               = var.crs_function_app_pe_name
  gitlab_resource_group_name         = module.import_resources.dns_rg_name
  function_app_private_dns_zone_name = module.import_resources.appservice_private_dns_name
  pe_subnet_id                       = module.import_resources.core_inv_pe_subnet_id
  tags                               = var.tags
  environment                        = var.environment
  created_by                         = var.created_by
  keyvault_core_id                   = module.import_resources.keyvault_core_id
  core_acr_name                      = module.import_resources.acrdpcore_name
  depends_on                         = [module.import_resources, module.storage_account]
  providers = {
    azurerm.core         = azurerm.core
    azurerm.connectivity = azurerm.connectivity
  }

}

module "inv_lss_function_app" {
  source                             = "./modules/functionapp"
  core_rg_name                       = module.import_resources.core_rg_name
  location                           = module.import_resources.core_rg_location
  storage_account_name               = module.storage_account.inv_storage_account_name
  storage_account_key                = module.storage_account.inv_storage_account_key
  file_share_name                    = module.storage_account.inv_lss_function_app_file_share_name
  function_app_plan_id               = module.inv_functionapp_service_plan.function_app_sevice_plan_id
  elastic_instance_minimum           = var.elastic_instance_minimum
  pre_warmed_instance_count          = var.pre_warmed_instance_count
  function_app_name                  = var.inv_lss_function_app_name
  function_app_subnet_id             = module.import_resources.core_inv_fap_subnet_id
  function_app_pe_name               = var.inv_lss_function_app_pe_name
  gitlab_resource_group_name         = module.import_resources.dns_rg_name
  function_app_private_dns_zone_name = module.import_resources.appservice_private_dns_name
  pe_subnet_id                       = module.import_resources.core_inv_pe_subnet_id
  tags                               = var.tags
  environment                        = var.environment
  created_by                         = var.created_by
  keyvault_core_id                   = module.import_resources.keyvault_core_id
  core_acr_name                      = module.import_resources.acrdpcore_name
  depends_on                         = [module.import_resources, module.storage_account]
  providers = {
    azurerm.core         = azurerm.core
    azurerm.connectivity = azurerm.connectivity
  }

}

module "inv_ml_function_app" {
  source                             = "./modules/functionapp"
  core_rg_name                       = module.import_resources.core_rg_name
  location                           = module.import_resources.core_rg_location
  storage_account_name               = module.storage_account.inv_storage_account_name
  storage_account_key                = module.storage_account.inv_storage_account_key
  file_share_name                    = module.storage_account.inv_ml_function_app_file_share_name
  function_app_plan_id               = module.inv_functionapp_service_plan.function_app_sevice_plan_id
  elastic_instance_minimum           = var.elastic_instance_minimum
  pre_warmed_instance_count          = var.pre_warmed_instance_count
  function_app_name                  = var.inv_ml_function_app_name
  function_app_subnet_id             = module.import_resources.core_inv_fap_subnet_id
  function_app_pe_name               = var.inv_ml_function_app_pe_name
  gitlab_resource_group_name         = module.import_resources.dns_rg_name
  function_app_private_dns_zone_name = module.import_resources.appservice_private_dns_name
  pe_subnet_id                       = module.import_resources.core_inv_pe_subnet_id
  tags                               = var.tags
  environment                        = var.environment
  created_by                         = var.created_by
  keyvault_core_id                   = module.import_resources.keyvault_core_id
  core_acr_name                      = module.import_resources.acrdpcore_name
  depends_on                         = [module.import_resources, module.storage_account]
  providers = {
    azurerm.core         = azurerm.core
    azurerm.connectivity = azurerm.connectivity
  }

}

# module "lss_hist_function_app" {
#   source                             = "./modules/functionapp"
#   core_rg_name                       = module.import_resources.core_rg_name
#   location                           = module.import_resources.core_rg_location
#   storage_account_name               = module.storage_account.lss_hist_storage_account_name
#   storage_account_key                = module.storage_account.lss_hist_storage_account_key
#   file_share_name                    = module.storage_account.lss_hist_function_app_file_share_name
#   function_app_plan_id               = module.lss_hist_functionapp_service_plan.function_app_sevice_plan_id
#   function_app_name                  = var.lss_hist_function_app_name
#   function_app_subnet_id             = module.import_resources.core_lss_fap_subnet_id
#   function_app_pe_name               = var.lss_hist_function_app_pe_name
#   gitlab_resource_group_name         = module.import_resources.dns_rg_name
#   function_app_private_dns_zone_name = module.import_resources.appservice_private_dns_name
#   pe_subnet_id                       = module.import_resources.core_lss_pe_subnet_id
#   tags                               = var.tags
#   environment                        = var.environment
#   created_by                         = var.created_by
#   keyvault_core_id                   = module.import_resources.keyvault_core_id
#   depends_on                         = [module.import_resources, module.storage_account]
#   providers = {
#     azurerm.core         = azurerm.core
#     azurerm.connectivity = azurerm.connectivity
#   }

# }

# module "ml_hist_function_app" {
#   source                             = "./modules/functionapp"
#   core_rg_name                       = module.import_resources.core_rg_name
#   location                           = module.import_resources.core_rg_location
#   storage_account_name               = module.storage_account.ml_hist_storage_account_name
#   storage_account_key                = module.storage_account.ml_hist_storage_account_key
#   file_share_name                    = module.storage_account.ml_hist_function_app_file_share_name
#   function_app_plan_id               = module.ml_hist_functionapp_service_plan.function_app_sevice_plan_id
#   function_app_name                  = var.ml_hist_function_app_name
#   function_app_subnet_id             = module.import_resources.core_ml_fap_subnet_id
#   function_app_pe_name               = var.ml_hist_function_app_pe_name
#   gitlab_resource_group_name         = module.import_resources.dns_rg_name
#   function_app_private_dns_zone_name = module.import_resources.appservice_private_dns_name
#   pe_subnet_id                       = module.import_resources.core_ml_pe_subnet_id
#   tags                               = var.tags
#   environment                        = var.environment
#   created_by                         = var.created_by
#   keyvault_core_id                   = module.import_resources.keyvault_core_id
#   depends_on                         = [module.import_resources, module.storage_account]
#   providers = {
#     azurerm.core         = azurerm.core
#     azurerm.connectivity = azurerm.connectivity
#   }

# }

# module "inv_function_app" {
#   source                             = "./modules/functionapp"
#   core_rg_name                       = module.import_resources.core_rg_name
#   location                           = module.import_resources.core_rg_location
#   storage_account_name               = module.storage_account.inv_storage_account_name
#   storage_account_key                = module.storage_account.inv_storage_account_key
#   file_share_name                    = module.storage_account.crs_function_app_file_share_name
#   function_app_plan_id               = module.inv_functionapp_service_plan.function_app_sevice_plan_id
#   function_app_name                  = var.crs_function_app_name
#   function_app_subnet_id             = module.import_resources.core_inv_fap_subnet_id
#   function_app_pe_name               = var.inv_function_app_pe_name
#   gitlab_resource_group_name         = module.import_resources.dns_rg_name
#   function_app_private_dns_zone_name = module.import_resources.appservice_private_dns_name
#   pe_subnet_id                       = module.import_resources.core_inv_pe_subnet_id
#   tags                               = var.tags
#   environment                        = var.environment
#   created_by                         = var.created_by
#   keyvault_core_id                   = module.import_resources.keyvault_core_id
#   depends_on                         = [module.import_resources, module.storage_account]
#   providers = {
#     azurerm.core         = azurerm.core
#     azurerm.connectivity = azurerm.connectivity
#   }

# }

module "ml_function_app" {
  source                             = "./modules/functionapp"
  core_rg_name                       = module.import_resources.core_rg_name
  location                           = module.import_resources.core_rg_location
  storage_account_name               = module.storage_account.ml_hist_storage_account_name
  storage_account_key                = module.storage_account.ml_hist_storage_account_key
  file_share_name                    = module.storage_account.ml_function_app_file_share_storage_name
  function_app_plan_id               = module.ml_functionapp_service_plan.function_app_sevice_plan_id
  elastic_instance_minimum           = var.elastic_instance_minimum
  pre_warmed_instance_count          = var.pre_warmed_instance_count
  function_app_name                  = var.ml_function_app_name
  pe_subnet_id                       = module.import_resources.core_ml_pe_subnet_id
  function_app_private_dns_zone_name = module.import_resources.appservice_private_dns_name
  gitlab_resource_group_name         = module.import_resources.dns_rg_name
  function_app_subnet_id             = module.import_resources.core_ml_fap_subnet_id
  function_app_pe_name               = var.ml_function_app_pe_name
  tags                               = var.tags
  environment                        = var.environment
  created_by                         = var.created_by
  keyvault_core_id                   = module.import_resources.keyvault_core_id
  core_acr_name                      = module.import_resources.acrdpcore_name
  depends_on                         = [module.import_resources, module.storage_account]
  providers = {
    azurerm.core         = azurerm.core
    azurerm.connectivity = azurerm.connectivity
  }

}


module "event_hub" {
  source                        = "./modules/event_hub"
  ch_rg_name                    = module.import_resources.ch_rg_name
  location                      = var.location
  namespace_name                = var.eventhub_namespace_name
  eventhub_name                 = var.eventhub_name
  partition_count               = var.eventhub_partition_count
  message_retention             = var.eventhub_message_retention
  consumer_groups               = var.eventhub_consumer_groups
  public_network_access_enabled = false
  # core_db_subnet_id             = module.import_resources.core_db_subnet_id
  eventhub_namespace_core     = var.eventhub_namespace_core
  eventhub_namespace_ch       = var.eventhub_namespace_ch
  eventhub_namespace_aks      = var.eventhub_namespace_aks
  eventhub_namespace_k8       = var.eventhub_namespace_k8
  core_rg_name                = module.import_resources.core_rg_name
  sku                         = var.sku
  lss_topic_name              = var.lss_topic_name
  wq_topic_name               = var.wq_topic_name
  ml_topic_name               = var.ml_topic_name
  idb_topic_name              = var.idb_topic_name
  ch_aks_subnet_id            = module.import_resources.ch_aks_subnet_id
  environment                 = var.environment
  created_by                  = var.created_by
  eventhub_connection_name    = var.eventhub_connection_name
  pe_eh_subnet_id             = module.import_resources.core_eh_subnet_id
  eh_private_dns_zone_name    = module.import_resources.eh_private_dns_zone_name
  gitlab_resource_group_name  = module.import_resources.dns_rg_name
  nursery_eventhub_name       = var.nursery_eventhub_name
  task_eventhub_name          = var.task_eventhub_name
  locationtopic_name          = var.locationtopic_name
  ch_eventhub_connection_name = var.ch_eventhub_connection_name
  pe_ch_subnet_id             = module.import_resources.pe_subnet_ch_id
  nurserytopic_name           = var.nurserytopic_name
  userstopic_name             = var.userstopic_name
  sensortopic_name            = var.sensortopic_name
  waterchemistrytopic_name    = var.waterchemistrytopic_name
  tags                        = var.tags

  providers = {
    azurerm.core         = azurerm.core
    azurerm.apps         = azurerm.apps
    azurerm.connectivity = azurerm.connectivity
  }
}



###############################################
#                                            ##
#                Postgres                    ##
#                                            ##
###############################################

module "inv_postgresql" {
  source                              = "./modules/postgresql"
  private_dns_zone                    = module.import_resources.psql_private_dns_zone_id
  rg_name                             = module.import_resources.resource_group_name
  rg_location                         = module.import_resources.core_rg_location
  virtual_network_id                  = module.import_resources.core_vnet_id
  az_pstgre_we_sensor_db_core         = var.inv_db_name
  az_pstgre_we_sensor_db_core_version = var.az_pstgre_we_sensor_db_core_version
  delegated_subnet_id                 = module.import_resources.core_inv_db_subnet_id
  pstgre_db_username                  = var.pstgre_db_username
  pstgre_db_password                  = var.pstgre_db_password
  az_pstgre_we_sensor_db_core_zone    = var.az_pstgre_we_sensor_db_core_zone
  pstgre_storage_mb                   = var.pstgre_storage_mb
  pstgre_storage_tier                 = var.pstgre_storage_tier
  pstgre_sku_name                     = var.pstgre_sku_name
  tenant_id                           = module.import_resources.tenant_id
  extenshion_name                     = var.extenshion_name
  extenshion_value                    = var.extenshion_value
  timescaledb_extension_name          = var.timescaledb_extension_name
  timescaledb_extension_value         = var.timescaledb_extension_value
  tablefunc_extension_name            = var.tablefunc_extension_name
  tablefunc_extension_value           = var.tablefunc_extension_value
  database_name                       = var.inv_database_name
  database_name_2                     = var.inv_database_name_2
  database_name_3                     = var.inv_database_name_3
  user1                               = var.inv_user1
  user2                               = var.inv_user2
  user3                               = var.inv_user3
  userdb_admin                        = var.inv_userdb_admin
  userdb_appuser                      = var.inv_userdb_appuser
  user_db_map                         = var.inv_user_db_map
  ha_mode                             = var.ha_mode
  tags                                = var.tags
  environment                         = var.environment
  providers = {
    azurerm = azurerm.core
  }
}


# ###############################################
# #                                            ##
# #               WCD Postgres                 ##
# #                                            ##
# ###############################################

module "ch_postgresql" {
  source                              = "./modules/postgresql"
  private_dns_zone                    = module.import_resources.psql_private_dns_zone_id
  rg_name                             = module.import_resources.ch_rg_name
  rg_location                         = module.import_resources.ch_rg_location
  virtual_network_id                  = module.import_resources.ch_vnet_id
  delegated_subnet_id                 = module.import_resources.ch_db_subnet_id
  az_pstgre_we_sensor_db_core_version = var.az_pstgre_we_sensor_db_core_version
  az_pstgre_we_sensor_db_core         = var.ch_db_name
  pstgre_db_username                  = var.pstgre_db_username
  pstgre_db_password                  = var.pstgre_db_password
  az_pstgre_we_sensor_db_core_zone    = var.db_zone
  pstgre_storage_mb                   = var.pstgre_storage_mb
  pstgre_storage_tier                 = var.pstgre_storage_tier
  pstgre_sku_name                     = var.pstgre_sku_name
  tenant_id                           = module.import_resources.tenant_id
  extenshion_name                     = var.extenshion_name
  extenshion_value                    = var.extenshion_value
  timescaledb_extension_name          = var.timescaledb_extension_name
  timescaledb_extension_value         = var.timescaledb_extension_value
  tablefunc_extension_name            = var.tablefunc_extension_name
  tablefunc_extension_value           = var.tablefunc_extension_value
  database_name                       = var.ch_database_name
  database_name_2                     = var.ch_database_name_2
  database_name_3                     = var.ch_database_name_3
  user1                               = var.ch_user1
  user2                               = var.ch_user2
  user3                               = var.ch_user3
  userdb_admin                        = var.ch_userdb_admin
  userdb_appuser                      = var.ch_userdb_appuser
  user_db_map                         = var.ch_user_db_map
  ha_mode                             = var.ha_mode
  tags                                = var.tags
  environment                         = var.environment
  providers = {
    azurerm = azurerm.apps
  }
}


################################################
##                                            ##
##                 Shiny Vm                   ##
##                                            ##
################################################

module "shinyvm" {
  source                                = "./modules/vm"
  shiny_vm_name                         = var.shiny_vm_name
  environment                           = var.environment
  shinyapp_nic_name                     = var.shinyapp_nic_name
  diagnostic_storage_account_name       = var.diagnostic_storage_account_name
  ch_rg_location                        = module.import_resources.core_rg_location
  ch_rg_name                            = module.import_resources.core_rg_name
  az_snet_we_vm_sensor_id               = module.import_resources.core_inv_vm_subnet_id
  shiny_vm_admin_username               = var.shiny_vm_admin_username
  shiny_vm_admin_password               = var.shiny_vm_admin_password
  shiny_vm_size                         = var.shiny_vm_size
  shiny_vm_os_disk_storage_account_type = var.shiny_vm_os_disk_storage_account_type
  diagnostic_storage_account_tier       = var.diagnostic_storage_account_tier
  tags                                  = var.tags
  providers = {
    azurerm.core = azurerm.core
  }
}

################################################
##                                            ##
##             KeyVault Secrets               ##
##                                            ##
################################################
module "keyvault_secrets" {

  source                      = "./modules/keyvault_secrets"
  batch_primary_access_key    = module.batch_lss.batch_primary_access_key
  key_vault_id                = module.import_resources.keyvault_core_id
  kafka_access_primary_key    = module.event_hub.eventhub_namespace_core_primary_key
  lss_password                = var.lss_password
  db_user                     = var.db_user
  db_passwd                   = var.db_passwd
  db_name                     = var.db_name
  reportingdb                 = var.reportingdb
  pstgre_db_username          = var.pstgre_db_username
  pstgre_db_password          = var.pstgre_db_password
  reportingdb_admin           = var.reportingdb_admin
  reportingdb_host            = module.inv_postgresql.postgres_host
  ml_kafka_access_key         = var.ml_kafka_access_key
  ml_cognito_password         = var.ml_cognito_password
  ml_cognito_username         = var.ml_cognito_username
  ml_batch_key                = var.ml_batch_key
  ml_kafka_primary_key        = module.event_hub.core_eventhub_namespace_access_keys
  ml_cognito_password_value   = var.ml_cognito_password_value
  ml_cognito_username_value   = var.ml_cognito_username_value
  ml_batch_primary_key        = module.batch_ml.batch_primary_access_key
  ml_function_app_access_key  = var.ml_function_app_access_key
  ml_function_app_primary_key = module.keyvault_secrets.function_app_master_key
  function_app_name           = module.ml_function_app.function_app_name
  core_rg_name                = module.import_resources.resource_group_name
  providers = {
    azurerm.core = azurerm.core
  }

  depends_on = [
    module.ml_function_app,
    module.inv_ml_function_app,
    module.inv_lss_function_app,
    module.crs_function_app,
    module.inv_wq_function_app,
    module.lss_function_app
  ]
}


################################################
##                                            ##
##             App Registration               ##
##                                            ##
################################################
# module "app_registration" {

#   source = "./modules/app_registration"
#   app_name = var.app_name
#   providers = {
#     azuread = azuread.apps
#   }
# }


################################################
##                                            ##
##               Dashboard                    ##
##                                            ##
################################################

module "dashboard" {
  source                   = "./modules/dashboard"
  ch_rg_name               = module.import_resources.ch_rg_name
  ch_rg_location           = module.import_resources.ch_rg_location
  ch_dashboard_name        = "${var.dashboard_name}_${lower(var.environment)}"
  apps_subscription_id     = var.apps_subscription_id
  vm_id                    = module.shinyvm.shiny_vm_id
  vm_name                  = module.shinyvm.shiny_vm_name
  aks_name                 = module.aks.cluster_name
  aks_id                   = module.aks.id
  core_eventhub_name       = module.event_hub.eventhub_namespace_core_name
  core_eventhub_id         = module.event_hub.eventhub_namespace_core_id
  ch_eventhub_name         = module.event_hub.eventhub_namespace_ch_name
  ch_eventhub_id           = module.event_hub.eventhub_namespace_ch_id
  inv_storage_id           = module.storage_account.inv_storage_account_id
  inv_storage_name         = module.storage_account.inv_storage_account_name
  lss_hist_storage_name    = module.storage_account.lss_hist_storage_account_name
  lss_hist_storage_id      = module.storage_account.lss_hist_storage_account_id
  ml_hist_storage_id       = module.storage_account.ml_hist_storage_account_id
  ml_hist_storage_name     = module.storage_account.ml_hist_storage_account_name
  sanursery_name           = module.storage_account.sanursery_storage_account_name
  sanursery_id             = module.storage_account.sanursery_storage_account_id
  crs_functionapp_name     = module.crs_function_app.function_app_name
  crs_functionapp_id       = module.crs_function_app.function_app_id
  inv_lss_functionapp_name = module.inv_lss_function_app.function_app_name
  inv_lss_functionapp_id   = module.inv_lss_function_app.function_app_id
  inv_ml_functionapp_name  = module.ml_function_app.function_app_name
  inv_ml_functionapp_id    = module.ml_function_app.function_app_id
  inv_wq_functionapp_name  = module.inv_wq_function_app.function_app_name
  inv_wq_functionapp_id    = module.inv_wq_function_app.function_app_id
  lss_functionapp_name     = module.lss_function_app.function_app_name
  lss_functionapp_id       = module.lss_function_app.function_app_id
  ml_functionapp_name      = module.ml_function_app.function_app_name
  ml_functionapp_id        = module.ml_function_app.function_app_id
  core_postgres_id         = module.inv_postgresql.postgres_id
  core_postgres_name       = module.inv_postgresql.postgres_name
  ch_postgres_id           = module.ch_postgresql.postgres_id
  ch_postgres_name         = module.ch_postgresql.postgres_name
  batch_lss_account_id     = module.batch_lss.batch_account_id
  batch_lss_account_name   = module.batch_lss.batch_account_name
  batch_ml_account_id      = module.batch_ml.batch_account_id
  batch_ml_account_name    = module.batch_ml.batch_account_name
  providers = {
    azurerm.apps = azurerm.apps
  }
}



################################################
##                                            ##
##              Log analytics                 ##
##                                            ##
################################################

module "loganalytics" {
  source                     = "./modules/loganalytics"
  lss_functionapp_id         = module.lss_function_app.function_app_id
  inv_ml_functionapp_id      = module.inv_ml_function_app.function_app_id
  inv_wq_functionapp_id      = module.inv_wq_function_app.function_app_id
  inv_lss_functionapp_id     = module.inv_lss_function_app.function_app_id
  crs_functionapp_id         = module.crs_function_app.function_app_id
  ml_functionapp_id          = module.ml_function_app.function_app_id
  log_analytics_workspace_id = module.import_resources.log_analytics_workspace_id
  core_eventhub_id           = module.event_hub.eventhub_namespace_core_id
  ch_eventhub_id             = module.event_hub.eventhub_namespace_ch_id
  ch_postgresql_id           = module.ch_postgresql.postgres_id
  inv_postgresql_id          = module.inv_postgresql.postgres_id
  inv_storage_id             = module.storage_account.inv_storage_account_id
  lss_hist_storage_id        = module.storage_account.lss_hist_storage_account_id
  ml_hist_storage_id         = module.storage_account.ml_hist_storage_account_id
  sanursery_id               = module.storage_account.sanursery_storage_account_id
  ch_container_registry_id   = module.container_registry.acr_id
  batch_lss_account_id       = module.batch_lss.batch_account_id
  aks_id                     = module.aks.id
  batch_ml_account_id        = module.batch_ml.batch_account_id

  providers = {
    azurerm.management = azurerm.management
  }
}

# module "gitlab_secrets" {
#   source                    = "./modules/gitlab_secrets"
#   secret_value              = "hardcodevalue"
#   gitlab_ch_nursery_repo_id = var.gitlab_ch_nursery_repo_id
#   gitlab_ch_users_repo_id   = var.gitlab_ch_users_repo_id
#   environment_scope         = lower(var.environment)
#   environment               = var.environment
#   pstgre_db_username        = var.pstgre_db_username
#   pstgre_db_password        = var.pstgre_db_password
#   ch_database_host          = module.ch_postgresql.postgres_host

#   providers                 = { gitlab = gitlab.kaust_gitlab }

# }
module "adf_managed_endpoints" {
  source         = "./modules/adf_managed_endpoint"
  ml_fap_pe_name = module.ml_function_app.function_app_name
  ml_fap_id      = module.ml_function_app.function_app_id
  core_adf_id    = module.import_resources.core_adf_id
  ml_fap_pe_hostname = module.ml_function_app.function_app_default_hostname
  depends_on = [ module.ml_function_app, module.import_resources ]
  providers = {
    azurerm.core = azurerm.core
  }
}

module "null_resources" {
  source = "./modules/null_resources"
  subscriptions_id         = var.core_subscription_id
  azure_tenant_id          = var.azure_tenant_id
  azure_client_id          = var.azure_client_id
  azure_client_secret      = var.azure_client_secret
  rg_name                  = module.import_resources.core_rg_name
  ml_function_app_name     = module.ml_function_app.function_app_name
  depends_on = [ module.import_resources, module.ml_function_app ]
  
}

module "identity_roles" {
  source = "./modules/identity_roles"
  ml_functionapp_id = module.ml_function_app.function_app_id
  keyvault_id       = module.import_resources.keyvault_core_id
  providers = {
    azurerm.core = azurerm.core
  }
  depends_on = [ module.ml_function_app ]
}