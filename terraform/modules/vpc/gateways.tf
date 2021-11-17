resource "aws_internet_gateway" "igw" {
  vpc_id            = var.vpc_id

  tags = {
    Name            = "internal-gateway"
  }
}

resource "aws_nat_gateway" "ngw" {
  for_each	    = var.public_subnets
  subnet_id         = aws_subnet.subnet-public[each.key].id
  allocation_id     = aws_eip.ngw[each.key].id

  tags = {
    Name            = "nat-gateway-${each.key}"
  }
}
