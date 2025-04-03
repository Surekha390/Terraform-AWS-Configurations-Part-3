locals {
    instance_type = {
        default = "t2.nano"
        dev = "t2.micro"
        prod = "m5.large"
    }
}
resource aws_instance "myec2" {
    ami = "ami-0f9d441b5d66d5f31"
    instance_type = local.instance_type[terraform.workspace]
}