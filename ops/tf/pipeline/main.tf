resource "aws_instance" "data_retriever" {
  ami                  = "${var.aws_ami_amazon_linux}"
  iam_instance_profile = "${data.aws_iam_role.ec2_to_s3.name}"
  instance_type        = "t2.micro"
  key_name             = "${var.ec2_ssh_key_name}"
  availability_zone    = "${var.aws_availability_zone}"
  security_groups      = [
    "${data.aws_security_group.local_ssh.id}"
  ]
  subnet_id            = "${data.aws_subnet.public.id}"
  user_data = "${base64encode(file("../../../download_data/user_data.sh"))}"
}

resource "aws_volume_attachment" "data_retriever_attachment" {
  device_name = "/dev/xvda"
  volume_id   = "${aws_ebs_volume.data_retriever.id}"
  instance_id = "${aws_instance.data_retriever.id}"
}

resource "aws_ebs_volume" "data_retriever" {
  availability_zone = "${var.aws_availability_zone}"
  size              = 8
}

resource "aws_s3_bucket" "uk_traffic_data" {
  bucket        = "uk-traffic-data",
  region        = "${var.aws_region}",
  acl           = "private",
  force_destroy = "false"
}
