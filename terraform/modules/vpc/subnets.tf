resource "aws_subnet" "subnet-public" {
  for_each			= var.public_subnets

  vpc_id                        = var.vpc_id
  availability_zone             = each.key
  cidr_block                    = each.value

  tags = {
    Name                        = "subnet-public-${each.key}"
  }
}

resource "aws_subnet" "subnet-private" {
  for_each			= var.private_subnets

  vpc_id                        = var.vpc_id
  availability_zone             = each.key
  cidr_block                    = each.value

  tags = {
    Name                        = "subnet-private-${each.key}"
  }
}

resource "aws_subnet" "subnet-db" {
  for_each			= var.db_subnets

  vpc_id                        = var.vpc_id
  availability_zone             = each.key
  cidr_block                    = each.value

  tags = {
    Name                        = "subnet-db-${each.key}"
  }
}
