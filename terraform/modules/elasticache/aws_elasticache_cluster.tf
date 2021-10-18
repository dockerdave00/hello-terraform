resource "aws_elasticache_cluster" "common" {
  cluster_id           	= "cluster-common"
  engine               	= var.ecache_engine
  node_type            	= var.ecache_cache_type
  num_cache_nodes      	= var.ecache_nodes_qty
  parameter_group_name 	= var.ecache_param_group_name
  subnet_group_name	= aws_elasticache_subnet_group.common.name
  security_group_ids	= [ aws_security_group.allow_elasticache.id ]
  engine_version       	= var.ecache_engine_ver
  port                 	= 6379

  tags = {
    name                = "common-elasticache-cluster"
  }

}

resource "aws_elasticache_subnet_group" "common" {
  name			= "internal-cache-common-subnet"
  subnet_ids		= [ var.internal_subnets ]

  tags = {
    Name		= "Elasticache subnet group"
  }
}

resource "aws_security_group" "allow_elasticache" {
  name                  = "allow_elasticache_sg"
  description           = "Allow Elasticache connections to instance"
  vpc_id                = var.vpc_id

  ingress {
    from_port           = 6379
    to_port             = 6379
    protocol            = "tcp"
    cidr_blocks         = [ "0.0.0.0/0" ]
  }

  egress {
    from_port           = 6379
    to_port             = 6379
    protocol            = "tcp"
    cidr_blocks         = [ "0.0.0.0/0" ]
  }

  tags = {
    Name                = "allow_elasticache_sg"
  }
}
