output "ec2_security_group" {
  value = aws_security_group.allow_ssh_http.id
}
