# =========================
# Security Group
# =========================
resource "aws_security_group" "awseb_up_lb" {
  name        = var.awseb_up_lb_name
  description = var.awseb_up_lb_desc
  vpc_id      = var.vpc_id

  tags = {
    Name                                   = "qc-web-qa4"
    aws:cloudformation:stack-name          = "awseb-e-upgmarpe38-stack"
    elasticbeanstalk:environment-id        = "e-upgmarpe38"
    aws:cloudformation:stack-id            = "arn:aws:cloudformation:us-east-2:474753614394:stack/awseb-e-upgmarpe38-stack/8defdc70-cd1f-11ec-906e-0253c5901f52"
    elasticbeanstalk:environment-name      = "qc-web-qa4"
    aws:cloudformation:logical-id          = "AWSEBLoadBalancerSecurityGroup"
  }
}

# =========================
# Ingress Rules
# =========================
resource "aws_vpc_security_group_ingress_rule" "allow_https_ipv4" {
  security_group_id = aws_security_group.awseb-up-lb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.awseb_up_lb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

# =========================
# Egress Rules
# =========================
resource "aws_vpc_security_group_egress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.awseb_up_lb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "allow_https_ipv4" {
  security_group_id = aws_security_group.awseb_up_lb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}


resource "aws_security_group" "awseb-mr" {
  name        = var.awseb_mr_name
  description = var.awseb_mr_desc
  vpc_id      = var.vpc_id

  tags = {
  }
}

# =========================
# Security Group
# =========================
resource "aws_security_group" "awseb_mr" {
  name        = var.awseb_mr_name
  description = var.awseb_mr_desc
  vpc_id      = var.vpc_id

  tags = {
    Name                                  = "qc-web-preprod4-worker"
    elasticbeanstalk:environment-id       = "e-mrasittm6p"
    aws:cloudformation:logical-id         = "AWSEBSecurityGroup"
    aws:cloudformation:stack-id           = "arn:aws:cloudformation:us-east-2:474753614394:stack/awseb-e-mrasittm6p-stack/aaefc890-ed3a-11ec-af68-0aa11c8d781e"
    elasticbeanstalk:environment-name     = "qc-web-preprod4-worker"
    aws:cloudformation:stack-name         = "awseb-e-mrasittm6p-stack"
  }
}

# =========================
# Ingress Rules
# =========================
resource "aws_vpc_security_group_ingress_rule" "allow_https_from_lb_sg" {
  security_group_id        = aws_security_group.awseb_mr.id
#   source_security_group_id = aws_security_group.awseb_mr_lb.id
  from_port                = 443
  to_port                  = 443
  ip_protocol              = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_from_lb_sg" {
  security_group_id        = aws_security_group.awseb_mr.id
#   source_security_group_id = aws_security_group.awseb_mr_lb.id
  from_port                = 80
  to_port                  = 80
  ip_protocol              = "tcp"
}

# =========================
# Egress Rule
# =========================
resource "aws_vpc_security_group_egress_rule" "allow_all_ipv4" {
  security_group_id = aws_security_group.awseb_mr.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 0
  to_port           = 0
  ip_protocol       = "-1"
}



# =========================
# Security Group
# =========================


resource "aws_security_group" "awseb_vc_lb" {
  name        = var.awseb_vc_lb_name
  description = var.awseb_vc_lb_desc
  vpc_id      = var.vpc_id

  tags = {
    Name                              = "qc-web-prod4"
    aws:cloudformation:stack-name     = "awseb-e-vc38fj8gj7-stack"
    elasticbeanstalk:environment-name = "qc-web-prod4"
    aws:cloudformation:stack-id       = "arn:aws:cloudformation:us-east-2:474753614394:stack/awseb-e-vc38fj8gj7-stack/5e5dcda0-f092-11ec-bdea-0a2265bc39a8"
    aws:cloudformation:logical-id     = "AWSEBLoadBalancerSecurityGroup"
    elasticbeanstalk:environment-id   = "e-vc38fj8gj7"
  }
}

# =========================
# Ingress Rules
# =========================
resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.awseb_vc_lb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "allow_https_ipv4" {
  security_group_id = aws_security_group.awseb_vc_lb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}

# =========================
# Egress Rules
# =========================
resource "aws_vpc_security_group_egress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.awseb_vc_lb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "allow_https_ipv4" {
  security_group_id = aws_security_group.awseb_vc_lb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}

# =========================
# Security Group
# =========================
resource "aws_security_group" "awseb_mr_lb" {
  name        = var.awseb_mr_lb_name
  description = var.awseb_mr_lb_desc
  vpc_id      = var.vpc_id

  tags = {
    Name                              = "qc-web-preprod4-worker"
    aws:cloudformation:stack-id       = "arn:aws:cloudformation:us-east-2:474753614394:stack/awseb-e-mrasittm6p-stack/aaefc890-ed3a-11ec-af68-0aa11c8d781e"
    aws:cloudformation:logical-id     = "AWSEBLoadBalancerSecurityGroup"
    elasticbeanstalk:environment-name = "qc-web-preprod4-worker"
    aws:cloudformation:stack-name     = "awseb-e-mrasittm6p-stack"
    elasticbeanstalk:environment-id   = "e-mrasittm6p"
  }
}

# =========================
# Ingress Rules
# =========================
resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.awseb_mr_lb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "allow_https_ipv4" {
  security_group_id = aws_security_group.awseb_mr_lb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}

# =========================
# Egress Rules
# =========================
resource "aws_vpc_security_group_egress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.awseb_mr_lb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "allow_https_ipv4" {
  security_group_id = aws_security_group.awseb_mr_lb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}


# =========================
# Security Group
# =========================
resource "aws_security_group" "awseb_4d_lb" {
  name        = var.awseb_4d_lb_name
  description = var.awseb_4d_lb_desc
  vpc_id      = var.vpc_id

  tags = {
    Name                              = "qc-web-preprod4"
    elasticbeanstalk:environment-id   = "e-4dqnmxqp9q"
    aws:cloudformation:logical-id     = "AWSEBLoadBalancerSecurityGroup"
    aws:cloudformation:stack-id       = "arn:aws:cloudformation:us-east-2:474753614394:stack/awseb-e-4dqnmxqp9q-stack/5b28ada0-ed4d-11ec-abd6-06a47b5c6c6a"
    elasticbeanstalk:environment-name = "qc-web-preprod4"
    aws:cloudformation:stack-name     = "awseb-e-4dqnmxqp9q-stack"
  }
}

# =========================
# Ingress Rules
# =========================
# From default SG
resource "aws_vpc_security_group_ingress_rule" "http_from_default" {
  security_group_id        = aws_security_group.awseb_4d_lb.id
#   source_security_group_id = "sg-1f3b5977"  default security Groyup
  from_port                = 80
  to_port                  = 80
  ip_protocol              = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "https_from_default" {
  security_group_id        = aws_security_group.awseb_4d_lb.id
#   source_security_group_id = "sg-1f3b5977" default security Groyup
  from_port                = 443
  to_port                  = 443
  ip_protocol              = "tcp"
}

# From anywhere (0.0.0.0/0)
resource "aws_vpc_security_group_ingress_rule" "http_from_anywhere" {
  security_group_id = aws_security_group.awseb_4d_lb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "https_from_anywhere" {
  security_group_id = aws_security_group.awseb_4d_lb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}

# From QC-Primary-Internal_and_VPN-Access (sg-01b50c1a09059de48)
resource "aws_vpc_security_group_ingress_rule" "http_from_qc_primary" {
  security_group_id        = aws_security_group.awseb_4d_lb.id
#   source_security_group_id = "sg-01b50c1a09059de48"
  from_port                = 80
  to_port                  = 80
  ip_protocol              = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "https_from_qc_primary" {
  security_group_id        = aws_security_group.awseb_4d_lb.id
#   source_security_group_id = "sg-01b50c1a09059de48"
  from_port                = 443
  to_port                  = 443
  ip_protocol              = "tcp"
}

# From qc-vpn (sg-093f62742b7dd6ee9)
resource "aws_vpc_security_group_ingress_rule" "http_from_vpn" {
  security_group_id        = aws_security_group.awseb_4d_lb.id
#   source_security_group_id = "sg-093f62742b7dd6ee9"
  from_port                = 80
  to_port                  = 80
  ip_protocol              = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "https_from_vpn" {
  security_group_id        = aws_security_group.awseb_4d_lb.id
#   source_security_group_id = "sg-093f62742b7dd6ee9"
  from_port                = 443
  to_port                  = 443
  ip_protocol              = "tcp"
}

# =========================
# Egress Rules
# =========================
resource "aws_vpc_security_group_egress_rule" "http_to_anywhere" {
  security_group_id = aws_security_group.awseb_4d_lb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "https_to_anywhere" {
  security_group_id = aws_security_group.awseb_4d_lb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}


# =========================
# Security Group
# =========================
resource "aws_security_group" "awseb_zb_lb" {
  name        = var.awseb_zb_lb_name
  description = var.awseb_zb_lb_desc
  vpc_id      = var.vpc_id

  tags = {
    Name                              = "qc-web-qa4-worker"
    aws:cloudformation:stack-name     = "awseb-e-zbhhf5ffpf-stack"
    aws:cloudformation:logical-id     = "AWSEBLoadBalancerSecurityGroup"
    elasticbeanstalk:environment-id   = "e-zbhhf5ffpf"
    elasticbeanstalk:environment-name = "qc-web-qa4-worker"
    aws:cloudformation:stack-id       = "arn:aws:cloudformation:us-east-2:474753614394:stack/awseb-e-zbhhf5ffpf-stack/8976b2a0-dd81-11ec-bdca-0aebcf018542"
  }
}

# =========================
# Ingress Rules
# =========================
resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.awseb_zb_lb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "allow_https_ipv4" {
  security_group_id = aws_security_group.awseb_zb_lb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}

# =========================
# Egress Rules
# =========================
resource "aws_vpc_security_group_egress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.awseb_zb_lb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

# =========================
# Security Group
# =========================
resource "aws_security_group" "awseb_2n" {
  name        = var.awseb_2n_name
  description = var.awseb_2n_desc
  vpc_id      = var.vpc_id

  tags = {
    Name                              = "qc-web-prod4-worker"
    aws:cloudformation:stack-name     = "awseb-e-2nre85mi2d-stack"
    aws:cloudformation:logical-id     = "AWSEBSecurityGroup"
    elasticbeanstalk:environment-id   = "e-2nre85mi2d"
    elasticbeanstalk:environment-name = "qc-web-prod4-worker"
    aws:cloudformation:stack-id       = "arn:aws:cloudformation:us-east-2:474753614394:stack/awseb-e-2nre85mi2d-stack/e7079570-f095-11ec-bbf7-0aa30cb0c1b2"
  }
}

# =========================
# Ingress Rules
# =========================
resource "aws_vpc_security_group_ingress_rule" "allow_http_from_lb" {
  security_group_id            = aws_security_group.awseb_2n.id
#   referenced_security_group_id = "sg-0b1fbb608d017cee6"
  from_port                    = 80
  to_port                      = 80
  ip_protocol                  = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "allow_https_from_lb" {
  security_group_id            = aws_security_group.awseb_2n.id
#   referenced_security_group_id = "sg-0b1fbb608d017cee6"
  from_port                    = 443
  to_port                      = 443
  ip_protocol                  = "tcp"
}

# =========================
# Egress Rules
# =========================
resource "aws_vpc_security_group_egress_rule" "allow_all_ipv4" {
  security_group_id = aws_security_group.awseb_2n.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # all protocols
}


# =========================
# Security Group
# =========================
resource "aws_security_group" "awseb_up" {
  name        = var.awseb_up_name
  description = var.awseb_up_desc
  vpc_id      = var.vpc_id

  tags = {
    Name                              = "qc-web-qa4"
    aws:cloudformation:stack-name     = "awseb-e-upgmarpe38-stack"
    aws:cloudformation:logical-id     = "AWSEBSecurityGroup"
    elasticbeanstalk:environment-id   = "e-upgmarpe38"
    elasticbeanstalk:environment-name = "qc-web-qa4"
    aws:cloudformation:stack-id       = "arn:aws:cloudformation:us-east-2:474753614394:stack/awseb-e-upgmarpe38-stack/8defdc70-cd1f-11ec-906e-0253c5901f52"
  }
}

# =========================
# Ingress Rules
# =========================
resource "aws_vpc_security_group_ingress_rule" "allow_http_from_lb" {
  security_group_id            = aws_security_group.awseb_up.id
#   referenced_security_group_id = "sg-0187f599c35682166"
  from_port                    = 80
  to_port                      = 80
  ip_protocol                  = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "allow_https_from_lb" {
  security_group_id            = aws_security_group.awseb_up.id
#   referenced_security_group_id = "sg-0187f599c35682166"
  from_port                    = 443
  to_port                      = 443
  ip_protocol                  = "tcp"
}

# =========================
# Egress Rules
# =========================
resource "aws_vpc_security_group_egress_rule" "allow_all_ipv4" {
  security_group_id = aws_security_group.awseb_up.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # all protocols
}

# =========================
# Security Group (Load Balancer)
# =========================
resource "aws_security_group" "awseb_2n_lb" {
  name        = var.awseb_2n_lb_name
  description = var.awseb_2n_lb_desc
  vpc_id      = var.vpc_id

  tags = {
    Name                              = "qc-web-prod4-worker"
    aws:cloudformation:stack-name     = "awseb-e-2nre85mi2d-stack"
    aws:cloudformation:logical-id     = "AWSEBLoadBalancerSecurityGroup"
    aws:cloudformation:stack-id       = "arn:aws:cloudformation:us-east-2:474753614394:stack/awseb-e-2nre85mi2d-stack/e7079570-f095-11ec-bbf7-0aa30cb0c1b2"
    elasticbeanstalk:environment-name = "qc-web-prod4-worker"
    elasticbeanstalk:environment-id   = "e-2nre85mi2d"
  }
}

# =========================
# Ingress Rules
# =========================
resource "aws_vpc_security_group_ingress_rule" "awseb_2n_lb_http" {
  security_group_id = aws_security_group.awseb_2n_lb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "awseb_2n_lb_https" {
  security_group_id = aws_security_group.awseb_2n_lb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}

# =========================
# Egress Rules
# =========================
resource "aws_vpc_security_group_egress_rule" "awseb_2n_lb_http_out" {
  security_group_id = aws_security_group.awseb_2n_lb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "awseb_2n_lb_https_out" {
  security_group_id = aws_security_group.awseb_2n_lb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}

# =========================
# Security Group (Instances)
# =========================
resource "aws_security_group" "awseb_4d" {
  name        = var.awseb_4d_name
  description = var.awseb_4d_desc
  vpc_id      = var.vpc_id

  tags = {
    Name                              = "qc-web-preprod4"
    aws:cloudformation:stack-name     = "awseb-e-4dqnmxqp9q-stack"
    aws:cloudformation:logical-id     = "AWSEBSecurityGroup"
    aws:cloudformation:stack-id       = "arn:aws:cloudformation:us-east-2:474753614394:stack/awseb-e-4dqnmxqp9q-stack/5b28ada0-ed4d-11ec-abd6-06a47b5c6c6a"
    elasticbeanstalk:environment-name = "qc-web-preprod4"
    elasticbeanstalk:environment-id   = "e-4dqnmxqp9q"
  }
}

# =========================
# Ingress Rules (from LB SG only)
# =========================
resource "aws_vpc_security_group_ingress_rule" "awseb_4d_http" {
  security_group_id            = aws_security_group.awseb_4d.id
  referenced_security_group_id = aws_security_group.awseb_4d_lb.id # Load Balancer SG
  from_port                    = 80
  to_port                      = 80
  ip_protocol                  = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "awseb_4d_https" {
  security_group_id            = aws_security_group.awseb_4d.id
  referenced_security_group_id = aws_security_group.awseb_4d_lb.id # Load Balancer SG
  from_port                    = 443
  to_port                      = 443
  ip_protocol                  = "tcp"
}

# =========================
# Egress Rules (allow all)
# =========================
resource "aws_vpc_security_group_egress_rule" "awseb_4d_all_out" {
  security_group_id = aws_security_group.awseb_4d.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # all traffic
}


# =========================
# Security Group (Instances)
# =========================
resource "aws_security_group" "awseb_vc" {
  name        = var.awseb_vc_name
  description = var.awseb_vc_desc
  vpc_id      = var.vpc_id

  tags = {
    Name                              = "qc-web-prod4"
    aws:cloudformation:stack-name     = "awseb-e-vc38fj8gj7-stack"
    aws:cloudformation:logical-id     = "AWSEBSecurityGroup"
    aws:cloudformation:stack-id       = "arn:aws:cloudformation:us-east-2:474753614394:stack/awseb-e-vc38fj8gj7-stack/5e5dcda0-f092-11ec-bdea-0a2265bc39a8"
    elasticbeanstalk:environment-name = "qc-web-prod4"
    elasticbeanstalk:environment-id   = "e-vc38fj8gj7"
  }
}

# =========================
# Ingress Rules (from LB SG only)
# =========================
resource "aws_vpc_security_group_ingress_rule" "awseb_vc_http" {
  security_group_id            = aws_security_group.awseb_vc.id
  referenced_security_group_id = aws_security_group.awseb_vc_lb.id # LB SG reference
  from_port                    = 80
  to_port                      = 80
  ip_protocol                  = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "awseb_vc_https" {
  security_group_id            = aws_security_group.awseb_vc.id
  referenced_security_group_id = aws_security_group.awseb_vc_lb.id # LB SG reference
  from_port                    = 443
  to_port                      = 443
  ip_protocol                  = "tcp"
}

# =========================
# Egress Rules (allow all)
# =========================
resource "aws_vpc_security_group_egress_rule" "awseb_vc_all_out" {
  security_group_id = aws_security_group.awseb_vc.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # all traffic
}





# =========================
# Security Group (Worker Instances)
# =========================
resource "aws_security_group" "awseb_zb" {
  name        = var.awseb_zb_name
  description = var.awseb_zb_desc
  vpc_id      = var.vpc_id

  tags = {
    Name                              = "qc-web-qa4-worker"
    aws:cloudformation:stack-name     = "awseb-e-zbhhf5ffpf-stack"
    aws:cloudformation:logical-id     = "AWSEBSecurityGroup"
    aws:cloudformation:stack-id       = "arn:aws:cloudformation:us-east-2:474753614394:stack/awseb-e-zbhhf5ffpf-stack/8976b2a0-dd81-11ec-bdca-0aebcf018542"
    elasticbeanstalk:environment-name = "qc-web-qa4-worker"
    elasticbeanstalk:environment-id   = "e-zbhhf5ffpf"
  }
}

# =========================
# Ingress Rule (from LB SG only)
# =========================
resource "aws_vpc_security_group_ingress_rule" "awseb_zb_http" {
  security_group_id            = aws_security_group.awseb_zb.id
  referenced_security_group_id = aws_security_group.awseb_zb_lb.id # LB SG reference
  from_port                    = 80
  to_port                      = 80
  ip_protocol                  = "tcp"
}

# =========================
# Egress Rule (allow all)
# =========================
resource "aws_vpc_security_group_egress_rule" "awseb_zb_all_out" {
  security_group_id = aws_security_group.awseb_zb.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # all traffic
}
