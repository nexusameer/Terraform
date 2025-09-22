################################################
##                                            ##
##        Private DNS For BatchAccount        ##
##                                            ##
################################################


# resource "azurerm_private_dns_zone" "core_batch_account" {
#   name                = var.core_batch_private_dns_name
#   resource_group_name = var.core_resource_group_name
#   tags = merge(
#     var.tags,
#     {
#       environment = var.environment
#     }
#   )
#   provider = azurerm.core

# }


################################################
##                                            ##
##      Private Vnet Link For BatchAccount    ##
##                                            ##
################################################

resource "azurerm_private_dns_zone_virtual_network_link" "core_batch_link" {
  name                  = var.core_batch_link_name #"batch-link-to-vnet"
  resource_group_name   = var.core_resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.core_batch_account.name
  virtual_network_id    = var.core_vnet_id
  provider              = azurerm.core
  depends_on = [
    azurerm_private_dns_zone.core_batch_account
  ]
}


################################################
##                                            ##
##        Private DNS For ACR                 ##
##                                            ##
################################################


# resource "azurerm_private_dns_zone" "core_acr_private_dns" {
#   name                = var.core_acr_private_dns_name
#   resource_group_name = var.core_resource_group_name
#   tags = merge(
#     var.tags,
#     {
#       environment = var.environment
#     }
#   )
#   provider = azurerm.core
# }


################################################
##                                            ##
##      Private Vnet Link For ACR             ##
##                                            ##
################################################

resource "azurerm_private_dns_zone_virtual_network_link" "core_acr_link" {
  name                  = var.core_acr_link_name #"link-to-vnet-for-acr"
  resource_group_name   = var.core_resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.core_acr_private_dns.name
  virtual_network_id    = var.core_vnet_id
  provider              = azurerm.core
  depends_on = [
    azurerm_private_dns_zone.core_acr_private_dns
  ]
}

#Function App Private DNS
# resource "azurerm_private_dns_zone" "core_fap_private_dns" {
#   name                = var.core_fap_private_dns_name
#   resource_group_name = var.core_resource_group_name
#   tags = merge(
#     var.tags,
#     {
#       environment = var.environment
#     }
#   )
#   provider = azurerm.core
# }


#Function App VNET Add into Private DNS
resource "azurerm_private_dns_zone_virtual_network_link" "core_network" {
  name                  = var.core_network_name
  resource_group_name   = var.core_resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.core_fap_private_dns.name
  virtual_network_id    = var.core_vnet_id
  depends_on = [
    azurerm_private_dns_zone.core_fap_private_dns
  ]
  provider = azurerm.core
}

# resource "azurerm_private_dns_zone" "core_file_dns" {
#   name                = var.core_file_dns_name #"privatelink.file.core.windows.net"
#   resource_group_name = var.core_resource_group_name
#   tags = merge(
#     var.tags,
#     {
#       environment = var.environment
#     }
#   )
#   provider = azurerm.core
# }

resource "azurerm_private_dns_zone_virtual_network_link" "core_file_link" {
  name                  = var.core_file_link_name #"privatelink.file.core.windows.net-link"
  resource_group_name   = var.core_resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.core_file_dns.name
  virtual_network_id    = var.core_vnet_id

  depends_on = [
    azurerm_private_dns_zone.core_file_dns
  ]
  provider = azurerm.core
}

# #Fahad
# resource "azurerm_private_dns_zone" "core_fap_dns" {
#   name                = var.core_fap_dns_name #"privatelink.blob.core.windows.net"
#   resource_group_name = var.core_resource_group_name
#   tags = merge(
#     var.tags,
#     {
#       environment = var.environment
#     }
#   )
#   provider = azurerm.core
# }

# resource "azurerm_private_dns_zone" "core_table_fap_dns" {
#   name                = var.core_table_fap_dns_name #"privatelink.table.core.windows.net"
#   resource_group_name = var.core_resource_group_name
#   tags = merge(
#     var.tags,
#     {
#       environment = var.environment
#     }
#   )
#   provider = azurerm.core
# }
# resource "azurerm_private_dns_zone" "core_queue_fap_dns" {
#   name                = var.core_queue_fap_dns_name #"privatelink.queue.core.windows.net"
#   resource_group_name = var.core_resource_group_name
#   tags = merge(
#     var.tags,
#     {
#       environment = var.environment
#     }
#   )
#   provider = azurerm.core
# }

resource "azurerm_private_dns_zone_virtual_network_link" "core_table_link" {
  name                  = var.core_table_link_name #"privatelink.table.core.windows.net-link"
  resource_group_name   = var.core_resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.core_table_fap_dns.name
  virtual_network_id    = var.core_vnet_id
  provider              = azurerm.core
  depends_on = [
    azurerm_private_dns_zone.core_table_fap_dns
  ]
}

resource "azurerm_private_dns_zone_virtual_network_link" "core_queue_link" {
  name                  = var.core_queue_link_name #"privatelink.queue.core.windows.net-link"
  resource_group_name   = var.core_resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.core_queue_fap_dns.name
  virtual_network_id    = var.core_vnet_id
  provider              = azurerm.core
}


resource "azurerm_private_dns_zone_virtual_network_link" "core_blob_link" {
  name                  = var.core_blob_link_name #"privatelink.blob.core.windows.net-link"
  resource_group_name   = var.core_resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.core_fap_dns.name
  virtual_network_id    = var.core_vnet_id
  provider              = azurerm.core
  depends_on = [
    azurerm_private_dns_zone.core_fap_dns
  ]
}

################################################
##                                            ##
##        Private DNS For KeyVault            ##
##                                            ##
################################################


# resource "azurerm_private_dns_zone" "core_vault" {
#   name                = var.core_vault_name
#   resource_group_name = var.core_resource_group_name
#   tags = merge(
#     var.tags,
#     {
#       environment = var.environment
#     }
#   )
#   provider = azurerm.core
# }


################################################
##                                            ##
##      Private Vnet Link For KeyVault        ##
##                                            ##
################################################

resource "azurerm_private_dns_zone_virtual_network_link" "core_link" {
  name                  = var.core_link_name
  resource_group_name   = var.core_resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.core_vault.name
  virtual_network_id    = var.core_vnet_id
  provider              = azurerm.core
  depends_on = [
    azurerm_private_dns_zone.core_vault
  ]

}


# resource "azurerm_private_dns_zone" "core_psql_dns" {
#   name                = var.core_psql_dns_name
#   resource_group_name = var.core_resource_group_name
#   tags = merge(
#     var.tags,
#     {
#       environment = var.environment
#     }
#   )
#   provider = azurerm.core
# }

resource "azurerm_private_dns_zone_virtual_network_link" "core_psql_dns_vnet" {
  name                  = var.core_psql_dns_vnet_name #"psql-dns-vnet"
  private_dns_zone_name = azurerm_private_dns_zone.core_psql_dns.name
  virtual_network_id    = var.core_vnet_id
  resource_group_name   = var.core_resource_group_name
  depends_on = [
    azurerm_private_dns_zone.core_psql_dns
  ]
  provider = azurerm.core
}


