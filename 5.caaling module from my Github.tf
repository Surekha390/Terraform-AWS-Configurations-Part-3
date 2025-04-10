
#with version number
module "consul" {
  source = "github.com/Surekha390/surekha-ec2-module?ref=v1.0.0"
}

/* 
#without version number
module "consul" {
  source = "github.com/Surekha390/surekha-ec2-module"
}

/*
module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.8.0"
}
*/
#to use existing module, we can just copy and paste this code from the module page.
#ignore this
