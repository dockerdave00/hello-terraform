resource "aws_eip" "ngw" {
  for_each                      = var.public_subnets

  tags = {
    Name   = "elastic-ip-${each.key}"
  }
}
