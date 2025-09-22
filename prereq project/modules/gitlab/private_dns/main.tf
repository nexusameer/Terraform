################################################
##                                            ##
##      Private Vnet Link For ACR Core        ##
##                                            ##
################################################

resource "azurerm_private_dns_zone_virtual_network_link" "gitlab_acr_link" {
  name                  = var.gitlab_acr_link_name
  resource_group_name   = var.core_resource_group_name
  private_dns_zone_name = var.core_acr_private_dns_name
  virtual_network_id    = var.gitlab_vnet_id
  tags = merge(
    var.tags,
    {
      environment = var.environment
    }
  )
  provider = azurerm.core
}

################################################
##                                            ##
##      Private Vnet Link For Postgres        ##
##                                            ##
################################################

resource "azurerm_private_dns_zone_virtual_network_link" "gitlab_postgres_link" {
  name                  = var.gitlab_psql_dns_vnet_name #"plink-to-gitlab-vnet-for-psql"
  private_dns_zone_name = var.core_psql_private_dns_name
  virtual_network_id    = var.gitlab_vnet_id
  resource_group_name   = var.core_resource_group_name
  tags = merge(
    var.tags,
    {
      environment = var.environment
    }
  )
  provider = azurerm.core
}

################################################
##                                            ##
##      Private Vnet Link For BatchAccount    ##
##                                            ##
################################################

resource "azurerm_private_dns_zone_virtual_network_link" "gitlab_batch_link" {
  name                  = var.gitlab_batch_link_name
  resource_group_name   = var.core_resource_group_name
  private_dns_zone_name = var.core_batch_private_dns_name
  virtual_network_id    = var.gitlab_vnet_id
  tags = merge(
    var.tags,
    {
      environment = var.environment
    }
  )
  provider = azurerm.core
}