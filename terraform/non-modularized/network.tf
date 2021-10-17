resource "aws_internet_gateway" "hello-igw" {
  vpc_id 	= "${aws_vpc.hello-vpc.id}"
  
  tags = {
    Name 	= "hello-igw"
  }
}

resource "aws_route_table" "hello-igw" {
  vpc_id 	= "${aws_vpc.hello-vpc.id}"

  tags = {
    Name 	= "hello-igw"
  }
}

resource "aws_route_table" "hello-public-crt" {
  vpc_id 	= "${aws_vpc.hello-vpc.id}"
  
  route {
    # associated subnet can reach everywhere
    cidr_block 	= "0.0.0.0/0"

    # CRT uses this IGW to reach internet
    gateway_id 	= "${aws_internet_gateway.hello-igw.id}"
  }

  tags = {
    Name 	= "hello-public-crt"
  }
}

resource "aws_route_table_association" "hello-crta-public-subnet" {
  subnet_id	 = "${aws_subnet.hello-subnet-public.id}"
  route_table_id = "${aws_route_table.hello-public-crt.id}"
}
# small change to trigger version control
