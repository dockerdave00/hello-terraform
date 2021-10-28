variable "vpc_id" {
  type = string
}

variable "cidr_block" {
  type = string
}

variable "internet_gateway" {
  type = string
}

variable "db_subnets" {
  type = map(string)
}

variable "public_subnets" {
  type = map(string)
}

variable "private_subnets" {
  type = map(string)
}
