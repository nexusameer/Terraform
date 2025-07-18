resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.rg_location
  resource_group_name = var.rg_name  
  address_space = var.address_space
  

  subnet {
    name             = "subnet1"
    address_prefixes = ["10.0.1.0/24"]
  }
}