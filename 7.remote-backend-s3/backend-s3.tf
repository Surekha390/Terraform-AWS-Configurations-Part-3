terraform {
  backend "s3" {
    bucket = "surekha-terraform-bucket"
    key    = "network-state files/terraform.tfstate"  #path where the .tfstate file shoulb be stored.
    region = "us-west-2"
  }
}
#As we already gave our access keys in aws configure, we don't need to give access keys again.We can also specify 
#access keys and secret access keys here in this code if we want(which is not a best practise).