variable "db_subnet_ids" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "db_password" {
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

variable "rds_security_group" {
  type = string
}
