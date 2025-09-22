resource "azurerm_data_factory_managed_private_endpoint" "ml_fap_private_endpoint" {
  provider           = azurerm.core
  name               = var.ml_fap_pe_name
  data_factory_id    = var.core_adf_id
  target_resource_id = var.ml_fap_id
  subresource_name   = "sites"
}


resource "azurerm_data_factory_linked_service_azure_function" "ml_function_app_lined_service" {
  provider        = azurerm.core
  name            = var.ml_fap_pe_name
  data_factory_id = var.core_adf_id
  url             = var.ml_fap_pe_hostname
  key             = "foo"
}
