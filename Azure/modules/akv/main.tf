

resource "azurerm_key_vault" "akv" {
  name                        = var.akv_name
  location                    = var.rg_location
  resource_group_name         = var.rg_name
  enabled_for_disk_encryption = true
  tenant_id                   = var.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = var.tenant_id
    object_id = var.object_id

    key_permissions     = ["Get"]
    secret_permissions  = ["Get", "Set"]
    storage_permissions = ["Get"]
  }
}


resource "azurerm_key_vault_secret" "ssh_key" {
  name         = "personal-ssh-key"
  value        = var.ssh_key
  key_vault_id = azurerm_key_vault.akv.id
}