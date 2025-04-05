/*challenge task:
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"

    }
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "splunk" {
  default = "8088"
}
resource "aws_security_group" "security_group_payment_app" {
  name        = "payment_app"
    description = "Application Security Group"
  depends_on = [aws_eip.example]

# Below ingress allows HTTPS  from DEV VPC
  ingress {
       from_port        = 443
     to_port          = 443
    protocol         = "tcp"
      cidr_blocks      = ["172.31.0.0/16"]
  }

# Below ingress allows APIs access from DEV VPC

  ingress {
    from_port        = 8080
      to_port          = 8080
    protocol         = "tcp"
       cidr_blocks      = ["172.31.0.0/16"]
  }

# Below ingress allows APIs access from Prod App Public IP.

  ingress {
    from_port        = 8443
      to_port          = 8443
    protocol         = "tcp"
       cidr_blocks      = ["${aws_eip.example.public_ip}/32"]
  }
}
 egress {
    from_port        = var.splunk
    to_port          = var.splunk
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }



resource "aws_eip" "example" {
   domain = "vpc"
}
*/

resource "aws_eip" "example" {
  domain = "vpc"
  tags = {
    owner = "surekha"
    name = "challenge-2 eip" #this will be added to tags tab
    Name = "challenge-2 eip-name" #this will be added as a name what we can see in the list.
    Team = "Payments Team"
    Env = "Production"
  }
}

/* step-1: Deleted } above egress block and put it below egress block.
step-2: 
terraform fmt ---> To update code with good indentation
terraform init
terraform plan -var splunk=8089
terraform apply -var splunk=8089
or 
terraform apply -var "splunk=8089"
*/

/*
when we run terraform apply -var splunk=8089 command and after that if we run without giving -var splunk=8089 then another outbound rule will be created 
with default variable 8088.
Next time when we run "terraform apply -var splunk=8089 command" again then old 8088 outbound rule will be deleted, only the outbound rule with 8089 
will exists.
*/

/*
1.logical names should be understandable and simple, no need of repetition. In security group we can see the resource is security group, so no need of mentioning 
security group again in logival name.
2.we should add description to our inbound and outbound rules also to easily understand even when we see reources from console.
3.when we change the logical name and run terraform apply, it will delete old resource and create new resource, as logical name has been changed.
4. we can apply with: terraform apply -var "splunk=8089" -auto-approve
5. Eventhough when we have different folders for resources and providers and everything it doesn't affect infrastructure in anyway, 
terraform will merge all the files before it looks into what are the operations it needs to do. Folder should be same,that's it.
*/