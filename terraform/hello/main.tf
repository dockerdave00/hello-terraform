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
}

module "ec2" {
  source                  = "../modules/ec2"
  latest_ami              = data.aws_ami.amazon_linux.id
  ec2_instance_type       = var.ec2_instance_type
  public_subnets          = module.vpc.public_subnets
  vpc_id                  = module.vpc.vpc_id
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
  internal_subnets        = module.vpc.internal_subnets
  vpc_id                  = module.vpc.vpc_id
 }

module "rds" {
  source                  = "../modules/rds"
  rds_instance_class      = var.rds_instance_class
  rds_alloc_storage       = var.rds_alloc_storage
  rds_engine              = var.rds_engine
  rds_engine_ver          = var.rds_engine_ver
  rds_username            = var.rds_username
  db_subnets              = module.vpc.db_subnets
  vpc_id                  = module.vpc.vpc_id
  db_password             = var.db_password
}
