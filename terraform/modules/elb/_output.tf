output "loadbalancer_dns_name" {
  value = aws_elb.elb.dns_name
}

output "elb_security_group_http_only" {
  value = aws_security_group.allow_http_only_for_elb.id
}
