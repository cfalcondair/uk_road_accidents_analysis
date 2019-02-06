data "aws_iam_policy" "s3_full_access" {
  arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

data "aws_iam_policy" "ec2_full_access" {
  arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

data "aws_iam_policy" "iam_full_access" {
  arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}
