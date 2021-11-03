resource "aws_instance" "app_server" {
  ami           		= var.latest_ami
  instance_type 		= var.ec2_instance_type
  key_name			= var.key_name
  vpc_security_group_ids 	= [ var.ec2_security_group ]
  subnet_id 			= var.subnet_id

  tags = {
    Name 			= "generic-instance"
  }
}
