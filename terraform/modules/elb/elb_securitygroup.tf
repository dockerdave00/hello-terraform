resource "aws_security_group" "allow_http_only_for_elb" {
  name                          = "allow_http_only_sg_for_elb"
  description                   = "Allow HTTP only inbound connections"
  vpc_id                        = var.vpc_id

  tags = {
    Name                        = "allow_http_only_sg_for_elb"
  }
}

resource "aws_security_group_rule" "allow_http" {
  type                        = "ingress"
  from_port                   = 80
  to_port                     = 80
  protocol                    = "tcp"
  cidr_blocks                 = ["0.0.0.0/0"]
  security_group_id           = aws_security_group.allow_http_only_for_elb.id
}

resource "aws_security_group_rule" "allow_all" {
  type                        = "egress"
  from_port                   = 0
  to_port                     = 0
  protocol                    = -1
  cidr_blocks                 = ["0.0.0.0/0"]
  security_group_id           = aws_security_group.allow_http_only_for_elb.id
}

