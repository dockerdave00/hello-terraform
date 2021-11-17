output "ec2_security_group_ssh_http_for_asg" {
  value = aws_security_group.allow_ssh_http_for_asg.id
}
