data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "surekha-remote-state-data-source-bucket"
    key    = "eip.tfstate"
    region = "us-west-2"
  }
}
