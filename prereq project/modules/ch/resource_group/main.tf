################################################
##                                            ##
##     Resource group for  AZ_RG_WE_CH        ##
##                                            ##
################################################

resource "azurerm_resource_group" "ch_rg" {
  name     = "${var.resource_group_ch_name}_${var.environment}"
  location = var.location
  provider = azurerm.app
  tags = merge(
    var.tags,
    {
      environment = var.environment
    }
  )
}
