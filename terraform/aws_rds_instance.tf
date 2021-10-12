resource "aws_db_parameter_group" "hello" {
  name				= "hello"
  family			= "postgres12"

  parameter {
    name			= "log_connections"
    value			= "1"
  }
}

resource "aws_db_instance" "hello" {
  identifier			= "db-hello"
  instance_class        	= "db.t2.micro"
  allocated_storage     	= 10
  engine                	= "postgres"
  engine_version        	= "12.8"
  username              	= "postgres"
  password              	= var.db_password
  db_subnet_group_name		= aws_db_subnet_group.hello.name
  vpc_security_group_ids	= [ aws_security_group.allow_rds.id ]
  publicly_accessible   	= false
  skip_final_snapshot   	= true
}

resource "aws_db_subnet_group" "hello" {
  name       			= "internal-db-hello-subnet"
  subnet_ids 			= [ aws_subnet.hello-subnet-db-e2a.id, aws_subnet.hello-subnet-db-e2b.id ]

  tags = {
    Name 			= "DB subnet group"
  }
}

resource "aws_security_group" "allow_rds" {
  name                  	= "allow_rds_sg"
  description           	= "Allow RDS connections to instance"
  vpc_id                	= aws_vpc.hello-vpc.id

  ingress {
    from_port           	= 5432
    to_port             	= 5432
    protocol            	= "tcp"
    cidr_blocks         	= [ "0.0.0.0/0" ]
  }

  egress {
    from_port           	= 5432
    to_port             	= 5432
    protocol            	= "tcp"
    cidr_blocks         	= [ "0.0.0.0/0" ]
  }

  tags = {
    Name                	= "allow_rds_sg"
  }
}
# small change to trigger version control
