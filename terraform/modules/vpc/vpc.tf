resource "aws_vpc" "generic-vpc" {
  cidr_block                    = var.cidr_block
  enable_dns_support            = true
  enable_dns_hostnames          = true
  enable_classiclink            = false
  instance_tenancy              = "default"

  tags = {
    Name                        = "generic-vpc"
  }
}
