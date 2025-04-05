/*
Challenge-task-code:
provider "aws" {
  version = "~> 2.54"
  region  = "us-east-1"
  access_key = "AKIAIOSFODNN7EXAMPLE"
  secret_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
}

provider "digitalocean" {}

terraform {
    required_version = "0.12.31"
}


resource "aws_eip" "kplabs_app_ip" {
  vpc      = true
}
*/


#solution
terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}
provider "aws" {
  region = "us-west-2"
}

resource "aws_eip" "kplabs_app_ip" {
  domain   = "vpc"
}



/*
Step -1: Need to install terraform 0.12.31 from official website and place the terrform.exe file(which we get after extract) in a path like c:/ then 
we need to open Advanced system settings->Environment variables->system variables->path->change the old path to c:/ and click on ok. Open new cmd and check terraform version. 
we will get 0.12.31 in the result.
(or)
We can simply add terraform.exe file in the challenge-1 folder and run " terraform.exe init " so that the old version will be stick only to this folder. 
when we check terraform version in the same terminal we will get v0.12.31
when we open another cmd and check terraform version it shows our v1.11.1 (latest version)
step-2: when the provider like digital ocean is not official, then we need to use provider block in terraform block. As new versions only
supports digital ocean providers with terarform block.
step-3: change to domain = "vpc" as new version supports it.
*/