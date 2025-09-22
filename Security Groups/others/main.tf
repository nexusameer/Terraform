# =========================
# Security Group
# =========================

resource "aws_security_group" "launch-wizard-5" {
  name        = var.launch-wizard-5_name
  description = var.launch-wizard-5_desc
  vpc_id      = var.vpc_id

  tags = {
    Name = "launch-wizard-5"
  }
}

# Allow HTTP (80) from anywhere
resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.launch-wizard-5.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
  description       = "Allow HTTP"
}

# Allow HTTPS (443) from anywhere
resource "aws_vpc_security_group_ingress_rule" "allow_https_ipv4" {
  security_group_id = aws_security_group.launch-wizard-5.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
  description       = "Allow HTTPS"
}

# Allow all outbound
resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.launch-wizard-5.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # all protocols
  description       = "Allow all outbound traffic"
}

# =========================
# Security Group
# =========================

resource "aws_security_group" "qc-web-qa-SG" {
  name        = var.qc-web-qa-SG_name
  description = var.qc-web-qa-SG_desc
  vpc_id      = var.vpc_id

  tags = {
    Name = "qc-web-qa-SG"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_all_self" {
  security_group_id            = aws_security_group.qc-web-qa-SG.id
  # referenced_security_group_id = aws_security_group.qc-web-qa-SG.id
  ip_protocol                  = "-1" # all traffic
  description                  = "Allow ALL-Traffic from itself"
}

resource "aws_vpc_security_group_ingress_rule" "allow_tcp_3000_from_alb" {
  security_group_id            = aws_security_group.qc-web-qa-SG.id
  # referenced_security_group_id = aws_security_group.qc-web-qa-ALB-SG.id
  from_port                    = 3000
  to_port                      = 3000
  ip_protocol                  = "tcp"
  description                  = "Allow 3000 from ALB for healthchecks"
}

resource "aws_vpc_security_group_ingress_rule" "allow_all_from_vpn" {
  security_group_id            = aws_security_group.qc-web-qa-SG.id
  # referenced_security_group_id = aws_security_group.qc-vpn.id
  ip_protocol                  = "-1"
  description                  = "Allow All Traffic from VPN"
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_from_alb" {
  security_group_id            = aws_security_group.qc-web-qa-SG.id
  # referenced_security_group_id = aws_security_group.qc-web-qa-ALB-SG.id
  from_port                    = 80
  to_port                      = 80
  ip_protocol                  = "tcp"
  description                  = "Allow HTTP from ALB"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.qc-web-qa-SG.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
  description       = "Allow all outbound traffic"
}

# =========================
# Security Group
# =========================

resource "aws_security_group" "cliplibraryservice-qa" {
  name        = var.cliplibraryservice_qa_name
  description = var.cliplibraryservice_qa_desc
  vpc_id      = var.vpc_id

  tags = {
    Name = "cliplibraryservice-qa"
  }
}

# Allow HTTP (80) from service-dialog-qa-sg
resource "aws_vpc_security_group_ingress_rule" "allow_http_from_dialog" {
  security_group_id            = aws_security_group.cliplibraryservice-qa.id
  # referenced_security_group_id = aws_security_group.service-dialog-qa-sg.id
  from_port                    = 80
  to_port                      = 80
  ip_protocol                  = "tcp"
  description                  = "Allow dialog usvc qa HTTP"
}

# Allow all traffic from VPN SG
resource "aws_vpc_security_group_ingress_rule" "allow_all_from_vpn" {
  security_group_id            = aws_security_group.cliplibraryservice-qa.id
  # referenced_security_group_id = aws_security_group.qc-vpn.id
  ip_protocol                  = "-1"
  description                  = "Allow All Traffic using VPN"
}

# Allow all traffic from itself
resource "aws_vpc_security_group_ingress_rule" "allow_all_self" {
  security_group_id            = aws_security_group.cliplibraryservice-qa.id
  # referenced_security_group_id = aws_security_group.cliplibraryservice-qa.id
  ip_protocol                  = "-1"
  description                  = "Allow All Traffic from Itself"
}

# Outbound: allow all traffic
resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.cliplibraryservice-qa.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
  description       = "Allow all outbound traffic"
}

# =========================
# Security Group
# =========================

resource "aws_security_group" "bot-qa-sg" {
  name        = var.bot_qa_name
  description = var.bot_qa_desc
  vpc_id      = var.vpc_id

  tags = {
    Name = "bot-qa-sg"
  }
}

# Allow all traffic from VPN SG
resource "aws_vpc_security_group_ingress_rule" "allow_all_from_vpn" {
  security_group_id            = aws_security_group.bot-qa-sg.id
  referenced_security_group_id = aws_security_group.qc-vpn.id
  ip_protocol                  = "-1"
  description                  = "Allow All Traffic from VPN"
}

# Allow all traffic from itself
resource "aws_vpc_security_group_ingress_rule" "allow_all_self" {
  security_group_id            = aws_security_group.bot-qa-sg.id
  referenced_security_group_id = aws_security_group.bot-qa-sg.id
  ip_protocol                  = "-1"
  description                  = "Allow All Traffic from itself"
}

# Outbound: allow all traffic
resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.bot-qa-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
  description       = "Allow all outbound traffic"
}


# =========================
# Security Group
# =========================

resource "aws_security_group" "notifierservice-prod-sg" {
  name        = var.notifierservice_prod_name
  description = var.notifierservice_prod_desc
  vpc_id      = var.vpc_id

  tags = {
    Name = "notifierservice-prod-sg"
  }
}

# Allow all traffic from VPN SG
resource "aws_vpc_security_group_ingress_rule" "allow_all_from_vpn" {
  security_group_id            = aws_security_group.notifierservice-prod-sg.id
  # referenced_security_group_id = aws_security_group.qc-vpn.id
  ip_protocol                  = "-1"
  description                  = "Allow All Traffic from VPN"
}

# Allow all traffic from itself
resource "aws_vpc_security_group_ingress_rule" "allow_all_self" {
  security_group_id            = aws_security_group.notifierservice-prod-sg.id
  # referenced_security_group_id = aws_security_group.notifierservice-prod-sg.id
  ip_protocol                  = "-1"
  description                  = "Allow All Traffic from Itself"
}

# Outbound: allow all traffic
resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.notifierservice-prod-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
  description       = "Allow all outbound traffic"
}


# =========================
# Security Group
# =========================


resource "aws_security_group" "qc-web-preprod-ALB-SG" {
  name        = var.qc_web_preprod_ALB_name
  description = var.qc_web_preprod_ALB_desc
  vpc_id      = var.vpc_id

  tags = {
    Name = "qc-web-preprod-ALB-SG"
  }
}

# Allow HTTP (80) from anywhere
resource "aws_vpc_security_group_ingress_rule" "allow_http_anywhere" {
  security_group_id = aws_security_group.qc-web-preprod-ALB-SG.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  description       = "Allow inbound HTTP from ANYWHERE"
}

# Allow HTTPS (443) from anywhere
resource "aws_vpc_security_group_ingress_rule" "allow_https_anywhere" {
  security_group_id = aws_security_group.qc-web-preprod-ALB-SG.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
  description       = "Allow inbound HTTPS from ANYWHERE"
}

# Outbound: allow all traffic
resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.qc-web-preprod-ALB-SG.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
  description       = "Allow all outbound traffic"
}


# =========================
# Security Group
# =========================

resource "aws_security_group" "launch-wizard-2" {
  name        = var.launch_wizard_2_name
  description = var.launch_wizard_2_desc
  vpc_id      = var.vpc_id

  tags = {
    Name = "launch-wizard-2"
  }
}

# Allow SSH from VPC CIDR
resource "aws_vpc_security_group_ingress_rule" "allow_ssh_vpc" {
  security_group_id = aws_security_group.launch-wizard-2.id
  cidr_ipv4         = "172.31.0.0/16"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  description       = "Allow SSH from VPC CIDR"
}

# Outbound: allow all traffic
resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.launch-wizard-2.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
  description       = "Allow all outbound traffic"
}

# =========================
# Security Group
# =========================


resource "aws_security_group" "service-dialog-ALB-QA-sg" {
  name        = var.service_dialog_ALB_QA_name
  description = var.service_dialog_ALB_QA_desc
  vpc_id      = var.vpc_id

  tags = {
    Name = "service-dialog-ALB-QA-sg"
  }
}

# Inbound: Allow HTTPS (443) from anywhere
resource "aws_vpc_security_group_ingress_rule" "allow_https_anywhere" {
  security_group_id = aws_security_group.service-dialog-ALB-QA-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
  description       = "PUBLIC: Allow HTTPS from ALL IPv4"
}

# Outbound: Allow HTTPS (443) to anywhere
resource "aws_vpc_security_group_egress_rule" "allow_https_anywhere" {
  security_group_id = aws_security_group.service-dialog-ALB-QA-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
  description       = "PUBLIC: Outbound HTTPS"
}

# Outbound: Allow HTTP (80) to service-dialog-qa-sg
resource "aws_vpc_security_group_egress_rule" "allow_http_to_service_dialog" {
  security_group_id            = aws_security_group.service-dialog-ALB-QA-sg.id
  # referenced_security_group_id = aws_security_group.service-dialog-qa-sg.id
  from_port                    = 80
  to_port                      = 80
  ip_protocol                  = "tcp"
  description                  = "VPC: Outbound HTTP to service-dialog"
}

# =========================
# Security Group
# =========================


resource "aws_security_group" "cliplibraryservice-preprod-sg" {
  name        = var.cliplibraryservice_preprod_name
  description = var.cliplibraryservice_preprod_desc
  vpc_id      = var.vpc_id

  tags = {
    Name = "cliplibraryservice-preprod-sg"
  }
}

# Allow all traffic from VPN SG
resource "aws_vpc_security_group_ingress_rule" "allow_all_from_vpn" {
  security_group_id            = aws_security_group.cliplibraryservice-preprod-sg.id
  referenced_security_group_id = aws_security_group.qc-vpn.id
  ip_protocol                  = "-1"
  description                  = "Allow Traffic for VPN"
}

# Allow HTTP (80) from dialogservice-preprod-sg
resource "aws_vpc_security_group_ingress_rule" "allow_http_from_dialog_preprod" {
  security_group_id            = aws_security_group.cliplibraryservice-preprod-sg.id
  referenced_security_group_id = aws_security_group.dialogservice-preprod-sg.id
  from_port                    = 80
  to_port                      = 80
  ip_protocol                  = "tcp"
  description                  = "Allow dialog usvc preprod HTTP"
}

# Allow all traffic from itself
resource "aws_vpc_security_group_ingress_rule" "allow_all_self" {
  security_group_id            = aws_security_group.cliplibraryservice-preprod-sg.id
  referenced_security_group_id = aws_security_group.cliplibraryservice-preprod-sg.id
  ip_protocol                  = "-1"
  description                  = "Allow All Traffic from Itself"
}

# Outbound: allow all traffic
resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.cliplibraryservice-preprod-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
  description       = "Allow all outbound traffic"
}


# =========================
# Security Group
# =========================


resource "aws_security_group" "qc-jenkins" {
  name        = var.qc_jenkins_name
  description = var.qc_jenkins_desc
  vpc_id      = var.vpc_id

  tags = {
    Name = "qc-jenkins"
  }
}

# Inbound: allow HTTP from main VPC CIDR
resource "aws_vpc_security_group_ingress_rule" "qc_jenkins_http_inbound" {
  security_group_id = aws_security_group.qc-jenkins.id
  cidr_ipv4         = "172.31.0.0/16"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  description       = "From main VPC"
}

# Outbound: allow all traffic
resource "aws_vpc_security_group_egress_rule" "qc_jenkins_allow_all_outbound" {
  security_group_id = aws_security_group.qc-jenkins.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
  description       = "Allow all outbound traffic"
}

resource "aws_security_group" "scoringservice-preprod-sg" {
  name        = var.scoringservice_preprod_name
  description = var.scoringservice_preprod_desc
  vpc_id      = var.vpc_id

  tags = {
    Name = "scoringservice-preprod-sg"
  }
}

# Inbound: allow all traffic from VPN SG
resource "aws_vpc_security_group_ingress_rule" "scoringservice_preprod_vpn_inbound" {
  security_group_id            = aws_security_group.scoringservice-preprod-sg.id
  referenced_security_group_id = "sg-093f62742b7dd6ee9" # qc-vpn
  ip_protocol                  = "-1"
  description                  = "All traffic through VPN"
}

# Inbound: allow all traffic from itself
resource "aws_vpc_security_group_ingress_rule" "scoringservice_preprod_self_inbound" {
  security_group_id            = aws_security_group.scoringservice-preprod-sg.id
  referenced_security_group_id = aws_security_group.scoringservice-preprod-sg.id
  ip_protocol                  = "-1"
  description                  = "All traffic through itself"
}

# Outbound: allow all traffic
resource "aws_vpc_security_group_egress_rule" "scoringservice_preprod_allow_all_outbound" {
  security_group_id = aws_security_group.scoringservice-preprod-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
  description       = "Allow all outbound traffic"
}


# =========================
# Security Group
# =========================


resource "aws_security_group" "embeddingscoring-qa-sg" {
  name        = var.embeddingscoring_qa_name
  description = var.embeddingscoring_qa_desc
  vpc_id      = var.vpc_id

  tags = {
    Name = "embeddingscoring-qa-sg"
  }
}

# Inbound: allow all traffic from itself
resource "aws_vpc_security_group_ingress_rule" "embeddingscoring_qa_self_inbound" {
  security_group_id            = aws_security_group.embeddingscoring-qa-sg.id
  referenced_security_group_id = aws_security_group.embeddingscoring-qa-sg.id
  ip_protocol                  = "-1"
  description                  = "All traffic from itself"
}

# Inbound: allow all traffic from VPN SG
resource "aws_vpc_security_group_ingress_rule" "embeddingscoring_qa_vpn_inbound" {
  security_group_id            = aws_security_group.embeddingscoring-qa-sg.id
  referenced_security_group_id = "sg-093f62742b7dd6ee9" # qc-vpn
  ip_protocol                  = "-1"
  description                  = "All traffic from VPN"
}

# Outbound: allow all traffic
resource "aws_vpc_security_group_egress_rule" "embeddingscoring_qa_allow_all_outbound" {
  security_group_id = aws_security_group.embeddingscoring-qa-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
  description       = "Allow all outbound traffic"
}


# =========================
# Security Group
# =========================


resource "aws_security_group" "launch-wizard-4" {
  name        = var.launch_wizard_4_name
  description = var.launch_wizard_4_desc
  vpc_id      = var.vpc_id

  tags = {
    Name = "launch-wizard-4"
  }
}

# Inbound: allow SSH from VPC CIDR
resource "aws_vpc_security_group_ingress_rule" "launch_wizard_4_ssh_inbound" {
  security_group_id = aws_security_group.launch-wizard-4.id
  cidr_ipv4         = "172.31.0.0/16" # VPC CIDR
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  description       = "Allow SSH from VPC"
}

# Outbound: allow all traffic
resource "aws_vpc_security_group_egress_rule" "launch_wizard_4_allow_all_outbound" {
  security_group_id = aws_security_group.launch-wizard-4.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
  description       = "Allow all outbound traffic"
}


# =========================
# Security Group
# =========================


resource "aws_security_group" "test_cvazquez_deleteme" {
  name        = var.test_cvazquez_deleteme_name
  description = var.test_cvazquez_deleteme_desc
  vpc_id      = var.vpc_id

  tags = {
    Name = "test-cvazquez-deleteme"
  }
}

# --- Inbound Rules ---

# 1. Allow all from QC-Primary-Internal_and_VPN-Access
resource "aws_vpc_security_group_ingress_rule" "deleteme_inbound_internal_vpn" {
  security_group_id            = aws_security_group.test_cvazquez_deleteme.id
  referenced_security_group_id = "sg-01b50c1a09059de48"
  ip_protocol                  = "-1"
}

# 2. Allow PostgreSQL (5432) from QuickSight
resource "aws_vpc_security_group_ingress_rule" "deleteme_inbound_postgres_qs" {
  security_group_id            = aws_security_group.test_cvazquez_deleteme.id
  referenced_security_group_id = "sg-05abf4079fb0c5ef5"
  from_port                    = 5432
  to_port                      = 5432
  ip_protocol                  = "tcp"
  description                  = "Inbound Traffic from QS to RDS"
}

# 3. Allow all from default SG (VPC internal)
resource "aws_vpc_security_group_ingress_rule" "deleteme_inbound_vpc_default" {
  security_group_id            = aws_security_group.test_cvazquez_deleteme.id
  referenced_security_group_id = "sg-1f3b5977"
  ip_protocol                  = "-1"
  description                  = "Anything from VPC"
}

# 4. Allow all from VPN
resource "aws_vpc_security_group_ingress_rule" "deleteme_inbound_vpn" {
  security_group_id            = aws_security_group.test_cvazquez_deleteme.id
  referenced_security_group_id = "sg-093f62742b7dd6ee9"
  ip_protocol                  = "-1"
  description                  = "Anything from VPN"
}

# 5. Allow custom TCP (5431) from QuickSight
resource "aws_vpc_security_group_ingress_rule" "deleteme_inbound_tcp5431_qs" {
  security_group_id            = aws_security_group.test_cvazquez_deleteme.id
  referenced_security_group_id = "sg-05abf4079fb0c5ef5"
  from_port                    = 5431
  to_port                      = 5431
  ip_protocol                  = "tcp"
  description                  = "Inbound Traffic from QS to RDS"
}

# --- Outbound Rules ---

# 1. Allow all TCP to QuickSight SG
resource "aws_vpc_security_group_egress_rule" "deleteme_outbound_tcp_qs" {
  security_group_id            = aws_security_group.test_cvazquez_deleteme.id
  referenced_security_group_id = "sg-05abf4079fb0c5ef5"
  from_port                    = 0
  to_port                      = 65535
  ip_protocol                  = "tcp"
}

# 2. Allow all traffic outbound to internet
resource "aws_vpc_security_group_egress_rule" "deleteme_outbound_all" {
  security_group_id = aws_security_group.test_cvazquez_deleteme.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# =========================
# Security Group
# =========================

resource "aws_security_group" "delete-me" {
  name        = var.delete_me_name
  description = var.delete_me_desc
  vpc_id      = var.vpc_id

  tags = {
    Name = "delete-me"
  }
}

# Inbound rule: allow all from VPN CIDR
resource "aws_security_group_rule" "inbound_vpn" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["172.30.0.0/16"]
  security_group_id = aws_security_group.delete-me.id
  description       = "US-EAST-2 VPN"
}

# Inbound rule: allow all from VPC CIDR
resource "aws_security_group_rule" "inbound_vpc" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["172.31.0.0/16"]
  security_group_id = aws_security_group.delete-me.id
  description       = "US-EAST-2 VPC"
}

# Inbound rule: allow all from another SG
resource "aws_security_group_rule" "inbound_sg" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = "sg-0e627540fc2738a27"
  security_group_id        = aws_security_group.delete-me.id
  description              = "delete-me SG reference"
}

# Outbound rule: allow all to anywhere
resource "aws_security_group_rule" "outbound_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.delete-me.id
}

# =========================
# Security Group
# =========================

resource "aws_security_group" "scoringservice_qa_sg" {
  name        = var.scoringservice_qa_name
  description = var.scoringservice_qa_desc
  vpc_id      = var.vpc_id

  tags = {
    Name = "scoringservice-qa"
  }
}

# Inbound: Allow all traffic from qc-vpn
resource "aws_security_group_rule" "scoringservice_qa_in_vpn" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = "sg-093f62742b7dd6ee9" # qc-vpn
  security_group_id        = aws_security_group.scoringservice_qa_sg.id
  description              = "Allow traffic from VPN"
}

# Inbound: Allow all traffic from itself
resource "aws_security_group_rule" "scoringservice_qa_in_self" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = aws_security_group.scoringservice_qa_sg.id
  security_group_id        = aws_security_group.scoringservice_qa_sg.id
  description              = "Allow traffic from itself"
}

# Outbound: Allow all traffic to anywhere
resource "aws_security_group_rule" "scoringservice_qa_out_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.scoringservice_qa_sg.id
}

# =========================
# Security Group
# =========================

resource "aws_security_group" "service_dialog_sg" {
  name        = var.service_dialog_sg_name
  description = var.service_dialog_sg_desc
  vpc_id      = var.vpc_id

  tags = {
    Name = "service-dialog-sg"
  }
}

# Inbound: Allow HTTP from ALB SG
resource "aws_security_group_rule" "service_dialog_in_http_alb" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = "sg-007408232067d24b5" # service-dialog-ALB-sg
  security_group_id        = aws_security_group.service_dialog_sg.id
  description              = "VPC : Allow HTTP from service-dialog ALB"
}

# Inbound: Allow SSH from VPN SG
resource "aws_security_group_rule" "service_dialog_in_ssh_vpn" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = "sg-093f62742b7dd6ee9" # qc-vpn
  security_group_id        = aws_security_group.service_dialog_sg.id
  description              = "VPC : Allow SSH from VPN"
}

# Outbound: Allow all traffic
resource "aws_security_group_rule" "service_dialog_out_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.service_dialog_sg.id
}

# =========================
# Security Group
# =========================

resource "aws_security_group" "qc_worker_prod_alb_sg" {
  name        = var.qc_worker_prod_alb_sg_name
  description = var.qc_worker_prod_alb_sg_desc
  vpc_id      = var.vpc_id

  tags = {
    Name = "qc-worker-prod-ALB-SG"
  }
}

# Inbound: Allow HTTPS from anywhere
resource "aws_security_group_rule" "qc_worker_alb_in_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.qc_worker_prod_alb_sg.id
  description       = "for SSL"
}

# Inbound: Allow HTTP from anywhere
resource "aws_security_group_rule" "qc_worker_alb_in_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.qc_worker_prod_alb_sg.id
  description       = "for non-SSL (enforced SSL)"
}

# Outbound: Allow all traffic
resource "aws_security_group_rule" "qc_worker_alb_out_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.qc_worker_prod_alb_sg.id
}

# =========================
# Security Group
# =========================

resource "aws_security_group" "scoringservice_prod_sg" {
  name        = var.scoringservice_prod_sg_name
  description = var.scoringservice_prod_sg_desc
  vpc_id      = var.vpc_id

  tags = {
    Name = "scoringservice-prod-sg"
  }
}

# Inbound: Allow all traffic from VPN SG
resource "aws_security_group_rule" "scoringservice_prod_in_vpn" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = "sg-093f62742b7dd6ee9" # qc-vpn
  security_group_id        = aws_security_group.scoringservice_prod_sg.id
  description              = "Allow traffic from VPN"
}

# Inbound: Allow all traffic from itself
resource "aws_security_group_rule" "scoringservice_prod_in_self" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = aws_security_group.scoringservice_prod_sg.id
  security_group_id        = aws_security_group.scoringservice_prod_sg.id
  description              = "Allow traffic from Itself"
}

# Outbound: Allow all traffic
resource "aws_security_group_rule" "scoringservice_prod_out_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.scoringservice_prod_sg.id
}

# =========================
# Security Group
# =========================


resource "aws_security_group" "qc_sonar" {
  name        = var.qc_sonar_sg_name
  description = var.qc_sonar_sg_desc
  vpc_id      = var.vpc_id

  tags = {
    Name = "qc-sonar"
  }
}

# Inbound: Allow HTTP from anywhere
resource "aws_security_group_rule" "qc_sonar_in_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.qc_sonar.id
  description       = "Allow HTTP from anywhere"
}

# Outbound: Allow all traffic
resource "aws_security_group_rule" "qc_sonar_out_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.qc_sonar.id
}

# =========================
# Security Group
# =========================

resource "aws_security_group" "dialogservice_memcache" {
  name        = var.dialogservice_memcache_sg_name
  description = var.dialogservice_memcache_sg_desc
  vpc_id      = var.vpc_id

  tags = {
    Name = "dialogservice-memcache"
  }
}

# Inbound: Allow TCP 11211 from Preprod SG
resource "aws_security_group_rule" "memcache_in_preprod" {
  type                     = "ingress"
  from_port                = 11211
  to_port                  = 11211
  protocol                 = "tcp"
  source_security_group_id = "sg-00f665cbea0b148a0"
  security_group_id        = aws_security_group.dialogservice_memcache.id
  description              = "Allow Preprod Dialog uSvc"
}

# Inbound: Allow TCP 11211 from Dev SG
resource "aws_security_group_rule" "memcache_in_dev" {
  type                     = "ingress"
  from_port                = 11211
  to_port                  = 11211
  protocol                 = "tcp"
  source_security_group_id = "sg-0f68b6d6b42ed8aa8"
  security_group_id        = aws_security_group.dialogservice_memcache.id
  description              = "Allow Dev Dialog uSvc"
}

# Inbound: Allow TCP 11211 from Prod SG
resource "aws_security_group_rule" "memcache_in_prod" {
  type                     = "ingress"
  from_port                = 11211
  to_port                  = 11211
  protocol                 = "tcp"
  source_security_group_id = "sg-003dd50cc0c35e0c0"
  security_group_id        = aws_security_group.dialogservice_memcache.id
  description              = "Allow Prod Dialog uSvc"
}

# Inbound: Allow TCP 11211 from QA SG
resource "aws_security_group_rule" "memcache_in_qa" {
  type                     = "ingress"
  from_port                = 11211
  to_port                  = 11211
  protocol                 = "tcp"
  source_security_group_id = "sg-0f38da419c38aac98"
  security_group_id        = aws_security_group.dialogservice_memcache.id
  description              = "Allow QA Dialog uSvc"
}

# Outbound: Allow all traffic
resource "aws_security_group_rule" "memcache_out_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.dialogservice_memcache.id
}

# =========================
# Security Group
# =========================

resource "aws_security_group" "qc_web_preprod_sg" {
  name        = var.qc_web_preprod_sg_name
  description = var.qc_web_preprod_sg_desc
  vpc_id      = var.vpc_id

  tags = {
    Name = "qc-web-preprod-SG"
  }
}

# Inbound: HTTP 80 from ALB SG
resource "aws_security_group_rule" "qc_web_preprod_in_http_alb" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = "sg-021f30b59c60d6a27"
  security_group_id        = aws_security_group.qc_web_preprod_sg.id
  description              = "Allow HTTP from ALB"
}

# Inbound: All traffic from itself
resource "aws_security_group_rule" "qc_web_preprod_in_self" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = aws_security_group.qc_web_preprod_sg.id
  security_group_id        = aws_security_group.qc_web_preprod_sg.id
  description              = "Allow ALL-Traffic from itself"
}

# Inbound: All traffic from VPN SG
resource "aws_security_group_rule" "qc_web_preprod_in_vpn" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = "sg-093f62742b7dd6ee9"
  security_group_id        = aws_security_group.qc_web_preprod_sg.id
  description              = "Allow All Traffic from VPN"
}

# Inbound: Custom TCP 3000 from ALB SG (health checks)
resource "aws_security_group_rule" "qc_web_preprod_in_3000_alb" {
  type                     = "ingress"
  from_port                = 3000
  to_port                  = 3000
  protocol                 = "tcp"
  source_security_group_id = "sg-021f30b59c60d6a27"
  security_group_id        = aws_security_group.qc_web_preprod_sg.id
  description              = "Allow 3000 from ALB for healthchecks"
}

# Outbound: Allow all traffic
resource "aws_security_group_rule" "qc_web_preprod_out_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.qc_web_preprod_sg.id
}


# =========================
# Security Group
# =========================


resource "aws_security_group" "qc_web_qa_alb_sg" {
  name        = var.qc_web_qa_alb_sg_name
  description = var.qc_web_qa_alb_sg_desc
  vpc_id      = var.vpc_id

  tags = {
    Name = "qc-web-qa-ALB-SG"
  }
}

# Inbound: Allow HTTPS from anywhere
resource "aws_security_group_rule" "qc_web_qa_alb_in_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.qc_web_qa_alb_sg.id
  description       = "Allow inbound HTTPS from ANYWHERE"
}

# Inbound: Allow HTTP from anywhere
resource "aws_security_group_rule" "qc_web_qa_alb_in_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.qc_web_qa_alb_sg.id
  description       = "Allow inbound HTTP from ANYWHERE"
}

# Outbound: Allow all traffic
resource "aws_security_group_rule" "qc_web_qa_alb_out_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.qc_web_qa_alb_sg.id
}


# =========================
# Security Group
# =========================


resource "aws_security_group" "cliplibraryservice_dev_sg" {
  name        = var.cliplibraryservice_dev_sg_name
  description = var.cliplibraryservice_dev_sg_desc
  vpc_id      = var.vpc_id

  tags = {
    Name = "cliplibraryservice-dev-sg"
  }
}

# Inbound: All traffic from itself
resource "aws_security_group_rule" "cliplibraryservice_dev_in_self" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = aws_security_group.cliplibraryservice_dev_sg.id
  security_group_id        = aws_security_group.cliplibraryservice_dev_sg.id
  description              = "All traffic from itself"
}

# Inbound: All traffic from VPN SG
resource "aws_security_group_rule" "cliplibraryservice_dev_in_vpn" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = "sg-093f62742b7dd6ee9"
  security_group_id        = aws_security_group.cliplibraryservice_dev_sg.id
  description              = "Allow All Traffic from VPN"
}

# Inbound: HTTP 80 from Dialog QA SG
resource "aws_security_group_rule" "cliplibraryservice_dev_in_http_qa" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = "sg-0f38da419c38aac98"
  security_group_id        = aws_security_group.cliplibraryservice_dev_sg.id
  description              = "Allow dialog uSvc QA HTTP"
}

# Inbound: HTTP 80 from Dialog Dev SG
resource "aws_security_group_rule" "cliplibraryservice_dev_in_http_dev" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = "sg-0f68b6d6b42ed8aa8"
  security_group_id        = aws_security_group.cliplibraryservice_dev_sg.id
  description              = "Allow dialog uSvc Dev HTTP"
}

# Outbound: Allow all traffic
resource "aws_security_group_rule" "cliplibraryservice_dev_out_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cliplibraryservice_dev_sg.id
}


# =========================
# Security Group
# =========================


resource "aws_security_group" "qc_web_prod_alb_sg" {
  name        = var.qc_web_prod_ALB_SG_name
  description = var.qc_web_prod_ALB_SG_desc
  vpc_id      = var.vpc_id

  tags = {
    Name = "qc-web-prod-ALB-SG"
  }
}

# Ingress: Allow HTTP from anywhere
resource "aws_security_group_rule" "qc_web_prod_alb_sg_in_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.qc_web_prod_alb_sg.id
  description       = "Allow inbound HTTP from ANYWHERE"
}

# Ingress: Allow HTTPS from anywhere
resource "aws_security_group_rule" "qc_web_prod_alb_sg_in_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.qc_web_prod_alb_sg.id
  description       = "Allow inbound HTTPS from ANYWHERE"
}

# Egress: Allow all outbound traffic
resource "aws_security_group_rule" "qc_web_prod_alb_sg_out_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.qc_web_prod_alb_sg.id
  description       = "Allow all outbound traffic"
}

# =========================
# Security Group
# =========================

resource "aws_security_group" "service_dialog_alb_sg" {
  name        = var.service_dialog_ALB_sg_name
  description = var.service_dialog_ALB_sg_desc
  vpc_id      = var.vpc_id

  tags = {
    Name = "service-dialog-ALB-sg"
  }
}

# HTTPS from anywhere (Public)
resource "aws_security_group_rule" "service_dialog_alb_sg_in_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.service_dialog_alb_sg.id
  description       = "PUBLIC: Allow HTTPS from ALL IPv4"
}

# HTTP to service-dialog SG
resource "aws_security_group_rule" "service_dialog_alb_sg_out_http" {
  type                     = "egress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.service_dialog_alb_sg.id
  source_security_group_id = "sg-0f68b6d6b42ed8aa8"
  description              = "VPC: Outbound HTTP to service-dialog"
}

# HTTPS to anywhere (Public)
resource "aws_security_group_rule" "service_dialog_alb_sg_out_https" {
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.service_dialog_alb_sg.id
  description       = "PUBLIC: Outbound HTTPS"
}

# =========================
# Security Group
# =========================

resource "aws_security_group" "notifierservice_dev" {
  name        = var.notifierservice_dev_name
  description = var.notifierservice_dev_desc
  vpc_id      = var.vpc_id

  tags = {
    Name = "notifierservice-dev"
  }
}

# TCP 3001 from notifierservice-dev SG
resource "aws_security_group_rule" "notifierservice_dev_in_tcp_3001_self" {
  type                     = "ingress"
  from_port                = 3001
  to_port                  = 3001
  protocol                 = "tcp"
  source_security_group_id = "sg-0ed47d709787ec639"
  security_group_id        = aws_security_group.notifierservice_dev.id
  description              = "Allow TCP 3001 from notifierservice-dev SG"
}

# TCP 3001 from qc-vpn SG
resource "aws_security_group_rule" "notifierservice_dev_in_tcp_3001_qc_vpn" {
  type                     = "ingress"
  from_port                = 3001
  to_port                  = 3001
  protocol                 = "tcp"
  source_security_group_id = "sg-093f62742b7dd6ee9"
  security_group_id        = aws_security_group.notifierservice_dev.id
  description              = "Allow TCP 3001 from qc-vpn SG"
}

# Allow all outbound traffic
resource "aws_security_group_rule" "notifierservice_dev_out_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.notifierservice_dev.id
  description       = "Allow all outbound traffic"
}


# =========================
# Security Group
# =========================


resource "aws_security_group" "dialogservice_preprod_sg" {
  name        = var.dialogservice_preprod_sg_name
  description = var.dialogservice_preprod_sg_desc
  vpc_id      = var.vpc_id

  tags = {
    Name = "dialogservice-preprod-sg"
  }
}

# SSH from qc-vpn SG
resource "aws_security_group_rule" "dialogservice_preprod_sg_in_ssh_vpn" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = "sg-093f62742b7dd6ee9"
  security_group_id        = aws_security_group.dialogservice_preprod_sg.id
  description              = "VPC: Allow SSH from VPN"
}

# HTTP from service-dialog ALB Preprod SG
resource "aws_security_group_rule" "dialogservice_preprod_sg_in_http_alb_preprod" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = "sg-06cc6f7ad736c25cd"
  security_group_id        = aws_security_group.dialogservice_preprod_sg.id
  description              = "VPC: Allow HTTP from service-dialog ALB Preprod"
}

# Allow all outbound traffic
resource "aws_security_group_rule" "dialogservice_preprod_sg_out_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.dialogservice_preprod_sg.id
  description       = "Allow all outbound traffic"
}


# =========================
# Security Group
# =========================

resource "aws_security_group" "service_dialog_qa_sg" {
  name        = var.service_dialog_qa_name
  description = var.service_dialog_qa_desc
  vpc_id      = var.vpc_id

  tags = {
    Name = "service-dialog-qa-sg"
  }
}

# SSH from qc-vpn SG
resource "aws_security_group_rule" "service_dialog_qa_sg_in_ssh_vpn" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = "sg-093f62742b7dd6ee9"
  security_group_id        = aws_security_group.service_dialog_qa_sg.id
  description              = "VPC: Allow SSH from VPN"
}

# HTTP from service-dialog ALB QA SG
resource "aws_security_group_rule" "service_dialog_qa_sg_in_http_alb_qa" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = "sg-0a7e09cdee0e3074a"
  security_group_id        = aws_security_group.service_dialog_qa_sg.id
  description              = "VPC: Allow HTTP from service-dialog ALB QA"
}


# Allow all outbound traffic
resource "aws_security_group_rule" "service_dialog_qa_sg_out_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.service_dialog_qa_sg.id
  description       = "Allow all outbound traffic"
}

# =========================
# Security Group
# =========================

resource "aws_security_group" "embeddingscoring_preprod_sg" {
  name        = var.embeddingscoring_preprod_sg_name
  description = var.embeddingscoring_preprod_sg_desc
  vpc_id      = var.vpc_id

  tags = {
    Name = "embeddingscoring-preprod-sg"
  }
}

# All traffic from itself
resource "aws_security_group_rule" "embeddingscoring_preprod_sg_in_self" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = "sg-0faaba92a8cd22ea6"
  security_group_id        = aws_security_group.embeddingscoring_preprod_sg.id
  description              = "All traffic from itself"
}

# All traffic from qc-vpn SG
resource "aws_security_group_rule" "embeddingscoring_preprod_sg_in_qc_vpn" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = "sg-093f62742b7dd6ee9"
  security_group_id        = aws_security_group.embeddingscoring_preprod_sg.id
  description              = "All traffic from VPN"
}

# Allow all outbound traffic
resource "aws_security_group_rule" "embeddingscoring_preprod_sg_out_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.embeddingscoring_preprod_sg.id
  description       = "Allow all outbound traffic"
}


# =========================
# Security Group
# =========================


resource "aws_security_group" "launch_wizard_1" {
  name        = var.launch_wizard_1_name
  description = var.launch_wizard_1_desc
  vpc_id      = var.vpc_id

  tags = {
    Name = "launch-wizard-1"
  }
}

# SSH from 172.31.0.0/16
resource "aws_security_group_rule" "launch_wizard_1_in_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["172.31.0.0/16"]
  security_group_id = aws_security_group.launch_wizard_1.id
  description       = "Allow SSH from 172.31.0.0/16"
}

# Allow all outbound traffic
resource "aws_security_group_rule" "launch_wizard_1_out_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.launch_wizard_1.id
  description       = "Allow all outbound traffic"
}

# =========================
# Security Group
# =========================

resource "aws_security_group" "qc-quicksight-access" {
  name        = var.qc_quicksight_access_name
  description = var.qc_quicksight_access_desc
  vpc_id      = var.vpc_id

  tags = {
    Name = "qc-quicksight-access"
  }
}

# =========================
# Security Group
# =========================


resource "aws_security_group" "qc_bot_724" {
  name        = var.qc_bot_724_name
  description = var.qc_bot_724_desc
  vpc_id      = var.vpc_id

  tags = {
    Name = "qc-bot-724"
  }
}


# HTTP from anywhere
resource "aws_security_group_rule" "qc_bot_724_in_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.qc_bot_724.id
  description       = "Allow HTTP from ANYWHERE"
}

# Allow all outbound traffic
resource "aws_security_group_rule" "qc_bot_724_out_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.qc_bot_724.id
  description       = "Allow all outbound traffic"
}
