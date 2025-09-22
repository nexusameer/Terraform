resource "azurerm_kubernetes_cluster_node_pool" "nodepool" {
  name                  = var.node_pool_name
  kubernetes_cluster_id = var.kubernetes_cluster_id
  vm_size               = var.vm_size
  node_count            = var.node_count
  vnet_subnet_id        = var.vnet_subnet_id
  auto_scaling_enabled  = var.auto_scaling_enabled
  min_count             = var.node_min_count
  max_count             = var.node_max_count
  tags                  = var.tags
}

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}