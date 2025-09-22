locals {
  subplan_map = {
    "KeyVaults"       = "PerKeyVault"
    "StorageAccounts" = "DefenderForStorageV2"
    "VirtualMachines" = "P2"
    # Add other resource_type => subplan mappings as needed
  }
}



resource "azurerm_security_center_subscription_pricing" "core_mdc" {
  for_each = toset(var.core_security_center_resource_types)

  provider      = azurerm.core
  resource_type = each.value
  tier          = "Standard"
  subplan       = lookup(local.subplan_map, each.value, null)
}

resource "azurerm_security_center_subscription_pricing" "app_mdc" {
  for_each = toset(var.app_security_center_resource_types)

  provider      = azurerm.app
  resource_type = each.value
  tier          = "Standard"
  subplan       = lookup(local.subplan_map, each.value, null)
}

resource "azurerm_security_center_subscription_pricing" "kcri_mdc" {
  for_each = toset(var.kcri_security_center_resource_types)

  provider      = azurerm.kcri
  resource_type = each.value
  tier          = "Standard"
  subplan       = lookup(local.subplan_map, each.value, null)
}
