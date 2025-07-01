variable "tenant_id" {
  type        = string
  sensitive   = true
  description = "Azure AD Tenant ID"
}

variable "subscription_id" {
  type        = string
  sensitive   = true
  description = "Azure Subscription ID"
}

variable "client_id" {
  type        = string
  sensitive   = true
  description = "Service Principal Application ID"
}

variable "client_secret" {
  type        = string
  sensitive   = true
  description = "Service Principal Client Secret"
}
variable "location" {
    type = string
}
variable "rg_name" {
    type = string
}
variable "vnet_name" {
    type = string
}
variable "storage_name"    { 
    type = string 
}
variable "account_tier"    { 
    type = string 
}
variable "replication_type"{ 
    type = string
} 
variable "subnet_prefixes" { 
    type = list(string) 
}
variable "address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}