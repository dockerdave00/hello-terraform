resource "aws_route_table" "public" {
  vpc_id                 = var.vpc_id

  tags = {
    Name                 = "public"
  }
}

resource "aws_route_table" "private" {
  for_each		 = var.private_subnets
  vpc_id                 = var.vpc_id

  tags = {
    Name                 = "private-${each.key}"
  }
}

resource "aws_route" "public-igw" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.internet_gateway
}

resource "aws_route" "private-ngw" {
  for_each		 = var.private_subnets
  route_table_id         = aws_route_table.private[each.key].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.ngw[each.key].id
}

resource "aws_route_table_association" "public-subnet" {
  for_each		 = var.public_subnets
  subnet_id              = aws_subnet.subnet-public[each.key].id
  route_table_id         = aws_route_table.public.id
} 

resource "aws_route_table_association" "private-subnet" {
  for_each		 = aws_subnet.subnet-private
  subnet_id              = aws_subnet.subnet-private[each.key].id
  route_table_id         = aws_route_table.private[each.key].id
} 
