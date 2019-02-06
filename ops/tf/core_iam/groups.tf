resource "aws_iam_group" "deployment" {
  name = "deployment"
}

resource "aws_iam_group_policy_attachment" "deployment_ec2_full_access" {
  group      = "${aws_iam_group.deployment.name}"
  policy_arn = "${data.aws_iam_policy.ec2_full_access.arn}"
}

resource "aws_iam_group_policy_attachment" "deployment_s3_full_access" {
  group      = "${aws_iam_group.deployment.name}"
  policy_arn = "${data.aws_iam_policy.s3_full_access.arn}"
}

# At a later date, confine this role to just be manual iam read access, as
# the ec2 building requires iam:PassRole, which is not in the default
# arn:aws:iam::aws:policy/IAMReadOnlyAccess policy.
resource "aws_iam_group_policy_attachment" "deployment_iam_full_access" {
  group      = "${aws_iam_group.deployment.name}"
  policy_arn = "${data.aws_iam_policy.iam_full_access.arn}"
}

resource "aws_iam_group_membership" "deployment" {
  name = "deployment"

  users = [
    "${aws_iam_user.deploy_tf.name}"
  ]

  group = "${aws_iam_group.deployment.name}"
}



resource "aws_iam_group" "local_command_line" {
  name = "local_command_line"
}

resource "aws_iam_group_policy_attachment" "local_command_line_s3_full_access" {
  group      = "${aws_iam_group.local_command_line.name}"
  policy_arn = "${data.aws_iam_policy.ec2_full_access.arn}"
}

resource "aws_iam_group_membership" "local_command_line" {
  name = "local_command_line"

  users = [
    "${aws_iam_user.local_command_line.name}"
  ]

  group = "${aws_iam_group.local_command_line.name}"
}
