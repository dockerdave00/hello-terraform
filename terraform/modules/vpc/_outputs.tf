output "vpc_id" {
  value = aws_vpc.common-vpc.id
}

output "public_subnets" {
  value = aws_subnet.common-subnet-public.id
}

output "internal_subnets" {
  value = aws_subnet.common-subnet-internal.id
}

output "db_subnets" {
  value = [ aws_subnet.common-subnet-db-e2a.id, aws_subnet.common-subnet-db-e2b.id ]
}
