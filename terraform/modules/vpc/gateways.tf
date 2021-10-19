resource "aws_internet_gateway" "igw" {
  vpc_id            = var.vpc_id

  tags = {
    Name            = "internal-gateway"
  }
}

resource "aws_nat_gateway" "ngw" {
  connectivity_type = "private"
  subnet_id         = var.public_subnet

  tags = {
    Name            = "nat-gateway"
  }
}
