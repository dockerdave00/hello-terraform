resource "aws_db_parameter_group" "generic" {
  name				= "generic"
  family			= "postgres12"

  parameter {
    name			= "log_connections"
    value			= "1"
  }
}

resource "aws_db_instance" "generic" {
  identifier			= "db-generic"
  instance_class        	= var.rds_instance_class
  allocated_storage     	= var.rds_alloc_storage
  engine                	= var.rds_engine
  engine_version        	= var.rds_engine_ver
  username              	= var.rds_username
  password              	= var.db_password
  db_subnet_group_name		= aws_db_subnet_group.generic.name
  vpc_security_group_ids	= [ var.rds_security_group ]
  publicly_accessible   	= false
  skip_final_snapshot   	= true
}

resource "aws_db_subnet_group" "generic" {
  name       			= "internal-db-generic-subnet"
  subnet_ids 			= flatten([ var.db_subnet_ids ])

  tags = {
    Name 			= "DB subnet group"
  }
}
