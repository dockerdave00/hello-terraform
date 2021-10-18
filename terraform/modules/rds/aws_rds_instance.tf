resource "aws_db_parameter_group" "common" {
  name				= "common"
  family			= "postgres12"

  parameter {
    name			= "log_connections"
    value			= "1"
  }
}

resource "aws_db_instance" "common" {
  identifier			= "db-common"
  instance_class        	= var.rds_instance_class
  allocated_storage     	= var.rds_alloc_storage
  engine                	= var.rds_engine
  engine_version        	= var.rds_engine_ver
  username              	= var.rds_username
  password              	= var.db_password
  db_subnet_group_name		= aws_db_subnet_group.common.name
  vpc_security_group_ids	= [ aws_security_group.allow_rds.id ]
  publicly_accessible   	= false
  skip_final_snapshot   	= true
}

resource "aws_db_subnet_group" "common" {
  name       			= "internal-db-common-subnet"
  subnet_ids 			= [ var.db_subnets[0], var.db_subnets[1] ]

  tags = {
    Name 			= "DB subnet group"
  }
}

resource "aws_security_group" "allow_rds" {
  name                  	= "allow_rds_sg"
  description           	= "Allow RDS connections to instance"
  vpc_id                	= var.vpc_id

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
