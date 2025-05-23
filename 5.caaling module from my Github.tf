
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

/*
To create version in my github repo, i selected releases in my repo, inside it i created tag with v1.0.0 and then and clicked on publish release.
so that zip file and tar file will be created automatically for our code along with version. when we mention this version name in our terraform code,
then automatically this zip file will be downloaded in .terraform folder when we run terraform init.
*/