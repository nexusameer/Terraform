
resource "azurerm_sentinel_log_analytics_workspace_onboarding" "sentinal" {
  workspace_id = var.log_workspace_id
  provider     = azurerm.security
}

resource "azurerm_resource_group_template_deployment" "main" {
  provider = azurerm.security

  for_each = toset(var.log_sources)

  name                = "deployment-solutions-${each.key}"
  resource_group_name = var.soc_security_rg_name
  deployment_mode     = "Incremental"

  parameters_content = jsonencode({
    "location" = {
      value = var.security_rg_location
    },
    "workspace-location" = {
      value = var.security_rg_location
    },
    "workspace" = {
      value = var.log_workspace_name
    }
  })

  template_content = file("${path.module}/templates/${each.key}.json")

  lifecycle {
    ignore_changes = [parameters_content]
  }
}










