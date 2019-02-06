# Created from core iam
data "aws_iam_role" "ec2_to_s3" {
  name = "EC2-to-S3"
}

# Created from core network
data "aws_security_group" "local_ssh" {
  id = "sg-02a1567342f941e09"
}

# Created from core network
data "aws_security_group" "egress_only" {
  id = "sg-0880fac2538724a4e"
}

# Created from core network
data "aws_subnet" "public" {
  id = "subnet-0c40a420e966384dd"
}
