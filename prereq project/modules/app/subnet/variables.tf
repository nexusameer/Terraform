variable "environment" {}
variable "sensor_resource_group_name" {}
variable "app_sensor_vnet_name" {}
variable "webapp_sensor_subnet_name" {}
variable "private_endpoint_sensor_subnet_name" {}
variable "virtual_machine_sensor_subnet_name" {}
variable "webapp_sensor_address_prefix" { type = list(string) }
variable "private_endpoint_sensor_address_prefix" { type = list(string) }
variable "virtual_machine_sensor_address_prefix" { type = list(string) }