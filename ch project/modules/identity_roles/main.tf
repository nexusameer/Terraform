


resource "azurerm_role_assignment" "keyvault_secrets_user" {
  provider             = azurerm.core
  scope                = var.keyvault_id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = var.ml_functionapp_id
}