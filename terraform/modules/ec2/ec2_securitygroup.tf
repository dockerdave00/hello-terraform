resource "aws_security_group" "allow_ssh_http" {
  name                          = "allow_ssh_http_sg"
  description                   = "Allow SSH and HTTP inbound connections"
  vpc_id                        = var.vpc_id

  tags = {
    Name                        = "allow_ssh_http_sg"
  }
}

resource "aws_security_group_rule" "ssh_rule" {
  type			      = "ingress"
  from_port                   = 22
  to_port                     = 22
  protocol                    = "tcp"
  cidr_blocks                 = ["0.0.0.0/0"]
  security_group_id	      = aws_security_group.allow_ssh_http.id
}

resource "aws_security_group_rule" "http_rule" {
  type			      = "ingress"
  from_port                   = 80
  to_port                     = 80
  protocol                    = "tcp"
  cidr_blocks                 = ["0.0.0.0/0"]
  security_group_id	      = aws_security_group.allow_ssh_http.id
}
