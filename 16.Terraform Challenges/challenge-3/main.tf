
/*Challenge-task:
variable "instance_config" {
  type = map
  default = {
    instance1 = { instance_type = "t2.micro", ami = "ami-03a6eaae9938c858c" }
    instance2 = { instance_type = "t2.small", ami = "ami-053b0d53c279acc90" }
  }
}
*/

variable "instance_config" {
  type = map
  default = {
    instance1 = { instance_type = "t2.micro", ami = "ami-0edf4a7e3058418ad" }
    #instance2 = { instance_type = "t2.small", ami = "ami-087f352c165340ea1" }
    instance3 = { instance_type = "t2.small", ami = "ami-087f352c165340ea1" }
  }
}

resource "aws_instance" "web" {
  for_each = var.instance_config
  ami           = each.value.ami
  instance_type = each.value.instance_type
  
}


 