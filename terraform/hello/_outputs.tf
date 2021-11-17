output "vpc_id" {
  description = "ID of project VPC"
  value       = module.vpc.vpc_id
}

output "lb_url" {
  description = "DNS of load balancer"
  value       = module.elb.loadbalancer_dns_name
}

output "bastion_public_id" {
  description = "Bastion public IP adress"
  value = module.bastion.bastion_public_ip
}

output "bastion_public_dns" {
  description = "Bastion public DNS"
  value = module.bastion.bastion_public_dns
}

output "command_to_copy_pem" {
  description = "Display command to scp pem file to bastion"
  value = "scp -i ~/dockerdave00_aws_instance_keypair.pem ~/dockerdave00_aws_instance_keypair.pem ec2-user@${module.bastion.bastion_public_ip}:~/."
}

output "command_to_ssh_to_bastion" {
  description = "Display command to ssh to bastion"
  value = "ssh -i ~/dockerdave00_aws_instance_keypair.pem ec2-user@${module.bastion.bastion_public_ip}"
}

output "url_for_the_flask_server" {
  description = "Display URL for the flask server"
  value = "http://${module.elb.loadbalancer_dns_name}/hello"
}
