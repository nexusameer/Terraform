resource "aws_subnet" "sub1" {
  vpc_id     = var.vpc_id
  cidr_block = var.sub1_cidr
  map_public_ip_on_launch = var.map_public_ip_on_launch
  availability_zone = "eu-central-1a"

}
resource "aws_subnet" "sub2" {
  vpc_id     = var.vpc_id
  cidr_block = var.sub2_cidr
  map_public_ip_on_launch = var.map_public_ip_on_launch
  availability_zone = "eu-central-1b"
}