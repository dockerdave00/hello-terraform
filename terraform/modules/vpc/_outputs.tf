output "vpc_id" {
  value = aws_vpc.common-vpc.id
}

output "public_subnet" {
  value = aws_subnet.subnet-public.id
}

output "private_subnet" {
  value = aws_subnet.subnet-private.id
}

output "db_subnet" {
  value = [ aws_subnet.subnet-db-e2a.id, aws_subnet.subnet-db-e2b.id ]
}

output "internet_gateway" {
  value = aws_internet_gateway.igw.id
}

output "nat_gateway" {
  value = aws_nat_gateway.ngw.id
}
