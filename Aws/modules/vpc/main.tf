resource "aws_vpc" "myvpc" {
  cidr_block       = var.myvpc_cidr
  instance_tenancy = var.myvpc_tenancy
  enable_dns_support = var.myvpc_dns_support
  enable_dns_hostnames = var.myvpc_dns_hostnames


}