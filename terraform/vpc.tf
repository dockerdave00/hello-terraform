resource "aws_vpc" "hello-vpc" {
  cidr_block			= "10.0.0.0/16"
  enable_dns_support		= true
  enable_dns_hostnames		= true
  enable_classiclink		= false
  instance_tenancy		= "default"

  tags = {
    Name			= "hello-vpc"
  }
}

resource "aws_subnet" "hello-subnet-public" {
  vpc_id 			= "${aws_vpc.hello-vpc.id}"
  cidr_block			= "10.0.1.0/24"
  map_public_ip_on_launch	= true
  availability_zone		= "us-east-2a"

  tags = {
    Name			= "hello-subnet-public"
  }
}

resource "aws_subnet" "hello-subnet-internal" {
  vpc_id 			= "${aws_vpc.hello-vpc.id}"
  cidr_block			= "10.0.2.0/24"
  map_public_ip_on_launch	= true
  availability_zone		= "us-east-2a"

  tags = {
    Name			= "hello-subnet-internal"
  }
}

resource "aws_subnet" "hello-subnet-db-e2a" {
  vpc_id 			= "${aws_vpc.hello-vpc.id}"
  cidr_block			= "10.0.3.0/24"
  map_public_ip_on_launch	= true
  availability_zone		= "us-east-2a"

  tags = {
    Name			= "hello-subnet-db"
  }
}

resource "aws_subnet" "hello-subnet-db-e2b" {
  vpc_id 			= "${aws_vpc.hello-vpc.id}"
  cidr_block			= "10.0.4.0/24"
  map_public_ip_on_launch	= true
  availability_zone		= "us-east-2b"

  tags = {
    Name			= "hello-subnet-db"
  }
}
# small change to trigger version control
