variable "AWS_REGION" {
  default = "ap-southeast-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "/tmp/mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "/tmp/mykey.pub"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1      = "ami-13be557e"
    us-west-2      = "ami-06b94666"
    eu-west-1      = "ami-844e0bf7"
    ap-southeast-1 = "ami-0abb8f6b71e7614d5"
  }
}

variable "INSTANCE_DEVICE_NAME" {
  default = "/dev/xvdh"
}

variable "DOMAIN_NAME" {
  default = "jgyynet.net"
}

variable "RDS_PASSWORD" {
  default = "password"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}