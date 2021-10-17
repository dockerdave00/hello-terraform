provider "aws" {
  profile           = "default"
  region            = "${var.AWS_REGION}"
}

module "vpc" {
  source            = "../modules/vpc"
}

module "ec2" {
  source            = "../modules/ec2"
  public_subnets    = module.vpc.public_subnets
  vpc_id            = module.vpc.vpc_id
  elasticache_nodes = module.elasticache.elasticache_nodes
  rds_instances     = module.rds.rds_instances
}
 
 module "elasticache" {
  source            = "../modules/elasticache"
  internal_subnets  = module.vpc.internal_subnets
  vpc_id            = module.vpc.vpc_id
 }

module "rds" {
  source            = "../modules/rds"
  db_subnets        = module.vpc.db_subnets
  vpc_id            = module.vpc.vpc_id
  db_password       = var.db_password
}
