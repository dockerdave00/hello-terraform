resource "aws_route_table" "common-igw" {
  vpc_id        = "${aws_vpc.common-vpc.id}"

  tags = {
    Name        = "common-igw"
  }
}

resource "aws_route_table" "common-public-crt" {
  vpc_id        = "${aws_vpc.common-vpc.id}"

  route {
    # associated subnet can reach everywhere
    cidr_block  = "0.0.0.0/0"

    # CRT uses this IGW to reach internet
    gateway_id  = "${aws_internet_gateway.common-igw.id}"
  }

  tags = {
    Name        = "common-public-crt"
  }
}

resource "aws_route_table_association" "common-crta-public-subnet" {
  subnet_id      = "${aws_subnet.common-subnet-public.id}"
  route_table_id = "${aws_route_table.common-public-crt.id}"
}
