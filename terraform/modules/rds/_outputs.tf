output "rds_instances" {
  value = aws_db_instance.generic.address
}

output "rds_security_group" {
  value = aws_security_group.allow_rds.id
}
