resource "azurerm_postgresql_flexible_server" "az_pstgre_we_sensor_db_core" {
  provider               = azurerm.core
  name                   = lower("${var.az_pstgre_we_sensor_db_core}-${var.environment}")
  resource_group_name    = var.core_rg
  location               = var.core_rg_location
  version                = var.az_pstgre_we_sensor_db_core_version
  delegated_subnet_id    = var.core_db_subnet_id
  private_dns_zone_id    = var.psql_private_dns_zone_id
  administrator_login    = var.pstgre_db_username
  administrator_password = var.pstgre_db_password
  zone                   = var.az_pstgre_we_sensor_db_core_zone
  storage_mb             = var.pstgre_storage_mb
  storage_tier           = var.pstgre_storage_tier

  sku_name                      = var.pstgre_sku_name
  public_network_access_enabled = false
  # authentication {
  #   active_directory_auth_enabled = true
  #   password_auth_enabled         = true
  #   tenant_id                     = var.azure_tenant_id
  # }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
}

resource "azurerm_postgresql_flexible_server_configuration" "extenshion" {
  provider   = azurerm.core
  name       = var.azure_extensions_name
  server_id  = azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core.id
  value      = var.azure_extensions_values
  depends_on = [azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core]
}


resource "azurerm_postgresql_flexible_server_configuration" "timescaledb_extenshion" {
  name       = var.shared_preload_libraries_name
  server_id  = azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core.id
  value      = var.shared_preload_libraries_values
  provider   = azurerm.core
  depends_on = [azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core]
}

