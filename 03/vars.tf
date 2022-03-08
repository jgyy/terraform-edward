variable "AWS_REGION" {
  default = "ap-southeast-1"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1      = "ami-13be557e"
    us-west-2      = "ami-06b94666"
    eu-west-1      = "ami-844e0bf7"
    ap-southeast-1 = "ami-e6d3a585"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "/tmp/mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "/tmp/mykey.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}
