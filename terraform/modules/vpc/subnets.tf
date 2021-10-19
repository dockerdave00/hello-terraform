resource "aws_subnet" "subnet-public" {
  vpc_id                        = var.vpc_id
  cidr_block                    = "10.0.1.0/24"
  map_public_ip_on_launch       = true
  availability_zone             = "us-east-2a"

  tags = {
    Name                        = "subnet-public"
  }
}

resource "aws_subnet" "subnet-private" {
  vpc_id                        = var.vpc_id
  cidr_block                    = "10.0.2.0/24"
  map_public_ip_on_launch       = true
  availability_zone             = "us-east-2a"

  tags = {
    Name                        = "subnet-private"
  }
}

resource "aws_subnet" "subnet-db-e2a" {
  vpc_id                        = var.vpc_id
  cidr_block                    = "10.0.3.0/24"
  map_public_ip_on_launch       = true
  availability_zone             = "us-east-2a"

  tags = {
    Name                        = "subnet-db-e2a"
  }
}

resource "aws_subnet" "subnet-db-e2b" {
  vpc_id                        = var.vpc_id
  cidr_block                    = "10.0.4.0/24"
  map_public_ip_on_launch       = true
  availability_zone             = "us-east-2b"

  tags = {
    Name                        = "subnet-db-e2b"
  }
}
