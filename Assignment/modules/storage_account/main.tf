resource "azurerm_storage_account" "sa" {
  name                     = "mystoragea2c4ct92345"
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
