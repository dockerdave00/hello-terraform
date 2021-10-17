resource "aws_internet_gateway" "common-igw" {
  vpc_id        = "${aws_vpc.common-vpc.id}"

  tags = {
    Name        = "common-igw"
  }
}
