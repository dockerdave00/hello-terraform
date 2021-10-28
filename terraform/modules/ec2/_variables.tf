variable "subnet_id" {
  type = string
}

variable "vpc_id" {
}

variable "key_name" {
   default = "dockerdave00_aws_instance_keypair"
}

variable "user_data" {
}

variable "latest_ami" {
}

variable "ec2_instance_type" {
}

variable "ec2_security_group" {
}
