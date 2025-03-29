/*
module "iam" {
  source  = "terraform-aws-modules/iam/aws"
  version = "5.54.0"
  #This will show no changes, as we need to specify which submodule we need, as in IAM we can do so many like Users,Roles,Policies etc.
}
*/
module "iam_iam-user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "5.54.0"
  name = "modules-iam-user"
  # insert the 1 required variable here i.e;name
  #This module create IAM user,IAM access keys, IAM console login to that user.
}