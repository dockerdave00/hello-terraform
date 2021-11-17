resource "aws_elasticache_cluster" "generic" {
  cluster_id           	= "cluster-generic"
  engine               	= var.ecache_engine
  node_type            	= var.ecache_cache_type
  num_cache_nodes      	= var.ecache_nodes_qty
  parameter_group_name 	= var.ecache_param_group_name
  subnet_group_name	= aws_elasticache_subnet_group.db.name
  security_group_ids	= [ var.ecache_security_group ]
  engine_version       	= var.ecache_engine_ver
  port                 	= 6379

  tags = {
    name                = "generic-elasticache-cluster"
  }

}

resource "aws_elasticache_subnet_group" "db" {
  name			= "cache-db-subnet"
  subnet_ids		= flatten([ var.db_subnet_ids ])

  tags = {
    Name		= "Elasticache subnet group"
  }
}
