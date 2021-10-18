aws_region              = "us-east-2"

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
