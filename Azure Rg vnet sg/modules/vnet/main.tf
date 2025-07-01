resource "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  resource_group_name = var.rg_name
  location            = var.location
  address_space = var.address_space
}

resource "azurerm_subnet" "subnets" {
  count               = length(var.subnet_prefixes)
  name                = "subnet-${count.index}"
  resource_group_name = var.rg_name
  virtual_network_name= azurerm_virtual_network.this.name
  address_prefixes    = [var.subnet_prefixes[count.index]]
}
