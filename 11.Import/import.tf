/*
provider "aws" {
    region = "us-west-2"
}
import {
  to = aws_security_group.mysg
  id = "sg-0d3c762cc42483aa8"
}
*/

provider "aws" {
  region     = "us-west-2"
}

import {
  to = aws_security_group.mysg
  id = "sg-0d3c762cc42483aa8"
}

/*
Commands:
terraform plan -generate-config-out="myfile.tf"
terraform apply
*/

/*
File with Terraform configuration will be created when we run terraform plan -generate-config-out="myfile.tf"
State file will be created when we run terraform apply
*/