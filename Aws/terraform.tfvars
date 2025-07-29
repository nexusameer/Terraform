# VPC Settings
vpc_cidr           = "10.0.0.0/16"
vpc_tenancy        = "default"
vpc_dns_support    = true
vpc_dns_hostnames  = true

# Subnets
sub1_cidr                = "10.0.0.0/24"
sub2_cidr                = "10.0.1.0/24"
map_public_ip_on_launch = true

# Instance
instance_type = "t2.micro"

# Application Load Balancer
alb_name     = "test-lb-tf"
alb_internal = false
alb_type     = "application"

# S3 Bucket
bucket = "nexus-test-bucket-xvczzzzzzwefr22"

# Target Group & HTTPS Certificate (use ACM cert ARN from your AWS account)
tg_name         = "my-target-group"


key_name   = "my-key"


