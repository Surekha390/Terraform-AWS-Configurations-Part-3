terraform {
  backend "s3" {
    bucket = "surekha-remote-state-data-source-bucket"
    key    = "eip.tfstate"
    region = "us-west-2"
  }
}