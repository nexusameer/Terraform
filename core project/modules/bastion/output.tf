output "bastion_name" {
  value = azurerm_bastion_host.bastion_host.name
}

output "bastion_pip_name" {
  value = azurerm_public_ip.bastion_pip.name
}

output "bastion_pip_address" {
  value = azurerm_public_ip.bastion_pip.ip_address
}
