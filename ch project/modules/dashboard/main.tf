resource "azurerm_portal_dashboard" "dashboard" {
  provider            = azurerm.apps
  name                = var.ch_dashboard_name
  resource_group_name = var.ch_rg_name
  location            = var.ch_rg_location

  dashboard_properties = templatefile("${path.module}/dashboard.json", {
    core_subscription_id = var.apps_subscription_id
    rg_name              = var.ch_rg_name
    # azsawestagingcore_name = var.azsawestagingcore_name
    # azsawestagingcore_id   = var.azsawestagingcore_id
    # batch_name             = var.batch_name
    # batch_id               = var.batch_id
    # datalake_name          = var.datalake_name
    # datalake_id            = var.datalake_id
    # keyvault_name          = var.keyvault_name
    # keyvault_id            = var.keyvault_id
    # data_factory_id        = var.data_factory_id
    vm_id                    = var.vm_id
    vm_name                  = var.vm_name
    aks_name                 = var.aks_name
    aks_id                   = var.aks_id
    core_eventhub_id         = var.core_eventhub_id
    core_eventhub_name       = var.core_eventhub_name
    ch_eventhub_id           = var.ch_eventhub_id
    ch_eventhub_name         = var.ch_eventhub_name
    inv_storage_id           = var.inv_storage_id
    inv_storage_name         = var.inv_storage_name
    lss_hist_storage_id      = var.lss_hist_storage_id
    lss_hist_storage_name    = var.lss_hist_storage_name
    ml_hist_storage_id       = var.ml_hist_storage_id
    ml_hist_storage_name     = var.ml_hist_storage_name
    sanursery_id             = var.sanursery_id
    sanursery_name           = var.sanursery_name
    crs_functionapp_name     = var.crs_functionapp_name
    crs_functionapp_id       = var.crs_functionapp_id
    inv_lss_functionapp_name = var.inv_lss_functionapp_name
    inv_lss_functionapp_id   = var.inv_lss_functionapp_id
    inv_ml_functionapp_name  = var.inv_ml_functionapp_name
    inv_ml_functionapp_id    = var.inv_ml_functionapp_id
    inv_wq_functionapp_name  = var.inv_wq_functionapp_name
    inv_wq_functionapp_id    = var.inv_wq_functionapp_id
    lss_functionapp_name     = var.lss_functionapp_name
    lss_functionapp_id       = var.lss_functionapp_id
    ml_functionapp_name      = var.ml_functionapp_name
    ml_functionapp_id        = var.ml_functionapp_id
    core_postgres_id         = var.core_postgres_id
    core_postgres_name       = var.core_postgres_name
    ch_postgres_id           = var.ch_postgres_id
    ch_postgres_name         = var.ch_postgres_name
    batch_lss_account_id     = var.batch_lss_account_id
    batch_lss_account_name   = var.batch_lss_account_name
    batch_ml_account_id      = var.batch_ml_account_id
    batch_ml_account_name    = var.batch_ml_account_name


  })

}
