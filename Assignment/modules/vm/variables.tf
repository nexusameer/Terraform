variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "network_interface_id" {
  description = "ID of the network interface"
  type        = string
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
}

variable "admin_user" {
  description = "Admin username for the VM"
  type        = string
}

variable "admin_pass" {
  description = "Admin password for the VM"
  type        = string
}
