provider "aws" {
  profile                 = "default"
  region                  = var.aws_region
}

data "aws_ami" "amazon_linux" {
  most_recent             = true
  owners                  = ["amazon"]

  filter {
    name                  = "name"
    values                = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

module "vpc" {
  source                  = "../modules/vpc"
  vpc_id                  = module.vpc.vpc_id
  cidr_block		  = var.cidr_block
  internet_gateway        = module.vpc.internet_gateway
  db_subnets		  = var.db_subnets
  public_subnets	  = var.public_subnets
  private_subnets	  = var.private_subnets
}

module "ec2" {
  source                  = "../modules/ec2"
  latest_ami              = data.aws_ami.amazon_linux.id
  ec2_instance_type       = var.ec2_instance_type
  vpc_id                  = module.vpc.vpc_id
  ec2_security_group      = module.ec2.ec2_security_group
  subnet_id    		  = module.vpc.public_subnet_ids[0]
  user_data               = templatefile("server_setup.sh",
                                          { "EC2USER_HOME" = "/home/ec2-user"
                                            "ECACHE_EP"    = module.elasticache.elasticache_nodes
                                            "RDS_EP"       = module.rds.rds_instances })
}
 
module "elasticache" {
  source                  = "../modules/elasticache"
  ecache_engine           = var.ecache_engine
  ecache_cache_type       = var.ecache_cache_type
  ecache_param_group_name = var.ecache_param_group_name
  ecache_engine_ver       = var.ecache_engine_ver
  ecache_nodes_qty        = var.ecache_nodes_qty
  db_subnet_ids           = module.vpc.db_subnet_ids
  vpc_id                  = module.vpc.vpc_id
  ecache_security_group   = module.elasticache.ecache_security_group
}

module "rds" {
  source                  = "../modules/rds"
  rds_instance_class      = var.rds_instance_class
  rds_alloc_storage       = var.rds_alloc_storage
  rds_engine              = var.rds_engine
  rds_engine_ver          = var.rds_engine_ver
  rds_username            = var.rds_username
  db_subnet_ids           = module.vpc.db_subnet_ids
  vpc_id                  = module.vpc.vpc_id
  rds_security_group      = module.rds.rds_security_group
  db_password             = var.db_password
}
