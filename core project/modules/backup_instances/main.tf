resource "azurerm_data_protection_backup_policy_postgresql_flexible_server" "psql_policy" {
  provider = azurerm.management
  name     = var.psql_policy_name
  vault_id = var.backup_vault_id

  backup_repeating_time_intervals = ["R/2025-04-09T00:00:00+00:00/P1D"]
  default_retention_rule {
    life_cycle {
      duration        = "P30D"
      data_store_type = "VaultStore"
    }
  }
}


resource "azurerm_role_assignment" "backup_vault_rg_access" {
  provider             = azurerm.core
  scope                = var.core_rg_id
  role_definition_name = "Contributor"
  principal_id         = var.backup_vault_principal_id
}


resource "azurerm_role_assignment" "backup_vault_psql_access" {
  provider             = azurerm.core
  scope                = var.psql_server_id
  role_definition_name = "Contributor"
  principal_id         = var.backup_vault_principal_id
}


resource "azurerm_data_protection_backup_instance_postgresql_flexible_server" "psql_instance" {
  depends_on       = [azurerm_role_assignment.backup_vault_rg_access, azurerm_role_assignment.backup_vault_psql_access]
  provider         = azurerm.management
  name             = var.az_pstgre_we_sensor_db_core
  location         = var.core_rg_location
  vault_id         = var.backup_vault_id
  server_id        = var.psql_server_id
  backup_policy_id = azurerm_data_protection_backup_policy_postgresql_flexible_server.psql_policy.id
}

resource "azurerm_role_assignment" "backup_vault_fapp_storage_account_access" {
  provider             = azurerm.core
  scope                = var.fapp_storage_account_id
  role_definition_name = "Storage Account Backup Contributor"
  principal_id         = var.backup_vault_principal_id
}


resource "azurerm_data_protection_backup_policy_blob_storage" "core_storage_account_backup_policy" {
  provider = azurerm.management
  name     = var.storage_account_policy_name
  vault_id = var.backup_vault_id

  backup_repeating_time_intervals = ["R/2025-04-09T00:00:00+00:00/P1D"]
  operational_default_retention_duration = "P30D"
  lifecycle {
    ignore_changes = [
      backup_repeating_time_intervals
    ]
  }
}

resource "time_sleep" "wait_for_role_assignment" {
  depends_on = [
    azurerm_role_assignment.backup_vault_rg_access,
    azurerm_role_assignment.backup_vault_fapp_storage_account_access
  ]
  create_duration = "60s"
}

resource "azurerm_data_protection_backup_instance_blob_storage" "fapp_storage_account_instance" {
  depends_on       = [time_sleep.wait_for_role_assignment, azurerm_role_assignment.backup_vault_rg_access, azurerm_role_assignment.backup_vault_fapp_storage_account_access, azurerm_data_protection_backup_policy_blob_storage.core_storage_account_backup_policy]
  provider         = azurerm.management
  name             = var.fapp_storage_acc_name
  location         = var.core_rg_location
  vault_id         = var.backup_vault_id
  storage_account_id = var.fapp_storage_account_id
  backup_policy_id = azurerm_data_protection_backup_policy_blob_storage.core_storage_account_backup_policy.id
}


