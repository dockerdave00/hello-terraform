variable "db_password" {
  description = "RDS root user password"
  type = string
  sensitive   = true
}

variable "key_name" {
  type = string
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

variable "cidr_block" {
  type = string
}

variable "db_subnets" {
  type = map
}

variable "public_subnets" {
  type = map
}

variable "private_subnets" {
  type = map
}

variable "elb_name" {
  type = string
}

variable "ec2_instance_port" {
  type = string
}

variable "elb_health_check_target" {
  type = string
}

# variable "loadbalancer_dns_name" {
#   type = string
# }
