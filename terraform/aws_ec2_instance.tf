resource "aws_instance" "app_server" {
  ami           		= "ami-00dfe2c7ce89a450b"
  instance_type 		= "t2.micro"
  key_name			= var.key_name
  vpc_security_group_ids 	= [ aws_security_group.allow_ssh_http.id ]
  subnet_id 			= aws_subnet.hello-subnet-public.id
  associate_public_ip_address 	= true

  tags = {
    Name 			= "hello-instance"
  }

  user_data			= templatefile("${path.module}/server_setup.sh", 
				    {
				      "EC2USER_HOME" = "/home/ec2-user"
				      "ELASTICACHE_ENDPOINT" = aws_elasticache_cluster.hello.cache_nodes.0.address
				      "RDS_ENDPOINT" = aws_db_instance.hello.address 
				    }
				  )
}

resource "aws_security_group" "allow_ssh_http" {
  name                  	= "allow_ssh_http_sg"
  description           	= "Allow SSH and HTTP inbound connections"
  vpc_id                	= aws_vpc.hello-vpc.id

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
# small change to trigger version control
