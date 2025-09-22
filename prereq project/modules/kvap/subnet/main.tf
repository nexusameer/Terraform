# resource "azurerm_subnet" "vm_gpu_kvap_subnet" {
#   name                 = "${var.vm_gpu_kvap_subnet_name}_${var.environment}"
#   resource_group_name  = var.kvap_rg_name
#   virtual_network_name = var.kvap_vnet_name
#   address_prefixes     = var.vm_gpu_kvap_subnet_prefix
#   provider             = azurerm.app
# }

# resource "azurerm_subnet" "vm_cpu_kvap_subnet" {
#   name                 = "${var.vm_cpu_kvap_subnet_name}_${var.environment}"
#   resource_group_name  = var.kvap_rg_name
#   virtual_network_name = var.kvap_vnet_name
#   address_prefixes     = var.vm_cpu_kvap_subnet_prefix
#   provider             = azurerm.app
# }

################################################
##                                            ##
##         SUBNET for KVAP VM  Subnet         ##
##                                            ##
################################################

resource "azurerm_subnet" "kvap_vm_subnet" {
  name                 = "${var.kvap_vm_subnet_name}_${var.environment}"
  resource_group_name  = var.kvap_rg_name
  virtual_network_name = var.kvap_vnet_name
  address_prefixes     = var.kvap_vm_address_prefix
  provider             = azurerm.app
}