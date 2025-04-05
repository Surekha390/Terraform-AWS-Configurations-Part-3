locals {
  cidr = ["${aws_eip.example.public_ip}/32"]
}

resource "aws_security_group" "payment_app" {
  name        = "payment_app"
  description = "Application Security Group"
  depends_on  = [aws_eip.example]
  tags = {
    owner = "surekha"
    Name = "challenge-2 security-group"
    Team = "Payments Team"
    Env = "Production"

  }

  # Below ingress allows HTTPS  from DEV VPC
  ingress {
    description = "ingress allows HTTPS  from DEV VPC"
    from_port   = var.port-1-https
    to_port     = var.port-1-https
    protocol    = "tcp"
    cidr_blocks = var.cidr-dev_vpc
  }

  # Below ingress allows APIs access from DEV VPC

  ingress {
    description = "ingress allows APIs access from DEV VPC"
    from_port   = var.port-2-apis
    to_port     = var.port-2-apis
    protocol    = "tcp"
    cidr_blocks = var.cidr-dev_vpc
  }

  # Below ingress allows APIs access from Prod App Public IP.

  ingress {
    description = "ingress allows APIs access from Prod App Public IP"
    from_port   = var.port-3-prod_apis
    to_port     = var.port-3-prod_apis
    protocol    = "tcp"
    cidr_blocks = local.cidr
  }

  egress {
    description = "Allow splunk"
    from_port   = var.splunk
    to_port     = var.splunk
    protocol    = "tcp"
    cidr_blocks = var.cidr-egress
  }
  
  
}
