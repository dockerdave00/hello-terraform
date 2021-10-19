resource "aws_security_group" "allow_rds" {
  name                          = "allow_rds_sg"
  description                   = "Allow RDS connections to instance"
  vpc_id                        = var.vpc_id

  ingress {
    from_port                   = 5432
    to_port                     = 5432
    protocol                    = "tcp"
    cidr_blocks                 = [ "0.0.0.0/0" ]
  }

  egress {
    from_port                   = 5432
    to_port                     = 5432
    protocol                    = "tcp"
    cidr_blocks                 = [ "0.0.0.0/0" ]
  }

  tags = {
    Name                        = "allow_rds_sg"
  }
}
