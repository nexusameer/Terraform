variable "ch_route_table_name" {}
variable "ch_route" {}
variable "ch_route_address_prefix" {}
variable "ch_next_hop_type" {}
variable "ch_next_hop_ip_address" {}
variable "environment" {}
variable "ch_resource_group_location" {}
variable "ch_resource_group_name" {}
variable "ch_aks_subnet_id" {}
variable "ch_db_subnet_id" {}
variable "ch_pe_subnet_id" {}
variable "tags" {}

variable "ch_internet_route_table_name" {}
variable "ch_appgtw_subnet_id" {}
variable "ch_routes" {
  default = {}
}
