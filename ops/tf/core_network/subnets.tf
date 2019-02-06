resource "aws_subnet" "public" {
  cidr_block              = "${cidrsubnet(aws_vpc.main.cidr_block, 4, 0)}"
  vpc_id                  = "${aws_vpc.main.id}"
  availability_zone       = "ap-southeast-2c"
  map_public_ip_on_launch = "true"
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.main.id}"
}

resource "aws_route" "public" {
  destination_cidr_block = "0.0.0.0/0",
  gateway_id             = "${aws_internet_gateway.gw.id}",
  route_table_id         = "${aws_route_table.public.id}"
}

resource "aws_main_route_table_association" "public" {
  route_table_id = "${aws_route_table.public.id}",
  vpc_id         = "${aws_vpc.main.id}"
}

resource "aws_route_table_association" "public" {
  route_table_id = "${aws_route_table.public.id}"
    subnet_id    = "${aws_subnet.public.id}"
}
