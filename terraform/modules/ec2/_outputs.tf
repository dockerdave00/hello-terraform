output "ec2_security_group" {
  value = aws_security_group.allow_ssh_http.id
}

output "aws_ec2_instance_id" {
  value = aws_instance.app_server.id
}
