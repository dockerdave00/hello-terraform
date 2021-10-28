variable "db_subnet_ids" {
  type = list(string)
}

variable "vpc_id" {
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

variable "ecache_security_group" {
  type = string
}
