terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.93"
    }
  }
}

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
}

output "instance_id" {
  value = aws_instance.web.id #we have to check attributes in documentation for "id"
}

variable "ami" {}

variable "instance_type" {}


variable "subnet_id" {}