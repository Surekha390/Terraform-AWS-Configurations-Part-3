provider "aws" {
    region = "us-east-1"
}
module "ec2" {
  source = "../../modules/ec2"
  instance_type = "t2.micro"
  subnet_id = "subnet-035810c6619ba14aa"
  ami           = "ami-071226ecf16aa7d96"

}

resource "aws_eip" "this" {
    domain = "vpc"
    instance = module.ec2.instance_id
}