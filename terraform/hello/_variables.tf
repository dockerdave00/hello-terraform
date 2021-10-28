variable "db_password" {
  type = string
  description = "RDS root user password"
  sensitive   = true
}

variable "key_name" {
  type = string
  default = "dockerdave00_aws_instance_keypair"
}

variable "aws_region" {
  type = string
}

variable "ec2_instance_type" {
  type = string
}

variable "ecache_engine" {
  type = string
}

variable "ecache_cache_type" {
  type = string
}

variable "ecache_param_group_name" {
  type = string
}

variable "ecache_engine_ver" {
  type = string
}

variable "ecache_nodes_qty" {
  type = string
}

variable "rds_instance_class" {
  type = string
}

variable "rds_alloc_storage" {
  type = string
}

variable "rds_engine" {
  type = string
}

variable "rds_engine_ver" {
  type = string
}

variable "rds_username" {
  type = string
}

variable "db_subnets" {
  type = map
  default = {
    "us-east-2a" = "10.0.3.0/24"
    "us-east-2b" = "10.0.5.0/24"
    "us-east-2c" = "10.0.7.0/24"
  }
}

variable "public_subnets" {
  type = map
  default = {
    "us-east-2a" = "10.0.13.0/24"
    "us-east-2b" = "10.0.15.0/24"
    "us-east-2c" = "10.0.17.0/24"
  }
}

variable "private_subnets" {
  type = map
  default = {
    "us-east-2a" = "10.0.23.0/24"
    "us-east-2b" = "10.0.25.0/24"
    "us-east-2c" = "10.0.27.0/24"
  }
}
