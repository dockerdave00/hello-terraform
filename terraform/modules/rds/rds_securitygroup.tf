resource "aws_security_group" "allow_rds" {
  name                          = "allow_rds_sg"
  description                   = "Allow RDS connections to instance"
  vpc_id                        = var.vpc_id

  tags = {
    Name                        = "allow_rds_sg"
  }
}

resource "aws_security_group_rule" "rds_rule" {
  type                        = "ingress"
  from_port                   = 5432
  to_port                     = 5432
  protocol                    = "tcp"
  cidr_blocks                 = ["0.0.0.0/0"]
  security_group_id           = aws_security_group.allow_rds.id
}

