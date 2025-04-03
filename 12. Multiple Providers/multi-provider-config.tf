provider "aws" {
  region = "ap-southeast-1" #Singapore region
}

provider "aws" {
  alias = "mumbai" 
  region = "ap-south-1"
}

provider "aws" {
  alias = "usa" 
  region = "us-east-1"
}

resource "aws_security_group" "allow_tls" {
  name        = "prod_firewall"
  provider = aws.usa
}

resource "aws_security_group" "allow_tls-1" {
  name        = "staging_firewall"
  provider = aws.mumbai

}

/*
If we don't specify any provider in our resource block, then by default it will be created in the provider region which don't have any alias, as
it is a default region
*/