resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.rg_location
  resource_group_name = var.rg_name

  default_node_pool {
    name       = var.node_pool_name
    node_count = var.node_count
    vm_size    = var.vm_size
  }

}