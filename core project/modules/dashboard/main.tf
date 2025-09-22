resource "azurerm_portal_dashboard" "dashboard" {
  provider            = azurerm.core
  name                = var.dashboard_name
  resource_group_name = var.rg_name
  location            = var.rg_location

  dashboard_properties = templatefile("${path.module}/dashboard.json", {
    core_subscription_id   = var.core_subscription_id
    rg_name                = var.rg_name
    azsawestagingcore_name = var.azsawestagingcore_name
    azsawestagingcore_id   = var.azsawestagingcore_id
    batch_name             = var.batch_name
    batch_id               = var.batch_id
    datalake_name          = var.datalake_name
    datalake_id            = var.datalake_id
    keyvault_name          = var.keyvault_name
    keyvault_id            = var.keyvault_id
    data_factory_id        = var.data_factory_id
    data_factory_name      = var.data_factory_name
    fapp_storage_acc_name  = var.fapp_storage_acc_name
    fapp_storage_acc_id    = var.fapp_storage_acc_id
    functionapp_name       = var.functionapp_name
    functionapp_id         = var.functionapp_id
  })

}
