variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  default = "eu-west-2"
}

variable "AMIS" {
  type = "map"

  default = {
    us-east-1 = "ami-04b8c2001b0bf0c27"
    eu-west-2 = "ami-07dc734dc14746eab"
    eu-west-1 = "ami-04ee3f20dbc50ab21"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}
