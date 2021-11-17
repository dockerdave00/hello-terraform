variable "private_subnet_ids" {
  type = list(string)
}

variable "elb_name" {
  type = string
}

variable "latest_ami" {
  type = string
}

variable "asg_instance_type" {
  type = string 
}

variable "user_data" {
  type = string
}

variable "asg_security_group_ssh_http" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "key_name" {
  type = string
}
