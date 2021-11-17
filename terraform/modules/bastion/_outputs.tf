output "ec2_security_group_for_bastion" {
  value = aws_security_group.allow_ssh_only_for_bastion.id
}

output "aws_ec2_instance_id" {
  value = aws_instance.bastion.id
}

output "bastion_public_ip" {
  description = "Bastion public IP address"
  value = aws_instance.bastion.public_ip
}

output "bastion_public_dns" {
  description = "Bastion public DNS"
  value = aws_instance.bastion.public_dns
}
