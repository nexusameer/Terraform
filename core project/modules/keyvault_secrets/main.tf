
resource "azurerm_key_vault_secret" "shinyapp_batch" {
  name = var.shinyapp_batch_name
  value = jsonencode({
    batch-secret     = var.batch_primary_access_key
    batch-name       = var.batch_account_name
    batch-job        = var.batch_job_name
    batch-repository = var.acr_login_server_name
  })
  key_vault_id = var.key_vault_id
  provider     = azurerm.core

}

resource "azurerm_key_vault_secret" "shinyapp_db" {
  name = var.shinyapp_db_name
  value = jsonencode({
    user     = var.pstgre_db_username
    password = var.pstgre_db_password
    host     = var.postgres_host
    dbname   = var.sensor_db_name
    port     = var.postgres_port
  })
  key_vault_id = var.key_vault_id
  provider     = azurerm.core
}

resource "azurerm_key_vault_secret" "shinyapp_storage" {
  name = var.shinyapp_storage_name
  value = jsonencode({
    account_name          = var.datalake_account_name
    account_key           = var.datalake_account_key
    container_name        = var.bronze_container_name
    account_name_output   = var.datalake_account_name
    account_key_output    = var.datalake_account_key
    container_name_output = var.silver_container_name
    account_name_staging  = var.datalake_account_name
    account_key_staging   = var.datalake_account_key
  })
  key_vault_id = var.key_vault_id
  provider     = azurerm.core
  lifecycle {
    ignore_changes = [
      value
    ]
  }
}

resource "azurerm_key_vault_secret" "core_datalake_access_key" {
  name = var.core_datalake_access_key
  value = var.core_datalake_primary_key
  key_vault_id = var.key_vault_id
  provider     = azurerm.core

}