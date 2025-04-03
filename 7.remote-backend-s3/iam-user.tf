resource "aws_iam_user" "lb" {
  name = "my-iam-user-2"
  path = "/system/"
}