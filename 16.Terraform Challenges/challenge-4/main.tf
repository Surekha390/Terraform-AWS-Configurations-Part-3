
data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

resource "aws_iam_user" "lb" {
  name = "admin-user-${data.aws_caller_identity.current.account_id}"
  path = "/system/"
}

data "aws_iam_users" "users" {}

output "iam-user-names" {
    value = data.aws_iam_users.users.names
}

output "total-iam-users" {
    value = length(data.aws_iam_users.users.names)
}