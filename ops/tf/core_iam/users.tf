resource "aws_iam_user" "deploy_tf" {
  name          = "deploy_tf"
  path          = "/"
  force_destroy = "false"
}

resource "aws_iam_user" "local_command_line" {
  name          = "local_command_line"
  path          = "/"
  force_destroy = "false"
}
