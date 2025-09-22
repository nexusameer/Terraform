resource "azurerm_user_assigned_identity" "aks_uami" {
  name                = "${var.cluster_name}-${lower(var.environment)}-uami"
  location            = var.location
  resource_group_name = var.resource_group_name
  provider            = azurerm.apps
}

# Assign Private DNS Zone Contributor Role to UAMI
resource "azurerm_role_assignment" "aks_private_dns" {
  scope                = var.private_dns_zone_id
  role_definition_name = "Private DNS Zone Contributor"
  principal_id         = azurerm_user_assigned_identity.aks_uami.principal_id
  provider             = azurerm.apps
}

resource "azurerm_role_assignment" "aks_vnet_join" {
  scope                = var.gitlab_vnet_id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.aks_uami.principal_id
  provider             = azurerm.apps
}

resource "azurerm_kubernetes_cluster" "this" {
  name                    = "${upper(var.cluster_name)}_${upper(var.environment)}"
  location                = var.location
  resource_group_name     = var.resource_group_name
  dns_prefix              = "${var.dns_prefix}-dns"
  private_cluster_enabled = var.private_cluster_enabled
  # private_dns_zone_id     = var.private_dns_zone_id
  sku_tier                  = var.aks_sku_tier
  cost_analysis_enabled     = var.cost_analysis_enabled
  kubernetes_version        = var.kubernetes_version
  automatic_upgrade_channel = var.automatic_upgrade_channel

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
    network_policy    = "calico"
  }

  default_node_pool {
    name                        = var.default_node_pool_name
    temporary_name_for_rotation = "tempnode"
    node_count                  = var.node_count
    vm_size                     = var.node_size
    os_disk_size_gb             = var.node_os_disk_size
    vnet_subnet_id              = var.subnet_id
    auto_scaling_enabled        = var.auto_scaling_enabled
    min_count                   = var.min_count
    max_count                   = var.max_count
    zones                       = var.availability_zones
    upgrade_settings {
      drain_timeout_in_minutes      = var.drain_timeout_in_minutes
      max_surge                     = var.max_surge
      node_soak_duration_in_minutes = var.node_soak_duration_in_minutes
    }
  }

  lifecycle {
    ignore_changes = [default_node_pool[0].node_count]
  }

  identity {
    type = "SystemAssigned"
  }
  # identity {
  #   type         = "UserAssigned"
  #   identity_ids = [azurerm_user_assigned_identity.aks_uami.id]
  # }

  monitor_metrics {
    annotations_allowed = "*"
    labels_allowed      = "*"
  }

  oms_agent {
    # log_analytics_workspace_id = azurerm_log_analytics_workspace.this.
    log_analytics_workspace_id = var.log_analytics_workspace_id
  }

  workload_autoscaler_profile {
    keda_enabled                    = var.keda_enabled
    vertical_pod_autoscaler_enabled = var.vertical_pod_autoscaler_enabled
  }

  ingress_application_gateway {
    gateway_id = var.agw_id
  }

  tags     = var.tags
  provider = azurerm.apps
}

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      configuration_aliases = [
        azurerm.apps,
        azurerm.connectivity
      ]
    }
  }
}

resource "azurerm_role_assignment" "this" {
  principal_id                     = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = var.container_registry_id
  skip_service_principal_aad_check = true
  provider                         = azurerm.apps
}

resource "azurerm_role_assignment" "agic_reader" {
  scope                = var.resource_group_id
  role_definition_name = "Reader"
  principal_id         = azurerm_kubernetes_cluster.this.ingress_application_gateway[0].ingress_application_gateway_identity[0].object_id
  provider             = azurerm.apps
}

resource "azurerm_role_assignment" "agic_contributor" {
  scope                = var.agw_id
  role_definition_name = "Contributor"
  principal_id         = azurerm_kubernetes_cluster.this.ingress_application_gateway[0].ingress_application_gateway_identity[0].object_id
  provider             = azurerm.apps
}

resource "azurerm_role_assignment" "agic_network_contributor" {
  scope                = var.agic_subnet_id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_kubernetes_cluster.this.ingress_application_gateway[0].ingress_application_gateway_identity[0].object_id
  provider             = azurerm.apps
}

resource "azurerm_role_assignment" "agic_role" {
  scope                = azurerm_kubernetes_cluster.this.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.agic_identity.principal_id
  provider             = azurerm.apps
}

resource "azurerm_user_assigned_identity" "agic_identity" {
  name                = "${var.agic_identity_name}-${var.environment}"
  resource_group_name = var.resource_group_name
  location            = var.location
  provider            = azurerm.apps
}

################################################
##                                            ##
##      Private Endpoint For AKS              ##
##                                            ##
################################################

resource "azurerm_private_endpoint" "aks_private_endpoint" {
  name                = "${var.cluster_name}-${var.environment}-private-endpoint"
  location            = azurerm_kubernetes_cluster.this.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "aks-private-link-${var.environment}"
    private_connection_resource_id = azurerm_kubernetes_cluster.this.id
    subresource_names              = ["management"]
    is_manual_connection           = false
  }
  provider = azurerm.apps
  tags = merge(
    var.tags,
    {
      environment = var.environment
    }
  )
}

data "azurerm_private_endpoint_connection" "ple_connection" {
  name                = "${var.cluster_name}-${lower(var.environment)}-private-endpoint"
  resource_group_name = var.resource_group_name
  depends_on          = [azurerm_private_endpoint.aks_private_endpoint]
  provider            = azurerm.apps
}

locals {
  kube_ple_ip = data.azurerm_private_endpoint_connection.ple_connection.private_service_connection.0.private_ip_address
}

resource "azurerm_private_dns_a_record" "private_dns_a_record_in_aks" {
  name                = split(".privatelink.westeurope.azmk8s.io", azurerm_kubernetes_cluster.this.private_fqdn)[0]
  zone_name           = var.aks_private_dns_name
  resource_group_name = var.gitlab_rg_name
  ttl                 = var.ttl
  records             = [local.kube_ple_ip]
  depends_on          = [azurerm_private_endpoint.aks_private_endpoint]
  provider            = azurerm.connectivity
  tags = merge(
    var.tags,
    {
      environment = var.environment
    }
  )
}

################################################
##                                            ##
##      Log Analytics Workspace               ##
##                                            ##
################################################

# resource "azurerm_log_analytics_workspace" "this" {
#   name                = "aks-logs"
#   location            = var.location
#   resource_group_name = var.resource_group_name
#   sku                 = "PerGB2018"
#   retention_in_days   = 30
#   provider            = azurerm.apps
# }

################################################
##                                            ##
##      Enable Recommended Alerts             ##
##                                            ##
################################################

# resource "null_resource" "enable_aks_alert_rules" {
#   provisioner "local-exec" {
#     command = <<EOT
#       az version

#       az aks update \
#         --resource-group ${var.resource_group_name} \
#         --name "${var.cluster_name}_${lower(var.environment)}" \
#         --enable-managed-prometheus \
#         --enable-oidc-issuer \
#         --enable-workload-identity

#       az aks update-monitoring \
#         --resource-group ${var.resource_group_name} \
#         --name "${var.cluster_name}_${lower(var.environment)}" \
#         --enable-syslog \
#         --enable-prometheus-alerts \
#         --actions ${var.action_group_id}
#     EOT
#   }

#   depends_on = [
#     azurerm_kubernetes_cluster.this
#   ]

#   triggers = {
#     cluster_name = "${var.cluster_name}_${lower(var.environment)}"
#   }
# }