variable "service_plan_name" {}
variable "location" {}
variable "core_rg_name" {}
variable "environment" {}
variable "created_by" {}
variable "maximum_elastic_worker_count" {
  default = 1
}
variable "premium_plan_auto_scale_enabled" {
  default = true
}
variable "worker_count" {
  default = 1
}