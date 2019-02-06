provider "aws" {
  version = "~> 1.24"
  profile = "${var.aws_profile}"
  region  = "${var.aws_region}"
}
