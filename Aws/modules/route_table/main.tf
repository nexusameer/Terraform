resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0" # Route all traffic
    gateway_id = var.gateway_id
  }
}

resource "aws_route_table_association" "subnet1" {
  subnet_id      = var.subnet1_id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "subnet2" {
  subnet_id      = var.subnet2_id
  route_table_id = aws_route_table.public.id
}
