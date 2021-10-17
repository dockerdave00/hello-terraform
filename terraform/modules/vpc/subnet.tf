resource "aws_subnet" "common-subnet-public" {
  vpc_id                        = "${aws_vpc.common-vpc.id}"
  cidr_block                    = "10.0.1.0/24"
  map_public_ip_on_launch       = true
  availability_zone             = "us-east-2a"

  tags = {
    Name                        = "common-subnet-public"
  }
}

resource "aws_subnet" "common-subnet-internal" {
  vpc_id                        = "${aws_vpc.common-vpc.id}"
  cidr_block                    = "10.0.2.0/24"
  map_public_ip_on_launch       = true
  availability_zone             = "us-east-2a"

  tags = {
    Name                        = "common-subnet-internal"
  }
}

resource "aws_subnet" "common-subnet-db-e2a" {
  vpc_id                        = "${aws_vpc.common-vpc.id}"
  cidr_block                    = "10.0.3.0/24"
  map_public_ip_on_launch       = true
  availability_zone             = "us-east-2a"

  tags = {
    Name                        = "common-subnet-db"
  }
}

resource "aws_subnet" "common-subnet-db-e2b" {
  vpc_id                        = "${aws_vpc.common-vpc.id}"
  cidr_block                    = "10.0.4.0/24"
  map_public_ip_on_launch       = true
  availability_zone             = "us-east-2b"

  tags = {
    Name                        = "common-subnet-db"
  }
}
