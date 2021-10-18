variable "db_password" {
  description = "RDS root user password"
  sensitive   = true
}

variable "key_name" {
   default = "dockerdave00_aws_instance_keypair"
}

variable "aws_region" {
}

variable "ec2_instance_type" {
}

variable "ecache_engine" {
}

variable "ecache_cache_type" {
}

variable "ecache_param_group_name" {
}

variable "ecache_engine_ver" {
}

variable "ecache_nodes_qty" {
}

variable "rds_instance_class" {
}

variable "rds_alloc_storage" {
}

variable "rds_engine" {
}

variable "rds_engine_ver" {
}

variable "rds_username" {
}
