resource "aws_instance" "web1" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  key_name      = var.key_name
  vpc_security_group_ids = [var.vpc_security_group_ids] 
  tags = {
    Name = "web1-instance"
  }
}

resource "aws_instance" "web2" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  key_name      = var.key_name
  vpc_security_group_ids = [var.vpc_security_group_ids] 

  tags = {
    Name = "web2-instance"
  }
}