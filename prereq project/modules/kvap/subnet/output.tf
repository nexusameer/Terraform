# output "vm_gpu_kvap_subnet_name" {
#   value = azurerm_subnet.vm_gpu_kvap_subnet.name
# }
# output "vm_gpu_kvap_subnet_id" {
#   value = azurerm_subnet.vm_gpu_kvap_subnet.id
# }
# output "vm_gpu_kvap_subnet_ip_range" {
#   value = azurerm_subnet.vm_gpu_kvap_subnet.address_prefixes
# }
# output "vm_cpu_kvap_subnet_name" {
#   value = azurerm_subnet.vm_cpu_kvap_subnet.name
# }
# output "vm_cpu_kvap_subnet_id" {
#   value = azurerm_subnet.vm_cpu_kvap_subnet.id
# }
output "kvap_vm_subnet_name" {
  value = azurerm_subnet.kvap_vm_subnet.name
}

output "kvap_vm_subnet_id" {
  value = azurerm_subnet.kvap_vm_subnet.id
}

output "kvap_vm_subnet_address_prefixes" {
  value = azurerm_subnet.kvap_vm_subnet.address_prefixes
}