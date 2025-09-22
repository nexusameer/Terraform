output "postgres_name" {
  value = azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core.name
}

output "postgres_host" {
  value = azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core.fqdn
}

output "postgres_id" {
  value = azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core.id
}