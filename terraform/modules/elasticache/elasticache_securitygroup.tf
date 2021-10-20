resource "aws_security_group" "allow_elasticache" {
  name                  = "allow_elasticache_sg"
  description           = "Allow Elasticache connections to instance"
  vpc_id                = var.vpc_id

  tags = {
    Name                = "allow_elasticache_sg"
  }
}

resource "aws_security_group_rule" "allow_elasticache" {
  type                        = "ingress"
  from_port                   = 6379
  to_port                     = 6379
  protocol                    = "tcp"
  cidr_blocks                 = ["0.0.0.0/0"]
  security_group_id           = aws_security_group.allow_elasticache.id
}

resource "aws_security_group_rule" "allow_all" {
  type                        = "egress"
  from_port                   = 0
  to_port                     = 0
  protocol                    = -1
  cidr_blocks                 = ["0.0.0.0/0"]
  security_group_id           = aws_security_group.allow_elasticache.id
}
