resource "aws_route_table" "public" {
  vpc_id                 = var.vpc_id

  tags = {
    Name                 = "public"
  }
}

resource "aws_route_table" "private" {
  vpc_id                 = var.vpc_id

  tags = {
    Name                 = "private"
  }
}

resource "aws_route" "public-igw" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.internet_gateway
  # gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route" "private-ngw" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.nat_gateway
}

resource "aws_route_table_association" "public-subnet" {
  subnet_id              = aws_subnet.subnet-public.id
  route_table_id         = aws_route_table.public.id

} 

resource "aws_route_table_association" "private-subnet" {
  subnet_id              = aws_subnet.subnet-private.id
  route_table_id         = aws_route_table.private.id

} 
