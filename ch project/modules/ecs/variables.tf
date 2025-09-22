variable "ecs_name" {}
variable "azurerm_resource_group" {}
variable "data_location" {
  default = "Europe"
}
variable "ecs_service_domain_name" {}
variable "domain_management" {
  default = "AzureManaged"
}