variable "subnet_id" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "key_name" {
   type = string
}

variable "latest_ami" {
  type = string
}

variable "ec2_instance_type" {
  type = string
}

variable "ec2_security_group_for_bastion" {
  type = string
}

variable "public_ip_address" {
  type = bool
}
