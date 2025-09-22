resource "azurerm_data_protection_backup_vault" "backup_vaults" {
  provider                   = azurerm.management
  name                       = var.backup_vault_name
  resource_group_name        = var.soc_security_rg_name
  location                   = var.security_rg_location
  retention_duration_in_days = 30
  datastore_type             = "VaultStore"
  redundancy                 = "ZoneRedundant"
  identity {
    type = "SystemAssigned"
  }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
}