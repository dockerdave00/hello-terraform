resource "aws_elasticache_cluster" "common" {
  cluster_id           	= "cluster-common"
  engine               	= "redis"
  node_type            	= "cache.t2.micro"
  num_cache_nodes      	= 1
  parameter_group_name 	= "default.redis6.x"
  subnet_group_name	= aws_elasticache_subnet_group.common.name
  security_group_ids	= [ aws_security_group.allow_elasticache.id ]
  engine_version       	= "6.x"
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
