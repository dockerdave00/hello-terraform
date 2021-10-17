resource "aws_elasticache_cluster" "hello" {
  cluster_id           	= "cluster-hello"
  engine               	= "redis"
  node_type            	= "cache.t2.micro"
  num_cache_nodes      	= 1
  parameter_group_name 	= "default.redis6.x"
  subnet_group_name	= aws_elasticache_subnet_group.hello.name
  security_group_ids	= [ aws_security_group.allow_elasticache.id ]
  engine_version       	= "6.x"
  port                 	= 6379

  tags = {
    name                = "hello-elasticache-cluster"
  }

}

resource "aws_elasticache_subnet_group" "hello" {
  name			= "internal-cache-hello-subnet"
  subnet_ids		= [ aws_subnet.hello-subnet-internal.id ]

  tags = {
    Name		= "Elasticache subnet group"
  }
}

resource "aws_security_group" "allow_elasticache" {
  name                  = "allow_elasticache_sg"
  description           = "Allow Elasticache connections to instance"
  vpc_id                = aws_vpc.hello-vpc.id

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
# small change to trigger version control
