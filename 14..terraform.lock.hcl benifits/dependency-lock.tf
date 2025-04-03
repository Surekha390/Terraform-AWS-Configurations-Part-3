terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #version = "~> 4.60"
      version = "4.60"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}



resource "aws_instance" "web" {
  ami           = ami-123
  instance_type = "t2.micro"
}

#Lock file will locks the Provider version, if we want to change the version, then we have to use "terraform init -upgrade"