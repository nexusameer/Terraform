# module "aks_monitor_alerts" {
#   source = "./modules/alerts"

#   prefix              = "AKS Alert Rule "
#   resource_group_name = module.import_resources.ch_rg_name
#   scope_resource_id   = module.aks.id
#   action_group_id     = module.import_resources.action_group_id

#   aks_alert_metrics = [
#     {
#       name             = "CPU Usage Percentage"
#       metric_namespace = "Insights.Container/nodes"
#       aggregation      = "Average"
#       operator         = "GreaterThan"
#       threshold        = 80
#       severity         = 2
#       description      = "Node CPU Usage is above 80%"
#     }
# {
#   name             = "memoryWorkingSetPercentage"
#   metric_namespace = "Insights.Container/nodes"
#   aggregation      = "Average"
#   operator         = "GreaterThan"
#   threshold        = 80
#   severity         = 2
#   description      = "Node Memory Usage is above 80%"
# },
# {
#   name             = "restarts"
#   metric_namespace = "Insights.Container/pods"
#   aggregation      = "Total"
#   operator         = "GreaterThan"
#   threshold        = 5
#   severity         = 3
#   description      = "Pod restarts exceed 5"
# }
#   ]
#   providers = {
#     azurerm      = azurerm.apps
#   }
# }




module "alerts" {
  source              = "./modules/alerts"
  resource_group_name = module.import_resources.tre_ch_rg_name
  scope_resource_id   = module.aks.id
  action_group_id     = module.import_resources.action_group_id
  database_id = [
    # module.ch_postgresql.postgres_id, 
    module.inv_postgresql.postgres_id
  ]
  ch_event_hub_id   = module.event_hub.eventhub_namespace_ch_id
  core_event_hub_id = module.event_hub.eventhub_namespace_core_id
  core_rg_name      = module.import_resources.kcri_rg_name
  batch_account = {
    batch1 = module.batch_lss.batch_account_id
    batch2 = module.batch_ml.batch_account_id
  }
  inv_vm_id = module.shinyvm.shiny_vm_id
  functionapp_id = {
    "lss_function_app"     = module.lss_function_app.function_app_id
    "inv_wq_function_app"  = module.inv_wq_function_app.function_app_id
    "crs_function_app"     = module.crs_function_app.function_app_id
    "inv_lss_function_app" = module.inv_lss_function_app.function_app_id
    "inv_ml_function_app"  = module.inv_ml_function_app.function_app_id
    "ml_function_app"      = module.ml_function_app.function_app_id

  }
  storage_account = {
    "inv_storage_account"       = module.storage_account.inv_storage_account_id
    "lss_hist_storage"          = module.storage_account.lss_hist_storage_account_id
    "ml_hist_storage"           = module.storage_account.ml_hist_storage_account_id
    "sanursery_storage_account" = module.storage_account.sanursery_storage_account_id
  }
  aks_id      = module.aks.id
  rg_location = module.import_resources.core_rg_location
  providers = {
    azurerm.tre = azurerm.tre
  }

}
