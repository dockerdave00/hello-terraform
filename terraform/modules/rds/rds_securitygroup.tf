resource "aws_security_group" "allow_rds" {
  name                          = "allow_rds_sg"
  description                   = "Allow RDS connections to instance"
  vpc_id                        = var.vpc_id

  tags = {
    Name                        = "allow_rds_sg"
  }
}

resource "aws_security_group_rule" "allow_rds" {
  type                        = "ingress"
  from_port                   = 5432
  to_port                     = 5432
  protocol                    = "tcp"
  cidr_blocks                 = ["0.0.0.0/0"]
  security_group_id           = aws_security_group.allow_rds.id
}

resource "aws_security_group_rule" "allow_all" {
  type                        = "egress"
  from_port                   = 0
  to_port                     = 0
  protocol                    = -1
  cidr_blocks                 = ["0.0.0.0/0"]
  security_group_id           = aws_security_group.allow_rds.id
}
