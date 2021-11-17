resource "aws_instance" "bastion" {
  ami           		= var.latest_ami
  instance_type 		= var.ec2_instance_type
  key_name			= var.key_name
  vpc_security_group_ids 	= [ var.ec2_security_group_for_bastion ]
  subnet_id 			= var.subnet_id
  associate_public_ip_address   = var.public_ip_address

  tags = {
    Name 			= "generic-instance"
  }
}
