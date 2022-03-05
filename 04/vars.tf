variable "PROFILE" {}

variable "AWS_REGION" {
  default = "ap-southeast-1"
}

variable "UBUNTU_AMIS" {
  type = map(any)
  default = {
    ap-south-1     = "ami-08a5e367"
    us-east-1      = "ami-d651b8ac"
    ap-northeast-1 = "ami-8422ebe2"
    eu-west-1      = "ami-17d11e6e"
    ap-southeast-1 = "ami-e6d3a585"
    ca-central-1   = "ami-e59c2581"
    us-west-1      = "ami-2d5c6d4d"
    eu-central-1   = "ami-5a922335"
    sa-east-1      = "ami-a3e39ecf"
    ap-southeast-2 = "ami-391ff95b"
    eu-west-2      = "ami-e1f2e185"
    ap-northeast-2 = "ami-0f6fb461"
  }
}

variable "WINDOWS_AMIS" {
  type = map(any)
  default = {
    ap-southeast-1 = "ami-0da930e66ef2fc2e0"
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

variable "INSTANCE_PASSWORD" {
  default = "P@ssw0rd123456"
}
