data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

module "vpc" {
    source = "./modules/vpc"
    myvpc_tenancy = var.vpc_tenancy
    myvpc_cidr = var.vpc_cidr
    myvpc_dns_support = var.vpc_dns_support
    myvpc_dns_hostnames = var.vpc_dns_hostnames
}

module "subnet" {
    source = "./modules/subnet"
    vpc_id = module.vpc.vpc_id
    sub1_cidr = var.sub1_cidr
    sub2_cidr = var.sub2_cidr
    map_public_ip_on_launch = var.map_public_ip_on_launch
}

module "internal_gateway" {
    source = "./modules/internet_gateway"
    vpc_id = module.vpc.vpc_id
}

module "routes" {
  source     = "./modules/route_table"
  gateway_id = module.internal_gateway.internet_gateway_id
  vpc_id     = module.vpc.vpc_id
  subnet1_id = module.subnet.subnet1_id
  subnet2_id = module.subnet.subnet2_id
}


module "security_group" {
    source = "./modules/security_group"
    vpc_id = module.vpc.vpc_id
    cidr_ipv4 = var.vpc_cidr
}

module "instance" {
    source = "./modules/instance"
    ami           = data.aws_ami.ubuntu.id
    instance_type = var.instance_type
    vpc_security_group_ids = module.security_group.vpc_security_group_id
    subnet_id   = module.subnet.subnet2_id
    key_name = module.key.key_name
}

module "load_balancer" {
    source = "./modules/alb"
    alb_security_group = module.security_group.vpc_security_group_id
    alb_type = var.alb_type
    alb_internal = var.alb_internal
    alb_name = var.alb_name
    alb_subnets = [module.subnet.subnet1_id, module.subnet.subnet2_id]
}

module "target_group" {
    source = "./modules/tg"
    instance1_id = module.instance.instance1_id
    instance2_id = module.instance.instance2_id
    vpc_id = module.vpc.vpc_id
    tg_name = var.tg_name
}

module "bucket" {
    source = "./modules/s3"
    bucket = var.bucket
}


module "key" {
    source = "./modules/kp"
    key_name = var.key_name
}