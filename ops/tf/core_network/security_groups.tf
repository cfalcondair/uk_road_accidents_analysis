resource "aws_security_group" "local_ssh" {
  name        = "local_ssh"
  description = "Allow local ssh access and all outbound traffic"
  vpc_id      = "${aws_vpc.main.id}"
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks     = ["194.187.249.183/32"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "egress_only" {
  name        = "egress_only"
  description = "Only allow egress traffic from box"
  vpc_id      = "${aws_vpc.main.id}"

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}
