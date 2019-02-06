resource "aws_iam_role" "ec2_to_s3" {
  assume_role_policy = <<POLICY
{
  "Version" : "2012-10-17",
  "Statement" : [
    {
      "Effect" : "Allow",
      "Principal" : {
        "Service" : "ec2.amazonaws.com"
      },
      "Action" : "sts:AssumeRole"
    }
  ]
}
POLICY
  description = "EC2 instances can read and write to s3."
  name        = "EC2-to-S3"
}

resource "aws_iam_role_policy_attachment" "aws_s3_full_access" {
  role = "${aws_iam_role.ec2_to_s3.name}"
  policy_arn = "${data.aws_iam_policy.s3_full_access.arn}"
}
