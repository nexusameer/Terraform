resource "azurerm_portal_dashboard" "shiny_dashboard" {
  provider             = azurerm.app
  name                 = "${var.dashboard_name}_${lower(var.environment)}"
  resource_group_name  = var.sensor_rg_name
  location             = var.sensor_rg_location

  
  dashboard_properties = templatefile("${path.module}/dashboard.json", {
    shiny_vm_id           = var.shiny_vm_id
    shiny_vm_name         = var.shiny_vm_name
    web_app_name          = var.web_app_name
    web_app               = var.web_app
    contol_panel_app      = var.contol_panel_app
    contol_panel_app_name = var.contol_panel_app_name
    bootdiagnostic_name   = var.bootdiagnostic_name
    bootdiagnostic_id     = var.bootdiagnostic_id
  })
}