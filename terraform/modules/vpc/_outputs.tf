output "vpc_id" {
  value = aws_vpc.common-vpc.id
}

output "internet_gateway" {
  value = aws_internet_gateway.igw.id
}

output "db_subnet_ids" {
  value = [ for subnet in aws_subnet.subnet-db: subnet.id]
}

output "public_subnet_ids" {
  value = [ for subnet in aws_subnet.subnet-public: subnet.id]
}

# output "private_subnet_ids" {
#   value = [ for subnet in aws_subnet.subnet-private: subnet.id]
# }
