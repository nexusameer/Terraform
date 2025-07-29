variable "alb_name" {}
variable "alb_internal" {}
variable "alb_type" {}
variable "alb_security_group" {}
variable "alb_subnets" {
    type = list(string)
}