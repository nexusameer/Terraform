


resource "azurerm_role_assignment" "keyvault_secrets_user" {
  provider             = azurerm.core
  scope                = var.keyvault_id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = var.batch_identity_principal_id
}

resource "azurerm_role_assignment" "acr_pull_access" {
  provider             = azurerm.core
  scope                = var.core_acr_name
  role_definition_name = "AcrPull"
  principal_id         = var.batch_identity_principal_id
}

resource "azurerm_role_assignment" "adf_to_datalake_role" {
  provider             = azurerm.core
  scope                = var.core_dalalake_name
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = var.adf_principal_id
}

resource "azurerm_role_assignment" "adf_to_storageaccount_role" {
  provider             = azurerm.core
  scope                = var.core_storage_name
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = var.adf_principal_id
}

resource "azurerm_role_assignment" "adf_to_functionapp_role" {
  provider             = azurerm.core
  scope                = var.core_functionapp_name
  role_definition_name = "Contributor"
  principal_id         = var.adf_principal_id
}

resource "azurerm_role_assignment" "function_app_key_vault_admin" {
  provider             = azurerm.core
  principal_id         = var.function_app_id
  role_definition_name = "Key Vault Secrets User"
  scope                = var.keyvault_id
}

resource "azurerm_role_assignment" "keyvault_self_assignment" {
  provider             = azurerm.core
  scope                = var.keyvault_id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = var.entra_object_id
}