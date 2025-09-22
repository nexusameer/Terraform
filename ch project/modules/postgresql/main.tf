resource "azurerm_postgresql_flexible_server" "az_pstgre_we_sensor_db_core" {
  # provider               = azurerm.core
  name                         = lower("${var.az_pstgre_we_sensor_db_core}-${var.environment}")
  resource_group_name          = var.rg_name
  location                     = var.rg_location
  version                      = var.az_pstgre_we_sensor_db_core_version
  delegated_subnet_id          = var.delegated_subnet_id
  private_dns_zone_id          = var.private_dns_zone
  administrator_login          = var.pstgre_db_username
  administrator_password       = var.pstgre_db_password
  zone                         = var.az_pstgre_we_sensor_db_core_zone
  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled
  high_availability {
    mode = var.ha_mode
  }
  storage_mb   = var.pstgre_storage_mb
  storage_tier = var.pstgre_storage_tier

  sku_name                      = var.pstgre_sku_name
  public_network_access_enabled = false
  authentication {
    active_directory_auth_enabled = false
    password_auth_enabled         = true
    tenant_id                     = var.tenant_id
  }

  lifecycle {
    ignore_changes = [authentication[0].tenant_id,
      zone
    ]

  }

  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
}

# resource "azurerm_postgresql_flexible_server_configuration" "extenshion" {
#   # provider  = azurerm.core
#   name      = var.extenshion_name
#   server_id = azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core.id
#   value     = var.extenshion_value
#   depends_on = [ azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core ]
# }


resource "azurerm_postgresql_flexible_server_configuration" "timescaledb_extenshion" {
  name       = var.timescaledb_extension_name
  server_id  = azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core.id
  value      = var.timescaledb_extension_value
  depends_on = [azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core]
  # provider  = azurerm.core
}

resource "azurerm_postgresql_flexible_server_configuration" "enable_tablefunc" {
  name       = var.tablefunc_extension_name
  server_id  = azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core.id
  value      = var.tablefunc_extension_value
  depends_on = [azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core]
}

# resource "azurerm_postgresql_flexible_server_database" "db" {
#   name      = var.database_name
#   server_id = azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core.id
#   charset   = "UTF8"
#   collation = "en_US.utf8"
#   depends_on = [ azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core ]
#   # provider  = azurerm.core
# }
# resource "azurerm_postgresql_flexible_server_database" "db2" {
#   name      = var.database_name_2
#   server_id = azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core.id
#   charset   = "UTF8"
#   collation = "en_US.utf8"
#   # provider  = azurerm.core
# }
# resource "azurerm_postgresql_flexible_server_database" "db3" {
#   name      = var.database_name_3
#   server_id = azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core.id
#   charset   = "UTF8"
#   collation = "en_US.utf8"
#   # provider  = azurerm.core
# }
# provider "postgresql" {
#   # alias           = "db1"
#   host            = azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core.fqdn
#   port            = 5432
#   database        = "postgres"#azurerm_postgresql_flexible_server_database.db.name
#   username        = azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core.administrator_login
#   password        = azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core.administrator_password
#   sslmode         = "require"
#   superuser       = false
# }

# provider "postgresql" {
#   alias           = "db2"
#   host            = azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core.fqdn
#   port            = 5432
#   database        = azurerm_postgresql_flexible_server_database.db2.name
#   username        = azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core.administrator_login
#   password        = azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core.administrator_password
#   sslmode         = "require"
#   superuser       = false
# }

# provider "postgresql" {
#   alias           = "db3"
#   host            = azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core.fqdn
#   port            = 5432
#   database        = azurerm_postgresql_flexible_server_database.db3.name
#   username        = azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core.administrator_login
#   password        = azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core.administrator_password
#   sslmode         = "require"
#   superuser       = false
# }
# resource "postgresql_role" "user1" {
#   # provider = postgresql.db1
#   name     = var.user1
#   login    = true
#   password = "HSh1CoR312345"
#   depends_on = [
#     azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core,
#     azurerm_postgresql_flexible_server_database.db
#   ]
#   # provider  = azurerm.core
# }
# resource "postgresql_role" "user2" {
#   # provider = postgresql.db2
#   name     = var.user2
#   login    = true
#   password = "HSh1CoR312345"
#   # provider  = azurerm.core
# }
# resource "postgresql_role" "user3" {
#   # provider = postgresql.db3
#   name     = var.user3
#   login    = true
#   password = "HSh1CoR312345"
#   # provider  = azurerm.core
# }

################# Start custom requirement for 2 users #################
resource "azurerm_postgresql_flexible_server_database" "database" {
  for_each   = var.user_db_map
  name       = each.value
  server_id  = azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core.id
  charset    = "UTF8"
  collation  = "en_US.utf8"
  depends_on = [azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core]
}
####commented by Zamran####
# resource "postgresql_role" "userdb_admin" {
#   for_each = var.userdb_admin
#   name     = each.key
#   login    = true
#   password = "HSh1CoR312345"
# }
# resource "postgresql_grant" "userdb_admin_privileges" {
#   for_each    = postgresql_role.userdb_admin
#   database    = "postgres"
#   role        = each.value.name
#   object_type = "database"
#   privileges  = ["CONNECT"]
#   depends_on = [
#     azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core,
#     azurerm_postgresql_flexible_server_database.database,
#     postgresql_role.userdb_admin
#   ]
# }
# resource "postgresql_grant" "userdb_admin_all_privileges" {
#   for_each    = var.user_db_map
#   database    = each.value
#   role        = each.key
#   object_type = "schema"
#   privileges  = ["CREATE", "USAGE"]
#   schema      = "public"
#   depends_on  = [
#     azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core,
#     azurerm_postgresql_flexible_server_database.database,
#     postgresql_role.userdb_admin
#   ]
# }
# resource "postgresql_default_privileges" "userdb_admin_tables" {
#   for_each    = var.user_db_map
#   database    = each.value
#   owner       = "psqladmin"
#   schema      = "public"
#   object_type = "table"
#   privileges  = ["DELETE","INSERT","REFERENCES","SELECT","TRIGGER","TRUNCATE","UPDATE"]
#   role        = each.key
#   depends_on  = [
#     azurerm_postgresql_flexible_server_database.database
#   ]
# }
# resource "postgresql_role" "userdb_appuser" {
#   for_each = var.userdb_appuser
#   name     = each.key
#   login    = true
#   password = "HSh1CoR312345"
# }
# resource "postgresql_grant" "userdb_appuser_privileges" {
#   for_each    = postgresql_role.userdb_appuser
#   database    = "postgres"
#   role        = each.value.name
#   object_type = "database"
#   privileges  = ["CONNECT"]
#   depends_on = [
#     azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core,
#     azurerm_postgresql_flexible_server_database.database,
#     postgresql_role.userdb_appuser
#   ]
# }
# resource "postgresql_grant" "userdb_appuser_restricted_privileges" {
#   for_each    = var.user_db_map
#   database    = each.value
#   role        = each.key
#   object_type = "table"
#   privileges  = ["SELECT", "INSERT", "UPDATE", "DELETE"]
#   schema      = "public"
#   depends_on = [ postgresql_role.userdb_appuser, postgresql_grant.userdb_appuser_privileges ]
# }
# resource "postgresql_grant" "userdb_appuser_schema_usage" {
#   for_each    = var.user_db_map
#   database    = each.value
#   role        = each.key
#   object_type = "schema"
#   privileges  = ["USAGE","CREATE"]
#   schema      = "public"

#   depends_on = [
#     azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core,
#     azurerm_postgresql_flexible_server_database.database,
#     postgresql_role.userdb_appuser
#   ]
# }
###commented by Zamran###
################# End custom requirement for 2 users #################

# resource "postgresql_grant" "app_user_privileges1" {
#   database    = azurerm_postgresql_flexible_server_database.db.name
#   role        = postgresql_role.user1.name
#   object_type = "database"
#   privileges  = ["CONNECT"]
#   depends_on = [
#     azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core,
#     azurerm_postgresql_flexible_server_database.db,
#     postgresql_role.user1
#   ]
#   # provider  = azurerm.core
# }
# resource "postgresql_grant" "app_user_privileges2" {
#   database    = azurerm_postgresql_flexible_server_database.db2.name
#   role        = postgresql_role.user2.name
#   object_type = "database"
#   privileges  = ["CONNECT"]
#   # provider  = azurerm.core
# }
# resource "postgresql_grant" "app_user_privileges3" {
#   database    = azurerm_postgresql_flexible_server_database.db3.name
#   role        = postgresql_role.user3.name
#   object_type = "database"
#   privileges  = ["CONNECT","CREATE"]
#   # provider  = azurerm.core
# }
# resource "postgresql_grant" "app_user_readonly" {
#   database    = azurerm_postgresql_flexible_server_database.db.name
#   role        = postgresql_role.user1.name
#   object_type = "table"
#   privileges  = ["SELECT", "INSERT", "UPDATE", "DELETE"]
#   schema      = "public"
#   depends_on = [
#     azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core,
#     azurerm_postgresql_flexible_server_database.db,
#     postgresql_role.user1
#   ]
#   # provider  = azurerm.core
# }

# resource "postgresql_grant" "app_user_readonly2" {
#   database    = azurerm_postgresql_flexible_server_database.db2.name
#   role        = postgresql_role.user2.name
#   object_type = "table"
#   privileges  = ["SELECT", "INSERT", "UPDATE", "DELETE"]
#   schema      = "public"
#   # provider  = azurerm.core
# }
# resource "postgresql_grant" "app_user_readonly3" {
#   database    = azurerm_postgresql_flexible_server_database.db3.name
#   role        = postgresql_role.user3.name
#   object_type = "table"
#   privileges  = ["SELECT", "INSERT", "UPDATE", "DELETE"]
#   schema      = "public"
#   # provider  = azurerm.core
# }
# resource "postgresql_grant" "app_user_create" {
#   database    = azurerm_postgresql_flexible_server_database.db3.name
#   role        = postgresql_role.user3.name
#   object_type = "database"
#   privileges  = ["CONNECT","CREATE"]
#   schema      = "public"
#   # provider  = azurerm.core
# }
# resource "postgresql_grant" "user1_schema_usage" {
#   database    = azurerm_postgresql_flexible_server_database.db.name
#   role        = postgresql_role.user1.name
#   object_type = "schema"
#   privileges  = ["USAGE", "CREATE"]
#   schema      = "public"

#   depends_on = [
#     azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core,
#     azurerm_postgresql_flexible_server_database.db,
#     postgresql_role.user1
#   ]
# }
# resource "postgresql_grant" "user2_schema_usage" {
#   database    = azurerm_postgresql_flexible_server_database.db2.name
#   role        = postgresql_role.user2.name
#   object_type = "schema"
#   privileges  = ["USAGE", "CREATE"]
#   schema      = "public"

#   depends_on = [
#     azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core,
#     azurerm_postgresql_flexible_server_database.db2,
#     postgresql_role.user2
#   ]
# }
# resource "postgresql_grant" "user3_schema_usage" {
#   database    = azurerm_postgresql_flexible_server_database.db3.name
#   role        = postgresql_role.user3.name
#   object_type = "schema"
#   privileges  = ["USAGE", "CREATE"]
#   schema      = "public"

#   depends_on = [
#     azurerm_postgresql_flexible_server.az_pstgre_we_sensor_db_core,
#     azurerm_postgresql_flexible_server_database.db3,
#     postgresql_role.user3
#   ]
# }

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
    # postgresql = {
    #   source  = "cyrilgdn/postgresql"
    #   version = "~> 1.21.0"  # Adjust version as needed
    # }
  }
}
