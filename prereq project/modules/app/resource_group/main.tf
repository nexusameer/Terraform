################################################
##                                            ##
##     Resource group for  AZ_RG_WE_SENSOR    ##
##                                            ##
################################################

resource "azurerm_resource_group" "sensor_rg" {
  name     = "${var.sensor_resource_group_name}_${var.environment}"
  location = var.sensor_resource_group_location
  provider = azurerm.app
  tags = merge(
    var.tags,
    {
      environment = var.environment
    }
  )
}
