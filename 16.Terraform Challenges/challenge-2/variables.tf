variable "port-1-https" {
  type = number
}

variable "cidr-dev_vpc" {
    type = list
}

#2nd ingress
variable "port-2-apis" {
  type = number
}

#3r ingress
variable "port-3-prod_apis" {
  type = number
}

#egress cidr
variable "cidr-egress" {
    type = list
}

variable "splunk" {
  default = "8088"
}