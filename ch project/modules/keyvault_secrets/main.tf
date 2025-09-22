
data "azurerm_function_app_host_keys" "function_app_keys" {
  name                = var.function_app_name
  resource_group_name = var.core_rg_name
  provider            = azurerm.core
}

resource "azurerm_key_vault_secret" "batch_key" {
  name         = "lss-batch-key"
  value        = var.batch_primary_access_key
  key_vault_id = var.key_vault_id
  provider     = azurerm.core

}


resource "azurerm_key_vault_secret" "kafka_key" {
  name         = "lss-kafka-access-key"
  value        = var.kafka_access_primary_key
  key_vault_id = var.key_vault_id
  provider     = azurerm.core

}

resource "azurerm_key_vault_secret" "lss_passwd" {
  name         = "lss-password"
  value        = var.lss_password
  key_vault_id = var.key_vault_id
  provider     = azurerm.core

}

resource "azurerm_key_vault_secret" "db_username" {
  name         = var.db_user
  value        = var.pstgre_db_username
  key_vault_id = var.key_vault_id
  provider     = azurerm.core

}

resource "azurerm_key_vault_secret" "db_passwd" {
  name         = var.db_passwd
  value        = var.pstgre_db_password
  key_vault_id = var.key_vault_id
  provider     = azurerm.core

}

resource "azurerm_key_vault_secret" "db_name" {
  name         = var.db_name
  value        = var.reportingdb_admin
  key_vault_id = var.key_vault_id
  provider     = azurerm.core

}

resource "azurerm_key_vault_secret" "reportingdb_host" {
  name         = var.reportingdb
  value        = var.reportingdb_host
  key_vault_id = var.key_vault_id
  provider     = azurerm.core

}



resource "azurerm_key_vault_secret" "ml_batch_key" {
  name         = var.ml_batch_key
  value        = var.ml_batch_primary_key
  key_vault_id = var.key_vault_id
  provider     = azurerm.core

}


resource "azurerm_key_vault_secret" "ml_cognito_username" {
  name         = var.ml_cognito_username
  value        = var.ml_cognito_username_value
  key_vault_id = var.key_vault_id
  provider     = azurerm.core

}


resource "azurerm_key_vault_secret" "ml_cognito_password" {
  name         = var.ml_cognito_password
  value        = var.ml_cognito_password_value
  key_vault_id = var.key_vault_id
  provider     = azurerm.core

}


resource "azurerm_key_vault_secret" "ml_kafka_access_key" {
  name         = var.ml_kafka_access_key
  value        = var.ml_kafka_primary_key
  key_vault_id = var.key_vault_id
  provider     = azurerm.core

}

resource "azurerm_key_vault_secret" "ml_function_app_access_key" {
  name         = var.ml_function_app_access_key
  value        = var.ml_function_app_primary_key
  key_vault_id = var.key_vault_id
  provider     = azurerm.core

}
