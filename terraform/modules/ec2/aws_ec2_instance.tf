resource "aws_instance" "app_server" {
  ami           		= var.latest_ami
  instance_type 		= var.ec2_instance_type
  key_name			= var.key_name
  vpc_security_group_ids 	= [ var.ec2_security_group ]
  subnet_id 			= var.public_subnet
  associate_public_ip_address 	= true

  tags = {
    Name 			= "common-instance"
  }

  user_data			= var.user_data
}
