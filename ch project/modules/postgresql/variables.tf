variable "private_dns_zone" {}
variable "rg_name" {}
variable "rg_location" {}
variable "environment" {}
variable "virtual_network_id" {}
variable "az_pstgre_we_sensor_db_core" {}
variable "az_pstgre_we_sensor_db_core_version" {}
variable "delegated_subnet_id" {}
variable "pstgre_db_username" {}
variable "pstgre_db_password" {}
variable "az_pstgre_we_sensor_db_core_zone" {}
variable "pstgre_storage_mb" {}
variable "pstgre_storage_tier" {}
variable "pstgre_sku_name" {}
variable "tenant_id" {}
variable "extenshion_name" {}
variable "extenshion_value" {}
variable "tags" {}
variable "timescaledb_extension_name" {}
variable "timescaledb_extension_value" {}
variable "tablefunc_extension_name" {}
variable "tablefunc_extension_value" {}
variable "database_name" {}
variable "database_name_2" {}
variable "database_name_3" {}
variable "user1" {}
variable "user2" {}
variable "user3" {}
variable "userdb_admin" {
  type = set(string)
}
variable "userdb_appuser" {
  type = set(string)
}
variable "user_db_map" {
  type = map(string)
}
variable "backup_retention_days" {
  default = 7
}
variable "geo_redundant_backup_enabled" {
  default = true
}
variable "ha_mode" {
  default = "SameZone" ###  Currently ZoneRedundant is only supported in e.g. EastUS, WestUS3 etc, not supported in WestEurope
}