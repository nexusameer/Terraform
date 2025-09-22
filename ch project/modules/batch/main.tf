
resource "azurerm_batch_account" "az-ba-we-lss-core" {
  provider                      = azurerm.core
  name                          = var.batch_name
  location                      = var.core_rg_location
  resource_group_name           = var.core_rg
  public_network_access_enabled = false
  pool_allocation_mode          = "BatchService"
  identity {
    type = "UserAssigned"
    identity_ids = [
      var.batch_identity
    ]
  }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
}

resource "azurerm_role_assignment" "batch_contributor" {
  provider             = azurerm.core
  principal_id         = var.batch_identity_principal_id
  role_definition_name = "Azure Batch Account Contributor"
  scope                = azurerm_batch_account.az-ba-we-lss-core.id
  depends_on           = [azurerm_batch_account.az-ba-we-lss-core]
}


resource "azurerm_private_endpoint" "batch_private_endpoint" {
  provider            = azurerm.core
  name                = var.batch_pe_name
  location            = var.core_rg_location
  resource_group_name = var.core_rg
  subnet_id           = var.core_pe_subnet_id

  private_service_connection {
    name                           = "${var.batch_pe_name}-psc"
    private_connection_resource_id = azurerm_batch_account.az-ba-we-lss-core.id
    is_manual_connection           = false
    subresource_names              = ["batchAccount"]
  }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
  depends_on = [azurerm_batch_account.az-ba-we-lss-core]
}

resource "azurerm_private_endpoint" "nodemanagement_private_endpoint" {
  provider            = azurerm.core
  name                = var.node_management
  location            = var.core_rg_location
  resource_group_name = var.core_rg
  subnet_id           = var.core_pe_subnet_id

  private_service_connection {
    name                           = var.node_management
    private_connection_resource_id = azurerm_batch_account.az-ba-we-lss-core.id
    is_manual_connection           = false
    subresource_names              = ["nodeManagement"]
  }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
  depends_on = [azurerm_batch_account.az-ba-we-lss-core]
}

resource "azurerm_private_dns_a_record" "batch_private_dns" {
  provider            = azurerm.connectivity
  name                = split(".batch.azure.com", azurerm_private_endpoint.batch_private_endpoint.custom_dns_configs[0].fqdn)[0]
  zone_name           = var.batch_private_dns_zone_name
  resource_group_name = var.gitlab_resource_group_name
  ttl                 = 60
  records             = azurerm_private_endpoint.batch_private_endpoint.custom_dns_configs[0].ip_addresses
  depends_on          = [azurerm_private_endpoint.batch_private_endpoint]
}

resource "azurerm_private_dns_a_record" "node_private_dns" {
  provider            = azurerm.connectivity
  name                = split(".batch.azure.com", azurerm_private_endpoint.nodemanagement_private_endpoint.custom_dns_configs[0].fqdn)[0]
  zone_name           = var.batch_private_dns_zone_name
  resource_group_name = var.gitlab_resource_group_name
  ttl                 = 60
  records             = azurerm_private_endpoint.nodemanagement_private_endpoint.custom_dns_configs[0].ip_addresses
  depends_on          = [azurerm_private_endpoint.nodemanagement_private_endpoint]
}

resource "time_sleep" "wait_1_min" {
  depends_on      = [azurerm_private_endpoint.batch_private_endpoint, azurerm_private_endpoint.nodemanagement_private_endpoint, azurerm_private_dns_a_record.batch_private_dns, azurerm_private_dns_a_record.node_private_dns]
  create_duration = "60s"
}

################################################
##                                            ##
##               Batch Pool                   ##
##                                            ##
################################################

resource "azurerm_batch_pool" "batch_pool" {
  provider            = azurerm.core
  name                = var.batch_pool_name
  resource_group_name = var.core_rg
  account_name        = azurerm_batch_account.az-ba-we-lss-core.name
  vm_size             = "Standard_D2s_v3"
  node_agent_sku_id   = "batch.node.ubuntu 20.04"
  max_tasks_per_node  = 7
  fixed_scale {
    target_dedicated_nodes    = 1
    target_low_priority_nodes = 0
  }



  storage_image_reference {
    publisher = "microsoft-azure-batch"
    offer     = "ubuntu-server-container"
    sku       = "20-04-lts"
    version   = "latest"
  }


  container_configuration {
    container_image_names = ["${var.acr_login_server_name}/${var.acr_image_name}:latest"]
    type                  = "DockerCompatible"
    container_registries {
      registry_server           = var.acr_login_server_name
      user_assigned_identity_id = var.batch_identity
    }
  }

  target_node_communication_mode = "Simplified"


  network_configuration {
    subnet_id                        = var.core_batch_account_subnet_id
    public_address_provisioning_type = "NoPublicIPAddresses"
  }

  identity {
    type = "UserAssigned"
    identity_ids = [
      var.batch_identity
    ]
  }

  inter_node_communication = "Disabled"

  node_placement {
    policy = "Regional"
  }

  task_scheduling_policy {
    node_fill_type = "Pack"
  }


  lifecycle {
    ignore_changes = [
      # container_configuration,
      # start_task
    ]
  }
  depends_on = [time_sleep.wait_1_min]
}

resource "azurerm_role_assignment" "batch_pool_contributor" {
  provider             = azurerm.core
  principal_id         = var.batch_identity_principal_id
  role_definition_name = "Contributor"
  scope                = azurerm_batch_pool.batch_pool.id
  depends_on           = [azurerm_batch_pool.batch_pool]
}

resource "azurerm_batch_job" "batch_job" {
  provider      = azurerm.core
  name          = "job"
  batch_pool_id = azurerm_batch_pool.batch_pool.id
  depends_on    = [azurerm_batch_pool.batch_pool]
}

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      configuration_aliases = [
        azurerm.core,
        azurerm.connectivity
      ]
    }
  }
}
