resource "aws_security_group" "allow_ssh_only" {
  name                          = "allow_ssh_only_sg"
  description                   = "Allow SSH only inbound connections"
  vpc_id                        = var.vpc_id

  tags = {
    Name                        = "allow_ssh_only_sg"
  }
}

resource "aws_security_group_rule" "allow_ssh" {
  type			      = "ingress"
  from_port                   = 22
  to_port                     = 22
  protocol                    = "tcp"
  cidr_blocks                 = ["0.0.0.0/0"]
  security_group_id	      = aws_security_group.allow_ssh_only.id
}

# resource "aws_security_group_rule" "allow_http" {
#   type			      = "ingress"
#   from_port                   = 80
#   to_port                     = 80
#   protocol                    = "tcp"
#   cidr_blocks                 = ["0.0.0.0/0"]
#   security_group_id	      = aws_security_group.allow_ssh_http.id
# }

resource "aws_security_group_rule" "allow_all" {
  type			      = "egress"
  from_port                   = 0
  to_port                     = 0
  protocol                    = -1
  cidr_blocks                 = ["0.0.0.0/0"]
  security_group_id	      = aws_security_group.allow_ssh_only.id
}
