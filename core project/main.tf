module "import_resources" {
  source                         = "./modules/import_resources"
  core_rg                        = var.core_rg
  kcri_rg                        = var.kcri_rg
  environment                    = var.environment
  core_vnet                      = var.core_vnet
  core_function_app_subnet_name  = var.core_function_app_subnet_name
  batch_account_subnet_name      = var.batch_account_subnet_name
  pe_subnet_name                 = var.pe_subnet_name
  core_db_subnet                 = var.core_db_subnet
  keyvault_private_dns_zone_name = var.keyvault_private_dns_zone_name
  blob_private_dns_zone_name     = var.blob_private_dns_zone_name
  psql_private_dns_zone_name     = var.psql_private_dns_zone_name
  batch_private_dns_zone_name    = var.batch_private_dns_zone_name
  queue_private_dns_zone_name    = var.queue_private_dns_zone_name
  file_private_dns_zone_name     = var.file_private_dns_zone_name
  table_private_dns_zone_name    = var.table_private_dns_zone_name
  acr_private_dns_name           = var.acr_private_dns_name
  fap_private_dns_zone_name      = var.fap_private_dns_zone_name
  dns_rg                         = var.dns_rg
  soc_security_rg_name           = var.soc_security_rg_name
  backup_vault_name              = var.backup_vault_name
  loganalytics_workspace_name    = var.loganalytics_workspace_name
  providers = {
    azurerm.core         = azurerm.core
    azurerm.tre         = azurerm.tre
    azurerm.connectivity = azurerm.connectivity
    azurerm.management   = azurerm.management
  }
}


# ################################################
# ##                                            ##
# ##              Container Registry            ##
# ##                                            ##
# ################################################

module "container_registry" {
  source                     = "./modules/acr"
  environment                = var.environment
  tags                       = var.tags
  acr_name                   = lower("${var.acr_name}${var.environment}")
  connection_name            = "${var.connection_name}_${var.environment}"
  core_rg_location           = module.import_resources.core_rg_location
  core_rg                    = module.import_resources.core_rg
  gitlab_resource_group_name = module.import_resources.gitlab_resource_group_name
  core_pe_subnet_id          = module.import_resources.core_pe_subnet_id
  acr_private_dns_zone_name  = module.import_resources.acr_private_dns_zone_name
  depends_on                 = [module.import_resources]
  providers = {
    azurerm.core         = azurerm.core
    azurerm.connectivity = azurerm.connectivity
    azurerm.management = azurerm.management
  }
}


################################################
##                                            ##
##              Log analytics                 ##
##                                            ##
################################################

module "loganalytics" {
  source                  = "./modules/loganalytics"
  container_registry_id = module.container_registry.acr_id
  data_factory_id = module.adf.data_factory_id
  log_analytics_workspace_id = module.import_resources.loganalytics_workspace_id
  batch_account_id = module.batch.batch_account_id
  postgres_id = module.postgresql.postgres_id
  key_vault_id = module.key_vault.key_vault_id
  function_app_id = module.azure_function_app.function_app_id
  datalake_account_id = module.storageaccount.datalake_id
  storage_account_id = module.storageaccount.storage_account_id
  backup_vault_id = module.import_resources.backup_vault_id
  providers = {
    azurerm.management = azurerm.management
  }
}


################################################
##                                            ##
##                 Bastion                    ##
##                                            ##
################################################

module "bastion" {
  source            = "./modules/bastion"
  core_rg           = module.import_resources.core_rg
  core_rg_location  = module.import_resources.core_rg_location
  bastion_subnet_id = module.import_resources.bastion_subnet_id
  bastion_name      = "${var.bastion_name}_${var.environment}"
  core_bastion_pip  = "${var.core_bastion_pip}_${var.environment}"
  tags              = var.tags
  environment       = var.environment
  depends_on        = [module.import_resources]
  providers = {
    azurerm.core = azurerm.core
  }
}

################################################
##                                            ##
##                Postgres                    ##
##                                            ##
################################################

module "postgresql" {
  source                              = "./modules/postgresql"
  core_rg                             = module.import_resources.core_rg
  core_rg_location                    = module.import_resources.core_rg_location
  core_db_subnet_id                   = module.import_resources.core_db_subnet_id
  psql_private_dns_zone_id            = module.import_resources.psql_private_dns_zone_id
  az_pstgre_we_sensor_db_core         = var.az_pstgre_we_sensor_db_core
  az_pstgre_we_sensor_db_core_version = var.az_pstgre_we_sensor_db_core_version
  pstgre_db_username                  = var.pstgre_db_username
  pstgre_db_password                  = var.pstgre_db_password
  az_pstgre_we_sensor_db_core_zone    = var.az_pstgre_we_sensor_db_core_zone
  pstgre_storage_mb                   = var.pstgre_storage_mb
  pstgre_storage_tier                 = var.pstgre_storage_tier
  pstgre_sku_name                     = var.pstgre_sku_name
  azure_extensions_name               = var.azure_extensions_name
  azure_extensions_values             = var.azure_extensions_values
  shared_preload_libraries_name       = var.shared_preload_libraries_name
  shared_preload_libraries_values     = var.shared_preload_libraries_values
  tags                                = var.tags
  environment                         = var.environment
  depends_on                          = [module.import_resources]
  providers = {
    azurerm.core = azurerm.core
  }
}




################################################
##                                            ##
##                Key Vault                   ##
##                                            ##
################################################

module "key_vault" {
  source = "./modules/keyvault"

  gitlab_resource_group_name     = module.import_resources.gitlab_resource_group_name
  core_rg_location               = module.import_resources.core_rg_location
  core_rg                        = module.import_resources.core_rg
  keyvault_private_dns_zone_name = module.import_resources.core_key_vault_private_dns_zone_name
  pe_subnet_id                   = module.import_resources.core_pe_subnet_id
  az_kv_name                     = "${var.keyvault_name}-${var.environment}"
  environment                    = var.environment
  azure_tenant_id                = var.azure_tenant_id
  pe_name                        = "${var.pe_name}_${var.environment}"
  service_name                   = "${var.keyvault_name}${var.environment}-psc"
  tags                           = var.tags
  depends_on                     = [module.import_resources]
  providers = {
    azurerm.core         = azurerm.core
    azurerm.connectivity = azurerm.connectivity
  }
}



################################################
##                                            ##
##             Storage Account                ##
##                                            ##
################################################

module "storageaccount" {
  source                     = "./modules/storageaccount"
  file_private_dns_zone_name = module.import_resources.file_private_dns_zone_name
  gitlab_resource_group_name = module.import_resources.gitlab_resource_group_name
  blob_private_dns_zone_name = module.import_resources.blob_private_dns_zone_name
  core_rg                    = module.import_resources.core_rg
  core_rg_location           = module.import_resources.core_rg_location
  core_pe_subnet_id          = module.import_resources.core_pe_subnet_id
  digital_assets_core        = var.digital_assets_core
  digital_assets_staging     = var.digital_assets_staging
  digital_assets_datalake    = var.digital_assets_datalake
  da_staging_datalake        = var.da_staging_datalake
  corekvap                   = lower(var.corekvap)
  coresensor                 = lower(var.coresensor)
  azsawestagingcore          = "${lower(var.azsawestagingcore)}${lower(var.environment)}"
  environment                = var.environment
  datalake_name              = "${lower(var.datalake_name)}${lower(var.environment)}"
  file_pe_to_datalake_name   = "${var.file_pe_to_datalake_name}_${var.environment}"
  tags                       = var.tags
  blob_pe_to_datalake_name   = "${var.blob_pe_to_datalake_name}_${var.environment}"
  depends_on                 = [module.import_resources]
  providers = {
    azurerm.core         = azurerm.core
    azurerm.connectivity = azurerm.connectivity
  }
}

################################################
##                                            ##
##                Identity                    ##
##                                            ##
################################################

module "identity" {
  source           = "./modules/identity"
  core_rg_location = module.import_resources.core_rg_location
  core_rg          = module.import_resources.core_rg
  identity_name    = "${var.identity_name}-${var.environment}"
  tags             = var.tags
  environment      = var.environment
  depends_on       = [module.import_resources]
  providers = {
    azurerm.core = azurerm.core
  }
}

################################################
##                                            ##
##              Batch Account                 ##
##                                            ##
################################################

module "batch" {
  source                       = "./modules/batch"
  core_rg                      = module.import_resources.core_rg
  core_rg_location             = module.import_resources.core_rg_location
  core_pe_subnet_id            = module.import_resources.core_pe_subnet_id
  batch_identity               = module.identity.batch_identity
  acr_login_server_name        = module.container_registry.acr_login_server_name
  core_batch_account_subnet_id = module.import_resources.core_batch_account_subnet_id
  batch_private_dns_zone_name  = module.import_resources.batch_private_dns_zone_name
  gitlab_resource_group_name   = module.import_resources.gitlab_resource_group_name
  batch_identity_principal_id  = module.identity.batch_identity_principal_id
  batch_name                   = "${var.batch_name}${lower(var.environment)}"
  batch_pe_name                = "${var.batch_pe_name}_${lower(var.environment)}"
  node_management              = "${var.node_management}-${var.environment}"
  batch_pool_name              = "${var.batch_pool_name}-${lower(var.environment)}"
  acr_image_name               = var.acr_image_name
  tags                         = var.tags
  environment                  = var.environment
  depends_on                   = [module.import_resources, module.container_registry] #module.identity, 
  providers = {
    azurerm.core         = azurerm.core
    azurerm.connectivity = azurerm.connectivity
  }
}



################################################
##                                            ##
##               Function App                 ##
##                                            ##
################################################

module "azure_function_app" {
  source                             = "./modules/function"
  core_rg                            = module.import_resources.core_rg
  core_rg_location                   = module.import_resources.core_rg_location
  blob_private_dns_zone_name         = module.import_resources.blob_private_dns_zone_name
  file_private_dns_zone_name         = module.import_resources.file_private_dns_zone_name
  table_private_dns_zone_name        = module.import_resources.table_private_dns_zone_name
  queue_private_dns_zone_name        = module.import_resources.queue_private_dns_zone_name
  function_app_private_dns_zone_name = module.import_resources.function_app_private_dns_zone_name
  gitlab_resource_group_name         = module.import_resources.gitlab_resource_group_name
  core_function_app_subnet_id        = module.import_resources.core_function_app_subnet_id
  core_pe_subnet_id                  = module.import_resources.core_pe_subnet_id
  keyvault_name                      = module.key_vault.keyvault_name
  key_vault_url                      = module.key_vault.key_vault_url
  service_plan_name                  = "${var.service_plan_name}-${var.environment}"
  fapp_storage_acc_name              = "${lower(var.fapp_storage_acc_name)}${lower(var.environment)}"
  function_app_name                  = "${var.function_app_name}-${var.environment}"
  blob_pe_to_fap_name                    = "${var.blob_pe_to_fap_name}_${var.environment}-${var.blob_pe_placeholder}"
  file_pe_to_fap_name                    = "${var.file_pe_to_fap_name}_${var.environment}-${var.file_pe_placeholder}"
  table_pe_to_fap_name                   = "${var.table_pe_to_fap_name}_${var.environment}-${var.table_pe_placeholder}"
  queue_pe_to_fap_name                   = "${var.queue_pe_to_fap_name}_${var.environment}-${var.queue_pe_placeholder}"
  function_app_pe_name                   = "${var.function_app_pe_name}_${var.environment}"
  tags                                   = var.tags
  environment                            = var.environment
  depends_on                             = [module.import_resources, module.key_vault]
  providers = {
    azurerm.core         = azurerm.core
    azurerm.connectivity = azurerm.connectivity
  }
}


################################################
##                                            ##
##               Data Factory                 ##
##                                            ##
################################################

module "adf" {
  source                         = "./modules/adf"
  core_rg_location               = module.import_resources.core_rg_location
  core_rg                        = module.import_resources.core_rg
  datalake_url                   = module.storageaccount.datalake_url
  storage_account_url            = module.storageaccount.storage_account_url
  storage_account_id             = module.storageaccount.storage_account_id
  datalake_id                    = module.storageaccount.datalake_id
  function_app_default_hostname  = module.azure_function_app.function_app_default_hostname
  function_app_name              = module.azure_function_app.function_app_name
  fap_id                         = module.azure_function_app.function_app_id
  fap_pe_name                    = "${var.fap_pe_name}_${var.environment}"
  key_vault_id                   = module.key_vault.key_vault_id
  keyvault_linked_name           = "${var.keyvault_linked_name}_${var.environment}"
  core_storage_account_name      = "${var.core_storage_account_name}_${var.environment}"
  datalake_linked_name           = "${var.datalake_linked_name}_${var.environment}"
  datalake_private_endpoint_name = "${var.datalake_private_endpoint_name}_${var.environment}"
  adf_name                       = "${var.adf_name}-${var.environment}"
  storage_private_endpoint_name  = "${var.storage_private_endpoint_name}_${var.environment}"
  vault_private_endpoint_name    = "${var.vault_private_endpoint_name}_${var.environment}"
  tags                           = var.tags
  environment                    = var.environment
  depends_on                     = [module.import_resources, module.storageaccount, module.azure_function_app, module.key_vault]
  providers = {
    azurerm.core = azurerm.core
    azurerm.management = azurerm.management
  }
}



################################################
##                                            ##
##                 Alerts                     ##
##                                            ##
################################################

module "alerts" {
  source          = "./modules/alerts"
  rg_name         = module.import_resources.core_rg
  datalake        = module.storageaccount.datalake_id
  action_group    = module.import_resources.action_group_id
  storage_account = module.storageaccount.storage_account_id
  batch_account   = module.batch.batch_account_id
  keyvault_id     = module.key_vault.key_vault_id
  data_factory_id = module.adf.data_factory_id
  database_id     = module.postgresql.postgres_id
  functionapp_id  = module.azure_function_app.function_app_id
  storage_account_id = module.storageaccount.storage_account_id
  rg_location     = module.import_resources.core_rg_location
  backup_vault_id = module.import_resources.backup_vault_id
  datalake_account_id = module.storageaccount.datalake_id
  depends_on      = [module.import_resources, module.batch, module.storageaccount, module.key_vault, module.adf]
  providers = {
    azurerm.tre = azurerm.tre
  }
}

################################################
##                                            ##
##               Dashboard                    ##
##                                            ##
################################################

module "dashboard" {
  source                 = "./modules/dashboard"
  rg_name                = module.import_resources.core_rg
  rg_location            = module.import_resources.core_rg_location
  azsawestagingcore_name = module.storageaccount.storage_account_name
  azsawestagingcore_id   = module.storageaccount.storage_account_id
  datalake_name          = module.storageaccount.datalake_account_name
  datalake_id            = module.storageaccount.datalake_id
  batch_name             = module.batch.batch_account_name
  batch_id               = module.batch.batch_account_id
  keyvault_id            = module.key_vault.key_vault_id
  keyvault_name          = module.key_vault.keyvault_name
  data_factory_id        = module.adf.data_factory_id
  data_factory_name      = module.adf.adf_name
  fapp_storage_acc_name  = module.azure_function_app.fapp_storage_account_name
  fapp_storage_acc_id    = module.azure_function_app.fapp_storage_account_id
  dashboard_name         = "${var.dashboard_name}_${lower(var.environment)}"
  core_subscription_id   = var.core_subscription_id
  functionapp_name       = module.azure_function_app.function_app_name
  functionapp_id         = module.azure_function_app.function_app_id
  depends_on             = [module.adf, module.import_resources, module.storageaccount, module.batch, module.key_vault]
  providers = {
    azurerm.core = azurerm.core
  }
}

module "null_resources" {
  source                   = "./modules/null_resources"
  rg_name                  = module.import_resources.core_rg
  keyvault_name            = module.key_vault.keyvault_name
  azsawestagingcore        = module.storageaccount.storage_account_name
  datalake_name            = module.storageaccount.datalake_account_name
  function_app_name        = module.azure_function_app.function_app_name
  subscriptions_id         = var.core_subscription_id
  azure_tenant_id          = var.azure_tenant_id
  azure_client_id          = var.azure_client_id
  azure_client_secret      = var.azure_client_secret
  keyvault_connection_name = "${var.keyvault_connection_name}-${var.environment}${var.keyvault_connection_name_suffix}_${var.environment}-conn"
  #  keyvault_url                = module.key_vault.key_vault_url
  # data_factory_id             = module.adf.data_factory_id
  # fap_id                      = module.azure_function_app.function_app_id
  # keyvault_linked_name        = "${var.keyvault_linked_name}_${var.environment}"
  # vault_private_endpoint_name = "${var.vault_private_endpoint_name}_${var.environment}"
  # az_kv_name                  = "${var.keyvault_name}-${var.environment}"
  # adf_name                    = "${var.adf_name}-${var.environment}"
  # fap_pe_name                 = "${var.fap_pe_name}_${var.environment}"
  depends_on = [
    module.adf,
    module.azure_function_app,
    module.import_resources,
    module.key_vault,
    module.storageaccount
  ]

  providers = {
    azurerm.core = azurerm.core
  }
}


module "keyvault_secrets" {
  source                   = "./modules/keyvault_secrets"
  acr_login_server_name    = module.container_registry.acr_login_server_name
  key_vault_id             = module.key_vault.key_vault_id
  postgres_host            = module.postgresql.postgres_host
  batch_primary_access_key = module.batch.batch_primary_access_key
  batch_account_name       = module.batch.batch_account_name
  batch_job_name           = module.batch.batch_job_name
  storage_account_key      = module.storageaccount.storage_account_key
  datalake_account_name    = module.storageaccount.datalake_account_name
  datalake_account_key     = module.storageaccount.datalake_account_key
  bronze_container_name    = module.storageaccount.bronze_container_name
  silver_container_name    = module.storageaccount.silver_container_name
  shinyapp_batch_name      = var.shinyapp_batch_name
  pstgre_db_username       = var.pstgre_db_username
  pstgre_db_password       = var.pstgre_db_password
  sensor_db_name           = var.sensor_db_name
  postgres_port            = var.postgres_port
  shinyapp_db_name         = var.shinyapp_db_name
  shinyapp_storage_name    = var.shinyapp_storage_name
  core_datalake_primary_key= module.storageaccount.datalake_account_key
  core_datalake_access_key= var.core_datalake_access_key
  
  depends_on               = [module.key_vault, module.storageaccount, module.postgresql, module.batch, module.identity_roles]
  providers = {
    azurerm.core         = azurerm.core
    azurerm.connectivity = azurerm.connectivity
  }
}


module "identity_roles" {
  source                      = "./modules/identity_roles"
  batch_account_id            = module.batch.batch_account_id
  keyvault_id                 = module.key_vault.key_vault_id
  core_acr_name               = module.container_registry.acr_id
  adf_principal_id            = module.adf.data_factory_principal_id
  core_dalalake_name          = module.storageaccount.datalake_id
  core_storage_name           = module.storageaccount.storage_account_id
  core_functionapp_name       = module.azure_function_app.function_app_id
  function_app_id             = module.azure_function_app.function_app_principal_id
  entra_object_id             = module.import_resources.object_id
  batch_identity_principal_id = module.identity.batch_identity_principal_id
  providers = {
    azurerm.core = azurerm.core
  }

}

module "backup_vault_instances" {
  source                      = "./modules/backup_instances"
  backup_vault_id            = module.import_resources.backup_vault_id
  backup_vault_principal_id  = module.import_resources.azurerm_data_protection_backup_vault_principal_id
  core_rg_id                  = module.import_resources.core_rg_id
  psql_server_id              = module.postgresql.postgres_id
  core_rg_location            = module.import_resources.core_rg_location
  az_pstgre_we_sensor_db_core = lower("${var.az_pstgre_we_sensor_db_core}-${var.environment}")
  psql_policy_name            = var.psql_policy_name
  fapp_storage_acc_name       = "${lower(var.fapp_storage_acc_name)}${lower(var.environment)}"
  fapp_storage_account_id     = module.azure_function_app.fapp_storage_account_id
  storage_account_policy_name = var.storage_account_policy_name
  depends_on                 = [module.import_resources, module.storageaccount, module.azure_function_app]
  providers = {
    azurerm.core         = azurerm.core
    azurerm.management = azurerm.management

  }
}


################################################
##                                            ##
##               DataBricks                    ##
##                                            ##
################################################


module "databricks" {
  source           = "./modules/databricks"
  databricks_name  = "${var.databricks_name}_${var.environment}"
  core_rg_location = module.import_resources.core_rg_location
  core_rg          = module.import_resources.core_rg

  tags             = var.tags
  environment      = var.environment

  providers = {
    azurerm.core = azurerm.core
  }
}


