resource "aws_internet_gateway" "igw" {
  vpc_id            = var.vpc_id

  tags = {
    Name            = "internal-gateway"
  }
}

resource "aws_nat_gateway" "ngw" {
  for_each	    = var.private_subnets
  subnet_id         = aws_subnet.subnet-private[each.key].id
  connectivity_type = "private"

  tags = {
    Name            = "nat-gateway-${each.key}"
  }
}
