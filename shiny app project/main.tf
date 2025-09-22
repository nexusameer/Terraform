################################################
##                                            ##
##          Import Resources                  ##
##                                            ##
################################################

module "import_resources" {
  source                       = "./modules/import_resources"
  loganalytics_workspace_name  = var.loganalytics_workspace_name
  resource_group_name_sensor   = var.resource_group_name_sensor
  resource_group_name_core     = var.resource_group_name_core
  az-kv-we-core                = var.az-kv-we-core
  environment                  = var.environment
  acr_private_dns_name         = var.acr_private_dns_name
  az_vnet_we_sensor_dashboard  = var.az_vnet_we_sensor_dashboard
  az_snet_we_pe_sensor         = var.az_snet_we_pe_sensor
  az_snet_we_webapp_sensor     = var.az_snet_we_webapp_sensor
  az_snet_we_vm_sensor         = var.az_snet_we_vm_sensor
  private_dns_zone_name_webapp = var.private_dns_zone_name_webapp
  dns_record_azcrweapp         = var.dns_record_azcrweapp
  dns_record_westeurope_data   = var.dns_record_westeurope_data
  resource_group_name_kcri     = var.resource_group_name_kcri
  resource_group_name_gitlab   = var.resource_group_name_gitlab
  soc_security_rg_name         = var.soc_security_rg_name
  backup_vault_name            = var.backup_vault_name
  action_group_name            = var.action_group_name
  tags                         = var.tags
  providers = {
    azurerm.core         = azurerm.core
    azurerm.app          = azurerm.app
    azurerm.kcri         = azurerm.kcri
    azurerm.management   = azurerm.management
    azurerm.connectivity = azurerm.connectivity

  }
}

################################################
##                                            ##
##          App Container Registry            ##
##                                            ##
################################################

module "apps_container_registry" {
  source                         = "./modules/apps_container_registry"
  sensor_container_registry_name = var.sensor_container_registry_name
  az_pe_we_apps_to_cr_we_core    = var.az_pe_we_apps_to_cr_we_core
  dns_record_westeurope_data     = var.dns_record_westeurope_data
  environment                    = var.environment
  sensor_rg_location             = module.import_resources.sensor_rg_location
  sensor_rg_name                 = module.import_resources.sensor_rg_name
  core_rg_name                   = module.import_resources.core_rg_name
  az_snet_we_pe_sensor_id        = module.import_resources.az_snet_we_pe_sensor_id
  acr_private_dns_name           = var.acr_private_dns_name
  # acr_private_dns_id            = module.import_resources.acr_private_dns_id
  dns_record_azcrweapp = var.dns_record_azcrweapp
  gitlab_rg_name       = module.import_resources.gitlab_rg_name
  tags                 = var.tags
  providers = {
    azurerm.core         = azurerm.core
    azurerm.app          = azurerm.app
    azurerm.connectivity = azurerm.connectivity
  }
}

################################################
##                                            ##
##                 App service                ##
##                                            ##
################################################

module "appservice" {
  source                       = "./modules/appservice"
  app_service_name             = var.app_service_name
  environment                  = var.environment
  app_subscription_id          = var.app_subscription_id
  sensor_app_service_plan_name = var.sensor_app_service_plan_name
  sensor_rg_location           = module.import_resources.sensor_rg_location
  sensor_rg_name               = module.import_resources.sensor_rg_name
  az_snet_we_pe_sensor_id      = module.import_resources.az_snet_we_pe_sensor_id
  container_registry_id        = module.apps_container_registry.container_registry_id
  keyvault_core_id             = module.import_resources.keyvault_core_id
  key_vault_name               = module.import_resources.key_vault_name
  az_snet_we_webapp_sensor_id  = module.import_resources.az_snet_we_webapp_sensor_id
  container_registry_name      = module.apps_container_registry.container_registry_name
  appservice_private_dns_id    = module.import_resources.appservice_private_dns_id
  appservice_private_dns_name  = module.import_resources.appservice_private_dns_name
  key_vault_url                = module.import_resources.key_vault_url
  gitlab_rg_name               = module.import_resources.gitlab_rg_name
  tags                         = var.tags
  providers = {
    azurerm.app          = azurerm.app
    azurerm.connectivity = azurerm.connectivity
  }
}

################################################
##                                            ##
##      Control Panel  App service            ##
##                                            ##
################################################

module "control_panel_appservice" {
  source                         = "./modules/control_panel_appservice"
  control_panel_app_service_name = var.control_panel_app_service_name
  environment                    = var.environment
  app_subscription_id            = var.app_subscription_id
  az_app_service_plan_id         = module.appservice.az_app_service_plan_id
  sensor_rg_location             = module.import_resources.sensor_rg_location
  sensor_rg_name                 = module.import_resources.sensor_rg_name
  az_snet_we_pe_sensor_id        = module.import_resources.az_snet_we_pe_sensor_id
  container_registry_id          = module.apps_container_registry.container_registry_id
  keyvault_core_id               = module.import_resources.keyvault_core_id
  key_vault_name                 = module.import_resources.key_vault_name
  az_snet_we_webapp_sensor_id    = module.import_resources.az_snet_we_webapp_sensor_id
  container_registry_name        = module.apps_container_registry.container_registry_name
  appservice_private_dns_id      = module.import_resources.appservice_private_dns_id
  appservice_private_dns_name    = module.import_resources.appservice_private_dns_name
  key_vault_url                  = module.import_resources.key_vault_url
  depends_on                     = [module.appservice]
  gitlab_rg_name                 = module.import_resources.gitlab_rg_name
  tags                           = var.tags
  providers = {
    azurerm.app          = azurerm.app
    azurerm.connectivity = azurerm.connectivity
  }
}

################################################
##                                            ##
##                 Shiny Vm                   ##
##                                            ##
################################################

module "shinyvm" {
  source                                = "./modules/shinyvm"
  shiny_vm_name                         = var.shiny_vm_name
  environment                           = var.environment
  shinyapp_nic_name                     = var.shinyapp_nic_name
  diagnostic_storage_account_name       = var.diagnostic_storage_account_name
  sensor_rg_location                    = module.import_resources.sensor_rg_location
  sensor_rg_name                        = module.import_resources.sensor_rg_name
  az_snet_we_vm_sensor_id               = module.import_resources.az_snet_we_vm_sensor_id
  shiny_vm_admin_username               = var.shiny_vm_admin_username
  shiny_vm_admin_password               = var.shiny_vm_admin_password
  shiny_vm_size                         = var.shiny_vm_size
  shiny_vm_os_disk_storage_account_type = var.shiny_vm_os_disk_storage_account_type
  diagnostic_storage_account_tier       = var.diagnostic_storage_account_tier
  tags                                  = var.tags
  providers = {
    azurerm.app = azurerm.app
  }
}

################################################
##                                            ##
##                 Alerts                     ##
##                                            ##
################################################

module "alerts" {
  source           = "./modules/alerts"
  kcri_rg_name     = module.import_resources.kcri_rg_name
  rg_location      = module.import_resources.kcri_rg_location
  shiny_vm_id      = module.shinyvm.shiny_vm_id
  action_group     = module.import_resources.action_group_id
  web_app          = module.appservice.sensor_app_service_id
  contol_panel_app = module.control_panel_appservice.control_panel_app_service_id
  providers = {
    azurerm.kcri = azurerm.kcri
  }
}

################################################
##                                            ##
##               Dashboard                    ##
##                                            ##
################################################

module "dashboard" {
  source                = "./modules/dashboard"
  dashboard_name        = var.dashboard_name
  sensor_rg_name        = module.import_resources.sensor_rg_name
  sensor_rg_location    = module.import_resources.sensor_rg_location
  shiny_vm_id           = module.shinyvm.shiny_vm_id
  shiny_vm_name         = module.shinyvm.shiny_vm_name
  environment           = var.environment
  web_app               = module.appservice.sensor_app_service_id
  web_app_name          = module.appservice.sensor_app_service_name
  contol_panel_app      = module.control_panel_appservice.control_panel_app_service_id
  contol_panel_app_name = module.control_panel_appservice.control_panel_app_service_name
  bootdiagnostic_name   = module.shinyvm.storage_account_name
  bootdiagnostic_id     = module.shinyvm.storage_account_id
  providers = {
    azurerm.kcri = azurerm.kcri
    azurerm.app  = azurerm.app
  }
}

################################################
##                                            ##
##             Backup Vault                   ##
##                                            ##
################################################

module "backup_vault_instances" {
  source                      = "./modules/backup_instances"
  environment                 = var.environment
  backup_vault_id             = module.import_resources.backup_vault_id
  backup_vault_principal_id   = module.import_resources.backup_vault_principal_id
  storage_account_name        = var.diagnostic_storage_account_name
  storage_account_id          = module.shinyvm.storage_account_id
  location                    = module.import_resources.soc_security_rg_location
  sensor_rg_id                = module.import_resources.sensor_rg_id
  sensor_rg_name              = module.import_resources.sensor_rg_name
  sensor_rg_location          = module.import_resources.sensor_rg_location
  soc_security_rg_name        = module.import_resources.soc_security_rg_name
  vm_backup_vault_policy_name = var.vm_backup_vault_policy_name
  shiny_vm_id                 = module.shinyvm.shiny_vm_id
  shiny_vm_name               = var.shiny_vm_name
  shiny_vm_os_disk_name       = module.shinyvm.shiny_vm_os_disk_name
  backup_vault_policy_name    = var.backup_vault_policy_name
  backup_vault_name           = module.import_resources.backup_vault_name
  management_subscription_id  = var.management_subscription_id
  ARM_CLIENT_ID               = var.ARM_CLIENT_ID
  ARM_CLIENT_SECRET           = var.ARM_CLIENT_SECRET
  ARM_TENANT_ID               = var.ARM_TENANT_ID
  depends_on                  = [module.shinyvm, module.import_resources]
  providers = {
    azurerm.app        = azurerm.app
    azurerm.management = azurerm.management
  }
}



################################################
##                                            ##
##              Log analytics                 ##
##                                            ##
################################################

module "loganalytics" {
  source                       = "./modules/loganalytics"
  control_panel_app_service_id = module.control_panel_appservice.control_panel_app_service_id
  apps_container_registry_id   = module.apps_container_registry.container_registry_id
  app_service_id               = module.appservice.sensor_app_service_id
  log_analytics_workspace_id   = module.import_resources.loganalytics_workspace_id
  providers = {
    azurerm.management = azurerm.management
  }
}

