variable "AWS_REGION" {
  default     = "us-east-2"
  description = "AWS region"
}

variable "db_password" {
  description = "RDS root user password"
  sensitive   = true
}

variable "key_name" {
   default = "dockerdave00_aws_instance_keypair"
}
# small change to trigger version control
