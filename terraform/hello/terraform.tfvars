aws_region              = "us-east-2"
cidr_block              = "10.0.0.0/16" 

db_subnets = {
  "us-east-2a" = "10.0.3.0/24"
  "us-east-2b" = "10.0.5.0/24"
  "us-east-2c" = "10.0.7.0/24"
}

public_subnets = {
  "us-east-2a" = "10.0.13.0/24"
  "us-east-2b" = "10.0.15.0/24"
  "us-east-2c" = "10.0.17.0/24"
}

private_subnets = {
  "us-east-2a" = "10.0.23.0/24"
  "us-east-2b" = "10.0.25.0/24"
  "us-east-2c" = "10.0.27.0/24"
}

ec2_instance_type       = "t2.micro"

ecache_engine           = "redis"
ecache_cache_type       = "cache.t2.micro"
ecache_param_group_name = "default.redis6.x"
ecache_engine_ver       = "6.x"
ecache_nodes_qty        = 1

rds_instance_class      = "db.t2.micro"
rds_alloc_storage       = 10
rds_engine              = "postgres"
rds_engine_ver          = "12.8"
rds_username            = "postgres"
