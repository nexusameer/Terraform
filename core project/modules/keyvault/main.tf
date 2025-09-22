resource "azurerm_key_vault" "az-kv" {
  provider                      = azurerm.core
  name                          = var.az_kv_name
  location                      = var.core_rg_location
  resource_group_name           = var.core_rg
  enabled_for_disk_encryption   = true
  tenant_id                     = var.azure_tenant_id
  soft_delete_retention_days    = 7
  purge_protection_enabled      = true
  public_network_access_enabled = false
  sku_name                      = "standard"
  enable_rbac_authorization     = true

  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
  }

  # access_policy {
  #   tenant_id = var.azure_tenant_id
  #   object_id = var.kv_object_id

  #   key_permissions = ["Get"]
  #   secret_permissions = [
  #     "Get", "List", "Set", "Delete", "Recover", "Backup", "Restore", "Purge"
  #   ]
  #   storage_permissions = ["Get"]
  # }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
}

# resource "azurerm_management_lock" "keyvault_lock" {
#   provider           = azurerm.core
#   name               = var.kv_lock_name
#   scope              = azurerm_key_vault.az-kv.id
#   lock_level         = var.kv_lock_level
#   notes              = "This lock prevents accidental deletion of the Key Vault."
#   depends_on          = [azurerm_key_vault.az-kv]
# }


resource "azurerm_private_endpoint" "kv_private_endpoint" {
  provider            = azurerm.core
  name                = var.pe_name
  location            = var.core_rg_location
  resource_group_name = var.core_rg
  subnet_id           = var.pe_subnet_id

  private_service_connection {
    name                           = var.service_name
    private_connection_resource_id = azurerm_key_vault.az-kv.id
    is_manual_connection           = false
    subresource_names              = ["vault"]
  }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
  depends_on = [azurerm_key_vault.az-kv]
}


resource "azurerm_private_dns_a_record" "key_vault_private_dns" {
  provider            = azurerm.connectivity
  name                = split(".vault.azure.net", azurerm_private_endpoint.kv_private_endpoint.custom_dns_configs[0].fqdn)[0]
  zone_name           = var.keyvault_private_dns_zone_name
  resource_group_name = var.gitlab_resource_group_name
  ttl                 = 60
  records             = azurerm_private_endpoint.kv_private_endpoint.custom_dns_configs[0].ip_addresses
  depends_on          = [azurerm_private_endpoint.kv_private_endpoint]
}

resource "time_sleep" "wait_1_min" {
  depends_on      = [azurerm_private_endpoint.kv_private_endpoint, azurerm_private_dns_a_record.key_vault_private_dns]
  create_duration = "60s"
}