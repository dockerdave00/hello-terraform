variable "vpc_id" {
  type = string
}

variable "elb_name" {
  type = string
}

variable "aws_ec2_instance_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "elb_security_group_http_only" {
  type = list(string)
}

variable "ec2_instance_port" {
  type = string
}

variable "elb_health_check_target" {
  type = string
}
