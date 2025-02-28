variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "rg_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "storage_account_name" {
  description = "Storage Account Name"
  type        = string
}

variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
}

variable "subnet_name" {
  description = "Subnet Name"
  type        = string
}

variable "address_space" {
  description = "Address space for VNet"
  type        = list(string)
}

variable "subnet_prefix" {
  description = "Subnet prefix"
  type        = list(string)
}

variable "nic_name" {
  description = "Network Interface Name"
  type        = string
}

variable "vm_name" {
  description = "Virtual Machine Name"
  type        = string
}

variable "vm_size" {
  description = "Size of Virtual Machine"
  type        = string
}

variable "admin_user" {
  description = "Admin Username for VM"
  type        = string
}

variable "admin_pass" {
  description = "Admin Password for VM"
  type        = string
  sensitive   = true
}
