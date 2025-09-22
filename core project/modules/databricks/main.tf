resource "azurerm_databricks_workspace" "databricks_workspace" {
  name                = var.databricks_name
  resource_group_name = var.core_rg
  location            = var.core_rg_location  
  sku                 = "standard"

  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
provider = azurerm.core
}
