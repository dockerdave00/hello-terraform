resource "aws_instance" "app_server" {
  ami           		= "ami-00dfe2c7ce89a450b"
  instance_type 		= "t2.micro"
  key_name			= var.key_name
  vpc_security_group_ids 	= [ aws_security_group.allow_ssh_http.id ]
  subnet_id 			= var.public_subnets
  associate_public_ip_address 	= true

  tags = {
    Name 			= "common-instance"
  }

  user_data			= templatefile("${path.module}/server_setup.sh", 
				    {
				      "EC2USER_HOME"         = "/home/ec2-user"
				      "ELASTICACHE_ENDPOINT" = var.elasticache_nodes
				      "RDS_ENDPOINT"         = var.rds_instances
				    }
				  )
}

resource "aws_security_group" "allow_ssh_http" {
  name                  	= "allow_ssh_http_sg"
  description           	= "Allow SSH and HTTP inbound connections"
  vpc_id                	= var.vpc_id

  ingress {
    from_port           	= 22
    to_port             	= 22
    protocol            	= "tcp"
    cidr_blocks         	= ["0.0.0.0/0"]
  }

  ingress {
    from_port           	= 80
    to_port             	= 80
    protocol            	= "tcp"
    cidr_blocks         	= ["0.0.0.0/0"]
  }

  egress {
    from_port           	= 0
    to_port             	= 0
    protocol            	= "-1"
    cidr_blocks         	= ["0.0.0.0/0"]
  }

  tags = {
    Name                	= "allow_ssh_http_sg"
  }
}
