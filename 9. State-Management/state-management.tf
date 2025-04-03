terraform {
  backend "s3" {
    bucket = "surekha-state-management-bucket"
    key    = "demo.tfstate"
    region = "us-west-2"
  }
}

resource "aws_iam_user" "prod" {  #changes dev to prod here, after i used terraform state mv. Using this, it will simply change the name, instead of 
#deleting one resource and adding another resource.
  name = "kplabs-user-01"
}

resource "aws_security_group" "prod" {
  name        = "terraform-firewalls"
}

/*
resource "aws_vpc_security_group_ingress_rule" "example" {
  security_group_id = aws_security_group.prod.id

  cidr_ipv4   = "10.0.0.0/8"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_vpc_security_group_ingress_rule" "example2" {
  security_group_id = aws_security_group.prod.id

  cidr_ipv4   = "10.0.0.0/8"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}
*/

#In a situation, when we want to delete all the resources created through our terraform configuration file, except one or some resources, then we can
#just remove those resources in state file using "terraform state rm instance-name" command and then we can just destroy the resources or we can just 
#remove the code. So that these resources, what we want, we can manage them by our own.