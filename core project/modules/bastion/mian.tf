################################################
##                                            ##
##            BASTION Public IP               ##
##                                            ##
################################################

resource "azurerm_public_ip" "bastion_pip" {
  provider            = azurerm.core
  name                = var.core_bastion_pip
  location            = var.core_rg_location
  resource_group_name = var.core_rg
  allocation_method   = "Static"
  sku                 = "Standard"
  # depends_on = [ azurerm_bastion_host.bastion_host ]
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
}



################################################
##                                            ##
##              BASTION HOST                  ##
##                                            ##
################################################


resource "azurerm_bastion_host" "bastion_host" {
  provider            = azurerm.core
  name                = var.bastion_name
  location            = var.core_rg_location
  resource_group_name = var.core_rg
  sku                 = "Standard"
  scale_units         = 2

  copy_paste_enabled     = true
  file_copy_enabled      = true
  shareable_link_enabled = true
  tunneling_enabled      = true

  ip_configuration {
    name                 = "config-01"
    subnet_id            = var.bastion_subnet_id
    public_ip_address_id = azurerm_public_ip.bastion_pip.id
  }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
  # depends_on = [azurerm_public_ip.bastion_pip]
}
