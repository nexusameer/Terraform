resource "aws_lb_target_group" "tg" {
  name     = var.tg_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "ec2_attach1" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.instance1_id
  port             = 80
}

resource "aws_lb_target_group_attachment" "ec2_attach2" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.instance2_id
  port             = 80
}

