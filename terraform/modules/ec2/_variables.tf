variable "subnet_id" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "key_name" {
   default = "dockerdave00_aws_instance_keypair"
}

variable "latest_ami" {
  type = string
}

variable "ec2_instance_type" {
  type = string
}

variable "ec2_security_group" {
  type = string
}
